-- CREATE PhotoObj TABLE
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
	--/ <quantity>pos.htm; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> MGC object ID/serial number (=ID) </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[MGC] bigint NOT NULL,

	--/ <summary> MGC field number (=MGCFN) </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[MGCFN] int NOT NULL,

	--/ <summary> CCD number (=CCD) </summary>
	--/ <quantity>meta.id;instr</quantity>
	[CCD] tinyint NOT NULL,

	--/ <summary> Object x position </summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit> pix </unit>
	[Xpos] real NOT NULL,

	--/ <summary> Object y position </summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit> pix </unit>
	[Ypos] real NOT NULL,

	--/ <summary> Object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg  </unit>
	[RA] float NOT NULL,

	--/ <summary> Object declination (J2000)  </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Flux rms along major axis </summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit> pix </unit>
	[a] real NOT NULL,

	--/ <summary> Flux rms along minor axis </summary>
	--/ <quantity>phys.angSize.sminAxis</quantity>
	--/ <unit> pix </unit>
	[b] real NOT NULL,

	--/ <summary> Position angle </summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> Semi-major axis of half-light ellipse </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pix </unit>
	[HLRad] real NOT NULL,

	--/ <summary> FWHM assuming a Gaussian core </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> pix </unit>
	[FWHM] real NOT NULL,

	--/ <summary> Background at object position  </summary>
	--/ <quantity>instr.background</quantity>
	--/ <unit> ct </unit>
	[Bkgrnd] real NOT NULL,

	--/ <summary> Best of MAG_AUTO and MAG_ISOCOR </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> B_MGC corrected for extinction </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmagc] real NOT NULL,

	--/ <summary> Effective surface brightness </summary>
	--/ <quantity>phot.mag.sb;em.opt.B</quantity>
	--/ <unit> mag arcsec-2 </unit>
	[Bmu] real NOT NULL,

	--/ <summary> Quality class. Photometric quality parameter: This parameter describes the reliability of an object's photometric 
	--/ depending on the level of 
	--/ -contamination by CCD defects satellite trails, cosmic rays and 
	--/ diffractionspikes 
	--/ -blending with a similarly bright object 
	--/ -missing light due to a CCD edge 
	--/ -failed background estimation due to nearby very bright objects. 
	--/ 0:Unclassified 
	--/ 1:Photometric parameters are reliable. 
	--/ 2:Photometric parameters are probably ok. 
	--/ 3:Photometric parameters are unreliable. All objects with Qual=3 lie in exclusion regions. </summary>
	--/ <quantity>meta.code.qual</quantity>
	[Qual] tinyint NOT NULL,

	--/ <summary> Stellaricity </summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[Stel] real NOT NULL,

	--/ <summary> [0/15] Classification parameter. Classification parameter is defined as follows: 
	--/ 0:Unclassified 
	--/ 1:Galaxy 
	--/ 2:Reserved for morphological classification of galaxies 
	--/ 3:Reserved for morphological classification of galaxies 
	--/ 4:Reserved for morphological classification of galaxies 
	--/ 5:Currently unused 
	--/ 6:Currently unused 
	--/ 7:QSO 
	--/ 8:Star 
	--/ 9:Asteroid 
	--/ 10:Satellite trail 
	--/ 11:Cosmic ray 
	--/ 12:CCD defect 
	--/ 13:Diffraction spike 
	--/ 14:Other (noise) 
	--/ 15:Obsolete (ie. replaced by a new catalogue entry) </summary>
	--/ <quantity>src.class</quantity>
	[Class] smallint NOT NULL,

	--/ <summary> [0/1] Exclusion region flag. Exclusion region flag: 
	--/ 0:Object is not in an exclusion region 
	--/ 1:Object is in an exclusion region </summary>
	--/ <quantity>meta.code</quantity>
	[xReg] tinyint NOT NULL,

	--/ <summary> Number of SDSS objects matched to MGC object </summary>
	--/ <quantity>meta.number;src</quantity>
	[NSDSS] smallint NOT NULL,

	--/ <summary> SDSS PhotoObject ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[SDSSid] char(18) NOT NULL,

	--/ <summary> SDSS run number </summary>
	--/ <quantity>meta.id;obs</quantity>
	[SDSSrun] int NOT NULL,

	--/ <summary> SDSS rerun number </summary>
	--/ <quantity>meta.id;obs</quantity>
	[SDSSrun2] smallint NOT NULL,

	--/ <summary> SDSS camera colum </summary>
	--/ <quantity>meta.id;instr</quantity>
	[SDSScam] tinyint NOT NULL,

	--/ <summary> SDSS field number </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[SDSSfld] int NOT NULL,

	--/ <summary> SDSS object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA1deg] float NOT NULL,

	--/ <summary> SDSS object declination (J2000)  </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE1deg] float NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[psfUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[psfGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[psfRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[psfImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[psfZmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[petUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[petGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[petRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[petImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[petZmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <quantity>phot.mag.model;phot.mag.redFree;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[modUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <quantity>phot.mag.model;phot.mag.redFree;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[modGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <quantity>phot.mag.model;phot.mag.redFree;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[modRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <quantity>phot.mag.model;phot.mag.redFree;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[modImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <quantity>phot.mag.model;phot.mag.redFree;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[modZmag] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <quantity>phot.correction; phys.absorption.gal; em.opt.SDSS.u </quantity>
	--/ <unit> mag </unit>
	[galUext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <quantity>phot.correction; phys.absorption.gal; em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[galGext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <quantity>phot.correction; phys.absorption.gal; em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[galRext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <quantity>phot.correction; phys.absorption.gal; em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[galIext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <quantity>phot.correction; phys.absorption.gal; em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[galZext] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <quantity>phy.angSize;phot.aper;em.opt.SDSS.u</quantity>
	--/ <unit> arcsec </unit>
	[R50U] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <quantity>phy.angSize;phot.aper;em.opt.SDSS.g</quantity>
	--/ <unit> arcsec </unit>
	[R50G] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <quantity>phy.angSize;phot.aper;em.opt.SDSS.r</quantity>
	--/ <unit> arcsec </unit>
	[R50R] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <quantity>phy.angSize;phot.aper;em.opt.SDSS.i</quantity>
	--/ <unit> arcsec </unit>
	[R50I] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <quantity>phy.angSize;phot.aper;em.opt.SDSS.z</quantity>
	--/ <unit> arcsec </unit>
	[R50Z] real NOT NULL,

	--/ <summary> [0/6] SDSS morphological classification </summary>
	--/ <quantity>src.morph</quantity>
	[MType] tinyint NOT NULL,

	--/ <summary> [0/8] MGC translation of MType </summary>
	--/ <quantity>src.morph</quantity>
	[Class1] smallint NOT NULL,

	--/ <summary> [0/8] SDSS spectroscopic classification </summary>
	--/ <quantity>src.class;spect</quantity>
	[SpClass] tinyint NOT NULL,

	--/ <summary> [0/14] MGC translation of SpClass </summary>
	--/ <quantity>src.class;spect</quantity>
	[Class2] smallint NOT NULL,

	--/ <summary> Number of 2dFGRS objects/spectra for this MGC object </summary>
	--/ <quantity>meta.number;src</quantity>
	[N2dFGRS] tinyint NOT NULL,

	--/ <summary> 2dFGRS (Cat. VII/226) object name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[twodFGRS] char(10) NOT NULL,

	--/ <summary> 2dFGRS sequence number </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID2dFGRS] bigint NOT NULL,

	--/ <summary> 2dFGRS object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA2deg] float NOT NULL,

	--/ <summary> 2dFGRS object declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE2deg] float NOT NULL,

	--/ <summary> UKST survey field number  </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[UKST] int NOT NULL,

	--/ <summary> 2dFGRS final bJ magnitude </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bJmag] real NOT NULL,

	--/ <summary> 2dFGRS final extinction corrected bJ magnitude </summary>
	--/ <quantity>phot.mag.redFree;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bJmagc] real NOT NULL,

	--/ <summary> uperCOSMOS Sky Surveys (=SSS) bJ magnitude </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bJmagS] real NOT NULL,

	--/ <summary> SSS R magnitude (=TDFGRS_SRRMAG) </summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[RmagS] real NOT NULL,

	--/ <summary> [0/2] 2dFGRS classification </summary>
	--/ <quantity>src.class</quantity>
	[Class3] tinyint NOT NULL,

	--/ <summary> [0/1] MGC translation of Class3 </summary>
	--/ <quantity>src.class</quantity>
	[Class4] tinyint NOT NULL,

	--/ <summary> 2QZ (Cat. VII/233) object name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[twoQZ] char(16) NOT NULL,

	--/ <summary> 2QZ object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA3deg] float NOT NULL,

	--/ <summary> 2QZ object declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE3deg] float NOT NULL,

	--/ <summary> UKST survey field number  </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[UKST2qz] int NOT NULL,

	--/ <summary> 2QZ bJ magnitude </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[bJmag2] real NOT NULL,

	--/ <summary> 2QZ U-bJ colour </summary>
	--/ <quantity>phot.color;em.opt.U;em.opt.B</quantity>
	[U_bJ] real NOT NULL,

	--/ <summary>  2QZ bJ-R colour </summary>
	--/ <quantity>phot.color;em.opt.B;em.opt.R</quantity>
	[bJ_R] real NOT NULL,

	--/ <summary> 2QZ color excess E(B-V) </summary>
	--/ <quantity>phot.color.excess</quantity>
	[Ext_B_V] real NOT NULL,

	--/ <summary> Number of 2QZ spectra for this MGC object </summary>
	--/ <quantity>meta.number;spect</quantity>
	[N2qz] tinyint NOT NULL,

	--/ <summary> 2QZ type </summary>
	--/ <quantity>src.class</quantity>
	[T2qz] char(10) NOT NULL,

	--/ <summary> [0/8] MGC translation of T2qZ </summary>
	--/ <quantity>src.class</quantity>
	[Class5] tinyint NOT NULL,

	--/ <summary> Number of NED objects matched to this MGC object  </summary>
	--/ <quantity>meta.number;src</quantity>
	[NNED] tinyint NOT NULL,

	--/ <summary> NED object name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[NEDname] char(30) NOT NULL,

	--/ <summary> NED object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA4deg] float NOT NULL,

	--/ <summary> NED object declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE4deg] float NOT NULL,

	--/ <summary> NED identification </summary>
	--/ <quantity>src.class</quantity>
	[NEDID] char(3) NOT NULL,

	--/ <summary> [0/7] MGC translation of NEDID  </summary>
	--/ <quantity>src.class</quantity>
	[Class6] tinyint NOT NULL,

	--/ <summary> PFr (Cat. J/AJ/127/646) object name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[PFr] char(7) NOT NULL,

	--/ <summary> PFr object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA5deg] float NOT NULL,

	--/ <summary> PFr object declination (J2000) </summary>
	--/ <quantity>pos.eq.dec.pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE5deg] float NOT NULL,

	--/ <summary> PFr R magnitude from USNO </summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> PFr K magnitude from 2MASS </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Kmag] real NOT NULL,

	--/ <summary> PFr J-K colour from 2MASS </summary>
	--/ <quantity>phot.color;em.IR.J;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[J_K] real NOT NULL,

	--/ <summary> LSBG (Cat. J/MNRAS/304/297) object name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[LSBG] char(12) NOT NULL,

	--/ <summary> LSBG object right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA6deg] float NOT NULL,

	--/ <summary>  LSBG object declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DE6deg] float NOT NULL,

	--/ <summary>  LSBG total B magnitude (=LSBG_BTOT) </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[BTOT] real NOT NULL,

	--/ <summary>  LSBG central surface brightness </summary>
	--/ <quantity>phot.mag.sb</quantity>
	--/ <unit> mag arcsec-2 </unit>
	[SuBr] real NOT NULL,

	--/ <summary> LSBG effective surface brightness </summary>
	--/ <quantity>phot.mag.sb</quantity>
	--/ <unit> mag arcsec-2 </unit>
	[SuBreff] real NOT NULL,

	--/ <summary>  LSBG effective radius  </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> arcsec </unit>
	[Reff] real NOT NULL,

	--/ <summary> MGCz heliocentric redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z1] float NOT NULL,

	--/ <summary> MGCz redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z1] tinyint NOT NULL,

	--/ <summary> SDSS redshift </summary>
	--/ <quantity>src.redshif</quantity>
	[z2] float NOT NULL,

	--/ <summary> SDSS redshift quality (=SDSS_ZQUAL). Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should 
	--/ used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z2] tinyint NOT NULL,

	--/ <summary> 2dFGRS heliocentric redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z3] float NOT NULL,

	--/ <summary> 2dFGRS redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z3] tinyint NOT NULL,

	--/ <summary> 2QZ redshift  </summary>
	--/ <quantity>src.redshift</quantity>
	[z4] float NOT NULL,

	--/ <summary> 2QZ redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z4] tinyint NOT NULL,

	--/ <summary> NED heliocentric redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z5] float NOT NULL,

	--/ <summary> NED redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z5] tinyint NOT NULL,

	--/ <summary> PFr redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z6] float NOT NULL,

	--/ <summary> PFr redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z6] tinyint NOT NULL,

	--/ <summary> LSBG heliocentric redshift  </summary>
	--/ <quantity>src.redshift</quantity>
	[z7] float NOT NULL,

	--/ <summary>  LSBG redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z7] tinyint NOT NULL,

	--/ <summary> Choice for best redshift+quality </summary>
	--/ <quantity>meta.ref</quantity>
	[r_z] char(8) NOT NULL,

	--/ <summary> Best redshift  </summary>
	--/ <quantity>src.redshift</quantity>
	[z] float NOT NULL,

	--/ <summary> Quality of best redshift. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z] tinyint NOT NULL,

	--/ <summary> Total number of spectra for this object </summary>
	--/ <quantity>meta.number;spect</quantity>
	[Nsp] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[MGC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

