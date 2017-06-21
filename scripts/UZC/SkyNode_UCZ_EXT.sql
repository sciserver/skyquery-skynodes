USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[seqID] bigint NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Bmag] real NOT NULL,
	[z] int NOT NULL,
	[e_z] smallint NOT NULL,
	[T] char(1) NOT NULL,
	[U] tinyint NOT NULL,
	[N] tinyint NOT NULL,
	[Zname] char(12) NOT NULL,
	[f_z] char(1) NOT NULL,
	[r_z] int NOT NULL,
	[Name] char(11) NOT NULL,
	[UZC] char(1) NOT NULL,
	[mul] char(1) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\UCZ\\ucz.bin'
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

	--/ <summary> Sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000)  </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> B magnitude (Zwicky magnitude)  </summary>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> Heliocentric redshift  </summary>
	--/ <unit> km/s </unit>
	[z] int NOT NULL,

	--/ <summary> rms uncertainty on z  </summary>
	--/ <unit> km/s </unit>
	[e_z] smallint NOT NULL,

	--/ <summary> [ABE] Spectral characteristics. the symbol means: 
	--/ A:absorption 
	--/ E:emission 
	--/ B:both emission and absorption </summary>
	[T] char(1) NOT NULL,

	--/ <summary> [0/4] UZC class 0-4. the UZC class is defined as:
	--/ 
	--/ 0:a "hit", where the GSC and Zwicky objects are separated in position by less than 180", are comparable in brightness as 
	--/ visually, and there is no other object within the field that could be a Zwicky galaxy.
	--/ 
	--/ 
	--/ 1:a "hit" with positional difference less than 180", again with a GSC brightness in the vicinity of the Zwicky value. 
	--/ the field is centered on a GSC "star" rather than on a "nonstar", but there is only one possible Zwicky galaxy nearby, 
	--/ the field. Thus, index 1 merely indicated that the nearest GSC object to the Zwicky coordinates is a star rather than the 
	--/ galaxy.
	--/ 
	--/ 
	--/ 2:a near "hit" with positional difference less than 180". However, there is confusion because there are at least two 
	--/ with an estimated spread in magnitudes |Δm| within the expected range, either of which could be a Zwicky galaxy.
	--/ 
	--/ 
	--/ 3:A near "hit" with positional difference less than 180", but with |Δm| outside the expected range, raising suspicions 
	--/ the match of the GSC object to the Zwicky galaxy.
	--/ 
	--/ 
	--/ 4:No "hit" at all for a positional difference less than 180", i.e., there is no match for a Zwicky galaxy. </summary>
	[U] tinyint NOT NULL,

	--/ <summary> Number of UZC neighboring galaxies, within 3' </summary>
	[N] tinyint NOT NULL,

	--/ <summary> Zwicky label based on 1950 positions </summary>
	[Zname] char(12) NOT NULL,

	--/ <summary> [FMTXZ] Origin of the redshift measurement. Code for the origin of the redshift measurement taken at the CfA: Z for 
	--/ M for the MMT (4.5m Multiple Mirror Telescope) F for FAST spectra taken from our own and from other projects X flags a 
	--/ spectrum for Z-machine (FAST) measurements and 
	--/ indicatesa low S/N match with a spectrum at c&lt;100km/s. </summary>
	[f_z] char(1) NOT NULL,

	--/ <summary> Reference code detailed in file refs.dat (blank for CfA unpublished data) </summary>
	[r_z] int NOT NULL,

	--/ <summary> Other name </summary>
	[Name] char(11) NOT NULL,

	--/ <summary> [*] UZC multiplicity, * if multiple </summary>
	[UZC] char(1) NOT NULL,

	--/ <summary> [PTG] NED multiplicity: Pair, Triple, Group  </summary>
	[mul] char(1) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, seqID, RA, DEC, Bmag, z, e_z, T, U, N, Zname, f_z, r_z, Name, UZC, mul)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
seqID, RA, DEC, Bmag, SpecObjRAW.z, e_z, T, U, N, Zname, f_z, r_z, Name, UZC, mul
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
