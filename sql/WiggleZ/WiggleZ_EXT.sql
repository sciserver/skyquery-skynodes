USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[ID] char(22) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Redshift] real NOT NULL,
	[Qop] tinyint NOT NULL,
	[u_SDSS] real NOT NULL,
	[g_SDSS] real NOT NULL,
	[r_SDSS] real NOT NULL,
	[i_SDSS] real NOT NULL,
	[z_SDSS] real NOT NULL,
	[g_RCS2] real NOT NULL,
	[r_RCS2] real NOT NULL,
	[z_RCS2] real NOT NULL,
	[NUV] real NOT NULL,
	[FUV] real NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\WiggleZ\WiggleZ_SpecObj.bin'
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

	--/ <summary> WiggleZ name (ANNJHHMMSSsss+DDMMSSss). "ANN" represent the regions, where "NN" represents the hour of right 
	--/ 00, 01, 03 and 22 for the South Galactic Pole; 09, 11 and 15 for the North Galactic Pole. </summary>
	[ID] char(22) NOT NULL,

	--/ <summary> Right ascension in decimal degrees </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> [-0.02/6.1] Redshift </summary>
	[Redshift] real NOT NULL,

	--/ <summary> [3/5]Redshift quality flag, 5=best. Redshift Quality Definitions:
	--/ 1=	No redshift was possible; highly noisy spectra.
	--/ 2=	An uncertain redshift was assigned.
	--/ 3=	A reasonably confident redshift; if based on [OII] alone, then the doublet is resolved or partially resolved.
	--/ 4=	A redshift that has multiple (obvious) emission lines all in agreement.
	--/ 5=	An excellent redshift with high S/N that may be suitable as a template.
	--/ 6=	Reserved for Galactic stars used as calibration sources. </summary>
	[Qop] tinyint NOT NULL,

	--/ <summary> SDSS u magnitude.  </summary>
	--/ <unit> mag </unit>
	[u_SDSS] real NOT NULL,

	--/ <summary> SDSS g magnitude.  </summary>
	--/ <unit> mag </unit>
	[g_SDSS] real NOT NULL,

	--/ <summary> SDSS r magnitude. </summary>
	--/ <unit> mag </unit>
	[r_SDSS] real NOT NULL,

	--/ <summary> SDSS i magnitude.  </summary>
	--/ <unit> mag </unit>
	[i_SDSS] real NOT NULL,

	--/ <summary> SDSSz magnitude.  </summary>
	--/ <unit> mag </unit>
	[z_SDSS] real NOT NULL,

	--/ <summary> RCS2 g magnitude </summary>
	--/ <unit> mag </unit>
	[g_RCS2] real NOT NULL,

	--/ <summary> RCS2 r magnitude.  </summary>
	--/ <unit> mag </unit>
	[r_RCS2] real NOT NULL,

	--/ <summary> RCS2 z magnitude  </summary>
	--/ <unit> mag </unit>
	[z_RCS2] real NOT NULL,

	--/ <summary> GALEX NUV magnitude  </summary>
	--/ <unit> mag </unit>
	[NUV] real NOT NULL,

	--/ <summary>  GALEX FUV magnitude </summary>
	--/ <unit> mag </unit>
	[FUV] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, ID, RA, DEC, Redshift, Qop, u_SDSS, g_SDSS, r_SDSS, i_SDSS, z_SDSS, g_RCS2, r_RCS2, z_RCS2, NUV, FUV)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
ID, RA, DEC, Redshift, Qop, u_SDSS, g_SDSS, r_SDSS, i_SDSS, z_SDSS, g_RCS2, r_RCS2, z_RCS2, NUV, FUV
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
