--/ <dataset>
--/ <summary> zCOSMOS-bright DR2 catalog</summary>
--/ <remarks>
--/ zCOSMOS is a large-redshift survey that is being undertaken in the COSMOS field using 600 hr of 
--/ observation with the VIMOS spectrograph on the 8 m VLT. The survey is designed to characterize the 
--/ environments of COSMOS galaxies from the 100 kpc scales of galaxy groups up to the 100 Mpc scale of 
--/ the cosmic web and to produce diagnostic information on galaxies and active galactic nuclei. The 
--/ zCOSMOS survey consists of two parts: (1) zCOSMOS-bright, a magnitude-limited I-band IAB$lt;22.5 
--/ sample of about 20,000 galaxies with 0.1$lt;z$lt;1.2 covering the whole 1.7 deg^2 COSMOS ACS field, 
--/ for which the survey parameters at z~0.7 are designed to be directly comparable to those of the 
--/ 2dFGRS at z~0.1 and (2) zCOSMOS-deep, a survey of approximately 10,000 galaxies selected through 
--/ color-selection criteria to have 1.4$lt;z$lt;3.0, within the central 1 deg^2.
--/ </remarks>
--/ <url>http://vizier.cfa.harvard.edu/viz-bin/VizieR?-source=J/ApJS/172/70</url>
--/ <icon>zcosmos.png</icon>
--/ <docpage>zcosmos.html</docpage>
--/ </dataset>
 GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.SpecObj 
(
	--/ <summary> zCOSMOS identification number.</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary>Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Redshift. </summary>
	--/ <quantity>src.redshift</quantity>
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
	--/ <quantity>stat.value</quantity>
	[CC] real NOT NULL,

	--/ <summary> Selection magnitude F814W, in AB system </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[Imag] real NOT NULL,

 CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

