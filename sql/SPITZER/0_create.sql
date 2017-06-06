--/ <dataset>
--/ <summary> Spitzer GOODS Catalog </summary>
--/ <remarks>
--/ The Great Observatories Origins Deep Survey (GOODS) aims to unite extremely deep observations from 
--/ NASA's Great Observatories (Spitzer, Hubble and Chandra), ESA's Herschel and XMM-Newton, and the 
--/ most powerful ground-based facilities. The survey consists of two 10x16.5 arcmin fields: GOODS-N 
--/ coincides with the Hubble Deep Field North, while GOODS-S coincides with the Chandra Deep Field South.
--/ </remarks>
--/ <url>http://irsa.ipac.caltech.edu/data/SPITZER/GOODS/overview.html</url>
--/ <icon>spitzer.png</icon>
--/ <docpage>spitzer.html</docpage>
--/ </dataset>
 GO

-- CREATE goodsnIRS16micron TABLE

--/ <summary>	GOODS-N IRS 16 micron Photometry Catalog</summary>
--/ <remarks>	GOODS-N IRS 16 micron Photometry Catalog</remarks>
CREATE TABLE dbo.goodsnIRS16micron
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Source ID </summary>
	--/ <quantity>meta.id</quantity>
	[id] int NOT NULL,

	--/ <summary> Right Ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Coverage </summary>
	--/ <quantity>obs.param</quantity>
	[cov] int NOT NULL,

	--/ <summary> 3.6 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC</quantity>
	--/ <unit> uJy </unit>
	[s3_6] real NOT NULL,

	--/ <summary> 3.6 micron flux density uncertainty </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC</quantity>
	--/ <unit> uJy </unit>
	[e_s3_6] real NOT NULL,

	--/ <summary> 4.5 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC45</quantity>
	--/ <unit> uJy </unit>
	[s4_5] real NOT NULL,

	--/ <summary> 4.5 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.Spitzer.IRAC45</quantity>
	--/ <unit> uJy </unit>
	[e_s4_5] real NOT NULL,

	--/ <summary> 5.8 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.em.IR.Spitzer.IRAC58</quantity>
	--/ <unit> uJy </unit>
	[s5_8] real NOT NULL,

	--/ <summary> 5.8 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.em.IR.Spitzer.IRAC58</quantity>
	--/ <unit> uJy </unit>
	[e_s5_8] real NOT NULL,

	--/ <summary> 8 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.em.IR.Spitzer.IRAC80</quantity>
	--/ <unit> uJy </unit>
	[s8] real NOT NULL,

	--/ <summary> 8 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.em.IR.Spitzer.IRAC80</quantity>
	--/ <unit> uJy </unit>
	[e_s8] real NOT NULL,

	--/ <summary> 16 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit> uJy </unit>
	[s16] real NOT NULL,

	--/ <summary> 16 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit> uJy </unit>
	[e_s16] real NOT NULL,

	--/ <summary> 24 micron flux density </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.Spitzer.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s24] real NOT NULL,

	--/ <summary> 24 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;stat.error;phot.flux.density;em.IR.Spitzer.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[e_s24] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zspec] real NOT NULL,

	--/ <summary> Reference for the spectroscopic redshift </summary>
	--/ <quantity>meta.ref</quantity>
	[r_zspec] int NOT NULL,

	--/ <summary> X-ray detection flag </summary>
	--/ <quantity>meta.code;em.X-ray</quantity>
	[xdet] tinyint NOT NULL,

	--/ <summary> Soft X-ray flux </summary>
	--/ <quantity>phot.flux;em.X-ray.soft</quantity>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[sbf] float NOT NULL,

	--/ <summary> Hard X-ray flux </summary>
	--/ <quantity>phot.flux;em.X-ray.hard</quantity>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[hbf] float NOT NULL,

	--/ <summary> Star flag </summary>
	--/ <quantity>meta.code</quantity>
	[star] tinyint NOT NULL,

	--/ <summary> 16 micron concentration index </summary>
	--/ <quantity>meta.code</quantity>
	[ratio] real NOT NULL,

	--/ <summary> Number of 8 micron sources within 4 arcsec </summary>
	--/ <quantity>meta.number;src;em.IR.Spizter.IRAC80</quantity>
	[ncf] tinyint NOT NULL,

	--/ <summary> Number of 16 micron sources within 5.4 arcsec </summary>
	--/ <quantity>meta.number;src;em.IR.15-30um</quantity>
	[ncf16] tinyint NOT NULL,

	--/ <summary> Quality flag </summary>
	--/ <quantity>meta.code.qual</quantity>
	[q] smallint NOT NULL,

	--/ <summary> Extended source flag </summary>
	--/ <quantity>meta.code</quantity>
	[e] tinyint NOT NULL,

	--/ <summary> HST B magnitude </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bmag] real NOT NULL,

	--/ <summary> HST V magnitude </summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[vmag] real NOT NULL,

	--/ <summary> HST I magnitude </summary>
	--/ <quantity>phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> HST z magnitude </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> HST B magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[ebmag] real NOT NULL,

	--/ <summary> HST V magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[evmag] real NOT NULL,

	--/ <summary> HST I magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[eimag] real NOT NULL,

	--/ <summary> HST z magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDDS.z</quantity>
	--/ <unit> mag </unit>
	[ezmag] real NOT NULL,

	--/ <summary> Number of I-band sources within 1 arcsec </summary>
	--/ <quantity>meta.number;src;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnIRS16micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-----------------------------------------------------------------------------------------


-- CREATE goodsnMIPS24micron TABLE

--/ <summary>	GOODS-N MIPS 24 micron Photometry Catalog</summary>
--/ <remarks>	GOODS-N MIPS 24 micron Photometry Catalog</remarks>
CREATE TABLE dbo.goodsnMIPS24micron
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	--/ <quantity>meta.id</quantity>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <quantity>phot.flux.density;em.opt.IR.Spizter.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Uncertanity in flux density of MIPS 24 micron source </summary>
	--/ <quantity>stat.error;phot.flux.density;em.opt.IR.Spizter.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	--/ <quantity>meta.code</quantity>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	--/ <quantity>meta.code</quantity>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnMIPS24micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


---------------------------------------------------------------------------------------------------

-- CREATE goodssIRS16micron TABLE

--/ <summary>GOODS-S IRS 16 micron Photometry Catalog</summary>
--/ <remarks>GOODS-S IRS 16 micron Photometry Catalog</remarks>
CREATE TABLE dbo.goodssIRS16micron
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Source ID </summary>
	--/ <quantity>meta.id</quantity>
	[id] int NOT NULL,

	--/ <summary> Right Ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Coverage </summary>
	--/ <quantity>obs.param</quantity>
	[cov] int NOT NULL,

	--/ <summary> 3.6 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC</quantity>
	--/ <unit> uJy </unit>
	[s3_6] real NOT NULL,

	--/ <summary> 3.6 micron flux density uncertainty </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC</quantity>
	--/ <unit> uJy </unit>
	[e_s3_6] real NOT NULL,

	--/ <summary> 4.5 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.Spitzer.IRAC45</quantity>
	--/ <unit> uJy </unit>
	[s4_5] real NOT NULL,

	--/ <summary> 4.5 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.Spitzer.IRAC45</quantity>
	--/ <unit> uJy </unit>
	[e_s4_5] real NOT NULL,

	--/ <summary> 5.8 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.em.IR.Spitzer.IRAC58</quantity>
	--/ <unit> uJy </unit>
	[s5_8] real NOT NULL,

	--/ <summary> 5.8 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.em.IR.Spitzer.IRAC58</quantity>
	--/ <unit> uJy </unit>
	[e_s5_8] real NOT NULL,

	--/ <summary> 8 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.em.IR.Spitzer.IRAC80</quantity>
	--/ <unit> uJy </unit>
	[s8] real NOT NULL,

	--/ <summary> 8 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.em.IR.Spitzer.IRAC80</quantity>
	--/ <unit> uJy </unit>
	[e_s8] real NOT NULL,

	--/ <summary> 16 micron flux density </summary>
	--/ <quantity>phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit> uJy </unit>
	[s16] real NOT NULL,

	--/ <summary> 16 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit> uJy </unit>
	[e_s16] real NOT NULL,

	--/ <summary> 24 micron flux density </summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.Spitzer.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s24] real NOT NULL,

	--/ <summary> 24 micron flux density uncertainty </summary>
	--/ <quantity>stat.error;stat.error;phot.flux.density;em.IR.Spitzer.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[e_s24] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zspec] real NOT NULL,

	--/ <summary> Reference for the spectroscopic redshift </summary>
	--/ <quantity>meta.ref</quantity>
	[r_zspec] int NOT NULL,

	--/ <summary> X-ray detection flag </summary>
	--/ <quantity>meta.code;em.X-ray</quantity>
	[xdet] tinyint NOT NULL,

	--/ <summary> Soft X-ray flux </summary>
	--/ <quantity>phot.flux;em.X-ray.soft</quantity>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[sbf] float NOT NULL,

	--/ <summary> Hard X-ray flux </summary>
	--/ <quantity>phot.flux;em.X-ray.hard</quantity>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[hbf] float NOT NULL,

	--/ <summary> Star flag </summary>
	--/ <quantity>meta.code</quantity>
	[star] tinyint NOT NULL,

	--/ <summary> 16 micron concentration index </summary>
	--/ <quantity>meta.code</quantity>
	[ratio] real NOT NULL,

	--/ <summary> Number of 8 micron sources within 4 arcsec </summary>
	--/ <quantity>meta.number;src;em.IR.Spizter.IRAC80</quantity>
	[ncf] tinyint NOT NULL,

	--/ <summary> Number of 16 micron sources within 5.4 arcsec </summary>
	--/ <quantity>meta.number;src;em.IR.15-30um</quantity>
	[ncf16] tinyint NOT NULL,

	--/ <summary> Quality flag </summary>
	--/ <quantity>meta.code.qual</quantity>
	[q] smallint NOT NULL,

	--/ <summary> Extended source flag </summary>
	--/ <quantity>meta.code</quantity>
	[e] tinyint NOT NULL,

	--/ <summary> HST B magnitude </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bmag] real NOT NULL,

	--/ <summary> HST V magnitude </summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[vmag] real NOT NULL,

	--/ <summary> HST I magnitude </summary>
	--/ <quantity>phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> HST z magnitude </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> HST B magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[ebmag] real NOT NULL,

	--/ <summary> HST V magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[evmag] real NOT NULL,

	--/ <summary> HST I magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[eimag] real NOT NULL,

	--/ <summary> HST z magnitude uncertainty </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDDS.z</quantity>
	--/ <unit> mag </unit>
	[ezmag] real NOT NULL,

	--/ <summary> Number of I-band sources within 1 arcsec </summary>
	--/ <quantity>meta.number;src;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodssIRS16micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


------------------------------------------------------------------------------------------------

-- CREATE goodssMIPS24micron TABLE

--/ <summary>GOODS-S MIPS 24 micron Photometry Catalog</summary>
--/ <remarks>GOODS-S MIPS 24 micron Photometry Catalog</remarks>
CREATE TABLE dbo.goodssMIPS24micron
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	--/ <quantity>meta.id</quantity>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <quantity>phot.flux.density;em.opt.IR.Spizter.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Uncertanity in flux density of MIPS 24 micron source </summary>
	--/ <quantity>stat.error;phot.flux.density;em.opt.IR.Spizter.MIPS24</quantity>
	--/ <unit> uJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	--/ <quantity>meta.code</quantity>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	--/ <quantity>meta.code</quantity>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodssMIPS24micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

