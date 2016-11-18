USE [SkyNode_SPITZER]

GO

IF OBJECT_ID ('dbo.goodssMIPS24micronRAW', 'U') IS NOT NULL
	DROP TABLE dbo.goodssMIPS24micronRAW;

GO

-- CREATE goodssMIPS24micronRAW TABLE
CREATE TABLE dbo.goodssMIPS24micronRAW
(	[objID] bigint NOT NULL,
	[srcid] int NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[ra_irac] float NOT NULL,
	[dec_irac] float NOT NULL,
	[s_24] real NOT NULL,
	[s_24_err] real NOT NULL,
	[irac_tag] tinyint NOT NULL,
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodssMIPS24micronRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	goodssMIPS24micronRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\\SPITZER\SPITZER_goodssMIPS24micron.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.goodssMIPS24micron', 'U') IS NOT NULL
	DROP TABLE dbo.goodssMIPS24micron;

GO

-- CREATE goodssMIPS24micron TABLE
CREATE TABLE dbo.goodssMIPS24micron
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Uncertanity in flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodssMIPS24micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.goodssMIPS24micron WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, srcid, ra, dec, ra_irac, dec_irac, s_24, s_24_err, irac_tag, extended_tag)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, objID, srcid, ra, dec, ra_irac, dec_irac, s_24, s_24_err, irac_tag, extended_tag
FROM dbo.goodssMIPS24micronRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE dbo.goodssMIPS24micronRAW;
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_Zone] ON [dbo].[goodssMIPS24micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_ZoneID] ON [dbo].[goodssMIPS24micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_HtmID] ON [dbo].[goodssMIPS24micron] 
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