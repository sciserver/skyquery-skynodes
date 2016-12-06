USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[seqID] bigint NOT NULL,
	[n_GSC] char(1) NOT NULL,
	[GSC] char(9) NOT NULL,
	[m_GSC] char(1) NOT NULL,
	[ESO_MCG] char(10) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[RA_1950] float NOT NULL,
	[DEC_1950] float NOT NULL,
	[mSSR] real NOT NULL,
	[RV] int NOT NULL,
	[e_RV] int NOT NULL,
	[TT] smallint NOT NULL,
	[r_RV] tinyint NOT NULL,
	[Note] char(4) NOT NULL,
	[NGC_IC] char(10) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\SSRS\ssrs.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SpecObj', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObj;

GO
-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
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

	--/ <summary> sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> f for galaxies fainter than the limit mSSRS2=15.5 </summary>
	[n_GSC] char(1) NOT NULL,

	--/ <summary> GSC (Cat. I/220) number of the galaxy  </summary>
	[GSC] char(9) NOT NULL,

	--/ <summary> [NSEW] Multiplicity index on GSC </summary>
	[m_GSC] char(1) NOT NULL,

	--/ <summary> ESO (Cat. VII/34) or MCG (Cat. VII/100) name </summary>
	[ESO_MCG] char(10) NOT NULL,

	--/ <summary> )Right ascension (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Right ascension (B1950.0) </summary>
	--/ <unit> deg (B1950) </unit>
	[RA_1950] float NOT NULL,

	--/ <summary> Declination (B1950.0) </summary>
	--/ <unit> deg (B1950) </unit>
	[DEC_1950] float NOT NULL,

	--/ <summary> SSRS2 magnitude. m(SSRS2) = 0.59m(GSC) + 8.42 </summary>
	--/ <unit> mag </unit>
	[mSSR] real NOT NULL,

	--/ <summary> Radial velocity </summary>
	--/ <unit> km/s </unit>
	[RV] int NOT NULL,

	--/ <summary> rms uncertainty on RV </summary>
	--/ <unit> km/s </unit>
	[e_RV] int NOT NULL,

	--/ <summary> de Vaucouleurs' galaxy morphology (T-types) </summary>
	[TT] smallint NOT NULL,

	--/ <summary> Source for the radial velocity in refs.dat file  </summary>
	[r_RV] tinyint NOT NULL,

	--/ <summary> Note </summary>
	[Note] char(4) NOT NULL,

	--/ <summary> NGC or IC (Cat. VII/118) name </summary>
	[NGC_IC] char(10) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, seqID, n_GSC, GSC, m_GSC, ESO_MCG, RA, DEC, RA_1950, DEC_1950, mSSR, RV, e_RV, TT, r_RV, Note, NGC_IC)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
seqID, n_GSC, GSC, m_GSC, ESO_MCG, RA, DEC, RA_1950, DEC_1950, mSSR, RV, e_RV, TT, r_RV, Note, NGC_IC
FROM dbo.SpecObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE SpecObjRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_SpecObj_Zone] ON [dbo].[SpecObj] 
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

CREATE NONCLUSTERED INDEX [IX_SpecObj_ZoneID] ON [dbo].[SpecObj] 
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
CREATE NONCLUSTERED INDEX [IX_SpecObj_HtmID] ON [dbo].[SpecObj] 
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
