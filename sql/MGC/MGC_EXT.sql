USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[MGC] bigint NOT NULL,
	[MGCFN] int NOT NULL,
	[CCD] tinyint NOT NULL,
	[Xpos] real NOT NULL,
	[Ypos] real NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[a] real NOT NULL,
	[b] real NOT NULL,
	[PA] real NOT NULL,
	[HLRad] real NOT NULL,
	[FWHM] real NOT NULL,
	[Bkgrnd] real NOT NULL,
	[Bmag] real NOT NULL,
	[Bmagc] real NOT NULL,
	[Bmu] real NOT NULL,
	[Qual] tinyint NOT NULL,
	[Stel] real NOT NULL,
	[Class] smallint NOT NULL,
	[xReg] tinyint NOT NULL,
	[NSDSS] smallint NOT NULL,
	[SDSSid] char(18) NOT NULL,
	[SDSSrun] int NOT NULL,
	[SDSSrun2] smallint NOT NULL,
	[SDSScam] tinyint NOT NULL,
	[SDSSfld] int NOT NULL,
	[RA1deg] float NOT NULL,
	[DE1deg] float NOT NULL,
	[psfUmag] real NOT NULL,
	[psfGmag] real NOT NULL,
	[psfRmag] real NOT NULL,
	[psfImag] real NOT NULL,
	[psfZmag] real NOT NULL,
	[petUmag] real NOT NULL,
	[petGmag] real NOT NULL,
	[petRmag] real NOT NULL,
	[petImag] real NOT NULL,
	[petZmag] real NOT NULL,
	[modUmag] real NOT NULL,
	[modGmag] real NOT NULL,
	[modRmag] real NOT NULL,
	[modImag] real NOT NULL,
	[modZmag] real NOT NULL,
	[galUext] real NOT NULL,
	[galGext] real NOT NULL,
	[galRext] real NOT NULL,
	[galIext] real NOT NULL,
	[galZext] real NOT NULL,
	[R50U] real NOT NULL,
	[R50G] real NOT NULL,
	[R50R] real NOT NULL,
	[R50I] real NOT NULL,
	[R50Z] real NOT NULL,
	[MType] tinyint NOT NULL,
	[Class1] smallint NOT NULL,
	[SpClass] tinyint NOT NULL,
	[Class2] smallint NOT NULL,
	[N2dFGRS] tinyint NOT NULL,
	[twodFGRS] char(10) NOT NULL,
	[ID2dFGRS] bigint NOT NULL,
	[RA2deg] float NOT NULL,
	[DE2deg] float NOT NULL,
	[UKST] int NOT NULL,
	[bJmag] real NOT NULL,
	[bJmagc] real NOT NULL,
	[bJmagS] real NOT NULL,
	[RmagS] real NOT NULL,
	[Class3] tinyint NOT NULL,
	[Class4] tinyint NOT NULL,
	[twoQZ] char(16) NOT NULL,
	[RA3deg] float NOT NULL,
	[DE3deg] float NOT NULL,
	[UKST2qz] int NOT NULL,
	[bJmag2] real NOT NULL,
	[U_bJ] real NOT NULL,
	[bJ_R] real NOT NULL,
	[Ext_B_V] real NOT NULL,
	[N2qz] tinyint NOT NULL,
	[T2qz] char(10) NOT NULL,
	[Class5] tinyint NOT NULL,
	[NNED] tinyint NOT NULL,
	[NEDname] char(30) NOT NULL,
	[RA4deg] float NOT NULL,
	[DE4deg] float NOT NULL,
	[NEDID] char(3) NOT NULL,
	[Class6] tinyint NOT NULL,
	[PFr] char(7) NOT NULL,
	[RA5deg] float NOT NULL,
	[DE5deg] float NOT NULL,
	[Rmag] real NOT NULL,
	[Kmag] real NOT NULL,
	[J_K] real NOT NULL,
	[LSBG] char(12) NOT NULL,
	[RA6deg] float NOT NULL,
	[DE6deg] float NOT NULL,
	[BTOT] real NOT NULL,
	[SuBr] real NOT NULL,
	[SuBreff] real NOT NULL,
	[Reff] real NOT NULL,
	[z1] float NOT NULL,
	[q_z1] tinyint NOT NULL,
	[z2] float NOT NULL,
	[q_z2] tinyint NOT NULL,
	[z3] float NOT NULL,
	[q_z3] tinyint NOT NULL,
	[z4] float NOT NULL,
	[q_z4] tinyint NOT NULL,
	[z5] float NOT NULL,
	[q_z5] tinyint NOT NULL,
	[z6] float NOT NULL,
	[q_z6] tinyint NOT NULL,
	[z7] float NOT NULL,
	[q_z7] tinyint NOT NULL,
	[r_z] char(8) NOT NULL,
	[z] float NOT NULL,
	[q_z] tinyint NOT NULL,
	[Nsp] tinyint NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[MGC] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\MGC\mgc.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SpecObj', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObj;

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

	--/ <summary> MGC object ID/serial number (=ID) </summary>
	[MGC] bigint NOT NULL,

	--/ <summary> MGC field number (=MGCFN) </summary>
	[MGCFN] int NOT NULL,

	--/ <summary> CCD number (=CCD) </summary>
	[CCD] tinyint NOT NULL,

	--/ <summary> Object x position </summary>
	--/ <unit> pix </unit>
	[Xpos] real NOT NULL,

	--/ <summary> Object y position </summary>
	--/ <unit> pix </unit>
	[Ypos] real NOT NULL,

	--/ <summary> Object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Object declination (J2000)  </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Flux rms along major axis </summary>
	--/ <unit> pix </unit>
	[a] real NOT NULL,

	--/ <summary> Flux rms along minor axis </summary>
	--/ <unit> pix </unit>
	[b] real NOT NULL,

	--/ <summary> Position angle </summary>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> Semi-major axis of half-light ellipse </summary>
	--/ <unit> pix </unit>
	[HLRad] real NOT NULL,

	--/ <summary> FWHM assuming a Gaussian core </summary>
	--/ <unit> pix </unit>
	[FWHM] real NOT NULL,

	--/ <summary> Background at object position  </summary>
	--/ <unit> ct </unit>
	[Bkgrnd] real NOT NULL,

	--/ <summary> Best of MAG_AUTO and MAG_ISOCOR </summary>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> B_MGC corrected for extinction </summary>
	--/ <unit> mag </unit>
	[Bmagc] real NOT NULL,

	--/ <summary> Effective surface brightness </summary>
	--/ <unit> mag/arcsec2 </unit>
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
	[Qual] tinyint NOT NULL,

	--/ <summary> Stellaricity </summary>
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
	[Class] smallint NOT NULL,

	--/ <summary> [0/1] Exclusion region flag. Exclusion region flag: 
	--/ 0:Object is not in an exclusion region 
	--/ 1:Object is in an exclusion region </summary>
	[xReg] tinyint NOT NULL,

	--/ <summary> Number of SDSS objects matched to MGC object </summary>
	[NSDSS] smallint NOT NULL,

	--/ <summary> SDSS PhotoObject ID </summary>
	[SDSSid] char(18) NOT NULL,

	--/ <summary> SDSS run number </summary>
	[SDSSrun] int NOT NULL,

	--/ <summary> SDSS rerun number </summary>
	[SDSSrun2] smallint NOT NULL,

	--/ <summary> SDSS camera colum </summary>
	[SDSScam] tinyint NOT NULL,

	--/ <summary> SDSS field number </summary>
	[SDSSfld] int NOT NULL,

	--/ <summary> SDSS object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA1deg] float NOT NULL,

	--/ <summary> SDSS object declination (J2000)  </summary>
	--/ <unit> deg (J2000) </unit>
	[DE1deg] float NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <unit> mag </unit>
	[psfUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <unit> mag </unit>
	[psfGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <unit> mag </unit>
	[psfRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <unit> mag </unit>
	[psfImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected PSF magnitude </summary>
	--/ <unit> mag </unit>
	[psfZmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <unit> mag </unit>
	[petUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <unit> mag </unit>
	[petGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <unit> mag </unit>
	[petRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <unit> mag </unit>
	[petImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected Petrosian magnitude </summary>
	--/ <unit> mag </unit>
	[petZmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <unit> mag </unit>
	[modUmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <unit> mag </unit>
	[modGmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <unit> mag </unit>
	[modRmag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <unit> mag </unit>
	[modImag] real NOT NULL,

	--/ <summary> SDSS extinction corrected model magnitude </summary>
	--/ <unit> mag </unit>
	[modZmag] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <unit> mag </unit>
	[galUext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <unit> mag </unit>
	[galGext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <unit> mag </unit>
	[galRext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <unit> mag </unit>
	[galIext] real NOT NULL,

	--/ <summary> SDSS Galactic extinction correction </summary>
	--/ <unit> mag </unit>
	[galZext] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <unit> arcsec </unit>
	[R50U] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <unit> arcsec </unit>
	[R50G] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <unit> arcsec </unit>
	[R50R] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <unit> arcsec </unit>
	[R50I] real NOT NULL,

	--/ <summary> SDSS radius containing 50% Petrosian flux </summary>
	--/ <unit> arcsec </unit>
	[R50Z] real NOT NULL,

	--/ <summary> [0/6] SDSS morphological classification </summary>
	[MType] tinyint NOT NULL,

	--/ <summary> [0/8] MGC translation of MType </summary>
	[Class1] smallint NOT NULL,

	--/ <summary> [0/8] SDSS spectroscopic classification </summary>
	[SpClass] tinyint NOT NULL,

	--/ <summary> [0/14] MGC translation of SpClass </summary>
	[Class2] smallint NOT NULL,

	--/ <summary> Number of 2dFGRS objects/spectra for this MGC object </summary>
	[N2dFGRS] tinyint NOT NULL,

	--/ <summary> 2dFGRS (Cat. VII/226) object name </summary>
	[twodFGRS] char(10) NOT NULL,

	--/ <summary> 2dFGRS sequence number </summary>
	[ID2dFGRS] bigint NOT NULL,

	--/ <summary> 2dFGRS object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA2deg] float NOT NULL,

	--/ <summary> 2dFGRS object declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DE2deg] float NOT NULL,

	--/ <summary> UKST survey field number  </summary>
	[UKST] int NOT NULL,

	--/ <summary> 2dFGRS final bJ magnitude </summary>
	--/ <unit> mag </unit>
	[bJmag] real NOT NULL,

	--/ <summary> 2dFGRS final extinction corrected bJ magnitude </summary>
	--/ <unit> mag </unit>
	[bJmagc] real NOT NULL,

	--/ <summary> uperCOSMOS Sky Surveys (=SSS) bJ magnitude </summary>
	--/ <unit> mag </unit>
	[bJmagS] real NOT NULL,

	--/ <summary> SSS R magnitude (=TDFGRS_SRRMAG) </summary>
	--/ <unit> mag </unit>
	[RmagS] real NOT NULL,

	--/ <summary> [0/2] 2dFGRS classification </summary>
	[Class3] tinyint NOT NULL,

	--/ <summary> [0/1] MGC translation of Class3 </summary>
	[Class4] tinyint NOT NULL,

	--/ <summary> 2QZ (Cat. VII/233) object name </summary>
	[twoQZ] char(16) NOT NULL,

	--/ <summary> 2QZ object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA3deg] float NOT NULL,

	--/ <summary> 2QZ object declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DE3deg] float NOT NULL,

	--/ <summary> UKST survey field number  </summary>
	[UKST2qz] int NOT NULL,

	--/ <summary> 2QZ bJ magnitude </summary>
	--/ <unit> mag </unit>
	[bJmag2] real NOT NULL,

	--/ <summary> 2QZ U-bJ colour </summary>
	--/ <unit> mag </unit>
	[U_bJ] real NOT NULL,

	--/ <summary>  2QZ bJ-R colour </summary>
	--/ <unit> mag </unit>
	[bJ_R] real NOT NULL,

	--/ <summary> 2QZ color excess E(B-V) </summary>
	--/ <unit> mag </unit>
	[Ext_B_V] real NOT NULL,

	--/ <summary> Number of 2QZ spectra for this MGC object </summary>
	[N2qz] tinyint NOT NULL,

	--/ <summary> 2QZ type </summary>
	[T2qz] char(10) NOT NULL,

	--/ <summary> [0/8] MGC translation of T2qZ </summary>
	[Class5] tinyint NOT NULL,

	--/ <summary> Number of NED objects matched to this MGC object  </summary>
	[NNED] tinyint NOT NULL,

	--/ <summary> NED object name </summary>
	[NEDname] char(30) NOT NULL,

	--/ <summary> NED object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA4deg] float NOT NULL,

	--/ <summary> NED object declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DE4deg] float NOT NULL,

	--/ <summary> NED identification </summary>
	[NEDID] char(3) NOT NULL,

	--/ <summary> [0/7] MGC translation of NEDID  </summary>
	[Class6] tinyint NOT NULL,

	--/ <summary> PFr (Cat. J/AJ/127/646) object name </summary>
	[PFr] char(7) NOT NULL,

	--/ <summary> PFr object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA5deg] float NOT NULL,

	--/ <summary> PFr object declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DE5deg] float NOT NULL,

	--/ <summary> PFr R magnitude from USNO </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> PFr K magnitude from 2MASS </summary>
	--/ <unit> mag </unit>
	[Kmag] real NOT NULL,

	--/ <summary> PFr J-K colour from 2MASS </summary>
	--/ <unit> mag </unit>
	[J_K] real NOT NULL,

	--/ <summary> LSBG (Cat. J/MNRAS/304/297) object name </summary>
	[LSBG] char(12) NOT NULL,

	--/ <summary> LSBG object right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA6deg] float NOT NULL,

	--/ <summary>  LSBG object declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DE6deg] float NOT NULL,

	--/ <summary>  LSBG total B magnitude (=LSBG_BTOT) </summary>
	--/ <unit> mag </unit>
	[BTOT] real NOT NULL,

	--/ <summary>  LSBG central surface brightness </summary>
	--/ <unit> mag/arcsec2 </unit>
	[SuBr] real NOT NULL,

	--/ <summary> LSBG effective surface brightness </summary>
	--/ <unit> mag/arcsec2 </unit>
	[SuBreff] real NOT NULL,

	--/ <summary>  LSBG effective radius  </summary>
	--/ <unit> arcsec </unit>
	[Reff] real NOT NULL,

	--/ <summary> MGCz heliocentric redshift </summary>
	[z1] float NOT NULL,

	--/ <summary> MGCz redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z1] tinyint NOT NULL,

	--/ <summary> SDSS redshift </summary>
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
	[q_z2] tinyint NOT NULL,

	--/ <summary> 2dFGRS heliocentric redshift </summary>
	[z3] float NOT NULL,

	--/ <summary> 2dFGRS redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z3] tinyint NOT NULL,

	--/ <summary> 2QZ redshift  </summary>
	[z4] float NOT NULL,

	--/ <summary> 2QZ redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z4] tinyint NOT NULL,

	--/ <summary> NED heliocentric redshift </summary>
	[z5] float NOT NULL,

	--/ <summary> NED redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z5] tinyint NOT NULL,

	--/ <summary> PFr redshift </summary>
	[z6] float NOT NULL,

	--/ <summary> PFr redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z6] tinyint NOT NULL,

	--/ <summary> LSBG heliocentric redshift  </summary>
	[z7] float NOT NULL,

	--/ <summary>  LSBG redshift quality. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z7] tinyint NOT NULL,

	--/ <summary> Choice for best redshift+quality </summary>
	[r_z] char(8) NOT NULL,

	--/ <summary> Best redshift  </summary>
	[z] float NOT NULL,

	--/ <summary> Quality of best redshift. Spectroscopic quality parameter (Normally only redshifts with q_z&ge;3 should be used): 
	--/ 1:Something is clearly wrong with the spectrum or there is absolutely no flux. Redshift measurement is not possible. 
	--/ with this q_z are meaningless 
	--/ 2:Low quality spectrum. Probability that redshift is correct is low. 
	--/ 3:Reasonable spectrum. Redshift is probably correct. 
	--/ 4:Good quality spectrum. Very reliable redshift. 
	--/ 5:very good quality spectrum. Very reliable redshift. 
	--/ 9:The database contains no spectroscopic information for this object </summary>
	[q_z] tinyint NOT NULL,

	--/ <summary> Total number of spectra for this object </summary>
	[Nsp] tinyint NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[MGC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, MGC, MGCFN, CCD, Xpos, Ypos, RA, DEC, a, b, PA, HLRad, FWHM, Bkgrnd, Bmag, Bmagc, Bmu, Qual, Stel, Class, xReg, NSDSS, SDSSid, SDSSrun, SDSSrun2, SDSScam, SDSSfld, RA1deg, DE1deg, psfUmag, psfGmag, psfRmag, psfImag, psfZmag, petUmag, petGmag, petRmag, petImag, petZmag, modUmag, modGmag, modRmag, modImag, modZmag, galUext, galGext, galRext, galIext, galZext, R50U, R50G, R50R, R50I, R50Z, MType, Class1, SpClass, Class2, N2dFGRS, twodFGRS, ID2dFGRS, RA2deg, DE2deg, UKST, bJmag, bJmagc, bJmagS, RmagS, Class3, Class4, twoQZ, RA3deg, DE3deg, UKST2qz, bJmag2, U_bJ, bJ_R, Ext_B_V, N2qz, T2qz, Class5, NNED, NEDname, RA4deg, DE4deg, NEDID, Class6, PFr, RA5deg, DE5deg, Rmag, Kmag, J_K, LSBG, RA6deg, DE6deg, BTOT, SuBr, SuBreff, Reff, z1, q_z1, z2, q_z2, z3, q_z3, z4, q_z4, z5, q_z5, z6, q_z6, z7, q_z7, r_z, z, q_z, Nsp)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, Spherical.htm.FromXyz(c.x,c.y,c.z) AS htmid, MGC, MGCFN, CCD, Xpos, Ypos, RA, DEC, a, b, PA, HLRad, FWHM, Bkgrnd, Bmag, Bmagc, Bmu, Qual, Stel, Class, xReg, NSDSS, SDSSid, SDSSrun, SDSSrun2, SDSScam, SDSSfld, RA1deg, DE1deg, psfUmag, psfGmag, psfRmag, psfImag, psfZmag, petUmag, petGmag, petRmag, petImag, petZmag, modUmag, modGmag, modRmag, modImag, modZmag, galUext, galGext, galRext, galIext, galZext, R50U, R50G, R50R, R50I, R50Z, MType, Class1, SpClass, Class2, N2dFGRS, twodFGRS, ID2dFGRS, RA2deg, DE2deg, UKST, bJmag, bJmagc, bJmagS, RmagS, Class3, Class4, twoQZ, RA3deg, DE3deg, UKST2qz, bJmag2, U_bJ, bJ_R, Ext_B_V, N2qz, T2qz, Class5, NNED, NEDname, RA4deg, DE4deg, NEDID, Class6, PFr, RA5deg, DE5deg, Rmag, Kmag, J_K, LSBG, RA6deg, DE6deg, BTOT, SuBr, SuBreff, Reff, z1, q_z1, z2, q_z2, z3, q_z3, z4, q_z4, z5, q_z5, z6, q_z6, z7, q_z7, r_z, SpecObjRAW.z, q_z, Nsp
FROM dbo.SpecObjRAW
CROSS APPLY Spherical.point.ConvertEqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE SpecObjRAW

GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_SpecObj_htmid] ON [dbo].[SpecObj]
(
	[htmid] ASC
)

GO
