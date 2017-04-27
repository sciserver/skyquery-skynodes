USE [Graywulf_Temp]
GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO

-- CREATE PhotoObjRAW TABLE

CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[csID] char(20) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[V]  real NOT NULL,
	[Period] real NOT NULL,
	[Amplitude] real NOT NULL,
	[NumberObs] real NOT NULL,
	[TYPE] char(10) NOT NULL,
	
 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\CSDR2\\csdr2_varCat.bin' 
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
	--/ <summary> Numerical ID. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Catalina Surveys identification (coded from the star's RA_2000 and DEC_2000 in the format: CSS_Jhhmmss.s+ddmmss). </summary>
	[csID] char(20) NOT NULL,

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
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> Magnitude in V band. </summary>
	--/ <unit> mag </unit>
	[V]  real NOT NULL,

	--/ <summary>  Period in days. </summary>
	--/ <unit> days </unit>
	[Period] float NOT NULL,

	--/ <summary>  Amplitude of the variation. </summary>
	[Amplitude] real NOT NULL,

	--/ <summary> Number of observations. </summary>
	[NumberObs] real NOT NULL,

	--/ <summary> Variable type. </summary>
	[Type] char(10) NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.PhotoObj WITH (TABLOCKX)
(objID, csID, ra, dec, cx,cy,cz,htmid, zoneid, V, Period, Amplitude, NumberObs,Type)
SELECT objID, csID, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
 V, Period, Amplitude, NumberObs,Type
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE

DROP TABLE PhotoObjRAW

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
