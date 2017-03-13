-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Source name (JHHMMSS.ss+DDMMSS.s) (not identical to SDSS name) </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[Name] char(19) NOT NULL,

	--/ <summary> r indicates several observations in repeats file </summary>
	--/ <quantity>meta.code.multip</quantity>
	[n_Name] char(1) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000) </summary>
	--/ <quantity>pos.eq.deg;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> [3/6] Configuration priority for 2dF </summary>
	--/ <quantity>meta.code</quantity>
	[Pr] tinyint NOT NULL,

	--/ <summary> SDSS Run number </summary>
	--/ <quantity>meta.id</quantity>
	[Run] int NOT NULL,

	--/ <summary> SDSS Rerun number </summary>
	--/ <quantity>meta.id</quantity>
	[Rerun] smallint NOT NULL,

	--/ <summary> SDSS camera number </summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[Camcol] tinyint NOT NULL,

	--/ <summary> SDSS Field number </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[Field] int NOT NULL,

	--/ <summary> SDSS object id within a field </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID] int NOT NULL,

	--/ <summary> SDSS PSF u magnitude. No extinction correction </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[umag] real NOT NULL,

	--/ <summary>  rms uncertainty on umag </summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[e_umag] real NOT NULL,

	--/ <summary> SDSS PSF g magnitude. No extinction correction. </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[gmag] real NOT NULL,

	--/ <summary> rms uncertainty on gmag </summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[e_gmag] real NOT NULL,

	--/ <summary> SDSS PSF r magnitude. No extinction correction. </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[rmag] real NOT NULL,

	--/ <summary> rms uncertainty on rmag </summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[e_rmag] real NOT NULL,

	--/ <summary> SDSS PSF i magnitude. No extinction correction. </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> rms uncertainty on imag </summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[e_imag] real NOT NULL,

	--/ <summary> SDSS PSF z magnitude. No extinction correction. </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> rms uncertainty on zmag </summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[e_zmag] real NOT NULL,

	--/ <summary> Extinction in u band </summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[ured] real NOT NULL,

	--/ <summary> Extinction in g band </summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[gred] real NOT NULL,

	--/ <summary> Extinction in r band </summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[rred] real NOT NULL,

	--/ <summary> Extinction in i band  </summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[ired] real NOT NULL,

	--/ <summary> Extinction in z band  </summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[zred] real NOT NULL,

	--/ <summary> SDSS Bayesian star-galaxy classification probability </summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[SpG] real NOT NULL,

	--/ <summary> [3,6] SDSS Object image morphology classification. 3 = galaxy, 6 = star </summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[Cl] tinyint NOT NULL,

	--/ <summary> SDSS emission spectroscopic redshift </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zem_S] real NOT NULL,

	--/ <summary> [0/1] SDSS spectroscopic quality flag, from 0 (bad) to 1 (good)  </summary>
	--/ <quantity>meta.code.qual;spect</quantity>
	[q_zem_S] real NOT NULL,

	--/ <summary> SDSS spectroscopic classification </summary>
	--/ <quantity>src.class;spect</quantity>
	[ID_S] char(9) NOT NULL,

	--/ <summary> 2QZ bJ magnitude (Smith et al. 2005MNRAS.359...57S)  </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bj] real NOT NULL,

	--/ <summary> 2QZ emission spectroscopic redshift (Croom et al., Cat. VII/241) </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zem2q] real NOT NULL,

	--/ <summary> 2QZ redshift quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_zem2q] tinyint NOT NULL,

	--/ <summary> 2QZ spectroscopic classification  </summary>
	--/ <quantity>src.class;spect</quantity>
	[ID2q] char(9) NOT NULL,

	--/ <summary> 2QZ ID quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	--/ <quantity>meta.code.qual;src.class</quantity>
	[q_ID2q] tinyint NOT NULL,

	--/ <summary> 2QZ name (JHHMMSS.s+DDMMSS, Cat. VII/241) </summary>
	--/ <quantity>meta.id.cross</quantity>
	[TwoQZ] char(17) NOT NULL,

	--/ <summary> 2SLAQ spectroscopic redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z2S] real NOT NULL,

	--/ <summary> 2SLAQ redshift quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z2S] tinyint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic ID (i.e. QSO, NELG, star etc.) </summary>
	--/ <quantity>src.class;spect</quantity>
	[ID2S] char(10) NOT NULL,

	--/ <summary> 2SLAQ ID quality flag. Quality flag is:
	--/ 1=	high-quality ID or redshift
	--/ 2=	poor-quality ID or redshift
	--/ 3=	no ID or redshift assignment </summary>
	--/ <quantity>meta.code.qual;src.class</quantity>
	[q_ID2S] tinyint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic observation date </summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit> "Y:M:D" </unit>
	[Date] char(10) NOT NULL,

	--/ <summary> 2SLAQ spectroscopic field  </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[Fl2S] char(3) NOT NULL,

	--/ <summary> [0/357] 2SLAQ spectroscopic fibre number </summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[Fb2S] smallint NOT NULL,

	--/ <summary> 2SLAQ spectroscopic S/N in a 4000-5000Å band </summary>
	--/ <quantity>stat.snr</quantity>
	[SpN] real NOT NULL,

	--/ <summary> 2SLAQ (gm mag)-(fibre mag) relative to mean zero point in field </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[dmag] real NOT NULL,

	--/ <summary> RASS X-ray flux (in 10–13erg/cm2/s) </summary>
	--/ <quantity>phot.flux;em.X-ray</quantity>
	--/ <unit> 1e-16 W m-2 </unit>
	[FX] real NOT NULL,

	--/ <summary> FIRST 1.4 GHz Radio flux </summary>
	--/ <quantity>phot.flux;em.radio.750-1500MHz</quantity>
	--/ <unit> mJy </unit>
	[F1p4] real NOT NULL,

	--/ <summary> [0/3] FIRST morphology,  </summary>
	--/ <quantity>src.morph</quantity>
	[n_F1p4] tinyint NOT NULL,

	--/ <summary> 2SLAQ comment on spectrum </summary>
	--/ <quantity>meta.comment</quantity>
	[Com] char(20) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

