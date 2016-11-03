USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[Seq] char(11) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Ksmag] real NOT NULL,
	[R_K] real NOT NULL,
	[z] real NOT NULL,
	[q_z] smallint NOT NULL,
	[Class] char(3) NOT NULL,
	[FileName] char(17) NOT NULL,
	[Com] char(12) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[Seq] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\K20\K20_SpecObj.bin'
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

	--/ <summary> K20 identification number, CDFS_NNNNN or q0055_NNNNN </summary>
	[Seq] char(11) NOT NULL,

	--/ <summary> Right ascension (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Total (SExtractor BEST) Ks-band magnitude </summary>
	--/ <unit> mag </unit>
	[Ksmag] real NOT NULL,

	--/ <summary> R-K colour index, measured in a 2"-diameter aperture corrected to total </summary>
	--/ <unit> mag </unit>
	[R_K] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> [-1/1] Quality flag on redshfit. Quality flag on redshfit as follows:
	--/ 1=	solid redshift determination;
	--/ 0=	tentative redshift determination;
	--/ -1=	no redshfit determination. </summary>
	[q_z] smallint NOT NULL,

	--/ <summary> Spectroscopic classes code. Spectroscopic classes as follows:
	--/ 0=	objects classified as stars;
	--/ 1=	red passive early-type galaxies;
	--/ 2=	blue emission-line galaxies;
	--/ 1.5=	intermediate galaxies with emission lines but red continuum indices;
	--/ 3=	galaxies which are not included in one of the three previous classes;
	--/ 4=	broad-line AGN. We remind that objects with only a tentative redshift (q_z=0) are not classified. </summary>
	[Class] char(3) NOT NULL,

	--/ <summary> Spectra file name in "sp" subdirectory </summary>
	[FileName] char(17) NOT NULL,

	--/ <summary> Comment </summary>
	[Com] char(12) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, Seq, RA, DEC, Ksmag, R_K, z, q_z, Class, FileName, Com)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
Seq, RA, DEC, Ksmag, R_K, SpecObjRAW.z, q_z, Class, FileName, Com
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