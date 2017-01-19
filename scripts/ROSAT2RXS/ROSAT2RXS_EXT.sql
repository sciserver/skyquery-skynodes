USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SourceObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SourceObjRAW;

GO

-- CREATE SourceObjRAW TABLE
CREATE TABLE dbo.SourceObjRAW
(	[IAU_NAME] char(21) NOT NULL,
	[SEQ_ID] bigint NOT NULL,
	[IND_DET] int NOT NULL,
	[EXI_ML] float NOT NULL,
	[CTS] float NOT NULL,
	[CERR] float NOT NULL,
	[RATE] float NOT NULL,
	[ERATE] float NOT NULL,
	[EXPOSURE] float NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[RA_HMS] char(12) NOT NULL,
	[DEC_DMS] char(12) NOT NULL,
	[LII] float NOT NULL,
	[BII] float NOT NULL,
	[LAMBDA] float NOT NULL,
	[BETA] float NOT NULL,
	[EXT] float NOT NULL,
	[EXTERR] float NOT NULL,
	[EXT_ML] float NOT NULL,
	[HR_1] float NOT NULL,
	[HR_1_err] float NOT NULL,
	[HR_2] float NOT NULL,
	[HR_2_err] float NOT NULL,
	[USKY] tinyint NOT NULL,
	[Masked] tinyint NOT NULL,
	[FLAG_all] smallint NOT NULL,
	[S_flag] smallint NOT NULL,
	[INDEX] bigint NOT NULL,
	[AMPL_MAX] float NOT NULL,
	[CM] float NOT NULL,
	[CD] float NOT NULL,
	[CTS_lc] float NOT NULL,
	[CMIN] float NOT NULL,
	[CMAX] float NOT NULL,
	[EMIN] float NOT NULL,
	[EMAX] float NOT NULL,
	[CHI2_lc] float NOT NULL,
	[EXCESS_VAR] float NOT NULL,
	[UNCERTAINTY] float NOT NULL,
	[Sigma_Excess] float NOT NULL,
	[NH_gal] float NOT NULL,
	[NH_fit_p] float NOT NULL,
	[NH_err_p] float NOT NULL,
	[NORM_p] float NOT NULL,
	[NORM_err_p] float NOT NULL,
	[GAMMA_p] float NOT NULL,
	[GAMMA_err_p] float NOT NULL,
	[CTR_spec_p] float NOT NULL,
	[FLUX_p] float NOT NULL,
	[Chi2red_spec_p] float NOT NULL,
	[Chi2_spec_p] float NOT NULL,
	[Num_Data_pts_p] smallint NOT NULL,
	[Num_Deg_free_p] smallint NOT NULL,
	[NH_fit_m] float NOT NULL,
	[NH_err_m] float NOT NULL,
	[NORM_m] float NOT NULL,
	[NORM_err_m] float NOT NULL,
	[Temp_fit_m] float NOT NULL,
	[Temp_err_m] float NOT NULL,
	[CTR_spec_m] float NOT NULL,
	[FLUX_m] float NOT NULL,
	[Chi2red_spec_m] float NOT NULL,
	[Chi2_spec_m] float NOT NULL,
	[Num_Data_pts_m] smallint NOT NULL,
	[Num_Deg_free_m] smallint NOT NULL,
	[NH_fit_b] float NOT NULL,
	[NH_err_b] float NOT NULL,
	[NORM_b] float NOT NULL,
	[NORM_err_b] float NOT NULL,
	[Temp_fit_b] float NOT NULL,
	[Temp_err_b] float NOT NULL,
	[CTR_spec_b] float NOT NULL,
	[FLUX_b] float NOT NULL,
	[Chi2red_spec_b] float NOT NULL,
	[Chi2_spec_b] float NOT NULL,
	[Num_Data_pts_b] smallint NOT NULL,
	[Num_Deg_free_b] smallint NOT NULL,
	[X_IMA] float NOT NULL,
	[Y_IMA] float NOT NULL,
	[XERR] float NOT NULL,
	[YERR] float NOT NULL,
	[X_SKY] float NOT NULL,
	[Y_SKY] float NOT NULL,
	[CUT_RAD] int NOT NULL,
	[FA] real NOT NULL,
	[TOTNUM] float NOT NULL,
	[BGR] float NOT NULL,
	[VIG_COR] float NOT NULL,
	[REMARKS] char(12) NOT NULL,
	[SB1] float NOT NULL,
	[SB2] float NOT NULL,
	[SB3] float NOT NULL,
	[SB4] float NOT NULL,
	[B1] float NOT NULL,
	[B2] float NOT NULL,
	[B3] float NOT NULL,
	[B4] float NOT NULL,
	[B_SPA] float NOT NULL,
	[S1] float NOT NULL,
	[S2] float NOT NULL,
	[S3] float NOT NULL,
	[S4] float NOT NULL,
	[mult_xmmsl1] smallint NOT NULL,
	[entr_xmmsl1] int NOT NULL,
	[dist_xmmsl1] real NOT NULL,
	[RA_xmmsl1] float NOT NULL,
	[DEC_xmmsl1] float NOT NULL,
	[SRCNAME_xmmsl1] char(40) NOT NULL,
	[RATE_B0_xmmsl1] float NOT NULL,
	[RATE_B0e_xmmsl1] float NOT NULL,
	[RATE_B5_xmmsl1] float NOT NULL,
	[RATE_B5e_xmmsl1] float NOT NULL,
	[mult_3xmm] smallint NOT NULL,
	[entr_3xmm] int NOT NULL,
	[dist_3xmm] real NOT NULL,
	[RA_3xmm] float NOT NULL,
	[DEC_3xmm] float NOT NULL,
	[SRCNAME_3xmm] char(21) NOT NULL,
	[RATE_EP8_3xmm] float NOT NULL,
	[RATE_EP8e_3xmm] float NOT NULL,
	[FLUX_R_3xmm] float NOT NULL,
	[FLUX_R_err_3xmm] float NOT NULL,
	[mult_2rxp] smallint NOT NULL,
	[entr_2rxp] int NOT NULL,
	[dist_2rxp] real NOT NULL,
	[RA_2rxp] float NOT NULL,
	[DEC_2rxp] float NOT NULL,
	[SRCNAME_2rxp] char(16) NOT NULL,
	[CRATE_2rxp] float NOT NULL,
	[CRATE_err_2rxp] float NOT NULL,
	[ExpTime_2rxp] int NOT NULL,
	[ObsID_2rxp] char(15) NOT NULL,
	[mult_1rxs] smallint NOT NULL,
	[entr_1rxs] int NOT NULL,
	[dist_1rxs] real NOT NULL,
	[RA_1rxs] float NOT NULL,
	[DEC_1rxs] float NOT NULL,
	[SRCNAME_1rxs] char(16) NOT NULL,
	[RATE_1rxs] float NOT NULL,
	[RATE_err_1rxs] float NOT NULL,
	[CTS_1rxs] float NOT NULL,
	[CTS_err_1rxs] float NOT NULL,
	[EXI_ML_1rxs] int NOT NULL,
	[EXPOS_1rxs] bigint NOT NULL,
	[HR1_1rxs] real NOT NULL,
	[HR1e_1rxs] real NOT NULL,
	[HR2_1rxs] real NOT NULL,
	[HR2e_1rxs] real NOT NULL,
	[mult_vv10] smallint NOT NULL,
	[entr_vv10] int NOT NULL,
	[dist_vv10] real NOT NULL,
	[NAME_vv10] char(17) NOT NULL,
	[Type_vv10] char(1) NOT NULL,
	[Vmag_vv10] real NOT NULL,
	[z_vv10] real NOT NULL,
	[Index_vv10] int NOT NULL,
	[RA_vv10] float NOT NULL,
	[DEC_vv10] float NOT NULL,
	[mult_tyc2] smallint NOT NULL,
	[entr_tyc2] int NOT NULL,
	[dist_tyc2] real NOT NULL,
	[RA_tyc2] float NOT NULL,
	[DEC_tyc2] float NOT NULL,
	[RecNo_tyc2] bigint NOT NULL,
	[VTmag_tyc2] real NOT NULL,
	[BTmag_tyc2] real NOT NULL,
	[TYC1_tyc2] int NOT NULL,
	[TYC2_tyc2] int NOT NULL,
	[TYC3_tyc2] tinyint NOT NULL,
	[mult_bri] smallint NOT NULL,
	[entr_bri] int NOT NULL,
	[dist_bri] real NOT NULL,
	[RA_bri] float NOT NULL,
	[DEC_bri] float NOT NULL,
	[Vmag_bri] real NOT NULL,
	[SpType_bri] char(20) NOT NULL,
	[RecNo_bri] int NOT NULL,
	[HD_bri] int NOT NULL,
	[mult_hmxb] smallint NOT NULL,
	[entr_hmxb] int NOT NULL,
	[dist_hmxb] real NOT NULL,
	[RA_hmxb] float NOT NULL,
	[DEC_hmxb] float NOT NULL,
	[Name_hmxb] char(21) NOT NULL,
	[Name2_hmxb] char(21) NOT NULL,
	[Vmag_hmxb] real NOT NULL,
	[mult_lmxb] smallint NOT NULL,
	[entr_lmxb] int NOT NULL,
	[dist_lmxb] real NOT NULL,
	[RA_lmxb] float NOT NULL,
	[DEC_lmxb] float NOT NULL,
	[Name_lmxb] char(16) NOT NULL,
	[Name2_lmxb] char(13) NOT NULL,
	[Vmag_lmxb] real NOT NULL,
	[mult_atnf] smallint NOT NULL,
	[entr_atnf] int NOT NULL,
	[dist_atnf] real NOT NULL,
	[RA_atnf] float NOT NULL,
	[DEC_atnf] float NOT NULL,
	[Name_atnf] char(16) NOT NULL,
	[Type_atnf] char(11) NOT NULL,
	[Period_atnf] char(21) NOT NULL,
	[mult_fuh] smallint NOT NULL,
	[entr_fuh] int NOT NULL,
	[dist_fuh] real NOT NULL,
	[RA_fuh] float NOT NULL,
	[DEC_fuh] float NOT NULL,
	[Seq_fuh] char(4) NOT NULL,
	[Name_fuh] char(30) NOT NULL,
	[mult_1sxps] smallint NOT NULL,
	[entr_1sxps] int NOT NULL,
	[dist_1sxps] real NOT NULL,
	[RA_1sxps] float NOT NULL,
	[DEC_1sxps] float NOT NULL,
	[Expos_1sxps] float NOT NULL,
	[DET_1sxps] int NOT NULL,
	[DET0_1sxps] int NOT NULL,
	[DET1_1sxps] int NOT NULL,
	[DET2_1sxps] int NOT NULL,
	[DET3_1sxps] int NOT NULL,
	[INDEX_1sxps] int NOT NULL,
	[Rate0_1sxps] float NOT NULL,
	[ERate0_1sxps] float NOT NULL,
	[mult_1rxh] smallint NOT NULL,
	[entr_1rxh] int NOT NULL,
	[dist_1rxh] real NOT NULL,
	[RA_1rxh] float NOT NULL,
	[DEC_1rxh] float NOT NULL,
	[SRCNAME_1rxh] char(21) NOT NULL,
	[CRATE_1rxh] float NOT NULL,
	[CRATE_err_1rxh] float NOT NULL,
	[ExpTime_1rxh] int NOT NULL,
	[SNR_1rxh] real NOT NULL,
	[mult_flem] smallint NOT NULL,
	[entr_flem] int NOT NULL,
	[dist_flem] real NOT NULL,
	[RA_flem] float NOT NULL,
	[DEC_flem] float NOT NULL,
	[SRCNAME_flem] char(14) NOT NULL,
	[Type_flem] char(10) NOT NULL,
	[WFC_flem] char(1) NOT NULL,
	[Rate_flem] real NOT NULL,
	[e_Rate_flem] real NOT NULL,
	[mult_wd] smallint NOT NULL,
	[entr_wd] int NOT NULL,
	[dist_wd] real NOT NULL,
	[RA_wd] float NOT NULL,
	[DEC_wd] float NOT NULL,
	[SRCNAME_wd] char(10) NOT NULL,
	[Vmag_wd] real NOT NULL,
	[Vsphot_wd] real NOT NULL,
	[mult_sdss] smallint NOT NULL,
	[entr_sdss] int NOT NULL,
	[dist_sdss] real NOT NULL,
	[RA_sdss] float NOT NULL,
	[DEC_sdss] float NOT NULL,
	[SDSS_NAME] char(24) NOT NULL,
	[LAMBDA_sdss] float NOT NULL,
	[BETA_sdss] float NOT NULL,
	[mult_2rxs] smallint NOT NULL,
	[entr_2rxs] int NOT NULL,
	[dist_2rxs] real NOT NULL,
	[INDEX_2rxs] int NOT NULL,
	[SEQ_ID_2rxs] int NOT NULL,
	[IND_DET_2rxs] int NOT NULL,
	[EXI_ML_2rxs] float NOT NULL,
	[RATE_2rxs] float NOT NULL,
	[RA_2rxs] float NOT NULL,
	[DEC_2rxs] float NOT NULL,
	[USKY_2rxs] smallint NOT NULL,
	[FLAG_2rxs] smallint NOT NULL,
	[BKG_id] smallint NOT NULL,
	[X_BKG_1] float NOT NULL,
	[Y_BKG_1] float NOT NULL,
	[X_BKG_2] float NOT NULL,
	[Y_BKG_2] float NOT NULL,
	[BGR_1rxs] float NOT NULL,
	[BGR_2rxs] float NOT NULL,
	[LFLAG] smallint NOT NULL,
	[CM6] float NOT NULL,
	[CD6] float NOT NULL,
	[EXCESSVAR6] float NOT NULL,
	[UNCERTAINTY6] float NOT NULL,
	[NBINS_A] int NOT NULL,
	[NBINS_6] int NOT NULL,
	[NBINS_1] int NOT NULL,
	[NBINS_N] int NOT NULL,
	[CMIN6] float NOT NULL,
	[CMAX6] float NOT NULL,
	[EMIN6] float NOT NULL,
	[EMAX6] float NOT NULL,
	[CTS_lc6] float NOT NULL,
	[SIGMA_excess6] float NOT NULL,
	[CM_plus_CD] float NOT NULL,
	[SPX] tinyint NOT NULL,
	[LCX] tinyint NOT NULL,
	[OBS_CLOCK_1] float NOT NULL,
	[OBS_CLOCK_2] float NOT NULL,
	[OBS_DATE_1] char(11) NOT NULL,
	[OBS_UT_1] char(10) NOT NULL,
	[OBS_DATE_2] char(11) NOT NULL,
	[OBS_UT_2] char(10) NOT NULL,
	[IND_2RXS] int NOT NULL,

	CONSTRAINT [PK_SourceObjRAW] PRIMARY KEY CLUSTERED
(
	[IAU_NAME] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SourceObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\\TwoRXS\TwoRXS_SourceObj.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SourceObj', 'U') IS NOT NULL
	DROP TABLE dbo.SourceObj;

GO

-- CREATE SourceObj TABLE
CREATE TABLE dbo.SourceObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> IAU name. Each source has been attributed an IAU name according to the IAU conventions. As this is the second ROSAT 
	--/ of point sources the prefix 2RXS is given in addition to the coordinate naming convention. </summary>
	[IAU_NAME] char(21) NOT NULL,

	--/ <summary> Sky field number </summary>
	[SEQ_ID] bigint NOT NULL,

	--/ <summary> Source number in a certain sky field </summary>
	[IND_DET] int NOT NULL,

	--/ <summary> Detection likelihood </summary>
	[EXI_ML] float NOT NULL,

	--/ <summary> Background corrected source counts </summary>
	--/ <unit> ct </unit>
	[CTS] float NOT NULL,

	--/ <summary> Error of the source counts </summary>
	--/ <unit> ct </unit>
	[CERR] float NOT NULL,

	--/ <summary> Source count rate </summary>
	--/ <unit> ct s-1 </unit>
	[RATE] float NOT NULL,

	--/ <summary> Error of the count rate </summary>
	--/ <unit> ct s-1 </unit>
	[ERATE] float NOT NULL,

	--/ <summary> Source exposure time </summary>
	--/ <unit> s </unit>
	[EXPOSURE] float NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Sexadecimal right ascension </summary>
	[RA_HMS] char(12) NOT NULL,

	--/ <summary> Sexadecimal declination </summary>
	[DEC_DMS] char(12) NOT NULL,

	--/ <summary> 	Latitude in galactic coordinate </summary>
	--/ <unit> deg </unit>
	[LII] float NOT NULL,

	--/ <summary> Longitude in galactic coordinate </summary>
	--/ <unit> deg </unit>
	[BII] float NOT NULL,

	--/ <summary> Latitude in ecliptic coordinate </summary>
	--/ <unit> deg </unit>
	[LAMBDA] float NOT NULL,

	--/ <summary> Longitude in ecliptic coordinate </summary>
	--/ <unit> deg </unit>
	[BETA] float NOT NULL,

	--/ <summary> 	Source extent in units of image pixels </summary>
	--/ <unit> pix </unit>
	[EXT] float NOT NULL,

	--/ <summary> 	Error of the source extent </summary>
	--/ <unit> pix </unit>
	[EXTERR] float NOT NULL,

	--/ <summary> Proability of the source extend </summary>
	[EXT_ML] float NOT NULL,

	--/ <summary> Hardness ratio 1 value. Hardness ratio 1 values as calculated from the source counts in the energy channels A (11-41), B 
	--/ by: HR_1=(B-A)/(B+A)  
	--/ Hardness ratio 2 values as calculated from the source counts in the  
	--/ energy channels C (52-90), D(91-201) by: HR_2=(D-C)/(D+C) </summary>
	[HR_1] float NOT NULL,

	--/ <summary> Error of HR1 </summary>
	[HR_1_err] float NOT NULL,

	--/ <summary> Hardness ratio 2 value. Hardness ratio 1 values as calculated from the source counts in the energy channels A (11-41), B 
	--/ by: HR_1=(B-A)/(B+A)  
	--/ Hardness ratio 2 values as calculated from the source counts in the  
	--/ energy channels C (52-90), D(91-201) by: HR_2=(D-C)/(D+C) </summary>
	[HR_2] float NOT NULL,

	--/ <summary> Error of HR2 </summary>
	[HR_2_err] float NOT NULL,

	--/ <summary> Unique flag. Sub-field detection cell defined in sky coordinates. </summary>
	[USKY] tinyint NOT NULL,

	--/ <summary> [1] Extended emission regions (0=yes 1=no) </summary>
	[Masked] tinyint NOT NULL,

	--/ <summary> [0] Detection flag of nearby sources 0=best </summary>
	[FLAG_all] smallint NOT NULL,

	--/ <summary> S flag (0=good) </summary>
	[S_flag] smallint NOT NULL,

	--/ <summary> Running number in catalogue </summary>
	[INDEX] bigint NOT NULL,

	--/ <summary> Maximum amplitude variability  </summary>
	[AMPL_MAX] float NOT NULL,

	--/ <summary> Error of CMIN </summary>
	--/ <unit> ct s-1 </unit>
	[CM] float NOT NULL,

	--/ <summary> Standard deviation of CM </summary>
	--/ <unit> ct s-1 </unit>
	[CD] float NOT NULL,

	--/ <summary> Number of counts calculated from the light curve analysis </summary>
	--/ <unit> ct </unit>
	[CTS_lc] float NOT NULL,

	--/ <summary> Minimum count rate </summary>
	--/ <unit> ct s-1 </unit>
	[CMIN] float NOT NULL,

	--/ <summary> Maximum count rate </summary>
	--/ <unit> ct s-1 </unit>
	[CMAX] float NOT NULL,

	--/ <summary> Error of CMIN </summary>
	--/ <unit> ct s-1 </unit>
	[EMIN] float NOT NULL,

	--/ <summary> Error of CMAX </summary>
	--/ <unit> ct s-1 </unit>
	[EMAX] float NOT NULL,

	--/ <summary> Chi2 value from the LC analysis </summary>
	[CHI2_lc] float NOT NULL,

	--/ <summary> Normalized excess variance </summary>
	[EXCESS_VAR] float NOT NULL,

	--/ <summary> One-sigma uncertainty of Exc_Var </summary>
	[UNCERTAINTY] float NOT NULL,

	--/ <summary> Excess variance in units of sigma </summary>
	[Sigma_Excess] float NOT NULL,

	--/ <summary> Galactic neutral hydrogen density </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_gal] float NOT NULL,

	--/ <summary> neutral hydrogen density of PL fits </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_fit_p] float NOT NULL,

	--/ <summary> Error of NHfitp </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_err_p] float NOT NULL,

	--/ <summary> Normalization for PL fits </summary>
	[NORM_p] float NOT NULL,

	--/ <summary> Error of NORM_p </summary>
	[NORM_err_p] float NOT NULL,

	--/ <summary> Photon index  </summary>
	[GAMMA_p] float NOT NULL,

	--/ <summary> Error of GAMMA_p </summary>
	[GAMMA_err_p] float NOT NULL,

	--/ <summary> Count rate obtained from the PL fit </summary>
	--/ <unit> ct s-1 </unit>
	[CTR_spec_p] float NOT NULL,

	--/ <summary> Absorption corrected flux of PL-fit  </summary>
	--/ <unit> mW m-2 </unit>
	[FLUX_p] float NOT NULL,

	--/ <summary> Reduced chi^2 value for the PL-fits </summary>
	[Chi2red_spec_p] float NOT NULL,

	--/ <summary> Chi^2 value for the power-law-fits </summary>
	[Chi2_spec_p] float NOT NULL,

	--/ <summary> Number of data points for the PL-fits </summary>
	[Num_Data_pts_p] smallint NOT NULL,

	--/ <summary> Number of degrees of freedom (PL) </summary>
	[Num_Deg_free_p] smallint NOT NULL,

	--/ <summary> Neutral hydrogen density (mekal fits) </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_fit_m] float NOT NULL,

	--/ <summary> Error of NHfitm </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_err_m] float NOT NULL,

	--/ <summary> Normalization for the mekal fits </summary>
	[NORM_m] float NOT NULL,

	--/ <summary> Error of NORM_m </summary>
	[NORM_err_m] float NOT NULL,

	--/ <summary> Temperature of the mekal fits </summary>
	[Temp_fit_m] float NOT NULL,

	--/ <summary> Error of Tempfitm  </summary>
	[Temp_err_m] float NOT NULL,

	--/ <summary> Count rate obtained for the mekal fits </summary>
	--/ <unit> ct s-1 </unit>
	[CTR_spec_m] float NOT NULL,

	--/ <summary> Absorption corrected flux (mekal fits) </summary>
	--/ <unit> mW m-2 </unit>
	[FLUX_m] float NOT NULL,

	--/ <summary> Reduced chi^2 value for mekal fits </summary>
	[Chi2red_spec_m] float NOT NULL,

	--/ <summary> Chi^2 value for the mekal fits </summary>
	[Chi2_spec_m] float NOT NULL,

	--/ <summary> Number of data points (mekal fits)  </summary>
	[Num_Data_pts_m] smallint NOT NULL,

	--/ <summary> Number of degrees of freedom (mekal) </summary>
	[Num_Deg_free_m] smallint NOT NULL,

	--/ <summary> Neutral hydrogen density (bbdy fits) </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_fit_b] float NOT NULL,

	--/ <summary> Error of NHfitb </summary>
	--/ <unit> 10+21 cm-2 </unit>
	[NH_err_b] float NOT NULL,

	--/ <summary> Normalization for the black body fits </summary>
	[NORM_b] float NOT NULL,

	--/ <summary> Error of the normalization (bbdy fits) </summary>
	[NORM_err_b] float NOT NULL,

	--/ <summary> Temperature of the black body fits </summary>
	[Temp_fit_b] float NOT NULL,

	--/ <summary> Error of Tempfitbbdy </summary>
	[Temp_err_b] float NOT NULL,

	--/ <summary> Count rate for the black body fit </summary>
	--/ <unit> ct s-1 </unit>
	[CTR_spec_b] float NOT NULL,

	--/ <summary> Absorption corrected flux (black body) </summary>
	--/ <unit> mW m-2 </unit>
	[FLUX_b] float NOT NULL,

	--/ <summary> Reduced chi2 value (black body) </summary>
	[Chi2red_spec_b] float NOT NULL,

	--/ <summary> Chi2 value for the black body fits </summary>
	[Chi2_spec_b] float NOT NULL,

	--/ <summary> Number of data points (black body) </summary>
	[Num_Data_pts_b] smallint NOT NULL,

	--/ <summary> Number of degrees of freedom (bbdy)  </summary>
	[Num_Deg_free_b] smallint NOT NULL,

	--/ <summary> X image coordinate (45 arcsec) in image pixel </summary>
	--/ <unit> pix </unit>
	[X_IMA] float NOT NULL,

	--/ <summary> Y image coordinate (45 arcsec) in image pixel </summary>
	--/ <unit> pix </unit>
	[Y_IMA] float NOT NULL,

	--/ <summary> One-sigma error of X_IMA in image pixel </summary>
	--/ <unit> pix </unit>
	[XERR] float NOT NULL,

	--/ <summary> One-sigma error of Y_IMA in image pixel </summary>
	--/ <unit> pix </unit>
	[YERR] float NOT NULL,

	--/ <summary> X sky coordinates (0.5 arcsec) in sky pixel </summary>
	--/ <unit> pix </unit>
	[X_SKY] float NOT NULL,

	--/ <summary> Y sky coordinates (0.5 arcsec) in sky pixel </summary>
	--/ <unit> pix </unit>
	[Y_SKY] float NOT NULL,

	--/ <summary> [600] Source extraction radius in sky pixels </summary>
	[CUT_RAD] int NOT NULL,

	--/ <summary> Analyzed fraction of cut radius </summary>
	[FA] real NOT NULL,

	--/ <summary> Total number of photons read from the PET and analyzed by the maximum likelihood algorithm </summary>
	[TOTNUM] float NOT NULL,

	--/ <summary> Background in source extraction region in 1/pix_image </summary>
	--/ <unit> pix-1 </unit>
	[BGR] float NOT NULL,

	--/ <summary> Vignetting correction factor </summary>
	[VIG_COR] float NOT NULL,

	--/ <summary> [source nrby?] on flags originating from ML-detection </summary>
	[REMARKS] char(12) NOT NULL,

	--/ <summary> Counts in band A </summary>
	--/ <unit> ct </unit>
	[SB1] float NOT NULL,

	--/ <summary> Counts in band B </summary>
	--/ <unit> ct </unit>
	[SB2] float NOT NULL,

	--/ <summary> Counts in band C  </summary>
	--/ <unit> ct </unit>
	[SB3] float NOT NULL,

	--/ <summary> Counts in band D </summary>
	--/ <unit> ct </unit>
	[SB4] float NOT NULL,

	--/ <summary> Background band A with other catalogue entries excised </summary>
	--/ <unit> ct </unit>
	[B1] float NOT NULL,

	--/ <summary> Background band B with other catalogue entries excised </summary>
	--/ <unit> ct </unit>
	[B2] float NOT NULL,

	--/ <summary> Background band C with other catalogue entries excised </summary>
	--/ <unit> ct </unit>
	[B3] float NOT NULL,

	--/ <summary> Background band D with other catalogue entries excised </summary>
	--/ <unit> ct </unit>
	[B4] float NOT NULL,

	--/ <summary> Remaining bkg area in square arcmin </summary>
	--/ <unit> arcmin+2 </unit>
	[B_SPA] float NOT NULL,

	--/ <summary> Source counts in band A (SB1 - B1*sbspa/bspa) </summary>
	--/ <unit> ct </unit>
	[S1] float NOT NULL,

	--/ <summary>  Source counts in band B (SB2 - B2*sbspa/bspa)  </summary>
	--/ <unit> ct </unit>
	[S2] float NOT NULL,

	--/ <summary> Source counts in band c (SB3 - B3*sbspa/bspa)  </summary>
	--/ <unit> ct </unit>
	[S3] float NOT NULL,

	--/ <summary> Source counts in band D (SB4 - B4*sbspa/bspa)  </summary>
	--/ <unit> ct </unit>
	[S4] float NOT NULL,

	--/ <summary> Number of counterparts in the XMM Slew Survey within the distance of 60"  </summary>
	[mult_xmmsl1] smallint NOT NULL,

	--/ <summary> Source number of nearest counterpart in the XMM Slew Survey  </summary>
	[entr_xmmsl1] int NOT NULL,

	--/ <summary> Distance of nearest XMMSL1 counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_xmmsl1] real NOT NULL,

	--/ <summary> 	XMMSL Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_xmmsl1] float NOT NULL,

	--/ <summary> XMMSL Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_xmmsl1] float NOT NULL,

	--/ <summary> Source name in the XMM Slew Survey </summary>
	[SRCNAME_xmmsl1] char(40) NOT NULL,

	--/ <summary> Broad Band Count rate </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_B0_xmmsl1] float NOT NULL,

	--/ <summary> Broad Band Count rate error </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_B0e_xmmsl1] float NOT NULL,

	--/ <summary> Count rate, energy band 0.5-2keV </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_B5_xmmsl1] float NOT NULL,

	--/ <summary> Count rate error, 0.5-2keV  </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_B5e_xmmsl1] float NOT NULL,

	--/ <summary> Number of 3XMM counterparts within the distance of 60" </summary>
	[mult_3xmm] smallint NOT NULL,

	--/ <summary> Source number of nearest counterpart in the 3XMM Catalogue </summary>
	[entr_3xmm] int NOT NULL,

	--/ <summary> Distance of nearest 3XMM counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_3xmm] real NOT NULL,

	--/ <summary> 3XMM Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_3xmm] float NOT NULL,

	--/ <summary> 3XMM Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_3xmm] float NOT NULL,

	--/ <summary> Source name in the 3XMM Catalogue  </summary>
	[SRCNAME_3xmm] char(21) NOT NULL,

	--/ <summary> 3XMM Count rate </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_EP8_3xmm] float NOT NULL,

	--/ <summary>  3XMM Count rate error </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_EP8e_3xmm] float NOT NULL,

	--/ <summary> 3XMM Flux </summary>
	--/ <unit> mW m-2 </unit>
	[FLUX_R_3xmm] float NOT NULL,

	--/ <summary> 3XMM Flux error </summary>
	--/ <unit> mW m-2 </unit>
	[FLUX_R_err_3xmm] float NOT NULL,

	--/ <summary> Number of 2RXP counterparts within the distance of 300" </summary>
	[mult_2rxp] smallint NOT NULL,

	--/ <summary> Source number of nearest counterpart in the 2RXP catalogue </summary>
	[entr_2rxp] int NOT NULL,

	--/ <summary> Distance of 2RXP nearest counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_2rxp] real NOT NULL,

	--/ <summary> 2RXP Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_2rxp] float NOT NULL,

	--/ <summary> 2RXP Declination (J2000)  </summary>
	--/ <unit> deg </unit>
	[DEC_2rxp] float NOT NULL,

	--/ <summary> Source name in the 2RXP </summary>
	[SRCNAME_2rxp] char(16) NOT NULL,

	--/ <summary> 2RXP Count rate </summary>
	--/ <unit> ct s-1 </unit>
	[CRATE_2rxp] float NOT NULL,

	--/ <summary> 2RXP Count rate error  </summary>
	--/ <unit> ct s-1 </unit>
	[CRATE_err_2rxp] float NOT NULL,

	--/ <summary> 2RXP Source exposure time </summary>
	--/ <unit> s </unit>
	[ExpTime_2rxp] int NOT NULL,

	--/ <summary> Field number of 2RXP counterpart </summary>
	[ObsID_2rxp] char(15) NOT NULL,

	--/ <summary> Number of 1RXS counterparts within a distance of 60" </summary>
	[mult_1rxs] smallint NOT NULL,

	--/ <summary> Source number of nearest counterpart in the 1RXS catalogue </summary>
	[entr_1rxs] int NOT NULL,

	--/ <summary>  Distance to nearest 1RXS counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_1rxs] real NOT NULL,

	--/ <summary> 1RXS Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_1rxs] float NOT NULL,

	--/ <summary> 	1RXS Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_1rxs] float NOT NULL,

	--/ <summary> Source name in the 1RXS catalogue </summary>
	[SRCNAME_1rxs] char(16) NOT NULL,

	--/ <summary> Source count rate in the 1RXS </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_1rxs] float NOT NULL,

	--/ <summary> Error of RATE_1rxs </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_err_1rxs] float NOT NULL,

	--/ <summary> Background corrected src counts 1RXS </summary>
	[CTS_1rxs] float NOT NULL,

	--/ <summary> Error of CTS_1rxs </summary>
	[CTS_err_1rxs] float NOT NULL,

	--/ <summary> Background corrected src counts 1RXS </summary>
	[EXI_ML_1rxs] int NOT NULL,

	--/ <summary> Source exposure time in 1RXS </summary>
	--/ <unit> s </unit>
	[EXPOS_1rxs] bigint NOT NULL,

	--/ <summary>  1RXS Hardness ratio 1 value. 1RXS hardness ratio 1 values have been calculated from the source counts in the energy 
	--/ A (11-41), B (52-201) by: HR_1=(B-A)/(B+A) in 1RXS  
	--/ Hardness ratio 2 values have been calculated from the source counts in the  
	--/ energy channels C (52-90), D(91-201) by: HR_2=(D-C)/(D+C) in the 1RXS </summary>
	[HR1_1rxs] real NOT NULL,

	--/ <summary>  Error of HR1 in the 1RXS </summary>
	[HR1e_1rxs] real NOT NULL,

	--/ <summary> 1RXS Hardness ratio 2 value.  1RXS hardness ratio 1 values have been calculated from the source counts in the energy 
	--/ A (11-41), B (52-201) by: HR_1=(B-A)/(B+A) in 1RXS  
	--/ Hardness ratio 2 values have been calculated from the source counts in the  
	--/ energy channels C (52-90), D(91-201) by: HR_2=(D-C)/(D+C) in the 1RXS </summary>
	[HR2_1rxs] real NOT NULL,

	--/ <summary> Error of HR2 in the 1RXS </summary>
	[HR2e_1rxs] real NOT NULL,

	--/ <summary> Number of counterparts in the Veron and Verson Catalogue within the distance of 60"  </summary>
	[mult_vv10] smallint NOT NULL,

	--/ <summary> Source number of VV10 nearest counterpart </summary>
	[entr_vv10] int NOT NULL,

	--/ <summary> Distance to nearest VV10 counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_vv10] real NOT NULL,

	--/ <summary> VV10 Catalogue name </summary>
	[NAME_vv10] char(17) NOT NULL,

	--/ <summary> 	[B/A/Q] VV10 Object type </summary>
	[Type_vv10] char(1) NOT NULL,

	--/ <summary>  VV10 V magnitude </summary>
	--/ <unit> mag </unit>
	[Vmag_vv10] real NOT NULL,

	--/ <summary> VV10 Redshift </summary>
	[z_vv10] real NOT NULL,

	--/ <summary> VV10 Running catalogue number </summary>
	[Index_vv10] int NOT NULL,

	--/ <summary> VV10 Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_vv10] float NOT NULL,

	--/ <summary> VV10 Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_vv10] float NOT NULL,

	--/ <summary>  Number of the nearest counterpart in the Tycho2 Catalogue </summary>
	[mult_tyc2] smallint NOT NULL,

	--/ <summary>  Source number of nearest Tyc2 counterpart  </summary>
	[entr_tyc2] int NOT NULL,

	--/ <summary>  Distance to nearest Tyc2 counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_tyc2] real NOT NULL,

	--/ <summary> Tyc2 Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_tyc2] float NOT NULL,

	--/ <summary> Tyc2 Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_tyc2] float NOT NULL,

	--/ <summary> Tyc2 Catalogue number </summary>
	[RecNo_tyc2] bigint NOT NULL,

	--/ <summary> Tyc2 VT magnitude </summary>
	--/ <unit> mag </unit>
	[VTmag_tyc2] real NOT NULL,

	--/ <summary> Tyc2 BT magnitude  </summary>
	--/ <unit> mag </unit>
	[BTmag_tyc2] real NOT NULL,

	--/ <summary> Tyc2 TYC1 number. Tyhco 2 name (c.f. Note 1 of the Tycho-2 online catalogue description) </summary>
	[TYC1_tyc2] int NOT NULL,

	--/ <summary> Tyc2 TYC2 number. Tyhco 2 name (c.f. Note 1 of the Tycho-2 online catalogue description) </summary>
	[TYC2_tyc2] int NOT NULL,

	--/ <summary> Tyc2 TYC3 number. Tyhco 2 name (c.f. Note 1 of the Tycho-2 online catalogue description) </summary>
	[TYC3_tyc2] tinyint NOT NULL,

	--/ <summary> Number of counterparts in the Catalogue of Bright Stars (BSC) within the distance of 300"  </summary>
	[mult_bri] smallint NOT NULL,

	--/ <summary> Source number of nearest BSC counterpart </summary>
	[entr_bri] int NOT NULL,

	--/ <summary> Distance to nearest BSC counterpar </summary>
	--/ <unit> arcsec </unit>
	[dist_bri] real NOT NULL,

	--/ <summary> 	BSC Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_bri] float NOT NULL,

	--/ <summary> 	BSC Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_bri] float NOT NULL,

	--/ <summary>  BSC V magnitude </summary>
	--/ <unit> mag </unit>
	[Vmag_bri] real NOT NULL,

	--/ <summary> BSC spectral type </summary>
	[SpType_bri] char(20) NOT NULL,

	--/ <summary> BSC Record catalogue number  </summary>
	[RecNo_bri] int NOT NULL,

	--/ <summary> Henry Draper Catalogue Number </summary>
	[HD_bri] int NOT NULL,

	--/ <summary> Number of counterparts in the Catalog of High Mass X-Ray Binaries (HMXBCAT) within the distance of 60" </summary>
	[mult_hmxb] smallint NOT NULL,

	--/ <summary> Source number of nearest HMXBCAT counterpart </summary>
	[entr_hmxb] int NOT NULL,

	--/ <summary> Distance of nearest HMXBCAT counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_hmxb] real NOT NULL,

	--/ <summary> HMXBCAT Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_hmxb] float NOT NULL,

	--/ <summary> HMXBCAT Declination (J2000)  </summary>
	--/ <unit> deg </unit>
	[DEC_hmxb] float NOT NULL,

	--/ <summary> HMXBCAT Catalogue name  </summary>
	[Name_hmxb] char(21) NOT NULL,

	--/ <summary> HMXBCAT Alternative catalogue name </summary>
	[Name2_hmxb] char(21) NOT NULL,

	--/ <summary> HMXBCAT V magnitude </summary>
	--/ <unit> mag </unit>
	[Vmag_hmxb] real NOT NULL,

	--/ <summary> Number of counterparts in the Catalog of Low Mass X-Ray Binaries (LMXBCAT) within the distance of 60"  </summary>
	[mult_lmxb] smallint NOT NULL,

	--/ <summary> Source number of nearest LMXBCAT counterpart </summary>
	[entr_lmxb] int NOT NULL,

	--/ <summary> Distance to nearest LMXBCAT counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_lmxb] real NOT NULL,

	--/ <summary> 	LMXBCAT Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_lmxb] float NOT NULL,

	--/ <summary> 	LMXBCAT Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_lmxb] float NOT NULL,

	--/ <summary> 	LMXBCAT Catalogue name  </summary>
	[Name_lmxb] char(16) NOT NULL,

	--/ <summary> 	LMXBCAT Alternative catalogue name  </summary>
	[Name2_lmxb] char(13) NOT NULL,

	--/ <summary> LMXBCAT V magnitude  </summary>
	--/ <unit> mag </unit>
	[Vmag_lmxb] real NOT NULL,

	--/ <summary>  </summary>
	[mult_atnf] smallint NOT NULL,

	--/ <summary> Source number of nearest ATNF counterpart </summary>
	[entr_atnf] int NOT NULL,

	--/ <summary> Distance to nearest ATNF counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_atnf] real NOT NULL,

	--/ <summary> ATNF Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_atnf] float NOT NULL,

	--/ <summary> 	ATNF Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_atnf] float NOT NULL,

	--/ <summary> ATNF Pulsar name </summary>
	[Name_atnf] char(16) NOT NULL,

	--/ <summary> ATNF Pulsar type </summary>
	[Type_atnf] char(11) NOT NULL,

	--/ <summary> 	ATNF Pulsar period </summary>
	--/ <unit> s </unit>
	[Period_atnf] char(21) NOT NULL,

	--/ <summary> Number of counterparts in the Catalog of Variable Sources from Fuhrmeister and Schmitt within the distance of 60" </summary>
	[mult_fuh] smallint NOT NULL,

	--/ <summary> Source number of nearest FUH counterpart </summary>
	[entr_fuh] int NOT NULL,

	--/ <summary> Distance to nearest FUH counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_fuh] real NOT NULL,

	--/ <summary> 	FUH Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_fuh] float NOT NULL,

	--/ <summary> FUH Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_fuh] float NOT NULL,

	--/ <summary> 	FUH Object number  </summary>
	[Seq_fuh] char(4) NOT NULL,

	--/ <summary> 	FUH Object name </summary>
	[Name_fuh] char(30) NOT NULL,

	--/ <summary> Number of counterparts in Swift 1SXPS catalogue within a distance of 120"  </summary>
	[mult_1sxps] smallint NOT NULL,

	--/ <summary> Source number of nearest 1SXPS counterpart  </summary>
	[entr_1sxps] int NOT NULL,

	--/ <summary> Distance to nearest 1SXPS counterparts </summary>
	--/ <unit> arcsec </unit>
	[dist_1sxps] real NOT NULL,

	--/ <summary> 	1SXPS Right ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[RA_1sxps] float NOT NULL,

	--/ <summary> 	1SXPS Declination (J2000)  </summary>
	--/ <unit> deg </unit>
	[DEC_1sxps] float NOT NULL,

	--/ <summary> 1SXPS Source exposure time </summary>
	--/ <unit> s </unit>
	[Expos_1sxps] float NOT NULL,

	--/ <summary> 1SXPS Total(0.3-10keV)-band detection flag </summary>
	[DET_1sxps] int NOT NULL,

	--/ <summary>  1SXPS Total(0.3-10keV)-band detection flag  </summary>
	[DET0_1sxps] int NOT NULL,

	--/ <summary> 1SXPS Soft(0.3-1keV)-band detection flag  </summary>
	[DET1_1sxps] int NOT NULL,

	--/ <summary> 1SXPS Meduin(2-2keV)-band detection flag </summary>
	[DET2_1sxps] int NOT NULL,

	--/ <summary> 1SXPS Hard(2-10keV)-band detection flag </summary>
	[DET3_1sxps] int NOT NULL,

	--/ <summary> Running catalogue number in Swift </summary>
	[INDEX_1sxps] int NOT NULL,

	--/ <summary> Swift Total (0.3-10 keV)-band count rate </summary>
	--/ <unit> ct s-1 </unit>
	[Rate0_1sxps] float NOT NULL,

	--/ <summary> Swift Error of Rate0_1sxps </summary>
	--/ <unit> ct s-1 </unit>
	[ERate0_1sxps] float NOT NULL,

	--/ <summary>  Number of counterparts in the 1RXH catalogue within the distance of 120"  </summary>
	[mult_1rxh] smallint NOT NULL,

	--/ <summary> Source number of nearest 1RXH counterpart  </summary>
	[entr_1rxh] int NOT NULL,

	--/ <summary> Distance to nearest 1RXH counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_1rxh] real NOT NULL,

	--/ <summary> 	1RXH Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_1rxh] float NOT NULL,

	--/ <summary> 1RXH Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_1rxh] float NOT NULL,

	--/ <summary> Source name in the 1RXH  </summary>
	[SRCNAME_1rxh] char(21) NOT NULL,

	--/ <summary> 1RXH Source count rate  </summary>
	--/ <unit> ct s-1 </unit>
	[CRATE_1rxh] float NOT NULL,

	--/ <summary>  Error of CRATE_1RXH </summary>
	--/ <unit> ct s-1 </unit>
	[CRATE_err_1rxh] float NOT NULL,

	--/ <summary>  1RXH Source exposure time </summary>
	--/ <unit> s </unit>
	[ExpTime_1rxh] int NOT NULL,

	--/ <summary> 1RXH Signal-to-noise ratio </summary>
	[SNR_1rxh] real NOT NULL,

	--/ <summary> Number of counterparts in the Catalog of White Dwarfs from Flemming within the distance of 60" </summary>
	[mult_flem] smallint NOT NULL,

	--/ <summary>  Source number of nearest Flemming counterpart </summary>
	[entr_flem] int NOT NULL,

	--/ <summary>  Distance to nearest Flemming counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_flem] real NOT NULL,

	--/ <summary> Flemming Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_flem] float NOT NULL,

	--/ <summary> Flemming Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_flem] float NOT NULL,

	--/ <summary> Source name in the Flemming Catalogue  </summary>
	[SRCNAME_flem] char(14) NOT NULL,

	--/ <summary> Flemming Object type </summary>
	[Type_flem] char(10) NOT NULL,

	--/ <summary> 	[Y/N] Flemming Wide Field Camera detection? </summary>
	[WFC_flem] char(1) NOT NULL,

	--/ <summary> Flemming count rate  </summary>
	--/ <unit> ct s-1 </unit>
	[Rate_flem] real NOT NULL,

	--/ <summary> Error of the Flemming count rate  </summary>
	--/ <unit> ct s-1 </unit>
	[e_Rate_flem] real NOT NULL,

	--/ <summary> Number of counterparts in the Catalog of White Dwarfs within the distance of 60 "  </summary>
	[mult_wd] smallint NOT NULL,

	--/ <summary> Source number of nearest WD counterpart  </summary>
	[entr_wd] int NOT NULL,

	--/ <summary> Distance to nearest WD counterpart  </summary>
	--/ <unit> arcsec </unit>
	[dist_wd] real NOT NULL,

	--/ <summary> WD Rigth ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_wd] float NOT NULL,

	--/ <summary> WD Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[DEC_wd] float NOT NULL,

	--/ <summary> 	WD Source name in the Catalogue </summary>
	[SRCNAME_wd] char(10) NOT NULL,

	--/ <summary> WD V-magnitude </summary>
	--/ <unit> mag </unit>
	[Vmag_wd] real NOT NULL,

	--/ <summary> WD V mag: multichannel spectrophotometry </summary>
	--/ <unit> mag </unit>
	[Vsphot_wd] real NOT NULL,

	--/ <summary> Source number of the nearest counterpart in the Sloan Catalogue </summary>
	[mult_sdss] smallint NOT NULL,

	--/ <summary> Source number of SDSS nearest counterpart </summary>
	[entr_sdss] int NOT NULL,

	--/ <summary> Distance to nearest SDSS counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_sdss] real NOT NULL,

	--/ <summary> 	SDSS Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_sdss] float NOT NULL,

	--/ <summary> 	SDSS Declination (J2000)  </summary>
	--/ <unit> deg </unit>
	[DEC_sdss] float NOT NULL,

	--/ <summary> 	SDSS Object name </summary>
	[SDSS_NAME] char(24) NOT NULL,

	--/ <summary> SDSS Latitude in elliptical coordinate  </summary>
	--/ <unit> deg </unit>
	[LAMBDA_sdss] float NOT NULL,

	--/ <summary>  SDSS Longitude in elliptical coordinate </summary>
	--/ <unit> deg </unit>
	[BETA_sdss] float NOT NULL,

	--/ <summary> Number of counterparts in the 2RXS catalogue within the distance of 60"  </summary>
	[mult_2rxs] smallint NOT NULL,

	--/ <summary>  Source number of 2RXS counterpart </summary>
	[entr_2rxs] int NOT NULL,

	--/ <summary> Distance to 2RXS counterpart </summary>
	--/ <unit> arcsec </unit>
	[dist_2rxs] real NOT NULL,

	--/ <summary>  Index of the nearest 2RXS counterpart  </summary>
	[INDEX_2rxs] int NOT NULL,

	--/ <summary> Number of sky field of 2RXS nearest counterpart  </summary>
	[SEQ_ID_2rxs] int NOT NULL,

	--/ <summary> Field detection number of 2RXS nearest counterpart  </summary>
	[IND_DET_2rxs] int NOT NULL,

	--/ <summary> Detection likelihood of 2RXS nearest counterpart </summary>
	[EXI_ML_2rxs] float NOT NULL,

	--/ <summary> Source count rate of 2RXS nearest counterpart  </summary>
	--/ <unit> ct s-1 </unit>
	[RATE_2rxs] float NOT NULL,

	--/ <summary> 	2RXS Right ascension (J2000)  </summary>
	--/ <unit> deg </unit>
	[RA_2rxs] float NOT NULL,

	--/ <summary> 2RXS Declination (J2000)  </summary>
	--/ <unit> deg </unit>
	[DEC_2rxs] float NOT NULL,

	--/ <summary> [-1/9] Sub-field detection cell of 2RXS nearest counterpart  </summary>
	[USKY_2rxs] smallint NOT NULL,

	--/ <summary>  [0/1] Nearby flag of 2RXS nearest counterpart, 0=best </summary>
	[FLAG_2rxs] smallint NOT NULL,

	--/ <summary> Selected background  </summary>
	[BKG_id] smallint NOT NULL,

	--/ <summary> X_sky coordinate of background center 1 in sky pixel  </summary>
	--/ <unit> pix </unit>
	[X_BKG_1] float NOT NULL,

	--/ <summary> Y_sky coordinate of background center 1 in sky pixel </summary>
	--/ <unit> pix </unit>
	[Y_BKG_1] float NOT NULL,

	--/ <summary>  X_sky coordinate of background center 2 in sky pixel </summary>
	--/ <unit> pix </unit>
	[X_BKG_2] float NOT NULL,

	--/ <summary> Y_sky coordinate of background center 2 in sky pixel </summary>
	--/ <unit> pix </unit>
	[Y_BKG_2] float NOT NULL,

	--/ <summary> Background count rate per square arcmin from 1RXS </summary>
	--/ <unit> ct s-1 arcmin-2 </unit>
	[BGR_1rxs] float NOT NULL,

	--/ <summary> Background count rate per square arcmin from 2RXS </summary>
	--/ <unit> ct s-1 arcmin-2 </unit>
	[BGR_2rxs] float NOT NULL,

	--/ <summary> Variability flag 0=good,1=bkg. quality flag for background selection for lightcurves and spectra: 0=good, bit 1: 
	--/ of CM+CD&lt;0, bit 2: background in masked region </summary>
	[LFLAG] smallint NOT NULL,

	--/ <summary> Count rate for light curve with less than 6s exposure </summary>
	--/ <unit> ct s-1 </unit>
	[CM6] float NOT NULL,

	--/ <summary> Standard deviation of light curves with less than 6s exposure </summary>
	--/ <unit> ct s-1 </unit>
	[CD6] float NOT NULL,

	--/ <summary> Excess variance for light curves with less than 6s exposure </summary>
	[EXCESSVAR6] float NOT NULL,

	--/ <summary>  Excess variance uncertainty </summary>
	[UNCERTAINTY6] float NOT NULL,

	--/ <summary> Number of data points in the LC </summary>
	[NBINS_A] int NOT NULL,

	--/ <summary> Number of data points with exposures times less than 6s </summary>
	[NBINS_6] int NOT NULL,

	--/ <summary> Number of data points with exposures times less than 1s </summary>
	[NBINS_1] int NOT NULL,

	--/ <summary> Number of data points with exposure times greater than 6s </summary>
	[NBINS_N] int NOT NULL,

	--/ <summary> Minimum count rate for light curves with exposure times of less than 6s  </summary>
	--/ <unit> ct s-1 </unit>
	[CMIN6] float NOT NULL,

	--/ <summary> Maximum count rate for light curves with exposure times of less than 6s  </summary>
	--/ <unit> ct s-1 </unit>
	[CMAX6] float NOT NULL,

	--/ <summary> Error of CMIN6 </summary>
	--/ <unit> ct s-1 </unit>
	[EMIN6] float NOT NULL,

	--/ <summary> Error of CMAX6 </summary>
	--/ <unit> ct s-1 </unit>
	[EMAX6] float NOT NULL,

	--/ <summary> [-] Number of counts for light curves with exposure times of less than 6s (CTS_lc6) Not used  </summary>
	--/ <unit> ct </unit>
	[CTS_lc6] float NOT NULL,

	--/ <summary>  Excess variance for light curves with exposure times of less than 6s  </summary>
	[SIGMA_excess6] float NOT NULL,

	--/ <summary> Sum of count rate + standard deviation </summary>
	[CM_plus_CD] float NOT NULL,

	--/ <summary> [0/1] graphical illustrations from spectral fits available in spx subdirectory  </summary>
	[SPX] tinyint NOT NULL,

	--/ <summary> 	[0/1] light curve exists as graphical illustration in clx subdirectory </summary>
	[LCX] tinyint NOT NULL,

	--/ <summary> Start time of exposure when source is within FOV and detector ons  </summary>
	--/ <unit> s </unit>
	[OBS_CLOCK_1] float NOT NULL,

	--/ <summary> End time of exposure when source is within FOV and detector ons  </summary>
	--/ <unit> s </unit>
	[OBS_CLOCK_2] float NOT NULL,

	--/ <summary> Start time of exposure when source is within FOV and detector on  </summary>
	--/ <unit> "Y:M:D" </unit>
	[OBS_DATE_1] char(11) NOT NULL,

	--/ <summary> Start time </summary>
	--/ <unit> "h:m:s" </unit>
	[OBS_UT_1] char(10) NOT NULL,

	--/ <summary> End time of exposure when source is within FOV and detector on </summary>
	--/ <unit> "Y:M:D" </unit>
	[OBS_DATE_2] char(11) NOT NULL,

	--/ <summary> End time </summary>
	--/ <unit> "h:m:s" </unit>
	[OBS_UT_2] char(10) NOT NULL,

	--/ <summary>  </summary>
	[IND_2RXS] int NOT NULL,

	CONSTRAINT [PK_SourceObj] PRIMARY KEY CLUSTERED
(
	[IAU_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SourceObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, IAU_NAME, SEQ_ID, IND_DET, EXI_ML, CTS, CERR, RATE, ERATE, EXPOSURE, RA, DEC, RA_HMS, DEC_DMS, LII, BII, LAMBDA, BETA, EXT, EXTERR, EXT_ML, HR_1, HR_1_err, HR_2, HR_2_err, USKY, Masked, FLAG_all, S_flag, [INDEX], AMPL_MAX, CM, CD, CTS_lc, CMIN, CMAX, EMIN, EMAX, CHI2_lc, EXCESS_VAR, UNCERTAINTY, Sigma_Excess, NH_gal, NH_fit_p, NH_err_p, NORM_p, NORM_err_p, GAMMA_p, GAMMA_err_p, CTR_spec_p, FLUX_p, Chi2red_spec_p, Chi2_spec_p, Num_Data_pts_p, Num_Deg_free_p, NH_fit_m, NH_err_m, NORM_m, NORM_err_m, Temp_fit_m, Temp_err_m, CTR_spec_m, FLUX_m, Chi2red_spec_m, Chi2_spec_m, Num_Data_pts_m, Num_Deg_free_m, NH_fit_b, NH_err_b, NORM_b, NORM_err_b, Temp_fit_b, Temp_err_b, CTR_spec_b, FLUX_b, Chi2red_spec_b, Chi2_spec_b, Num_Data_pts_b, Num_Deg_free_b, X_IMA, Y_IMA, XERR, YERR, X_SKY, Y_SKY, CUT_RAD, FA, TOTNUM, BGR, VIG_COR, REMARKS, SB1, SB2, SB3, SB4, B1, B2, B3, B4, B_SPA, S1, S2, S3, S4, mult_xmmsl1, entr_xmmsl1, dist_xmmsl1, RA_xmmsl1, DEC_xmmsl1, SRCNAME_xmmsl1, RATE_B0_xmmsl1, RATE_B0e_xmmsl1, RATE_B5_xmmsl1, RATE_B5e_xmmsl1, mult_3xmm, entr_3xmm, dist_3xmm, RA_3xmm, DEC_3xmm, SRCNAME_3xmm, RATE_EP8_3xmm, RATE_EP8e_3xmm, FLUX_R_3xmm, FLUX_R_err_3xmm, mult_2rxp, entr_2rxp, dist_2rxp, RA_2rxp, DEC_2rxp, SRCNAME_2rxp, CRATE_2rxp, CRATE_err_2rxp, ExpTime_2rxp, ObsID_2rxp, mult_1rxs, entr_1rxs, dist_1rxs, RA_1rxs, DEC_1rxs, SRCNAME_1rxs, RATE_1rxs, RATE_err_1rxs, CTS_1rxs, CTS_err_1rxs, EXI_ML_1rxs, EXPOS_1rxs, HR1_1rxs, HR1e_1rxs, HR2_1rxs, HR2e_1rxs, mult_vv10, entr_vv10, dist_vv10, NAME_vv10, Type_vv10, Vmag_vv10, z_vv10, Index_vv10, RA_vv10, DEC_vv10, mult_tyc2, entr_tyc2, dist_tyc2, RA_tyc2, DEC_tyc2, RecNo_tyc2, VTmag_tyc2, BTmag_tyc2, TYC1_tyc2, TYC2_tyc2, TYC3_tyc2, mult_bri, entr_bri, dist_bri, RA_bri, DEC_bri, Vmag_bri, SpType_bri, RecNo_bri, HD_bri, mult_hmxb, entr_hmxb, dist_hmxb, RA_hmxb, DEC_hmxb, Name_hmxb, Name2_hmxb, Vmag_hmxb, mult_lmxb, entr_lmxb, dist_lmxb, RA_lmxb, DEC_lmxb, Name_lmxb, Name2_lmxb, Vmag_lmxb, mult_atnf, entr_atnf, dist_atnf, RA_atnf, DEC_atnf, Name_atnf, Type_atnf, Period_atnf, mult_fuh, entr_fuh, dist_fuh, RA_fuh, DEC_fuh, Seq_fuh, Name_fuh, mult_1sxps, entr_1sxps, dist_1sxps, RA_1sxps, DEC_1sxps, Expos_1sxps, DET_1sxps, DET0_1sxps, DET1_1sxps, DET2_1sxps, DET3_1sxps, INDEX_1sxps, Rate0_1sxps, ERate0_1sxps, mult_1rxh, entr_1rxh, dist_1rxh, RA_1rxh, DEC_1rxh, SRCNAME_1rxh, CRATE_1rxh, CRATE_err_1rxh, ExpTime_1rxh, SNR_1rxh, mult_flem, entr_flem, dist_flem, RA_flem, DEC_flem, SRCNAME_flem, Type_flem, WFC_flem, Rate_flem, e_Rate_flem, mult_wd, entr_wd, dist_wd, RA_wd, DEC_wd, SRCNAME_wd, Vmag_wd, Vsphot_wd, mult_sdss, entr_sdss, dist_sdss, RA_sdss, DEC_sdss, SDSS_NAME, LAMBDA_sdss, BETA_sdss, mult_2rxs, entr_2rxs, dist_2rxs, INDEX_2rxs, SEQ_ID_2rxs, IND_DET_2rxs, EXI_ML_2rxs, RATE_2rxs, RA_2rxs, DEC_2rxs, USKY_2rxs, FLAG_2rxs, BKG_id, X_BKG_1, Y_BKG_1, X_BKG_2, Y_BKG_2, BGR_1rxs, BGR_2rxs, LFLAG, CM6, CD6, EXCESSVAR6, UNCERTAINTY6, NBINS_A, NBINS_6, NBINS_1, NBINS_N, CMIN6, CMAX6, EMIN6, EMAX6, CTS_lc6, SIGMA_excess6, CM_plus_CD, SPX, LCX, OBS_CLOCK_1, OBS_CLOCK_2, OBS_DATE_1, OBS_UT_1, OBS_DATE_2, OBS_UT_2, IND_2RXS)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, IAU_NAME, SEQ_ID, IND_DET, EXI_ML, CTS, CERR, RATE, ERATE, EXPOSURE, RA, DEC, RA_HMS, DEC_DMS, LII, BII, LAMBDA, BETA, EXT, EXTERR, EXT_ML, HR_1, HR_1_err, HR_2, HR_2_err, USKY, Masked, FLAG_all, S_flag, [INDEX], AMPL_MAX, CM, CD, CTS_lc, CMIN, CMAX, EMIN, EMAX, CHI2_lc, EXCESS_VAR, UNCERTAINTY, Sigma_Excess, NH_gal, NH_fit_p, NH_err_p, NORM_p, NORM_err_p, GAMMA_p, GAMMA_err_p, CTR_spec_p, FLUX_p, Chi2red_spec_p, Chi2_spec_p, Num_Data_pts_p, Num_Deg_free_p, NH_fit_m, NH_err_m, NORM_m, NORM_err_m, Temp_fit_m, Temp_err_m, CTR_spec_m, FLUX_m, Chi2red_spec_m, Chi2_spec_m, Num_Data_pts_m, Num_Deg_free_m, NH_fit_b, NH_err_b, NORM_b, NORM_err_b, Temp_fit_b, Temp_err_b, CTR_spec_b, FLUX_b, Chi2red_spec_b, Chi2_spec_b, Num_Data_pts_b, Num_Deg_free_b, X_IMA, Y_IMA, XERR, YERR, X_SKY, Y_SKY, CUT_RAD, FA, TOTNUM, BGR, VIG_COR, REMARKS, SB1, SB2, SB3, SB4, B1, B2, B3, B4, B_SPA, S1, S2, S3, S4, mult_xmmsl1, entr_xmmsl1, dist_xmmsl1, RA_xmmsl1, DEC_xmmsl1, SRCNAME_xmmsl1, RATE_B0_xmmsl1, RATE_B0e_xmmsl1, RATE_B5_xmmsl1, RATE_B5e_xmmsl1, mult_3xmm, entr_3xmm, dist_3xmm, RA_3xmm, DEC_3xmm, SRCNAME_3xmm, RATE_EP8_3xmm, RATE_EP8e_3xmm, FLUX_R_3xmm, FLUX_R_err_3xmm, mult_2rxp, entr_2rxp, dist_2rxp, RA_2rxp, DEC_2rxp, SRCNAME_2rxp, CRATE_2rxp, CRATE_err_2rxp, ExpTime_2rxp, ObsID_2rxp, mult_1rxs, entr_1rxs, dist_1rxs, RA_1rxs, DEC_1rxs, SRCNAME_1rxs, RATE_1rxs, RATE_err_1rxs, CTS_1rxs, CTS_err_1rxs, EXI_ML_1rxs, EXPOS_1rxs, HR1_1rxs, HR1e_1rxs, HR2_1rxs, HR2e_1rxs, mult_vv10, entr_vv10, dist_vv10, NAME_vv10, Type_vv10, Vmag_vv10, z_vv10, Index_vv10, RA_vv10, DEC_vv10, mult_tyc2, entr_tyc2, dist_tyc2, RA_tyc2, DEC_tyc2, RecNo_tyc2, VTmag_tyc2, BTmag_tyc2, TYC1_tyc2, TYC2_tyc2, TYC3_tyc2, mult_bri, entr_bri, dist_bri, RA_bri, DEC_bri, Vmag_bri, SpType_bri, RecNo_bri, HD_bri, mult_hmxb, entr_hmxb, dist_hmxb, RA_hmxb, DEC_hmxb, Name_hmxb, Name2_hmxb, Vmag_hmxb, mult_lmxb, entr_lmxb, dist_lmxb, RA_lmxb, DEC_lmxb, Name_lmxb, Name2_lmxb, Vmag_lmxb, mult_atnf, entr_atnf, dist_atnf, RA_atnf, DEC_atnf, Name_atnf, Type_atnf, Period_atnf, mult_fuh, entr_fuh, dist_fuh, RA_fuh, DEC_fuh, Seq_fuh, Name_fuh, mult_1sxps, entr_1sxps, dist_1sxps, RA_1sxps, DEC_1sxps, Expos_1sxps, DET_1sxps, DET0_1sxps, DET1_1sxps, DET2_1sxps, DET3_1sxps, INDEX_1sxps, Rate0_1sxps, ERate0_1sxps, mult_1rxh, entr_1rxh, dist_1rxh, RA_1rxh, DEC_1rxh, SRCNAME_1rxh, CRATE_1rxh, CRATE_err_1rxh, ExpTime_1rxh, SNR_1rxh, mult_flem, entr_flem, dist_flem, RA_flem, DEC_flem, SRCNAME_flem, Type_flem, WFC_flem, Rate_flem, e_Rate_flem, mult_wd, entr_wd, dist_wd, RA_wd, DEC_wd, SRCNAME_wd, Vmag_wd, Vsphot_wd, mult_sdss, entr_sdss, dist_sdss, RA_sdss, DEC_sdss, SDSS_NAME, LAMBDA_sdss, BETA_sdss, mult_2rxs, entr_2rxs, dist_2rxs, INDEX_2rxs, SEQ_ID_2rxs, IND_DET_2rxs, EXI_ML_2rxs, RATE_2rxs, RA_2rxs, DEC_2rxs, USKY_2rxs, FLAG_2rxs, BKG_id, X_BKG_1, Y_BKG_1, X_BKG_2, Y_BKG_2, BGR_1rxs, BGR_2rxs, LFLAG, CM6, CD6, EXCESSVAR6, UNCERTAINTY6, NBINS_A, NBINS_6, NBINS_1, NBINS_N, CMIN6, CMAX6, EMIN6, EMAX6, CTS_lc6, SIGMA_excess6, CM_plus_CD, SPX, LCX, OBS_CLOCK_1, OBS_CLOCK_2, OBS_DATE_1, OBS_UT_1, OBS_DATE_2, OBS_UT_2, IND_2RXS
FROM dbo.SourceObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE dbo.SourceObjRAW;
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_SourceObj_Zone] ON [dbo].[SourceObj] 
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

CREATE NONCLUSTERED INDEX [IX_SourceObj_ZoneID] ON [dbo].[SourceObj] 
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
CREATE NONCLUSTERED INDEX [IX_SourceObj_HtmID] ON [dbo].[SourceObj] 
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