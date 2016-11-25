USE [SkyNode_zCOSMOS]
GO


CREATE TABLE dbo.SpecObj 
(
	--/ <summary> zCOSMOS identification number.</summary>
	[objID] bigint NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[dec] float NOT NULL,

	--/ <summary>Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary>HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> Redshift. </summary>
	[z]  real NOT NULL,

	--/ <summary> Confidence Class indicating reliability. 
	--/ Confidence Class (CC) defined as 3 digits (ab.c).
	--/ Unit digit (b in ab.c) represents the confidence class:
	--/      --------------------------------------------------------------------
	--/      CC Description            Spectroscopic     Photo-z consistency
	--/                                 verification      within dz=0.08(1+z)
	--/      --------------------------------------------------------------------
	--/      4  Very secure redshift,
	--/          beautiful redshift    &gt;99.5%             97%
	--/      3  Secure redshift        &gt;99.5%             97%
	--/      9  One line redshift      95%                84%-95%  (after
	--/          (best guess)          (after correction) correction with photo-z)
	--/      2  Probable redshift      92%                93%
	--/      1  Insecure redshift      70%                72%
	--/      0  Unidentified spectrum
	--/      --------------------------------------------------------------------

	--/  the decimal (.c) represents the Spectroscopic/photometric consistency:
	--/      --------------------------------------------------------------------
	--/      .5   Spectroscopic redshift consistent within 0.08(1+z) of the
	--/           photometric redshift, both for galaxies, stars and AGN.
	--/      .4   No photometric redshift available, includes all spectroscopic
	--/           AGN and stars
	--/      .3   Special case for Class 18 and 9: Consistent with photo-z only
	--/           after the redshift changed to the alternate redshift,
	--/           a switch which is then applied
	--/      .1   Spectroscopic and photometric redshifts are not consistent at
	--/           the level of 0.08(1+z)
	--/      --------------------------------------------------------------------
	--/ 
	--/  the tens (a in ab.c) is
	--/       ---------------------------
	--/       0       = Galaxies and stars
	--/       1 (+10) = Broad line AGN
	--/       2 (+20) = Secondary targets
	--/       ---------------------------</summary>
	[CC] real NOT NULL,

	--/ <summary> Selection magnitude F814W, in AB system </summary>
	--/ <unit>mag</unit>
	[Imag] real NOT NULL,

 CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
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
CREATE NONCLUSTERED INDEX [IXSpecObj__HtmID] ON [dbo].[SpecObj] 
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
