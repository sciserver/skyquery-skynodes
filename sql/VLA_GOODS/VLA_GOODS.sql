USE [VLAGOODS]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
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
	[beam_] real NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM 'C:\Data\ebanyai\project\Skyquery-data\VLA_GOODSN\\vla_goods.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObj;

GO
-- CREATE VLA TABLE
CREATE TABLE dbo.PhotoObj
(

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

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
	[beam_] real NOT NULL,

	CONSTRAINT [PK_VLA] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, objID, Name, RA, e_RAs, DEC, e_DECs, SN, Peak, e_Peak, Total, e_Total, bmaj, bmin, PA, ulim, beam_)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, Spherical.htm.FromXyz(c.x,c.y,c.z) AS htmid, objID, Name, RA, e_RAs, DEC, e_DECs, SN, Peak, e_Peak, Total, e_Total, bmaj, bmin, PA, ulim, beam_
FROM dbo.PhotoObjRAW
CROSS APPLY Spherical.point.ConvertEqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE PhotoObjRAW

-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_htmid] ON [dbo].[PhotoObj]
(
	[htmid] ASC
)

GO
