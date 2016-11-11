USE [SkyNode_TwoSLAQ]

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

	--/ <summary> Source name (JHHMMSS.ss+DDMMSS.s) (not identical to SDSS name) </summary>
	[Name] char(19) NOT NULL,

	--/ <summary> r indicates several observations in repeats file </summary>
	[n_Name] char(1) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> [3/6] Configuration priority for 2dF </summary>
	[Pr] tinyint NOT NULL,

	--/ <summary> SDSS Run number </summary>
	[Run] int NOT NULL,

	--/ <summary> SDSS Rerun number </summary>
	[Rerun] smallint NOT NULL,

	--/ <summary> SDSS camera number </summary>
	[Camcol] tinyint NOT NULL,

	--/ <summary> SDSS Field number </summary>
	[Field] int NOT NULL,

	--/ <summary> SDSS object id within a field </summary>
	[ID] int NOT NULL,

	--/ <summary> SDSS PSF u magnitude. No extinction correction </summary>
	--/ <unit> mag </unit>
	[umag] real NOT NULL,

	--/ <summary>  rms uncertainty on umag </summary>
	--/ <unit> mag </unit>
	[e_umag] real NOT NULL,

	--/ <summary> SDSS PSF g magnitude. No extinction correction. </summary>
	--/ <unit> mag </unit>
	[gmag] real NOT NULL,

	--/ <summary> rms uncertainty on gmag </summary>
	--/ <unit> mag </unit>
	[e_gmag] real NOT NULL,

	--/ <summary> SDSS PSF r magnitude. No extinction correction. </summary>
	--/ <unit> mag </unit>
	[rmag] real NOT NULL,

	--/ <summary> rms uncertainty on rmag </summary>
	--/ <unit> mag </unit>
	[e_rmag] real NOT NULL,

	--/ <summary> SDSS PSF i magnitude. No extinction correction. </summary>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> rms uncertainty on imag </summary>
	--/ <unit> mag </unit>
	[e_imag] real NOT NULL,

	--/ <summary> SDSS PSF z magnitude. No extinction correction. </summary>
	--/ <unit> rms uncertainty on zmag </unit>
	[zmag] real NOT NULL,

	--/ <summary> mag </summary>
	--/ <unit> mag </unit>
	[e_zmag] real NOT NULL,

	--/ <summary> Extinction in u band </summary>
	--/ <unit> mag </unit>
	[ured] real NOT NULL,

	--/ <summary> Extinction in g band </summary>
	--/ <unit> mag </unit>
	[gred] real NOT NULL,

	--/ <summary> Extinction in r band </summary>
	--/ <unit> mag </unit>
	[rred] real NOT NULL,

	--/ <summary> Extinction in i band  </summary>
	--/ <unit> mag </unit>
	[ired] real NOT NULL,

	--/ <summary> Extinction in z band  </summary>
	--/ <unit> mag </unit>
	[zred] real NOT NULL,

	--/ <summary> SDSS Bayesian star-galaxy classification probability </summary>
	[SpG] real NOT NULL,

	--/ <summary> [3,6] SDSS Object image morphology classification. 3 = galaxy, 6 = star </summary>
	[Cl] tinyint NOT NULL,

	--/ <summary> SDSS emission spectroscopic redshift </summary>
	[zem_S] real NOT NULL,

	--/ <summary> [0/1] SDSS spectroscopic quality flag, from 0 (bad) to 1 (good)  </summary>
	[q_zem_S] real NOT NULL,

	--/ <summary> SDSS spectroscopic classification </summary>
	[ID_S] char(9) NOT NULL,

	--/ <summary> 2QZ bJ magnitude (Smith et al. 2005MNRAS.359...57S)  </summary>
	--/ <unit> mag </unit>
	[bj] real NOT NULL,

	--/ <summary> 2QZ emission spectroscopic redshift (Croom et al., Cat. VII/241) </summary>
	[zem2q] real NOT NULL,

	--/ <summary> 2QZ redshift quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	[q_zem2q] tinyint NOT NULL,

	--/ <summary> 2QZ spectroscopic classification  </summary>
	[ID2q] char(9) NOT NULL,

	--/ <summary> 2QZ ID quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	[q_ID2q] tinyint NOT NULL,

	--/ <summary> 2QZ name (JHHMMSS.s+DDMMSS, Cat. VII/241) </summary>
	[TwoQZ] char(17) NOT NULL,

	--/ <summary> 2SLAQ spectroscopic redshift </summary>
	[z2S] real NOT NULL,

	--/ <summary> 2SLAQ redshift quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	[q_z2S] tinyint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic ID (i.e. QSO, NELG, star etc.) </summary>
	[ID2S] char(10) NOT NULL,

	--/ <summary> 2SLAQ ID quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	[q_ID2S] tinyint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic observation date </summary>
	--/ <unit> "Y:M:D" </unit>
	[Date] char(10) NOT NULL,

	--/ <summary> 2SLAQ spectroscopic field  </summary>
	[Fl2S] char(3) NOT NULL,

	--/ <summary> [0/357] 2SLAQ spectroscopic fibre number </summary>
	[Fb2S] smallint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic S/N in a 4000-5000Å band </summary>
	[SpN] real NOT NULL,

	--/ <summary> 2SLAQ (gm mag)-(fibre mag) relative to mean zero point in field </summary>
	--/ <unit> mag </unit>
	[dmag] real NOT NULL,

	--/ <summary> RASS X-ray flux (in 10–13erg/cm2/s) </summary>
	--/ <unit> 10-16W/m2 </unit>
	[FX] real NOT NULL,

	--/ <summary> FIRST 1.4 GHz Radio flux </summary>
	--/ <unit> mJy </unit>
	[F1p4] real NOT NULL,

	--/ <summary> [0/3] FIRST morphology,  </summary>
	[n_F1p4] tinyint NOT NULL,

	--/ <summary> 2SLAQ comment on spectrum </summary>
	[Com] char(20) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Name] ASC
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
