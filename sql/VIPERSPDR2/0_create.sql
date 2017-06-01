--/ <dataset>
--/ <summary> The second data release (PDR-2) of the VIMOS Public Extragalactic Redshift Survey (VIPERS) </summary>
--/ <remarks>
--/ The PDR-2 includes spectroscopic measurements for 91507 objects, together with the survey masks, 
--/ statistical weights and photometric ancillary information from the VIPERS multi-lambda survey. 89022 
--/ of these objects are main survey targets. 
--/ </remarks>
--/ <url>http://vipers.inaf.it/rel-pdr2.html</url>
--/ <icon>viperspdr2.png</icon>
--/ <docpage>viperspdr2.html</docpage>
--/ </dataset>
 GO

-- CREATE PhotoObj TABLE

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.PhotoObj
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

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of the prefix VIPERS plus the internal 
	--/ number. The internal id number (num) is in the form  
	--/    attxxxxxx  
	--/ where  
	--/     a identifies the sky area (1 for W1 and 4 for W4),  
	--/     tt identifies the CFHTLS tile number where the object is located,  
	--/     xxxxxx is the original CFHTLS ID within the tile.  
	--/ The correspondence between our tile identifier and the official CFHTLS tile name is provided in Guzzo et al. 2014 </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> Internal identification number. The internal id number (num) is in the form  
	--/    attxxxxxx  
	--/ where  
	--/     a identifies the sky area (1 for W1 and 4 for W4),  
	--/     tt identifies the CFHTLS tile number where the object is located,  
	--/     xxxxxx is the original CFHTLS ID within the tile.  
	--/ The correspondence between our tile identifier and the official CFHTLS tile name is provided in Guzzo et al. 2014 </summary>
	--/ <quantity>meta.id</quantity>
	[num] bigint NOT NULL,

	--/ <summary> Object ID in the VIPERS Multi-Lambda catalog. Objects not matched to a T0005 counterpart have this ID set to -1. </summary>
	--/ <quantity>meta.id.cross</quantity>
	[id_T07] bigint NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from CFHTLS T0005 catalogue </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 catalogue in some specific cases. See Guzzo et al. 
	--/ section 3 and appendix C, for details on the tile to tile color offests, as well as for T0005 and T0006 catalogue 
	--/  
	--/ All magnitudes are given in the AB system, and are corrected for Galactic extinction as follows  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/ where E(B-V) is the extinction factor (color excess).  
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. When a magnitude (and its 
	--/ could not be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[u] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 catalogue in some specific cases. See Guzzo et al. 
	--/ section 3 and appendix C, for details on the tile to tile color offests, as well as for T0005 and T0006 catalogue 
	--/  
	--/ All magnitudes are given in the AB system, and are corrected for Galactic extinction as follows  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/ where E(B-V) is the extinction factor (color excess).  
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. When a magnitude (and its 
	--/ could not be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 catalogue in some specific cases. See Guzzo et al. 
	--/ section 3 and appendix C, for details on the tile to tile color offests, as well as for T0005 and T0006 catalogue 
	--/  
	--/ All magnitudes are given in the AB system, and are corrected for Galactic extinction as follows  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/ where E(B-V) is the extinction factor (color excess).  
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. When a magnitude (and its 
	--/ could not be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 catalogue in some specific cases. See Guzzo et al. 
	--/ section 3 and appendix C, for details on the tile to tile color offests, as well as for T0005 and T0006 catalogue 
	--/  
	--/ All magnitudes are given in the AB system, and are corrected for Galactic extinction as follows  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/ where E(B-V) is the extinction factor (color excess).  
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. When a magnitude (and its 
	--/ could not be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[i] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 catalogue in some specific cases. See Guzzo et al. 
	--/ section 3 and appendix C, for details on the tile to tile color offests, as well as for T0005 and T0006 catalogue 
	--/  
	--/ All magnitudes are given in the AB system, and are corrected for Galactic extinction as follows  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/ where E(B-V) is the extinction factor (color excess).  
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. When a magnitude (and its 
	--/ could not be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> u magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[erru] real NOT NULL,

	--/ <summary> g magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[errg] real NOT NULL,

	--/ <summary> r magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[errr] real NOT NULL,

	--/ <summary> i magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erri] real NOT NULL,

	--/ <summary> z magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[errz] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey  
	--/ Magnitudes u,g,r,i,iy,z are derived from the CFHTLS T0007 release; magnitudes FUV and NUV are from GALEX; magnitude 
	--/ is from WIRCAM data; magnitude K_video (only for W1) is from the VIDEO VISTA survey. For details and the full 
	--/ catalog see the VIPERS Multi-Lambda Survey web site and Moutard et al. 2016a. 
	--/ These are isophotal aperture magnitudes corrected to a pseudo-total magnitude value using an aperture correction 
	--/ for each object by averaging the individual aperture corrections estimated for the g,r,i and K bands 
	--/ All magnitudes are corrected for Galactic extinction using the same prescription as the one used for the T0005 ones. 
	--/ When an object has not been observed in a given band, magnitude and error are set equal to -99. 
	--/ When a magnitude (and its error) could not be measured, these values are set to 99. 
	--/ Objects observed in i band, have y magniudes set to -99.99. 
	--/ Objects observed in y band instead of i band, have i magniudes set to -99.99. </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[u_T07] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey. See u_T107 for details. </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g_T07] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey. See u_T107 for details. </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r_T07] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey. See u_T107 for details. </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[i_T07] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey. See u_T107 for details. Details on i vs. y filter  
	--/ In 7 tiles, the T0007 i-band data were taken with a modified i filter, called y filter in the Terapix documentation. For 
	--/ objects the i-band magnitude (i_T07) is set equal to -99.99, and the y magnitude is provided (iy_T07).  
	--/  
	--/ For the objects in these tiles that do not have a matching counterpart in the T0007 data, a T0007-like y magnitude has 
	--/ computed starting from the T0005 data as  
	--/  
	--/     y(T0007) = i(T0005) + Delta(i,y) + slope * g(T0005)-i(T0005)  
	--/  
	--/ where Delta(i,y) and slope have been derived tile by tile fitting with the above relation all matched objects with  
	--/     18.0 &lt;selmag &lt;22.5  
	--/ and  
	--/     0 &lt;g-i &lt;3.5 </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[iy_T07] real NOT NULL,

	--/ <summary> Magnitudes from the VIPERS Multi-Lambda Survey. See u_T107 for details. </summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[erru_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[errg_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[errr_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erri_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erriy_T07] real NOT NULL,

	--/ <summary> Magnitude error </summary>
	--/ <quantity></quantity>
	--/ <unit> mag </unit>
	[errz_T07] real NOT NULL,

	--/ <summary> magnitude K_video (only for W1) is from the VIDEO VISTA survey. </summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[K_video] real NOT NULL,

	--/ <summary> magnitude Ks is from WIRCAM data </summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Ks] real NOT NULL,

	--/ <summary> magnitudes FUV and NUV are from GALEX </summary>
	--/ <quantity>phot.mag.isophotal;em.UV.FUV</quantity>
	--/ <unit> mag </unit>
	[FUV] real NOT NULL,

	--/ <summary> magnitudes FUV and NUV are from GALEX </summary>
	--/ <quantity>phot.mag.isophotal;em.UV</quantity>
	--/ <unit> mag </unit>
	[NUV] real NOT NULL,

	--/ <summary> Magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[errK_video] real NOT NULL,

	--/ <summary> Magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[errKs] real NOT NULL,

	--/ <summary> Magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV.FUV</quantity>
	--/ <unit> mag </unit>
	[errFUV] real NOT NULL,

	--/ <summary> Magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV</quantity>
	--/ <unit> mag </unit>
	[errNUV] real NOT NULL,

	--/ <summary> 	Tile-to-tile colors offsets used in the targets sample selection applied to the CFHTLS T005 data (see Guzzo et al. 
	--/ section 3.1). For both galaxy and AGN selection, the colors used to assign classFlag can be obtained by applying the 
	--/ corrections to the colors derived from the magnitudes listed in the database:  
	--/     u-gcorr = u-g - DeltaUG 
	--/     g-rcorr = g-r - DeltaGR 
	--/     r-icorr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.u;em.opt.SDSS.g</quantity>
	[DeltaUG] real NOT NULL,

	--/ <summary> 	Tile-to-tile colors offsets used in the targets sample selection applied to the CFHTLS T005 data (see Guzzo et al. 
	--/ section 3.1). For both galaxy and AGN selection, the colors used to assign classFlag can be obtained by applying the 
	--/ corrections to the colors derived from the magnitudes listed in the database:  
	--/     u-gcorr = u-g - DeltaUG 
	--/     g-rcorr = g-r - DeltaGR 
	--/     r-icorr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.r</quantity>
	[DeltaGR] real NOT NULL,

	--/ <summary> 	Tile-to-tile colors offsets used in the targets sample selection applied to the CFHTLS T005 data (see Guzzo et al. 
	--/ section 3.1). For both galaxy and AGN selection, the colors used to assign classFlag can be obtained by applying the 
	--/ corrections to the colors derived from the magnitudes listed in the database:  
	--/     u-gcorr = u-g - DeltaUG 
	--/     g-rcorr = g-r - DeltaGR 
	--/     r-icorr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.r;em.opt.SDSS.i</quantity>
	[DeltaRI] real NOT NULL,

	--/ <summary> extinction factor (color excess) E(B-V) derived from Schlegel's maps </summary>
	--/ <quantity>phot.color.excess</quantity>
	[ebv] real NOT NULL,

	--/ <summary> radius enclosing half the object light as from CFHTLS T0005 catalogue, measured in pixels </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pixel </unit>
	[r2] real NOT NULL,

	--/ <summary> radius enclosing half the object light as from CFHTLS T0007 catalogue, measured in pixels </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pixel </unit>
	[r2_T07] real NOT NULL,

	--/ <summary> The VIPERS galaxy target selection flag, based on the CFHTLS T005 catalogue, where 
	--/  
	--/ 1: VIPERS main galaxy target, i.e. galaxy with colors compatible with z &gt; 0.5, according to the color criteria 
	--/ in Guzzo et al. 2014 
	--/  
	--/ 0: galaxy with colors compatible with z &lt; 0.5, according to the color criteria described in Guzzo et al. 2014 
	--/  
	--/ -1: stellar like object according to the VIPERS star/galaxy separation criteria 
	--/  
	--/ -2: magnitude i &gt; 22.5 
	--/  
	--/ -3: magnitude i &lt; 17.5 
	--/  
	--/ -88: problematic object, possibly saturated image 
	--/  
	--/ -99: problematic object, missing photometric data </summary>
	--/ <quantity>meta.code</quantity>
	[classFlag] int NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1 if the object is inside the mask, 0 if it is 
	--/ Objects outside the photometric mask have a less reliable photometry </summary>
	--/ <quantity>meta.code;phot</quantity>
	[photoMask] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the spectroscopic mask. 1 if the object is inside the mask, 0 if it is 
	--/ Objects outside the spectroscopic mask have not entered the mask preparation phase (see Garilli et al. 2014 for 
	--/ </summary>
	--/ <quantity>meta.code;spect</quantity>
	[spectroMask] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-----------------------------------------------------------------------------------

-- CREATE SpecObj TABLE

--/ <summary></summary>
--/ <remarks></remarks>
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of the prefix VIPERS plus the internal 
	--/ number. The internal id number (num) is in the form  
	--/    attxxxxxx  
	--/ where  
	--/ a identifies the sky area (1 for W1 and 4 for W4),  
	--/ tt identifies the CFHTLS tile number where the object is located,  
	--/ xxxxxx is the original CFHTLS ID within the tile.  
	--/ The correspondence between our tile identifier and the official CFHTLS tile name is provided in Guzzo et al 2014 </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> The internal id number (num) is in the form  
	--/    attxxxxxx  
	--/ where  
	--/ a identifies the sky area (1 for W1 and 4 for W4),  
	--/ tt identifies the CFHTLS tile number where the object is located,  
	--/ xxxxxx is the original CFHTLS ID within the tile.  
	--/ The correspondence between our tile identifier and the official CFHTLS tile name is provided in Guzzo et al 2014 </summary>
	--/ <quantity>meta.id</quantity>
	[num] bigint NOT NULL,

	--/ <summary> right ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from CFHTLS T0005 catalogues </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error. </summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>meta.note</quantity>
	[pointing] char(6) NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>meta.code</quantity>
	[quadrant] tinyint NOT NULL,

	--/ <summary> Spectroscopic redshift. </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zspec] real NOT NULL,

	--/ <summary> Redshift measurement quality flag 
	--/  
	--/ The integer part of the flag has the following meaning: 
	--/ 4 a high-confidence, highly secure redshift, based on a high SNR spectrum and supported by obvious and consistent 
	--/ features. The confidence level of Flag 4 measurements is estimated to be 99% secure. 
	--/ 3 also a very secure redshift, comparable in confidence with Flag 4, supported by clear spectral features in the 
	--/ but not necessarily with high SNR. 
	--/ 2 a fairly secure, ~90% confidence redshift measurement, supported by cross-correlation results, continuum shape 
	--/ some spectral features. 
	--/ 9 a redshift based on only one single clear spectral emission feature. 
	--/ 1 a reasonable redshift measurement, based on weak spectral features and/or continuum shape, for which there is 
	--/ a 50% chance that the redshift is actually wrong. 
	--/ In case of broad emission lines typical of broad line AGN, a prefix of 1 is added to zflag, i.e. 
	--/ 14 secure AGN with a &gt;95% secure redshift, at least 2 broad lines; 
	--/ 13 secure AGN with good confidence redshift, based on one broad line and some faint additional feature; 
	--/ 12 a &gt;95% secure redshift measurement, but lines are not significantly broad, might not be an AGN; 
	--/ 19 secure AGN with one single secure emission line feature, redshift based on this line only; 
	--/ 11 a tentative redshift measurement, with spectral features not significantly broad. 
	--/ Second objects in slit get a 2 as prefix to the flag, i.e. 
	--/ 24 a second object with flag 4 
	--/ 23 a second object with flag 3 
	--/ 22 a second object with flag 2 
	--/ 29 a second object with flag 9 
	--/ 21 a second object with flag 1 
	--/ And similarly for BLAGN (214, 213, 212, ...).  
	--/  
	--/ Suffix in form of decimal digit has the following meaning: 
	--/ .5 the spectroscopic redshift is compatible within 1σ with photometric redshift, i.e  
	--/     zphotmin &lt; zspec &lt; zphotmax 
	--/ .4 the spectroscopic redshift is compatible with photometric redshift at the 2σ level, i.e.  
	--/     minvalue &lt; zspec &lt; maxvalue  
	--/ where 
	--/     minvalue=min[ zphot-(1+zphot)*0.05, zphotmin ] 
	--/     maxvalue=max[ zphot+(1+zphot)*0.05, zphotmax ] 
	--/ and 0.05 is twice the median scatter of the comparison between spectroscopic and photometric redshifts.  
	--/ .2 spectroscopic redshift is NOT compatible with photometric redshift 
	--/ .1 no photometric redshift available </summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[zflg] real NOT NULL,

	--/ <summary> Normalization factor. The spectrum has been multiplied by this value to be normalized to the selmag value. </summary>
	--/ <quantity>stat.value</quantity>
	[norm] real NOT NULL,

	--/ <summary> Observing epoch. epoch=1 objects have been observed before VIMOS refurbishing in summer 2010, epoch=2 objects have 
	--/ observed after summer 2010 </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[epoch] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1 if the object is inside the mask, 0 if it is 
	--/ Objects outside the photometric mask have a less reliable photometry </summary>
	--/ <quantity>meta.code;phot</quantity>
	[photoMask] tinyint NOT NULL,

	--/ <summary> The Target Sampling Rate (TSR) is defined as the ratio of the observed objects over the number of possible targets: 
	--/ where Nspec is the number of detected targets and Nparent is the number of all the possible random targets.  
	--/ TSR has been computed in small rectangular apertures to take into account the shadowing effect of MOS slits in the 
	--/ of the galaxy distribution. TSR and is needed to take into account the fact that not all the possible targets can be 
	--/ in the single pass strategy adopted in VIPERS. See Scodeggio et al. 2016 for details </summary>
	--/ <quantity>meta.code;obs;arith.ratio</quantity>
	[tsr] real NOT NULL,

	--/ <summary> The Spectroscopic Success Rate (SSR) is defined as the ratio of the galaxies with a successfully measured redshift 
	--/ = 2.*,3.*,4.*,9.*) over the total sample of detected galaxies.  
	--/ SSR is a function of the apparent magnitude (since to bright objects correspond spectra with high signal-to-noise, 
	--/ which the redshift can be more easily measured), of the galaxy luminosity and rest-frame color and of the overall 
	--/ quality, quantified via the mean SSR for all galaxies in that quadrant. See Scodeggio et al. 2016 for detail </summary>
	--/ <quantity>meta.code;spect</quantity>
	[ssr] real NOT NULL,

	--/ <summary> The VIPERS galaxy target selection flag, based on the CFHTLS T005 catalogue, where 
	--/  
	--/ 1: VIPERS main galaxy target, i.e. galaxy with colors compatible with z &gt; 0.5, according to the color criteria 
	--/ in Guzzo et al. 2014 
	--/  
	--/ 0: galaxy with colors compatible with z &lt; 0.5, according to the color criteria described in Guzzo et al. 2014 
	--/  
	--/ -1: stellar like object according to the VIPERS star/galaxy separation criteria 
	--/  
	--/ -2: magnitude i &gt; 22.5 
	--/  
	--/ -3: magnitude i &lt; 17.5 
	--/  
	--/ -88: problematic object, possibly saturated image 
	--/  
	--/ -99: problematic object, missing photometric data </summary>
	--/ <quantity>meta.code</quantity>
	[classFlag] int NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
