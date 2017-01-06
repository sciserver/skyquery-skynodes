USE [Graywulf_Temp]
GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO

-- CREATE PhotoObjRAW TABLE

CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[objName] char(13) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[PER]  real NOT NULL,
	[HJD0] float NOT NULL,
	[VMAX] real NOT NULL,
	[VAMP] real NOT NULL,
	[TYPE] char(27) NOT NULL,
	[GCVS_ID] char(19) NOT NULL,
	[GCVS_TYPE] char(13) NOT NULL,
	[IR12]  real NOT NULL,
	[IR25] real NOT NULL,
	[IR60] real NOT NULL,
	[IR100] real NOT NULL,
	[J] real NOT NULL,
	[H] real NOT NULL,
	[K]  real NOT NULL,
	[V_IR12] real NOT NULL,
	[V_J] real NOT NULL,
	[V_H] real NOT NULL,
	[V_K] real NOT NULL,
	[J_H] real NOT NULL,
	[H_K]  real NOT NULL,
	
 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\ACVS\acvs.bin' 
     WITH 
    ( 
   DATAFILETYPE = 'native',
   TABLOCK 
    )
GO

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObj;
GO

-- CREATE PhotoObj TABLE

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Unique ID. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> ASAS identification (coded from the star's RA_2000 and DEC_2000 in the format: hhmmss+ddmm.m). </summary>
	[objName] char(13) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[dec] float NOT NULL,

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

	--/ <summary> Period in days (or characteristic time scale of variation for irregular objects). </summary>
	--/ <unit> days </unit>
	[PER]  real NOT NULL,

	--/ <summary>  Epoch of minimum (for eclipsing) or maximum (for pulsating) brightness. </summary>
	[HJD0] float NOT NULL,

	--/ <summary>  Brightness at maximum. </summary>
	--/ <unit> mag </unit>
	[VMAX] real NOT NULL,

	--/ <summary> Amplitude of variation. </summary>
	--/ <unit> mag </unit>
	[VAMP] real NOT NULL,

	--/ <summary> One of the predefined classes: DSCT, RRC, RRAB, DCEP_FU, DCEP_FO, CW, ACV, BCEP, MIRA and MISC, or its combination. </summary>
	[TYPE] char(27) NOT NULL,

	--/ <summary> GCVS name. </summary>
	[GCVS_ID] char(19) NOT NULL,

	--/ <summary> GCVS variability type. </summary>
	[GCVS_TYPE] char(13) NOT NULL,

	--/ <summary> IRAS flux at 12 microns (listed as -2.5 log flux). </summary>
	--/ <unit> Jy </unit>
	[IR12]  real NOT NULL,

	--/ <summary>  IRAS flux at 25 microns. </summary>
	--/ <unit> Jy </unit>
	[IR25] real NOT NULL,

	--/ <summary>  IRAS flux at 60 microns. </summary>
	--/ <unit> Jy </unit>
	[IR60] real NOT NULL,

	--/ <summary>  IRAS flux at 100 microns. </summary>
	--/ <unit> Jy </unit>
	[IR100] real NOT NULL,

	--/ <summary> 2MASS J photometry. </summary>
	--/ <unit> mag </unit>
	[J] real NOT NULL,

	--/ <summary> 2MASS H photometry. </summary>
	--/ <unit> mag </unit>
	[H] real NOT NULL,

	--/ <summary> 2MASS K photometry. </summary>
	--/ <unit> mag </unit>
	[K]  real NOT NULL,

	--/ <summary> V-IR12 color index. </summary>
	--/ <unit> mag </unit>
	[V_IR12] real NOT NULL,

	--/ <summary> V-J color index. </summary>
	--/ <unit> mag </unit>
	[V_J] real NOT NULL,

	--/ <summary> V-H color index. </summary>
	--/ <unit> mag </unit>
	[V_H] real NOT NULL,

	--/ <summary> V-K color index. </summary>
	--/ <unit> mag </unit>
	[V_K] real NOT NULL,

	--/ <summary> J-H color index. </summary>
	--/ <unit> mag </unit>
	[J_H] real NOT NULL,

	--/ <summary> H-K color index. </summary>
	--/ <unit> mag </unit>
	[H_K]  real NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.PhotoObj WITH (TABLOCKX)
(objID, objName, ra, dec, cx,cy,cz,htmid, zoneid, PER, HJD0, VMAX, VAMP, TYPE, GCVS_ID, GCVS_TYPE, IR12, IR25, IR60, IR100,
J, H, K, V_IR12, V_J, V_H, V_K, J_H, H_K)
SELECT objID, objName, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, PER, HJD0, VMAX, VAMP, TYPE, GCVS_ID, GCVS_TYPE, IR12, IR25, IR60, IR100,
J, H, K, V_IR12, V_J, V_H, V_K, J_H, H_K
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE
DROP TABLE dbo.PhotoObjRAW;
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
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

CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
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
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID] ON [dbo].[PhotoObj] 
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