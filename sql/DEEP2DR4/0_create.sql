--/ <dataset>
--/ <summary> DEEP2 Galaxy Redshift Survey - Data Release 4 </summary>
--/ <remarks>
--/ The DEEP2 DR4 redshift catalog includes 50,319 entries, with 36 fields (or tags) per entry. 
--/ </remarks>
--/ <url>http://deep.ps.uci.edu/DR4/home.html</url>
--/ <icon>deep2dr4.png</icon>
--/ <docpage>deep2dr4.html</docpage>
--/ </dataset>
 GO
 
-- CREATE SpecObj TABLE

--/ <summary> </summary>
--/ <remarks>Note that these redshift catalogs include all spectroscopic targets regardless of whether an accurate redshift was measured; only galaxies with redshift quality (ZQUALITY) greater than or equal to 3 should be treated as having a reliable redshift measurement (objects identified as stars are given ZQUALITY of -1).</remarks>

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
	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone; pos.frame=J2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> DEEP2 object number </summary>
	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Right Ascension (in decimal degrees, J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (in decimal degrees, J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> CFHT B-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[MAGB] real NOT NULL,

	--/ <summary> CFHT R-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[MAGR] real NOT NULL,

	--/ <summary> CFHT I-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <quantity>phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[MAGI] real NOT NULL,

	--/ <summary> B-band magnitude error </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[MAGBERR] real NOT NULL,

	--/ <summary> R-band magnitude error </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[MAGRERR] real NOT NULL,

	--/ <summary> I-band magnitude error </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[MAGIERR] real NOT NULL,

	--/ <summary> estimated R-band radius of object 
	--/ (sigma of Guassian fit in units of pixels --- 0.207”/pix) </summary>
	--/ <quantity>phys.size.radius;em.opt.R</quantity>
	--/ <unit> pix </unit>
	[RG] real NOT NULL,

	--/ <summary> ellipticity defined as E2 = (1 - b/a) </summary>
	--/ <quantity>src.ellipticity</quantity>
	[E2] real NOT NULL,

	--/ <summary> object PA (degrees E of N)  </summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> the probability (0 - 1) that the sources is a galaxy for unresolved galaxies, 3 if resolved </summary>
	--/ <quantity>stat.probability</quantity>
	[PGAL] real NOT NULL,

	--/ <summary> E(B-V) from Schlegel, Finkbeiner, and Davis dust map </summary>
	--/ <quantity>phot.color.excess</quantity>
	[SFD_EBV] real NOT NULL,

	--/ <summary> absolute B-band magnitude (AB, h = 1) from Willmer et al. (2006ApJ...647..853W) </summary>
	--/ <quantity>phot.mag.abs;em.opt.B</quantity>
	[M_B] real NOT NULL,

	--/ <summary> rest-frame U-B color (AB) from Willmer et al. 2006 (2006ApJ...647..853W) </summary>
	--/ <quantity>phot.color;em.opt.U;em.opt.B</quantity>
	[U_B] real NOT NULL,

	--/ <summary> the 8-digit DEEP2 object id (not always the same as OBJNO). 
	--/ The CFHT 12K BRI catalogs are created on a pointing-by-pointing bases 
	--/ and not at a field-by-field level (for more info regarding the DEEP2 
	--/ fields and pointings, refer to the description of the photometric 
	--/ catalogs: http://deep.ps.uci.edu/DR4/photo.html and 
	--/ here: http://deep.ps.uci.edu/DR4/completeness.html). For objects that 
	--/ fall in the regions of overlap between the various photometric pointings 
	--/ within a given field, the objects can appear in multiple photometric 
	--/ catalogs (e.g., in pcat.41.fits and pcat.42.fits), being assigned different 
	--/ 8-digit DEEP2 identification numbers in each catalog. These duplications 
	--/ have been resolved such that a unique identifier is assigned. This is 
	--/ the 8-digit ID given in the “OBJNO” field. However, the slitmasks are 
	--/ designed on a pointing-by-pointing basis, so objects are actually targeted 
	--/ based on their id numbers in a particular pointing. Most importantly, since 
	--/ the spec2d data reduction pipeline draws the object id information from the 
	--/ slitmask design files, the object id in the “spec1d” files is this 
	--/ pointing-specific number. In order to facilitate matching of entries in the 
	--/ redshift catalog to 1-d spectral files, the “OBJNAME” field is included, 
	--/ which gives the pointing-specific id number. Thus, for a given entry in the 
	--/ redshift catalog, the spec1d file will be named “spec1d.MASK.SLIT.OBJNAME.fits”, 
	--/ following the formatting detailed here: http://deep.ps.uci.edu/DR4/spectra.html. </summary>
	--/ <quantity>meta.id</quantity>
	[OBJNAME] bigint NOT NULL,

	--/ <summary> the DEEP2/DEEP3 slitmask number on which the object was observed </summary>
	--/ <quantity>meta.id;instr</quantity>
	[MASK] bigint NOT NULL,

	--/ <summary> the slitlet number (on mask MASKNAME) in which the object was placed </summary>
	--/ <quantity>meta.id;instr</quantity>
	[SLIT] bigint NOT NULL,

	--/ <summary> Date on which the mask was observed (YYYY-MM-DD) </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[DATE] char(10) NOT NULL,

	--/ <summary> Modified Julian date of observation </summary>
	--/ <quantity>time.each;obs</quantity>
	[MJD] real NOT NULL,

	--/ <summary> RA of slit center </summary>
	--/ <quantity>pos.eq.ra;instr</quantity>
	--/ <unit> deg </unit>
	[SLITRA] real NOT NULL,

	--/ <summary> Dec of slit center </summary>
	--/ <quantity>pos.eq.dec;instr</quantity>
	--/ <unit> deg </unit>
	[SLITDEC] real NOT NULL,

	--/ <summary> PA (degrees E of N) of slit </summary>
	--/ <quantity>pos.posAng;instr</quantity>
	--/ <unit> deg </unit>
	[SLITLEN] real NOT NULL,

	--/ <summary> length of slit (arcsec) </summary>
	--/ <quantity>phys.angSize;instr.param</quantity>
	--/ <unit> arcsec </unit>
	[SLITPA] real NOT NULL,

	--/ <summary> observed best-fitting redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[Z] real NOT NULL,

	--/ <summary> best redshift (corrected for heliocentric motion) </summary>
	--/ <quantity>src.redshift</quantity>
	[ZBEST] real NOT NULL,

	--/ <summary> redshift error (zerr &lt; 0 indicates problematic z fit) </summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[ZERR] real NOT NULL,

	--/ <summary> redshift quality code, Q </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[ZQUALITY] int NOT NULL,

	--/ <summary> type of best-fitting template (e.g., GALAXY or STAR). 
	--/ 	It should be noted that the CLASS tag only indicates the best-fitting 
	--/ 	template; many AGN (both broad- and narrow-line) in the DEEP2 sample 
	--/ 	will have 'GALAXY' as their class.</summary>
	--/ <quantity>src.class</quantity>
	[CLASS] char(6) NOT NULL,

	--/ <summary> coarse classification for stellar templates </summary>
	--/ <quantity>src.class</quantity>
	[SUBCLASS] char(6) NOT NULL,

	--/ <summary> reduced chi-squared value for the redshift fit </summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[RCHI2] real NOT NULL,

	--/ <summary> degrees of freedom for redshift fit </summary>
	--/ <quantity>stat.fit.dof</quantity>
	[DOF] bigint NOT NULL,

	--/ <summary> velocity dispersion in km/s </summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit> km s-1 </unit>
	[VDISP] real NOT NULL,

	--/ <summary> error in velocity dispersion </summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	[VDISPERR] real NOT NULL,

	--/ <summary> comment field </summary>
	--/ <quantity>meta.note</quantity>
	[COMMENT] char(43) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


