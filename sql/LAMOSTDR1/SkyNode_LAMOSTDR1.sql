USE [SkyNode_LAMOSTDR1]

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