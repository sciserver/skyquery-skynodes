USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[TKRS] bigint NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Rmag] real NOT NULL,
	[Mask] smallint NOT NULL,
	[Slit] int NOT NULL,
	[z] float NOT NULL,
	[q_z] smallint NOT NULL,
	[zOther] real NOT NULL,
	[r_zOther] smallint NOT NULL,
	[XpixD] real NOT NULL,
	[YpixD] real NOT NULL,
	[ACS] smallint NOT NULL,
	[XpixG] real NOT NULL,
	[YpixG] real NOT NULL,
	[MajAxis] real NOT NULL,
	[e2] real NOT NULL,
	[PA] real NOT NULL,
	[GOODS] char(20) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[TKRS] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\TKRS\tkrs.bin'
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

	--/ <summary> Serial number in Team Keck Survey </summary>
	[TKRS] bigint NOT NULL,

	--/ <summary> DEIMOS degree of Right Ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> DEIMOS Degree of Declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> DEIMOS R band (648.7&plusmn;81nm) in AB system </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> Mask number on which object was placed </summary>
	[Mask] smallint NOT NULL,

	--/ <summary>  Slit number for object on TKRS mask </summary>
	[Slit] int NOT NULL,

	--/ <summary> Topocentric redshift measured by TKRS </summary>
	[z] float NOT NULL,

	--/ <summary> Redshift code assigned by TKRS. Redshift code as follows:
	--/ -1=	star
	--/ 1=	redshift unmeasurable
	--/ 2=	redshift uncertain
	--/ 3=	90% confidence
	--/ 4=	99% confidence </summary>
	[q_z] smallint NOT NULL,

	--/ <summary> Alternate redshift from other works </summary>
	[zOther] real NOT NULL,

	--/ <summary> Source of alternate redshift </summary>
	[r_zOther] smallint NOT NULL,

	--/ <summary> X position on the DEIMOS mosaic image </summary>
	--/ <unit> pix </unit>
	[XpixD] real NOT NULL,

	--/ <summary> Y position on the DEIMOS mosaic image </summary>
	--/ <unit> pix </unit>
	[YpixD] real NOT NULL,

	--/ <summary> Sector number in which the object lies on the HST/ACS mosaic image. As shown in the figure made by the GOODS team at </summary>
	[ACS] smallint NOT NULL,

	--/ <summary> X position on the HST/ACS mosaic image </summary>
	--/ <unit> pix </unit>
	[XpixG] real NOT NULL,

	--/ <summary> Y position on the HST/ACS mosaic image </summary>
	--/ <unit> pix </unit>
	[YpixG] real NOT NULL,

	--/ <summary> DEIMOS semi-major axis. Measured by SExtractor on DEIMOS mosaic image. </summary>
	--/ <unit> arcsec </unit>
	[MajAxis] real NOT NULL,

	--/ <summary> DEIMOS ellipticity (1-a/b). Measured by SExtractor on DEIMOS mosaic image. </summary>
	[e2] real NOT NULL,

	--/ <summary> [-90/140] DEIMOS major axis position angle. Measured by SExtractor on DEIMOS mosaic image (North=0, East=+90). </summary>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> GOODS-N v1.0 catalog IAU identification. Of objects matching the DEIMOS catalogue from Giavalisco et al. (2004, in 
	--/ Cat. II/261). </summary>
	[GOODS] char(20) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[TKRS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, TKRS, RA, DEC, Rmag, Mask, Slit, z, q_z, zOther, r_zOther, XpixD, YpixD, ACS, XpixG, YpixG, MajAxis, e2, PA, GOODS)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
TKRS, RA, DEC, Rmag, Mask, Slit, SpecObjRAW.z, q_z, zOther, r_zOther, XpixD, YpixD, ACS, XpixG, YpixG, MajAxis, e2, PA, GOODS
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
