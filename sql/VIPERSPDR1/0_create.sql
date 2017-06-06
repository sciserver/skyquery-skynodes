--/ <dataset>
--/ <summary> First data release (PDR-1) of the VIMOS Public Extragalactic Redshift Survey (VIPERS). </summary>
--/ <remarks>
--/ The PDR-1 includes spectroscopic measurements for 57204 objects, together with the survey masks and 
--/ weights and photometric ancillary information from the CFHTLS. 54756 of these objects are galaxies 
--/ or AGN, 2448 are stars. 
--/ </remarks>
--/ <url>http://vipers.inaf.it/rel-pdr1.html</url>
--/ <icon>viperspdr1.png</icon>
--/ <docpage>viperspdr1.html</docpage>
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

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of 
	--/ the prefix VIPERS plus the internal identification number. The internal 
	--/ id number (num) is in the form 
	--/    attxxxxxx 
	--/ where 
	--/     a identifies the sky area (1 for W1 and 4 for W4), 
	--/     tt identifies the CFHTLS tile number where the object is located, 
	--/     xxxxxx is the original CFHTLS ID within the tile. 
	--/ The correspondence between our tile identifier and the official CFHTLS 
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of 
	--/ the prefix VIPERS plus the internal identification number. The internal 
	--/ id number (num) is in the form 
	--/    attxxxxxx 
	--/ where 
	--/     a identifies the sky area (1 for W1 and 4 for W4), 
	--/     tt identifies the CFHTLS tile number where the object is located, 
	--/     xxxxxx is the original CFHTLS ID within the tile. 
	--/ The correspondence between our tile identifier and the official CFHTLS 
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	--/ <quantity>meta.id</quantity>
	[num] bigint NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from 
	--/ CFHTLS T0005 catalogue. </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error </summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[u] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[i] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> Error of u magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[erru] real NOT NULL,

	--/ <summary> Error of g magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[errg] real NOT NULL,

	--/ <summary> Error of r magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[errr] real NOT NULL,

	--/ <summary> Error of i magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erri] real NOT NULL,

	--/ <summary> Error of z magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[errz] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[u_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[i_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[iy_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <quantity>phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z_T07] real NOT NULL,

	--/ <summary> Error of u_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[erru_T07] real NOT NULL,

	--/ <summary> Error of g_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[errg_T07] real NOT NULL,

	--/ <summary> Error of r_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[errr_T07] real NOT NULL,

	--/ <summary> Error of i_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erri_T07] real NOT NULL,

	--/ <summary> Error of iy_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[erriy_T07] real NOT NULL,

	--/ <summary> Error of z_T07 magnitude. </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[errz_T07] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied 
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.u;em.opt.SDSS.g</quantity>
	[DeltaUG] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied 
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.r</quantity>
	[DeltaGR] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied 
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	--/ <quantity>phot.color;em.opt.SDSS.r;em.opt.SDSS.i</quantity>
	[DeltaRI] real NOT NULL,

	--/ <summary> Extinction factor (color excess) E(B-V) derived from Schlegel's maps. </summary>
	--/ <quantity></quantity>
	[E_BV] real NOT NULL,

	--/ <summary>  
	--/ Radius enclosing half the object light as from CFHTLS T0005 catalogue, 
	--/ measured in pixels </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pixel </unit>
	[r2] real NOT NULL,

	--/ <summary> Radius enclosing half the object light as from CFHTLS T0007 catalogue, 
	--/ measured in pixels </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pixel </unit>
	[r2_T07] real NOT NULL,

	--/ <summary>  
	--/ the VIPERS selection flag based on the CFHTLS T005 catalogue, where 
	--/  
	--/   -99: problematic object, missing photometric data 
	--/  
	--/   -88: problematic object, possibly saturated image 
	--/  
	--/    -3: magnitude i &lt; 17.5 
	--/  
	--/    -2: magnitude i &gt; 22.5 
	--/  
	--/    -1: stellar like object according to the VIPERS star/galaxy 
	--/        separation criteria 
	--/  
	--/     0: object with colors compatible with most galaxies at z &lt; 0.5 
	--/  
	--/     1: object with colors compatible with most galaxies at z &gt; 0.5 
	--/  
	--/ See section 4 and Fig. 3 in Guzzo et al. 2013. </summary>
	--/ <quantity>meta.code</quantity>
	[classFlag] int NOT NULL,

	--/ <summary>  
	--/ A value equal to 1 is assigned to all AGN candidates, and equal to 0 
	--/ otherwise. An object is an AGN candidate if it is stellar-like 
	--/ (classFlag = -1) and exhibits colours that are clearly different from 
	--/ those of the main stellar sequence (see equations 2 and 3 and Section 
	--/ 2.2 in Garilli et al. 2013) </summary>
	--/ <quantity>meta.code</quantity>
	[agnFlag] int NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1 
	--/ if the object is inside the mask, 0 if it is outside. Objects outside 
	--/ the photometric mask have a less reliable photometry. </summary>
	--/ <quantity>meta.code;phot</quantity>
	[photoMask] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the spectroscopic mask. 
	--/ 1 if the object is inside the mask, 0 if it is outside. Objects outside 
	--/ the spectroscopic mask have not entered the mask preparation phase (see 
	--/ Garilli et al. 2013 for details) </summary>
	--/ <quantity>meta.code;spect</quantity>
	[spectroMask] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-----------------------------------------------------------------------------


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
	--/ <quantity>pos.eq.t;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ The correspondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ Thecorrespondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	--/ <quantity>meta.id</quantity>
	[num] bigint NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] real NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] real NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from
	--/ CFHTLS T0005 catalogues. </summary>
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

	--/ <summary> The integer part of the flag has the following meaning:
	--/ 
	--/    4 a high-confidence, highly secure redshift, based on a high SNR
	--/      spectrum and supported by obvious and consistent spectral
	--/      features. The confidence level of Flag 4 measurements is estimated
	--/      to be 99% secure. 
	--/    3 also a very secure redshift, comparable in confidence with Flag
	--/      4, supported by clear spectral features in the spectrum, but not
	--/      necessarily with high SNR.
	--/    2 a fairly secure, ~90% confidence redshift measurement, supported
	--/      by cross-correlation results, continuum shape and some spectral
	--/      features.
	--/    9 a redshift based on only one single clear spectral emission
	--/      feature.
	--/    1 a reasonable redshift measurement, based on weak spectral features
	--/      and/or continuum shape, for which there is roughly a 50% chance
	--/      that the redshift is  actually wrong.
	--/    0 no reliable spectroscopic redshift measurement was
	--/      possible. Redshift is set to the conventional value of 9.9999.
	--/ 
	--/ In case of broad emission lines typical of broad line AGN, a prefix of 1
	--/ is added to zflag, i.e.
	--/ 
	--/    14 secure AGN with a &gt;95% secure redshift, at least 2 broad lines;
	--/    13 secure AGN with good confidence redshift, based on one broad line
	--/       and some faint additional feature;
	--/    12 a >95% secure redshift measurement, but lines are not
	--/       significantly broad, might not be an AGN;
	--/    19 secure AGN with one single secure emission line feature, redshift
	--/       based on this line only;
	--/    11 a tentative redshift measurement, with spectral features not
	--/       significantly broad.
	--/ 
	--/ Second objects in slit get a 2 as prefix to the flag, i.e.
	--/ 
	--/    24 a second object with flag 4
	--/    23 a second object with flag 3
	--/    22 a second object with flag 2
	--/    29 a second object with flag 9
	--/    21 a second object with flag 1
	--/    20 a second object with flag 0
	--/ 
	--/ And similarly for BLAGN (214, 213, 212, ...).
	--/ 
	--/ Suffix in form of decimal digit has the following meaning:
	--/ 
	--/    .5 the spectroscopic redshift is compatible within 1 sigma with
	--/       photometric redshift, i.e
	--/           zphot_min &lt; zspec &lt; zphot_max
	--/    .4 the spectroscopic redshift is compatible with photometric
	--/       redshift at the 2 sigma level, i.e.
	--/            minvalue &lt; zspec &lt; maxvalue
	--/       where
	--/            minvalue = min[ zphot-(1+zphot)*0.05, zphot_min ]
	--/            maxvalue = max[ zphot+(1+zphot)*0.05, zphot_max ]
	--/       and 0.05 is twice the median scatter of the comparison between
	--/       spectroscopic and photometric redshifts.
	--/    .2 spectroscopic redshift is NOT compatible with photometric
	--/       redshift
	--/    .1 no photometric redshift available </summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[zflg] real NOT NULL,

	--/ <summary> Spectroscopic redshift. A conventional zpsec value of 9.9999 is assigned
	--/ in case a redshift could not be measured. </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[zspec] real NOT NULL,

	--/ <summary> Observing epoch. epoch=1 objects have been observed before VIMOS
	--/ refurbishing in summer 2010, epoch=2 objects have been observed after
	--/ summer 2010. </summary>
	--/ <quantity>time.epoch</quantity>
	[epoch] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1
	--/ if the object is inside the mask, 0 if it is outside. Objects outside
	--/ the photometric mask have a less reliable photometry </summary>
	--/ <quantity>meta.code;phot</quantity>
	[photoMask] tinyint NOT NULL,

	--/ <summary> The Target Sampling Rate is defined as the ratio of the observed objects
	--/ over the number of possible targets: TSR=Nspec/Nparent, where Nspec is
	--/ the number of detected targets and Nparent is the number of all the
	--/ possible random targets.
	--/ TSR has been computed in bins of apparent magnitude to take into account
	--/ the possible dependence of the sampling rate on the clustering of bright
	--/ objects (possibly causing slit collision) and the higher fraction of
	--/ observed bright objects for which a spectrum has not been extracted (see
	--/ Garilli et al. 2013).
	--/ TSR and is needed to take into account the fact that not all the
	--/ possible targets can be observed in the single pass strategy adopted in
	--/ VIPERS. See Garilli et al. 2013 for details
	--/ TSR is = -1 for serendipitous targets (flags 2*.*), and observed objects
	--/ not fulfilling the selection criterion for z&gt;0.5 galaxies (i.e. AGN);
	--/ TSR = -99 for objects outside the considered area and selection
	--/ magnitude range (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	--/ <quantity>meta.code</quantity>
	[tsr] real NOT NULL,

	--/ <summary> The SSR is defined as the ratio of the galaxies with a successfully
	--/ measured redshift (flag = 2.*,3.*,4.*,9.*) over the total sample of
	--/ detected galaxies.
	--/ SSR is a function of the apparent magnitude (since to bright objects
	--/ correspond spectra with high signal-to-noise, from which the redshift
	--/ can be more easily measured), and of redshift (because the spectral
	--/ features visible in the observed spectral range can change). Therefore
	--/ SSR has been computed in bins of redshift and apparent magnitude.
	--/ SSR is = -1 for stars (z=0.0000), non measured objects (flag 0), low
	--/ confidence redshift measurements (flags 1.*), spectroscopic BLAGN (flags
	--/ 1*.*), serendipitous targets (flags=2*.*), and hight redshift galaxies
	--/ (zspec&gt;3);
	--/ SSR = -99 for objects outside the considered area and selection
	--/ magnituderange (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	--/ <quantity>meta.code</quantity>
	[ssr] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
