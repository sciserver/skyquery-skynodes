USE [SkyNode_SPITZER]

GO

IF OBJECT_ID ('dbo.goodsnIRS16micronRAW', 'U') IS NOT NULL
	DROP TABLE dbo.goodsnIRS16micronRAW;

GO

-- CREATE goodsnIRS16micronRAW TABLE
CREATE TABLE dbo.goodsnIRS16micronRAW
(	[objID] bigint NOT NULL,
	[id] int NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[cov] int NOT NULL,
	[s3_6] real NOT NULL,
	[e_s3_6] real NOT NULL,
	[s4_5] real NOT NULL,
	[e_s4_5] real NOT NULL,
	[s5_8] real NOT NULL,
	[e_s5_8] real NOT NULL,
	[s8] real NOT NULL,
	[e_s8] real NOT NULL,
	[s16] real NOT NULL,
	[e_s16] real NOT NULL,
	[s24] real NOT NULL,
	[e_s24] real NOT NULL,
	[zspec] real NOT NULL,
	[r_zspec] int NOT NULL,
	[xdet] tinyint NOT NULL,
	[sbf] float NOT NULL,
	[hbf] float NOT NULL,
	[star] tinyint NOT NULL,
	[ratio] real NOT NULL,
	[ncf] tinyint NOT NULL,
	[ncf16] tinyint NOT NULL,
	[q] smallint NOT NULL,
	[e] tinyint NOT NULL,
	[bmag] real NOT NULL,
	[vmag] real NOT NULL,
	[imag] real NOT NULL,
	[zmag] real NOT NULL,
	[ebmag] real NOT NULL,
	[evmag] real NOT NULL,
	[eimag] real NOT NULL,
	[ezmag] real NOT NULL,
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnIRS16micronRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	goodsnIRS16micronRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\\SPITZER\SPITZER_goodsnIRS16micron.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.goodsnIRS16micron', 'U') IS NOT NULL
	DROP TABLE dbo.goodsnIRS16micron;

GO

-- CREATE goodsnIRS16micron TABLE
CREATE TABLE dbo.goodsnIRS16micron
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

	--/ <summary> Source ID </summary>
	[id] int NOT NULL,

	--/ <summary> Right Ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Coverage </summary>
	[cov] int NOT NULL,

	--/ <summary> 3.6 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s3_6] real NOT NULL,

	--/ <summary> 3.6 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s3_6] real NOT NULL,

	--/ <summary> 4.5 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s4_5] real NOT NULL,

	--/ <summary> 4.5 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s4_5] real NOT NULL,

	--/ <summary> 5.8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s5_8] real NOT NULL,

	--/ <summary> 5.8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s5_8] real NOT NULL,

	--/ <summary> 8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s8] real NOT NULL,

	--/ <summary> 8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s8] real NOT NULL,

	--/ <summary> 16 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s16] real NOT NULL,

	--/ <summary> 16 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s16] real NOT NULL,

	--/ <summary> 24 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s24] real NOT NULL,

	--/ <summary> 24 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s24] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	[zspec] real NOT NULL,

	--/ <summary> Reference for the spectroscopic redshift </summary>
	[r_zspec] int NOT NULL,

	--/ <summary> X-ray detection flag </summary>
	[xdet] tinyint NOT NULL,

	--/ <summary> Soft X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[sbf] float NOT NULL,

	--/ <summary> Hard X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[hbf] float NOT NULL,

	--/ <summary> Star flag </summary>
	[star] tinyint NOT NULL,

	--/ <summary> 16 micron concentration index </summary>
	[ratio] real NOT NULL,

	--/ <summary> Number of 8 micron sources within 4 arcsec </summary>
	[ncf] tinyint NOT NULL,

	--/ <summary> Number of 16 micron sources within 5.4 arcsec </summary>
	[ncf16] tinyint NOT NULL,

	--/ <summary> Quality flag </summary>
	[q] smallint NOT NULL,

	--/ <summary> Extended source flag </summary>
	[e] tinyint NOT NULL,

	--/ <summary> HST B magnitude </summary>
	--/ <unit> mag </unit>
	[bmag] real NOT NULL,

	--/ <summary> HST V magnitude </summary>
	--/ <unit> mag </unit>
	[vmag] real NOT NULL,

	--/ <summary> HST I magnitude </summary>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> HST z magnitude </summary>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> HST B magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ebmag] real NOT NULL,

	--/ <summary> HST V magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[evmag] real NOT NULL,

	--/ <summary> HST I magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[eimag] real NOT NULL,

	--/ <summary> HST z magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ezmag] real NOT NULL,

	--/ <summary> Number of I-band sources within 1 arcsec </summary>
	--/ <unit> mag </unit>
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnIRS16micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.goodsnIRS16micron WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, id, ra, dec, cov, s3_6, e_s3_6, s4_5, e_s4_5, s5_8, e_s5_8, s8, e_s8, s16, e_s16, s24, e_s24, zspec, r_zspec, xdet, sbf, hbf, star, ratio, ncf, ncf16, q, e, bmag, vmag, imag, zmag, ebmag, evmag, eimag, ezmag, icls)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, objID, id, ra, dec, cov, s3_6, e_s3_6, s4_5, e_s4_5, s5_8, e_s5_8, s8, e_s8, s16, e_s16, s24, e_s24, zspec, r_zspec, xdet, sbf, hbf, star, ratio, ncf, ncf16, q, e, bmag, vmag, imag, zmag, ebmag, evmag, eimag, ezmag, icls
FROM dbo.goodsnIRS16micronRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE dbo.goodsnIRS16micronRAW;
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_Zone] ON [dbo].[goodsnIRS16micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_ZoneID] ON [dbo].[goodsnIRS16micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_HtmID] ON [dbo].[goodsnIRS16micron] 
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