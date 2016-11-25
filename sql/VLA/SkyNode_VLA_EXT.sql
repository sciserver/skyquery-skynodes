USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.GOODSNRAW', 'U') IS NOT NULL
	DROP TABLE dbo.GOODSNRAW;

GO

-- CREATE GOODSNRAW TABLE
CREATE TABLE dbo.GOODSNRAW
(	[objID] bigint NOT NULL,
	[Name] char(5) NOT NULL,
	[RA] float NOT NULL,
	[e_RAs] float NOT NULL,
	[DEC] float NOT NULL,
	[e_DECs] float NOT NULL,
	[SN] real NOT NULL,
	[Peak] real NOT NULL,
	[e_Peak] real NOT NULL,
	[Total] real NOT NULL,
	[e_Total] real NOT NULL,
	[bmaj] real NOT NULL,
	[bmin] real NOT NULL,
	[PA] int NOT NULL,
	[ulim] real NOT NULL,
	[beam] real NOT NULL,

	CONSTRAINT [PK_GOODSNRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	GOODSNRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\VLA\vla_goodsn.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.GOODSN', 'U') IS NOT NULL
	DROP TABLE dbo.GOODSN;

GO
-- CREATE VLA TABLE
CREATE TABLE dbo.GOODSN
(

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential id </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Catalog Source Number </summary>
	[Name] char(5) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Error in the Right Ascension </summary>
	--/ <unit> arcsec (J2000) </unit>
	[e_RAs] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Error in the Declination </summary>
	--/ <unit>  arcsec (J2000) </unit>
	[e_DECs] float NOT NULL,

	--/ <summary> Peak Signal/Noise Ratio </summary>
	[SN] real NOT NULL,

	--/ <summary> Observed peak brightness. In units of microJanskeys/beam and 
	--/ uncorrected for primary beam or bandwidth smearing. </summary>
	--/ <unit> uJy </unit>
	[Peak] real NOT NULL,

	--/ <summary> Error in Observed peak brightness  </summary>
	--/ <unit> uJy </unit>
	[e_Peak] real NOT NULL,

	--/ <summary> Total Flux Density </summary>
	--/ <unit> uJy </unit>
	[Total] real NOT NULL,

	--/ <summary> Error in Total Flux Density </summary>
	--/ <unit> uJy </unit>
	[e_Total] real NOT NULL,

	--/ <summary> Fitted Gaussian Major Axis FWHM </summary>
	--/ <unit> arcsec </unit>
	[bmaj] real NOT NULL,

	--/ <summary> Fitted Gaussian Minor Axis FWHM </summary>
	--/ <unit> arcsec </unit>
	[bmin] real NOT NULL,

	--/ <summary> Fitted Position Angle </summary>
	--/ <unit> deg </unit>
	[PA] int NOT NULL,

	--/ <summary> bmaj-upper limit if bmaj=0.0. Or maximum size for very resolved sources. </summary>
	--/ <unit> arcsec </unit>
	[ulim] real NOT NULL,

	--/ <summary> map beam size </summary>
	--/ <unit> arcsec </unit>
	[beam] real NOT NULL,

	CONSTRAINT [PK_VLA] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.GOODSN WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, Name, RA, e_RAs, DEC, e_DECs, SN, Peak, e_Peak, Total, e_Total, bmaj, bmin, PA, ulim, beam)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, Name, RA, e_RAs, DEC, e_DECs, SN, Peak, e_Peak, Total, e_Total, bmaj, bmin, PA, ulim, beam
FROM dbo.GOODSNRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE GOODSNRAW
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_GOODSN_Zone] ON [dbo].[GOODSN] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_GOODSN_ZoneID] ON [dbo].[GOODSN] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_GOODSN_HtmID] ON [dbo].[GOODSN] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO
