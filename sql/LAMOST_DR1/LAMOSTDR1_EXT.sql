USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[obsid] bigint NOT NULL,
	[designation] char(19) NOT NULL,
	[obsdate] char(10) NOT NULL,
	[lmjd] float NOT NULL,
	[planid] char(20) NOT NULL,
	[spid] int NOT NULL,
	[fiberid] int NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[snru] real NOT NULL,
	[snrg] real NOT NULL,
	[snrr] real NOT NULL,
	[snri] real NOT NULL,
	[snrz] real NOT NULL,
	[objtype] char(10) NOT NULL,
	[class] char(7) NOT NULL,
	[subclass] char(12) NOT NULL,
	[magtype] char(10) NOT NULL,
	[mag1] real NOT NULL,
	[mag2] real NOT NULL,
	[mag3] real NOT NULL,
	[mag4] real NOT NULL,
	[mag5] real NOT NULL,
	[mag6] real NOT NULL,
	[mag7] real NOT NULL,
	[tsource] char(10) NOT NULL,
	[fibertype] char(5) NOT NULL,
	[tfrom] char(18) NOT NULL,
	[t_info] char(23) NOT NULL,
	[rv] real NOT NULL,
	[z] real NOT NULL,
	[z_err] real NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[obsid] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\LAMOST\lamost_SpecObj.bin'
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

	--/ <summary> Unique Spectra ID </summary>
	[obsid] bigint NOT NULL,

	--/ <summary> Target Designation </summary>
	[designation] char(19) NOT NULL,

	--/ <summary> Target Observation Date </summary>
	[obsdate] char(10) NOT NULL,

	--/ <summary> Local Modified Julian Day </summary>
	[lmjd] float NOT NULL,

	--/ <summary> Plan Name </summary>
	[planid] char(20) NOT NULL,

	--/ <summary> Spectrograph ID </summary>
	[spid] int NOT NULL,

	--/ <summary> Fiber ID </summary>
	[fiberid] int NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> Signal Noise Ratio of u filter </summary>
	[snru] real NOT NULL,

	--/ <summary> Signal Noise Ratio of g filter </summary>
	[snrg] real NOT NULL,

	--/ <summary> Signal Noise Ratio of r filter </summary>
	[snrr] real NOT NULL,

	--/ <summary> Signal Noise Ratio of i filter </summary>
	[snri] real NOT NULL,

	--/ <summary> Signal Noise Ratio of z filter </summary>
	[snrz] real NOT NULL,

	--/ <summary> Object Type </summary>
	[objtype] char(10) NOT NULL,

	--/ <summary> Spectra Type </summary>
	[class] char(7) NOT NULL,

	--/ <summary> Stellar Sub-Class </summary>
	[subclass] char(12) NOT NULL,

	--/ <summary> Target Magnitude Type </summary>
	[magtype] char(10) NOT NULL,

	--/ <summary> Associated Magnitude 1 </summary>
	--/ <unit> mag </unit>
	[mag1] real NOT NULL,

	--/ <summary> Associated Magnitude 2 </summary>
	--/ <unit> mag </unit>
	[mag2] real NOT NULL,

	--/ <summary> Associated Magnitude 3 </summary>
	--/ <unit> mag </unit>
	[mag3] real NOT NULL,

	--/ <summary> Associated Magnitude 4 </summary>
	--/ <unit> mag </unit>
	[mag4] real NOT NULL,

	--/ <summary> Associated Magnitude 5 </summary>
	--/ <unit> mag </unit>
	[mag5] real NOT NULL,

	--/ <summary> Associated Magnitude 6 </summary>
	--/ <unit> mag </unit>
	[mag6] real NOT NULL,

	--/ <summary> Associated Magnitude 7 </summary>
	--/ <unit> mag </unit>
	[mag7] real NOT NULL,

	--/ <summary> Organization or person who submits input catalog </summary>
	[tsource] char(10) NOT NULL,

	--/ <summary> Fiber Type of target [Obj, Sky, F-std, Unused, PosErr, Dead] </summary>
	[fibertype] char(5) NOT NULL,

	--/ <summary> Input catalog submitted by an organization or a person determined by the tsource </summary>
	[tfrom] char(18) NOT NULL,

	--/ <summary> Target ID from SDSS, UCAC4, PANSTAR and other catalogue </summary>
	[t_info] char(23) NOT NULL,

	--/ <summary> Heliocentric Radial Velocity </summary>
	--/ <unit> km/s </unit>
	[rv] real NOT NULL,

	--/ <summary> Redshift </summary>
	--/ <unit> Redshift Uncertainty </unit>
	[z] real NOT NULL,

	--/ <summary> Redshift Uncertainty </summary>
	[z_err] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[obsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, obsid, designation, obsdate, lmjd, planid, spid, fiberid, ra, dec, snru, snrg, snrr, snri, snrz, objtype, class, subclass, magtype, mag1, mag2, mag3, mag4, mag5, mag6, mag7, tsource, fibertype, tfrom, t_info, rv, z, z_err)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
	SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
	obsid, designation, obsdate, lmjd, planid, spid, fiberid, ra, dec, snru, snrg, snrr, snri, snrz, objtype, class, subclass, magtype, mag1, mag2, mag3, mag4, mag5, mag6, mag7, tsource, fibertype, tfrom, t_info, rv, SpecObjRAW.z, z_err
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