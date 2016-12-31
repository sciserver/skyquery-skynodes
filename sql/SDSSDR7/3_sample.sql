-- SUBSAMPLING TABLE 'Ap7Mag' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Ap7Mag] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Ap7Mag] WITH (TABLOCKX)
	([objID], [rowc], [colc], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [apMag_u], [apMag_g], [apMag_r], [apMag_i], [apMag_z], [apMagErr_u], [apMagErr_g], [apMagErr_r], [apMagErr_i], [apMagErr_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[rowc], sourcetablealias.[colc], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[apMag_u], sourcetablealias.[apMag_g], sourcetablealias.[apMag_r], sourcetablealias.[apMag_i], sourcetablealias.[apMag_z], sourcetablealias.[apMagErr_u], sourcetablealias.[apMagErr_g], sourcetablealias.[apMagErr_r], sourcetablealias.[apMagErr_i], sourcetablealias.[apMagErr_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[Ap7Mag] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'BestTarget2Sector' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint, [regionID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], sourcetablealias.[regionID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[BestTarget2Sector] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID], [regionID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[BestTarget2Sector] WITH (TABLOCKX)
	([objID], [regionID], [status], [primTarget], [secTarget], [petroMag_r], [extinction_r])
 SELECT sourcetablealias.[objID], sourcetablealias.[regionID], sourcetablealias.[status], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[petroMag_r], sourcetablealias.[extinction_r]
 FROM   [SkyNode_SDSSDR7].[dbo].[BestTarget2Sector] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID AND ##temporaryidlist.regionID = sourcetablealias.regionID
	;


GO

-- SUBSAMPLING TABLE 'Chunk' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Chunk] WITH (TABLOCKX)
    ([chunkID], [skyVersion], [targetVersion], [startMu], [endMu], [stripe], [exportVersion], [loadVersion])
 SELECT sourcetablealias.[chunkID], sourcetablealias.[skyVersion], sourcetablealias.[targetVersion], sourcetablealias.[startMu], sourcetablealias.[endMu], sourcetablealias.[stripe], sourcetablealias.[exportVersion], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[Chunk] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'DataConstants' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[DataConstants] WITH (TABLOCKX)
    ([field], [name], [value], [description])
 SELECT sourcetablealias.[field], sourcetablealias.[name], sourcetablealias.[value], sourcetablealias.[description]
 FROM   [SkyNode_SDSSDR7].[dbo].[DataConstants] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'DR5QuasarCatalog' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[DR5QuasarCatalog] WITH (TABLOCKX)
    ([specObjId], [SDSSName], [RA], [dec], [cx], [cy], [cz], [htmid], [zoneID], [z], [psfmag_u], [psfmagerr_u], [psfmag_g], [psfmagerr_g], [psfmag_r], [psfmagerr_r], [psfmag_i], [psfmagerr_i], [psfmag_z], [psfmagerr_z], [A_u], [A_g], [A_r], [A_i], [A_z], [lgNH], [FIRSTmag], [FIRST_sn], [FIRST_sep], [FIRST_flux_at_opt], [FIRST_extmatch], [lg_RASS_rate], [RASS_sn], [RASS_sep], [TWOMASSmag_J], [TWOMASSmagerr_J], [TWOMASSmag_H], [TWOMASSmagerr_H], [TWOMASSmag_K], [TWOMASSmagerr_K], [TWOMASS_sep], [M_i], [delgi], [morphology], [scienceprimary], [mode], [uniform], [bestprimtarget], [ts_b_lowz], [ts_b_hiz], [ts_b_FIRST], [ts_b_ROSAT], [ts_b_serendip], [ts_b_star], [ts_b_gal], [run_best], [mjd_best], [mjd_spec], [plate], [fiberid], [rerun_best], [camcol_best], [field_best], [obj_best], [targprimtarget], [ts_t_lowz], [ts_t_hiz], [ts_t_first], [ts_t_rosat], [ts_t_serendip], [ts_t_star], [ts_t_gal], [t_psfmag_u], [t_psfmagerr_u], [t_psfmag_g], [t_psfmagerr_g], [t_psfmag_r], [t_psfmagerr_r], [t_psfmag_i], [t_psfmagerr_i], [t_psfmag_z], [t_psfmagerr_z])
 SELECT sourcetablealias.[specObjId], sourcetablealias.[SDSSName], sourcetablealias.[RA], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneID], sourcetablealias.[z], sourcetablealias.[psfmag_u], sourcetablealias.[psfmagerr_u], sourcetablealias.[psfmag_g], sourcetablealias.[psfmagerr_g], sourcetablealias.[psfmag_r], sourcetablealias.[psfmagerr_r], sourcetablealias.[psfmag_i], sourcetablealias.[psfmagerr_i], sourcetablealias.[psfmag_z], sourcetablealias.[psfmagerr_z], sourcetablealias.[A_u], sourcetablealias.[A_g], sourcetablealias.[A_r], sourcetablealias.[A_i], sourcetablealias.[A_z], sourcetablealias.[lgNH], sourcetablealias.[FIRSTmag], sourcetablealias.[FIRST_sn], sourcetablealias.[FIRST_sep], sourcetablealias.[FIRST_flux_at_opt], sourcetablealias.[FIRST_extmatch], sourcetablealias.[lg_RASS_rate], sourcetablealias.[RASS_sn], sourcetablealias.[RASS_sep], sourcetablealias.[TWOMASSmag_J], sourcetablealias.[TWOMASSmagerr_J], sourcetablealias.[TWOMASSmag_H], sourcetablealias.[TWOMASSmagerr_H], sourcetablealias.[TWOMASSmag_K], sourcetablealias.[TWOMASSmagerr_K], sourcetablealias.[TWOMASS_sep], sourcetablealias.[M_i], sourcetablealias.[delgi], sourcetablealias.[morphology], sourcetablealias.[scienceprimary], sourcetablealias.[mode], sourcetablealias.[uniform], sourcetablealias.[bestprimtarget], sourcetablealias.[ts_b_lowz], sourcetablealias.[ts_b_hiz], sourcetablealias.[ts_b_FIRST], sourcetablealias.[ts_b_ROSAT], sourcetablealias.[ts_b_serendip], sourcetablealias.[ts_b_star], sourcetablealias.[ts_b_gal], sourcetablealias.[run_best], sourcetablealias.[mjd_best], sourcetablealias.[mjd_spec], sourcetablealias.[plate], sourcetablealias.[fiberid], sourcetablealias.[rerun_best], sourcetablealias.[camcol_best], sourcetablealias.[field_best], sourcetablealias.[obj_best], sourcetablealias.[targprimtarget], sourcetablealias.[ts_t_lowz], sourcetablealias.[ts_t_hiz], sourcetablealias.[ts_t_first], sourcetablealias.[ts_t_rosat], sourcetablealias.[ts_t_serendip], sourcetablealias.[ts_t_star], sourcetablealias.[ts_t_gal], sourcetablealias.[t_psfmag_u], sourcetablealias.[t_psfmagerr_u], sourcetablealias.[t_psfmag_g], sourcetablealias.[t_psfmagerr_g], sourcetablealias.[t_psfmag_r], sourcetablealias.[t_psfmagerr_r], sourcetablealias.[t_psfmag_i], sourcetablealias.[t_psfmagerr_i], sourcetablealias.[t_psfmag_z], sourcetablealias.[t_psfmagerr_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[DR5QuasarCatalog] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'ELRedShift' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[elRedShiftID] bigint, [specObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[elRedShiftID], sourcetablealias.[specObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[ELRedShift] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [elRedShiftID], [specObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[ELRedShift] WITH (TABLOCKX)
	([elRedShiftID], [z], [zErr], [zConf], [nFit], [wtFit], [specObjID])
 SELECT sourcetablealias.[elRedShiftID], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[zConf], sourcetablealias.[nFit], sourcetablealias.[wtFit], sourcetablealias.[specObjID]
 FROM   [SkyNode_SDSSDR7].[dbo].[ELRedShift] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.elRedShiftID = sourcetablealias.elRedShiftID AND ##temporaryidlist.specObjID = sourcetablealias.specObjID
	;


GO

-- SUBSAMPLING TABLE 'Field' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Field] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Field] WITH (TABLOCKX)
	([fieldID], [skyVersion], [run], [rerun], [camcol], [field], [nObjects], [nChild], [nGalaxy], [nStars], [numStars_u], [numStars_g], [numStars_r], [numStars_i], [numStars_z], [nCR_u], [nCR_g], [nCR_r], [nCR_i], [nCR_z], [nBrightObj_u], [nBrightObj_g], [nBrightObj_r], [nBrightObj_i], [nBrightObj_z], [nFaintObj_u], [nFaintObj_g], [nFaintObj_r], [nFaintObj_i], [nFaintObj_z], [quality], [mjd_u], [mjd_g], [mjd_r], [mjd_i], [mjd_z], [a_u], [a_g], [a_r], [a_i], [a_z], [b_u], [b_g], [b_r], [b_i], [b_z], [c_u], [c_g], [c_r], [c_i], [c_z], [d_u], [d_g], [d_r], [d_i], [d_z], [e_u], [e_g], [e_r], [e_i], [e_z], [f_u], [f_g], [f_r], [f_i], [f_z], [dRow0_u], [dRow0_g], [dRow0_r], [dRow0_i], [dRow0_z], [dRow1_u], [dRow1_g], [dRow1_r], [dRow1_i], [dRow1_z], [dRow2_u], [dRow2_g], [dRow2_r], [dRow2_i], [dRow2_z], [dRow3_u], [dRow3_g], [dRow3_r], [dRow3_i], [dRow3_z], [dCol0_u], [dCol0_g], [dCol0_r], [dCol0_i], [dCol0_z], [dCol1_u], [dCol1_g], [dCol1_r], [dCol1_i], [dCol1_z], [dCol2_u], [dCol2_g], [dCol2_r], [dCol2_i], [dCol2_z], [dCol3_u], [dCol3_g], [dCol3_r], [dCol3_i], [dCol3_z], [csRow_u], [csRow_g], [csRow_r], [csRow_i], [csRow_z], [csCol_u], [csCol_g], [csCol_r], [csCol_i], [csCol_z], [ccRow_u], [ccRow_g], [ccRow_r], [ccRow_i], [ccRow_z], [ccCol_u], [ccCol_g], [ccCol_r], [ccCol_i], [ccCol_z], [riCut_u], [riCut_g], [riCut_r], [riCut_i], [riCut_z], [airmass_u], [airmass_g], [airmass_r], [airmass_i], [airmass_z], [muErr_u], [muErr_g], [muErr_r], [muErr_i], [muErr_z], [nuErr_u], [nuErr_g], [nuErr_r], [nuErr_i], [nuErr_z], [raMin], [raMax], [decMin], [decMax], [scanlineArea], [stripeArea], [seqId], [aa_u], [aa_g], [aa_r], [aa_i], [aa_z], [aaErr_u], [aaErr_g], [aaErr_r], [aaErr_i], [aaErr_z], [bb_u], [bb_g], [bb_r], [bb_i], [bb_z], [bbErr_u], [bbErr_g], [bbErr_r], [bbErr_i], [bbErr_z], [cc_u], [cc_g], [cc_r], [cc_i], [cc_z], [ccErr_u], [ccErr_g], [ccErr_r], [ccErr_i], [ccErr_z], [kk_u], [kk_g], [kk_r], [kk_i], [kk_z], [kkErr_u], [kkErr_g], [kkErr_r], [kkErr_i], [kkErr_z], [framesStatus], [rowOffset_u], [rowOffset_g], [rowOffset_r], [rowOffset_i], [rowOffset_z], [colOffset_u], [colOffset_g], [colOffset_r], [colOffset_i], [colOffset_z], [saturationLevel_u], [saturationLevel_g], [saturationLevel_r], [saturationLevel_i], [saturationLevel_z], [nEffPsf_u], [nEffPsf_g], [nEffPsf_r], [nEffPsf_i], [nEffPsf_z], [skyPsp_u], [skyPsp_g], [skyPsp_r], [skyPsp_i], [skyPsp_z], [skyFrames_u], [skyFrames_g], [skyFrames_r], [skyFrames_i], [skyFrames_z], [skyFramesSub_u], [skyFramesSub_g], [skyFramesSub_r], [skyFramesSub_i], [skyFramesSub_z], [sigPix_u], [sigPix_g], [sigPix_r], [sigPix_i], [sigPix_z], [deVApCorrection_u], [deVApCorrection_g], [deVApCorrection_r], [deVApCorrection_i], [deVApCorrection_z], [deVApCorrectionErr_u], [deVApCorrectionErr_g], [deVApCorrectionErr_r], [deVApCorrectionErr_i], [deVApCorrectionErr_z], [expApCorrection_u], [expApCorrection_g], [expApCorrection_r], [expApCorrection_i], [expApCorrection_z], [expApCorrectionErr_u], [expApCorrectionErr_g], [expApCorrectionErr_r], [expApCorrectionErr_i], [expApCorrectionErr_z], [deVModelApCorrection_u], [deVModelApCorrection_g], [deVModelApCorrection_r], [deVModelApCorrection_i], [deVModelApCorrection_z], [deVModelApCorrectionErr_u], [deVModelApCorrectionErr_g], [deVModelApCorrectionErr_r], [deVModelApCorrectionErr_i], [deVModelApCorrectionErr_z], [expModelApCorrection_u], [expModelApCorrection_g], [expModelApCorrection_r], [expModelApCorrection_i], [expModelApCorrection_z], [expModelApCorrectionErr_u], [expModelApCorrectionErr_g], [expModelApCorrectionErr_r], [expModelApCorrectionErr_i], [expModelApCorrectionErr_z], [medianFiberColor_u], [medianFiberColor_g], [medianFiberColor_r], [medianFiberColor_i], [medianFiberColor_z], [medianPsfColor_u], [medianPsfColor_g], [medianPsfColor_r], [medianPsfColor_i], [medianPsfColor_z], [q_u], [q_g], [q_r], [q_i], [q_z], [u_u], [u_g], [u_r], [u_i], [u_z], [pspStatus], [culled], [badMask], [acceptableMask], [goodMask], [holeMask], [status_u], [status_g], [status_r], [status_i], [status_z], [sky_u], [sky_g], [sky_r], [sky_i], [sky_z], [skySig_u], [skySig_g], [skySig_r], [skySig_i], [skySig_z], [skyErr_u], [skyErr_g], [skyErr_r], [skyErr_i], [skyErr_z], [skySlope_u], [skySlope_g], [skySlope_r], [skySlope_i], [skySlope_z], [lbias_u], [lbias_g], [lbias_r], [lbias_i], [lbias_z], [rbias_u], [rbias_g], [rbias_r], [rbias_i], [rbias_z], [psfNStar_u], [psfNStar_g], [psfNStar_r], [psfNStar_i], [psfNStar_z], [psfApCorrectionErr_u], [psfApCorrectionErr_g], [psfApCorrectionErr_r], [psfApCorrectionErr_i], [psfApCorrectionErr_z], [psfSigma1_u], [psfSigma1_g], [psfSigma1_r], [psfSigma1_i], [psfSigma1_z], [psfSigma2_u], [psfSigma2_g], [psfSigma2_r], [psfSigma2_i], [psfSigma2_z], [psfB_u], [psfB_g], [psfB_r], [psfB_i], [psfB_z], [psfP0_u], [psfP0_g], [psfP0_r], [psfP0_i], [psfP0_z], [psfBeta_u], [psfBeta_g], [psfBeta_r], [psfBeta_i], [psfBeta_z], [psfSigmaP_u], [psfSigmaP_g], [psfSigmaP_r], [psfSigmaP_i], [psfSigmaP_z], [psfWidth_u], [psfWidth_g], [psfWidth_r], [psfWidth_i], [psfWidth_z], [psfPsfCounts_u], [psfPsfCounts_g], [psfPsfCounts_r], [psfPsfCounts_i], [psfPsfCounts_z], [psf2GSigma1_u], [psf2GSigma1_g], [psf2GSigma1_r], [psf2GSigma1_i], [psf2GSigma1_z], [psf2GSigma2_u], [psf2GSigma2_g], [psf2GSigma2_r], [psf2GSigma2_i], [psf2GSigma2_z], [psf2GB_u], [psf2GB_g], [psf2GB_r], [psf2GB_i], [psf2GB_z], [psfCounts_u], [psfCounts_g], [psfCounts_r], [psfCounts_i], [psfCounts_z], [gain_u], [gain_g], [gain_r], [gain_i], [gain_z], [darkVariance_u], [darkVariance_g], [darkVariance_r], [darkVariance_i], [darkVariance_z], [nProf_u], [nProf_g], [nProf_r], [nProf_i], [nProf_z], [loadVersion], [segmentID])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[nObjects], sourcetablealias.[nChild], sourcetablealias.[nGalaxy], sourcetablealias.[nStars], sourcetablealias.[numStars_u], sourcetablealias.[numStars_g], sourcetablealias.[numStars_r], sourcetablealias.[numStars_i], sourcetablealias.[numStars_z], sourcetablealias.[nCR_u], sourcetablealias.[nCR_g], sourcetablealias.[nCR_r], sourcetablealias.[nCR_i], sourcetablealias.[nCR_z], sourcetablealias.[nBrightObj_u], sourcetablealias.[nBrightObj_g], sourcetablealias.[nBrightObj_r], sourcetablealias.[nBrightObj_i], sourcetablealias.[nBrightObj_z], sourcetablealias.[nFaintObj_u], sourcetablealias.[nFaintObj_g], sourcetablealias.[nFaintObj_r], sourcetablealias.[nFaintObj_i], sourcetablealias.[nFaintObj_z], sourcetablealias.[quality], sourcetablealias.[mjd_u], sourcetablealias.[mjd_g], sourcetablealias.[mjd_r], sourcetablealias.[mjd_i], sourcetablealias.[mjd_z], sourcetablealias.[a_u], sourcetablealias.[a_g], sourcetablealias.[a_r], sourcetablealias.[a_i], sourcetablealias.[a_z], sourcetablealias.[b_u], sourcetablealias.[b_g], sourcetablealias.[b_r], sourcetablealias.[b_i], sourcetablealias.[b_z], sourcetablealias.[c_u], sourcetablealias.[c_g], sourcetablealias.[c_r], sourcetablealias.[c_i], sourcetablealias.[c_z], sourcetablealias.[d_u], sourcetablealias.[d_g], sourcetablealias.[d_r], sourcetablealias.[d_i], sourcetablealias.[d_z], sourcetablealias.[e_u], sourcetablealias.[e_g], sourcetablealias.[e_r], sourcetablealias.[e_i], sourcetablealias.[e_z], sourcetablealias.[f_u], sourcetablealias.[f_g], sourcetablealias.[f_r], sourcetablealias.[f_i], sourcetablealias.[f_z], sourcetablealias.[dRow0_u], sourcetablealias.[dRow0_g], sourcetablealias.[dRow0_r], sourcetablealias.[dRow0_i], sourcetablealias.[dRow0_z], sourcetablealias.[dRow1_u], sourcetablealias.[dRow1_g], sourcetablealias.[dRow1_r], sourcetablealias.[dRow1_i], sourcetablealias.[dRow1_z], sourcetablealias.[dRow2_u], sourcetablealias.[dRow2_g], sourcetablealias.[dRow2_r], sourcetablealias.[dRow2_i], sourcetablealias.[dRow2_z], sourcetablealias.[dRow3_u], sourcetablealias.[dRow3_g], sourcetablealias.[dRow3_r], sourcetablealias.[dRow3_i], sourcetablealias.[dRow3_z], sourcetablealias.[dCol0_u], sourcetablealias.[dCol0_g], sourcetablealias.[dCol0_r], sourcetablealias.[dCol0_i], sourcetablealias.[dCol0_z], sourcetablealias.[dCol1_u], sourcetablealias.[dCol1_g], sourcetablealias.[dCol1_r], sourcetablealias.[dCol1_i], sourcetablealias.[dCol1_z], sourcetablealias.[dCol2_u], sourcetablealias.[dCol2_g], sourcetablealias.[dCol2_r], sourcetablealias.[dCol2_i], sourcetablealias.[dCol2_z], sourcetablealias.[dCol3_u], sourcetablealias.[dCol3_g], sourcetablealias.[dCol3_r], sourcetablealias.[dCol3_i], sourcetablealias.[dCol3_z], sourcetablealias.[csRow_u], sourcetablealias.[csRow_g], sourcetablealias.[csRow_r], sourcetablealias.[csRow_i], sourcetablealias.[csRow_z], sourcetablealias.[csCol_u], sourcetablealias.[csCol_g], sourcetablealias.[csCol_r], sourcetablealias.[csCol_i], sourcetablealias.[csCol_z], sourcetablealias.[ccRow_u], sourcetablealias.[ccRow_g], sourcetablealias.[ccRow_r], sourcetablealias.[ccRow_i], sourcetablealias.[ccRow_z], sourcetablealias.[ccCol_u], sourcetablealias.[ccCol_g], sourcetablealias.[ccCol_r], sourcetablealias.[ccCol_i], sourcetablealias.[ccCol_z], sourcetablealias.[riCut_u], sourcetablealias.[riCut_g], sourcetablealias.[riCut_r], sourcetablealias.[riCut_i], sourcetablealias.[riCut_z], sourcetablealias.[airmass_u], sourcetablealias.[airmass_g], sourcetablealias.[airmass_r], sourcetablealias.[airmass_i], sourcetablealias.[airmass_z], sourcetablealias.[muErr_u], sourcetablealias.[muErr_g], sourcetablealias.[muErr_r], sourcetablealias.[muErr_i], sourcetablealias.[muErr_z], sourcetablealias.[nuErr_u], sourcetablealias.[nuErr_g], sourcetablealias.[nuErr_r], sourcetablealias.[nuErr_i], sourcetablealias.[nuErr_z], sourcetablealias.[raMin], sourcetablealias.[raMax], sourcetablealias.[decMin], sourcetablealias.[decMax], sourcetablealias.[scanlineArea], sourcetablealias.[stripeArea], sourcetablealias.[seqId], sourcetablealias.[aa_u], sourcetablealias.[aa_g], sourcetablealias.[aa_r], sourcetablealias.[aa_i], sourcetablealias.[aa_z], sourcetablealias.[aaErr_u], sourcetablealias.[aaErr_g], sourcetablealias.[aaErr_r], sourcetablealias.[aaErr_i], sourcetablealias.[aaErr_z], sourcetablealias.[bb_u], sourcetablealias.[bb_g], sourcetablealias.[bb_r], sourcetablealias.[bb_i], sourcetablealias.[bb_z], sourcetablealias.[bbErr_u], sourcetablealias.[bbErr_g], sourcetablealias.[bbErr_r], sourcetablealias.[bbErr_i], sourcetablealias.[bbErr_z], sourcetablealias.[cc_u], sourcetablealias.[cc_g], sourcetablealias.[cc_r], sourcetablealias.[cc_i], sourcetablealias.[cc_z], sourcetablealias.[ccErr_u], sourcetablealias.[ccErr_g], sourcetablealias.[ccErr_r], sourcetablealias.[ccErr_i], sourcetablealias.[ccErr_z], sourcetablealias.[kk_u], sourcetablealias.[kk_g], sourcetablealias.[kk_r], sourcetablealias.[kk_i], sourcetablealias.[kk_z], sourcetablealias.[kkErr_u], sourcetablealias.[kkErr_g], sourcetablealias.[kkErr_r], sourcetablealias.[kkErr_i], sourcetablealias.[kkErr_z], sourcetablealias.[framesStatus], sourcetablealias.[rowOffset_u], sourcetablealias.[rowOffset_g], sourcetablealias.[rowOffset_r], sourcetablealias.[rowOffset_i], sourcetablealias.[rowOffset_z], sourcetablealias.[colOffset_u], sourcetablealias.[colOffset_g], sourcetablealias.[colOffset_r], sourcetablealias.[colOffset_i], sourcetablealias.[colOffset_z], sourcetablealias.[saturationLevel_u], sourcetablealias.[saturationLevel_g], sourcetablealias.[saturationLevel_r], sourcetablealias.[saturationLevel_i], sourcetablealias.[saturationLevel_z], sourcetablealias.[nEffPsf_u], sourcetablealias.[nEffPsf_g], sourcetablealias.[nEffPsf_r], sourcetablealias.[nEffPsf_i], sourcetablealias.[nEffPsf_z], sourcetablealias.[skyPsp_u], sourcetablealias.[skyPsp_g], sourcetablealias.[skyPsp_r], sourcetablealias.[skyPsp_i], sourcetablealias.[skyPsp_z], sourcetablealias.[skyFrames_u], sourcetablealias.[skyFrames_g], sourcetablealias.[skyFrames_r], sourcetablealias.[skyFrames_i], sourcetablealias.[skyFrames_z], sourcetablealias.[skyFramesSub_u], sourcetablealias.[skyFramesSub_g], sourcetablealias.[skyFramesSub_r], sourcetablealias.[skyFramesSub_i], sourcetablealias.[skyFramesSub_z], sourcetablealias.[sigPix_u], sourcetablealias.[sigPix_g], sourcetablealias.[sigPix_r], sourcetablealias.[sigPix_i], sourcetablealias.[sigPix_z], sourcetablealias.[deVApCorrection_u], sourcetablealias.[deVApCorrection_g], sourcetablealias.[deVApCorrection_r], sourcetablealias.[deVApCorrection_i], sourcetablealias.[deVApCorrection_z], sourcetablealias.[deVApCorrectionErr_u], sourcetablealias.[deVApCorrectionErr_g], sourcetablealias.[deVApCorrectionErr_r], sourcetablealias.[deVApCorrectionErr_i], sourcetablealias.[deVApCorrectionErr_z], sourcetablealias.[expApCorrection_u], sourcetablealias.[expApCorrection_g], sourcetablealias.[expApCorrection_r], sourcetablealias.[expApCorrection_i], sourcetablealias.[expApCorrection_z], sourcetablealias.[expApCorrectionErr_u], sourcetablealias.[expApCorrectionErr_g], sourcetablealias.[expApCorrectionErr_r], sourcetablealias.[expApCorrectionErr_i], sourcetablealias.[expApCorrectionErr_z], sourcetablealias.[deVModelApCorrection_u], sourcetablealias.[deVModelApCorrection_g], sourcetablealias.[deVModelApCorrection_r], sourcetablealias.[deVModelApCorrection_i], sourcetablealias.[deVModelApCorrection_z], sourcetablealias.[deVModelApCorrectionErr_u], sourcetablealias.[deVModelApCorrectionErr_g], sourcetablealias.[deVModelApCorrectionErr_r], sourcetablealias.[deVModelApCorrectionErr_i], sourcetablealias.[deVModelApCorrectionErr_z], sourcetablealias.[expModelApCorrection_u], sourcetablealias.[expModelApCorrection_g], sourcetablealias.[expModelApCorrection_r], sourcetablealias.[expModelApCorrection_i], sourcetablealias.[expModelApCorrection_z], sourcetablealias.[expModelApCorrectionErr_u], sourcetablealias.[expModelApCorrectionErr_g], sourcetablealias.[expModelApCorrectionErr_r], sourcetablealias.[expModelApCorrectionErr_i], sourcetablealias.[expModelApCorrectionErr_z], sourcetablealias.[medianFiberColor_u], sourcetablealias.[medianFiberColor_g], sourcetablealias.[medianFiberColor_r], sourcetablealias.[medianFiberColor_i], sourcetablealias.[medianFiberColor_z], sourcetablealias.[medianPsfColor_u], sourcetablealias.[medianPsfColor_g], sourcetablealias.[medianPsfColor_r], sourcetablealias.[medianPsfColor_i], sourcetablealias.[medianPsfColor_z], sourcetablealias.[q_u], sourcetablealias.[q_g], sourcetablealias.[q_r], sourcetablealias.[q_i], sourcetablealias.[q_z], sourcetablealias.[u_u], sourcetablealias.[u_g], sourcetablealias.[u_r], sourcetablealias.[u_i], sourcetablealias.[u_z], sourcetablealias.[pspStatus], sourcetablealias.[culled], sourcetablealias.[badMask], sourcetablealias.[acceptableMask], sourcetablealias.[goodMask], sourcetablealias.[holeMask], sourcetablealias.[status_u], sourcetablealias.[status_g], sourcetablealias.[status_r], sourcetablealias.[status_i], sourcetablealias.[status_z], sourcetablealias.[sky_u], sourcetablealias.[sky_g], sourcetablealias.[sky_r], sourcetablealias.[sky_i], sourcetablealias.[sky_z], sourcetablealias.[skySig_u], sourcetablealias.[skySig_g], sourcetablealias.[skySig_r], sourcetablealias.[skySig_i], sourcetablealias.[skySig_z], sourcetablealias.[skyErr_u], sourcetablealias.[skyErr_g], sourcetablealias.[skyErr_r], sourcetablealias.[skyErr_i], sourcetablealias.[skyErr_z], sourcetablealias.[skySlope_u], sourcetablealias.[skySlope_g], sourcetablealias.[skySlope_r], sourcetablealias.[skySlope_i], sourcetablealias.[skySlope_z], sourcetablealias.[lbias_u], sourcetablealias.[lbias_g], sourcetablealias.[lbias_r], sourcetablealias.[lbias_i], sourcetablealias.[lbias_z], sourcetablealias.[rbias_u], sourcetablealias.[rbias_g], sourcetablealias.[rbias_r], sourcetablealias.[rbias_i], sourcetablealias.[rbias_z], sourcetablealias.[psfNStar_u], sourcetablealias.[psfNStar_g], sourcetablealias.[psfNStar_r], sourcetablealias.[psfNStar_i], sourcetablealias.[psfNStar_z], sourcetablealias.[psfApCorrectionErr_u], sourcetablealias.[psfApCorrectionErr_g], sourcetablealias.[psfApCorrectionErr_r], sourcetablealias.[psfApCorrectionErr_i], sourcetablealias.[psfApCorrectionErr_z], sourcetablealias.[psfSigma1_u], sourcetablealias.[psfSigma1_g], sourcetablealias.[psfSigma1_r], sourcetablealias.[psfSigma1_i], sourcetablealias.[psfSigma1_z], sourcetablealias.[psfSigma2_u], sourcetablealias.[psfSigma2_g], sourcetablealias.[psfSigma2_r], sourcetablealias.[psfSigma2_i], sourcetablealias.[psfSigma2_z], sourcetablealias.[psfB_u], sourcetablealias.[psfB_g], sourcetablealias.[psfB_r], sourcetablealias.[psfB_i], sourcetablealias.[psfB_z], sourcetablealias.[psfP0_u], sourcetablealias.[psfP0_g], sourcetablealias.[psfP0_r], sourcetablealias.[psfP0_i], sourcetablealias.[psfP0_z], sourcetablealias.[psfBeta_u], sourcetablealias.[psfBeta_g], sourcetablealias.[psfBeta_r], sourcetablealias.[psfBeta_i], sourcetablealias.[psfBeta_z], sourcetablealias.[psfSigmaP_u], sourcetablealias.[psfSigmaP_g], sourcetablealias.[psfSigmaP_r], sourcetablealias.[psfSigmaP_i], sourcetablealias.[psfSigmaP_z], sourcetablealias.[psfWidth_u], sourcetablealias.[psfWidth_g], sourcetablealias.[psfWidth_r], sourcetablealias.[psfWidth_i], sourcetablealias.[psfWidth_z], sourcetablealias.[psfPsfCounts_u], sourcetablealias.[psfPsfCounts_g], sourcetablealias.[psfPsfCounts_r], sourcetablealias.[psfPsfCounts_i], sourcetablealias.[psfPsfCounts_z], sourcetablealias.[psf2GSigma1_u], sourcetablealias.[psf2GSigma1_g], sourcetablealias.[psf2GSigma1_r], sourcetablealias.[psf2GSigma1_i], sourcetablealias.[psf2GSigma1_z], sourcetablealias.[psf2GSigma2_u], sourcetablealias.[psf2GSigma2_g], sourcetablealias.[psf2GSigma2_r], sourcetablealias.[psf2GSigma2_i], sourcetablealias.[psf2GSigma2_z], sourcetablealias.[psf2GB_u], sourcetablealias.[psf2GB_g], sourcetablealias.[psf2GB_r], sourcetablealias.[psf2GB_i], sourcetablealias.[psf2GB_z], sourcetablealias.[psfCounts_u], sourcetablealias.[psfCounts_g], sourcetablealias.[psfCounts_r], sourcetablealias.[psfCounts_i], sourcetablealias.[psfCounts_z], sourcetablealias.[gain_u], sourcetablealias.[gain_g], sourcetablealias.[gain_r], sourcetablealias.[gain_i], sourcetablealias.[gain_z], sourcetablealias.[darkVariance_u], sourcetablealias.[darkVariance_g], sourcetablealias.[darkVariance_r], sourcetablealias.[darkVariance_i], sourcetablealias.[darkVariance_z], sourcetablealias.[nProf_u], sourcetablealias.[nProf_g], sourcetablealias.[nProf_r], sourcetablealias.[nProf_i], sourcetablealias.[nProf_z], sourcetablealias.[loadVersion], sourcetablealias.[segmentID]
 FROM   [SkyNode_SDSSDR7].[dbo].[Field] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID
	;


GO

-- SUBSAMPLING TABLE 'FieldProfile' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint, [bin] tinyint, [band] tinyint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], sourcetablealias.[bin], sourcetablealias.[band], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[FieldProfile] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID], [bin], [band]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[FieldProfile] WITH (TABLOCKX)
	([bin], [band], [profMean], [profMed], [profSig], [fieldID])
 SELECT sourcetablealias.[bin], sourcetablealias.[band], sourcetablealias.[profMean], sourcetablealias.[profMed], sourcetablealias.[profSig], sourcetablealias.[fieldID]
 FROM   [SkyNode_SDSSDR7].[dbo].[FieldProfile] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID AND ##temporaryidlist.bin = sourcetablealias.bin AND ##temporaryidlist.band = sourcetablealias.band
	;


GO

-- SUBSAMPLING TABLE 'FieldQA' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[FieldQA] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[FieldQA] WITH (TABLOCKX)
	([fieldID], [run], [rerun], [camcol], [field], [inLegacy], [astromVersion], [koCat], [koVersion], [sdssbitu], [sdssbitg], [sdssbitr], [sdssbiti], [sdssbitz], [QgriS], [QrizS], [psbitu], [psbitg], [psbitr], [psbiti], [psbitz], [QgriP], [QrizP], [problemChar])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[inLegacy], sourcetablealias.[astromVersion], sourcetablealias.[koCat], sourcetablealias.[koVersion], sourcetablealias.[sdssbitu], sourcetablealias.[sdssbitg], sourcetablealias.[sdssbitr], sourcetablealias.[sdssbiti], sourcetablealias.[sdssbitz], sourcetablealias.[QgriS], sourcetablealias.[QrizS], sourcetablealias.[psbitu], sourcetablealias.[psbitg], sourcetablealias.[psbitr], sourcetablealias.[psbiti], sourcetablealias.[psbitz], sourcetablealias.[QgriP], sourcetablealias.[QrizP], sourcetablealias.[problemChar]
 FROM   [SkyNode_SDSSDR7].[dbo].[FieldQA] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID
	;


GO

-- SUBSAMPLING TABLE 'Frame' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint, [zoom] int
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], sourcetablealias.[zoom], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Frame] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID], [zoom]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Frame] WITH (TABLOCKX)
	([fieldID], [zoom], [run], [rerun], [camcol], [field], [stripe], [strip], [a], [b], [c], [d], [e], [f], [node], [incl], [raMin], [raMax], [decMin], [decMax], [mu], [nu], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[zoom], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[stripe], sourcetablealias.[strip], sourcetablealias.[a], sourcetablealias.[b], sourcetablealias.[c], sourcetablealias.[d], sourcetablealias.[e], sourcetablealias.[f], sourcetablealias.[node], sourcetablealias.[incl], sourcetablealias.[raMin], sourcetablealias.[raMax], sourcetablealias.[decMin], sourcetablealias.[decMax], sourcetablealias.[mu], sourcetablealias.[nu], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID]
 FROM   [SkyNode_SDSSDR7].[dbo].[Frame] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID AND ##temporaryidlist.zoom = sourcetablealias.zoom
	;


GO

-- SUBSAMPLING TABLE 'HalfSpace' ---

 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[HalfSpace] ON;
  -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[HalfSpace] WITH (TABLOCKX)
    ([constraintid], [regionid], [convexid], [x], [y], [z], [c])
 SELECT sourcetablealias.[constraintid], sourcetablealias.[regionid], sourcetablealias.[convexid], sourcetablealias.[x], sourcetablealias.[y], sourcetablealias.[z], sourcetablealias.[c]
 FROM   [SkyNode_SDSSDR7].[dbo].[HalfSpace] sourcetablealias WITH (NOLOCK)
	;
  --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[HalfSpace] OFF;
 

GO

-- SUBSAMPLING TABLE 'HoleObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[HoleObj] WITH (TABLOCKX)
    ([holeID], [plateID], [holeType], [objType], [targetID], [fiberID], [xFocal], [yFocal], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneID], [loadVersion])
 SELECT sourcetablealias.[holeID], sourcetablealias.[plateID], sourcetablealias.[holeType], sourcetablealias.[objType], sourcetablealias.[targetID], sourcetablealias.[fiberID], sourcetablealias.[xFocal], sourcetablealias.[yFocal], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneID], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[HoleObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Mask' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[maskID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[maskID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Mask] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [maskID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Mask] WITH (TABLOCKX)
	([maskID], [run], [rerun], [camcol], [field], [mask], [filter], [ra], [dec], [radius], [area], [type], [seeing], [cx], [cy], [cz], [htmID], [zoneID])
 SELECT sourcetablealias.[maskID], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[mask], sourcetablealias.[filter], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[radius], sourcetablealias.[area], sourcetablealias.[type], sourcetablealias.[seeing], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID]
 FROM   [SkyNode_SDSSDR7].[dbo].[Mask] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.maskID = sourcetablealias.maskID
	;


GO

-- SUBSAMPLING TABLE 'MaskedObject' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objid] bigint, [maskID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objid], sourcetablealias.[maskID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[MaskedObject] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objid], [maskID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[MaskedObject] WITH (TABLOCKX)
	([objid], [maskID], [maskType])
 SELECT sourcetablealias.[objid], sourcetablealias.[maskID], sourcetablealias.[maskType]
 FROM   [SkyNode_SDSSDR7].[dbo].[MaskedObject] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objid = sourcetablealias.objid AND ##temporaryidlist.maskID = sourcetablealias.maskID
	;


GO

-- SUBSAMPLING TABLE 'Match' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID1] bigint, [objID2] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID1], sourcetablealias.[objID2], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Match] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID1], [objID2]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Match] WITH (TABLOCKX)
	([objID1], [objID2], [run1], [run2], [type1], [type2], [mode1], [mode2], [distance], [miss], [matchHead])
 SELECT sourcetablealias.[objID1], sourcetablealias.[objID2], sourcetablealias.[run1], sourcetablealias.[run2], sourcetablealias.[type1], sourcetablealias.[type2], sourcetablealias.[mode1], sourcetablealias.[mode2], sourcetablealias.[distance], sourcetablealias.[miss], sourcetablealias.[matchHead]
 FROM   [SkyNode_SDSSDR7].[dbo].[Match] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID1 = sourcetablealias.objID1 AND ##temporaryidlist.objID2 = sourcetablealias.objID2
	;


GO

-- SUBSAMPLING TABLE 'MatchHead' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[MatchHead] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[MatchHead] WITH (TABLOCKX)
	([objID], [averageRa], [averageDec], [varRa], [varDec], [matchCount], [missCount])
 SELECT sourcetablealias.[objID], sourcetablealias.[averageRa], sourcetablealias.[averageDec], sourcetablealias.[varRa], sourcetablealias.[varDec], sourcetablealias.[matchCount], sourcetablealias.[missCount]
 FROM   [SkyNode_SDSSDR7].[dbo].[MatchHead] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'Neighbors' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint, [neighborObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], sourcetablealias.[neighborObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Neighbors] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID], [neighborObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Neighbors] WITH (TABLOCKX)
	([objID], [neighborObjID], [distance], [type], [neighborType], [mode], [neighborMode])
 SELECT sourcetablealias.[objID], sourcetablealias.[neighborObjID], sourcetablealias.[distance], sourcetablealias.[type], sourcetablealias.[neighborType], sourcetablealias.[mode], sourcetablealias.[neighborMode]
 FROM   [SkyNode_SDSSDR7].[dbo].[Neighbors] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID AND ##temporaryidlist.neighborObjID = sourcetablealias.neighborObjID
	;


GO

-- SUBSAMPLING TABLE 'ObjMask' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[ObjMask] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[ObjMask] WITH (TABLOCKX)
	([objID], [size], [nspan], [row0], [col0], [rmin], [rmax], [cmin], [cmax], [npix], [span])
 SELECT sourcetablealias.[objID], sourcetablealias.[size], sourcetablealias.[nspan], sourcetablealias.[row0], sourcetablealias.[col0], sourcetablealias.[rmin], sourcetablealias.[rmax], sourcetablealias.[cmin], sourcetablealias.[cmax], sourcetablealias.[npix], sourcetablealias.[span]
 FROM   [SkyNode_SDSSDR7].[dbo].[ObjMask] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'OrigField' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[OrigField] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[OrigField] WITH (TABLOCKX)
	([fieldID], [skyVersion], [run], [rerun], [camcol], [field], [nObjects], [nChild], [nGalaxy], [nStars], [numStars_u], [numStars_g], [numStars_r], [numStars_i], [numStars_z], [nCR_u], [nCR_g], [nCR_r], [nCR_i], [nCR_z], [nBrightObj_u], [nBrightObj_g], [nBrightObj_r], [nBrightObj_i], [nBrightObj_z], [nFaintObj_u], [nFaintObj_g], [nFaintObj_r], [nFaintObj_i], [nFaintObj_z], [quality], [mjd_u], [mjd_g], [mjd_r], [mjd_i], [mjd_z], [a_u], [a_g], [a_r], [a_i], [a_z], [b_u], [b_g], [b_r], [b_i], [b_z], [c_u], [c_g], [c_r], [c_i], [c_z], [d_u], [d_g], [d_r], [d_i], [d_z], [e_u], [e_g], [e_r], [e_i], [e_z], [f_u], [f_g], [f_r], [f_i], [f_z], [dRow0_u], [dRow0_g], [dRow0_r], [dRow0_i], [dRow0_z], [dRow1_u], [dRow1_g], [dRow1_r], [dRow1_i], [dRow1_z], [dRow2_u], [dRow2_g], [dRow2_r], [dRow2_i], [dRow2_z], [dRow3_u], [dRow3_g], [dRow3_r], [dRow3_i], [dRow3_z], [dCol0_u], [dCol0_g], [dCol0_r], [dCol0_i], [dCol0_z], [dCol1_u], [dCol1_g], [dCol1_r], [dCol1_i], [dCol1_z], [dCol2_u], [dCol2_g], [dCol2_r], [dCol2_i], [dCol2_z], [dCol3_u], [dCol3_g], [dCol3_r], [dCol3_i], [dCol3_z], [csRow_u], [csRow_g], [csRow_r], [csRow_i], [csRow_z], [csCol_u], [csCol_g], [csCol_r], [csCol_i], [csCol_z], [ccRow_u], [ccRow_g], [ccRow_r], [ccRow_i], [ccRow_z], [ccCol_u], [ccCol_g], [ccCol_r], [ccCol_i], [ccCol_z], [riCut_u], [riCut_g], [riCut_r], [riCut_i], [riCut_z], [airmass_u], [airmass_g], [airmass_r], [airmass_i], [airmass_z], [muErr_u], [muErr_g], [muErr_r], [muErr_i], [muErr_z], [nuErr_u], [nuErr_g], [nuErr_r], [nuErr_i], [nuErr_z], [raMin], [raMax], [decMin], [decMax], [scanlineArea], [stripeArea], [seqId], [aa_u], [aa_g], [aa_r], [aa_i], [aa_z], [aaErr_u], [aaErr_g], [aaErr_r], [aaErr_i], [aaErr_z], [bb_u], [bb_g], [bb_r], [bb_i], [bb_z], [bbErr_u], [bbErr_g], [bbErr_r], [bbErr_i], [bbErr_z], [cc_u], [cc_g], [cc_r], [cc_i], [cc_z], [ccErr_u], [ccErr_g], [ccErr_r], [ccErr_i], [ccErr_z], [kk_u], [kk_g], [kk_r], [kk_i], [kk_z], [kkErr_u], [kkErr_g], [kkErr_r], [kkErr_i], [kkErr_z], [framesStatus], [rowOffset_u], [rowOffset_g], [rowOffset_r], [rowOffset_i], [rowOffset_z], [colOffset_u], [colOffset_g], [colOffset_r], [colOffset_i], [colOffset_z], [saturationLevel_u], [saturationLevel_g], [saturationLevel_r], [saturationLevel_i], [saturationLevel_z], [nEffPsf_u], [nEffPsf_g], [nEffPsf_r], [nEffPsf_i], [nEffPsf_z], [skyPsp_u], [skyPsp_g], [skyPsp_r], [skyPsp_i], [skyPsp_z], [skyFrames_u], [skyFrames_g], [skyFrames_r], [skyFrames_i], [skyFrames_z], [skyFramesSub_u], [skyFramesSub_g], [skyFramesSub_r], [skyFramesSub_i], [skyFramesSub_z], [sigPix_u], [sigPix_g], [sigPix_r], [sigPix_i], [sigPix_z], [deVApCorrection_u], [deVApCorrection_g], [deVApCorrection_r], [deVApCorrection_i], [deVApCorrection_z], [deVApCorrectionErr_u], [deVApCorrectionErr_g], [deVApCorrectionErr_r], [deVApCorrectionErr_i], [deVApCorrectionErr_z], [expApCorrection_u], [expApCorrection_g], [expApCorrection_r], [expApCorrection_i], [expApCorrection_z], [expApCorrectionErr_u], [expApCorrectionErr_g], [expApCorrectionErr_r], [expApCorrectionErr_i], [expApCorrectionErr_z], [deVModelApCorrection_u], [deVModelApCorrection_g], [deVModelApCorrection_r], [deVModelApCorrection_i], [deVModelApCorrection_z], [deVModelApCorrectionErr_u], [deVModelApCorrectionErr_g], [deVModelApCorrectionErr_r], [deVModelApCorrectionErr_i], [deVModelApCorrectionErr_z], [expModelApCorrection_u], [expModelApCorrection_g], [expModelApCorrection_r], [expModelApCorrection_i], [expModelApCorrection_z], [expModelApCorrectionErr_u], [expModelApCorrectionErr_g], [expModelApCorrectionErr_r], [expModelApCorrectionErr_i], [expModelApCorrectionErr_z], [medianFiberColor_u], [medianFiberColor_g], [medianFiberColor_r], [medianFiberColor_i], [medianFiberColor_z], [medianPsfColor_u], [medianPsfColor_g], [medianPsfColor_r], [medianPsfColor_i], [medianPsfColor_z], [q_u], [q_g], [q_r], [q_i], [q_z], [u_u], [u_g], [u_r], [u_i], [u_z], [pspStatus], [culled], [badMask], [acceptableMask], [goodMask], [holeMask], [status_u], [status_g], [status_r], [status_i], [status_z], [sky_u], [sky_g], [sky_r], [sky_i], [sky_z], [skySig_u], [skySig_g], [skySig_r], [skySig_i], [skySig_z], [skyErr_u], [skyErr_g], [skyErr_r], [skyErr_i], [skyErr_z], [skySlope_u], [skySlope_g], [skySlope_r], [skySlope_i], [skySlope_z], [lbias_u], [lbias_g], [lbias_r], [lbias_i], [lbias_z], [rbias_u], [rbias_g], [rbias_r], [rbias_i], [rbias_z], [psfNStar_u], [psfNStar_g], [psfNStar_r], [psfNStar_i], [psfNStar_z], [psfApCorrectionErr_u], [psfApCorrectionErr_g], [psfApCorrectionErr_r], [psfApCorrectionErr_i], [psfApCorrectionErr_z], [psfSigma1_u], [psfSigma1_g], [psfSigma1_r], [psfSigma1_i], [psfSigma1_z], [psfSigma2_u], [psfSigma2_g], [psfSigma2_r], [psfSigma2_i], [psfSigma2_z], [psfB_u], [psfB_g], [psfB_r], [psfB_i], [psfB_z], [psfP0_u], [psfP0_g], [psfP0_r], [psfP0_i], [psfP0_z], [psfBeta_u], [psfBeta_g], [psfBeta_r], [psfBeta_i], [psfBeta_z], [psfSigmaP_u], [psfSigmaP_g], [psfSigmaP_r], [psfSigmaP_i], [psfSigmaP_z], [psfWidth_u], [psfWidth_g], [psfWidth_r], [psfWidth_i], [psfWidth_z], [psfPsfCounts_u], [psfPsfCounts_g], [psfPsfCounts_r], [psfPsfCounts_i], [psfPsfCounts_z], [psf2GSigma1_u], [psf2GSigma1_g], [psf2GSigma1_r], [psf2GSigma1_i], [psf2GSigma1_z], [psf2GSigma2_u], [psf2GSigma2_g], [psf2GSigma2_r], [psf2GSigma2_i], [psf2GSigma2_z], [psf2GB_u], [psf2GB_g], [psf2GB_r], [psf2GB_i], [psf2GB_z], [psfCounts_u], [psfCounts_g], [psfCounts_r], [psfCounts_i], [psfCounts_z], [gain_u], [gain_g], [gain_r], [gain_i], [gain_z], [darkVariance_u], [darkVariance_g], [darkVariance_r], [darkVariance_i], [darkVariance_z], [nProf_u], [nProf_g], [nProf_r], [nProf_i], [nProf_z], [loadVersion], [segmentID])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[nObjects], sourcetablealias.[nChild], sourcetablealias.[nGalaxy], sourcetablealias.[nStars], sourcetablealias.[numStars_u], sourcetablealias.[numStars_g], sourcetablealias.[numStars_r], sourcetablealias.[numStars_i], sourcetablealias.[numStars_z], sourcetablealias.[nCR_u], sourcetablealias.[nCR_g], sourcetablealias.[nCR_r], sourcetablealias.[nCR_i], sourcetablealias.[nCR_z], sourcetablealias.[nBrightObj_u], sourcetablealias.[nBrightObj_g], sourcetablealias.[nBrightObj_r], sourcetablealias.[nBrightObj_i], sourcetablealias.[nBrightObj_z], sourcetablealias.[nFaintObj_u], sourcetablealias.[nFaintObj_g], sourcetablealias.[nFaintObj_r], sourcetablealias.[nFaintObj_i], sourcetablealias.[nFaintObj_z], sourcetablealias.[quality], sourcetablealias.[mjd_u], sourcetablealias.[mjd_g], sourcetablealias.[mjd_r], sourcetablealias.[mjd_i], sourcetablealias.[mjd_z], sourcetablealias.[a_u], sourcetablealias.[a_g], sourcetablealias.[a_r], sourcetablealias.[a_i], sourcetablealias.[a_z], sourcetablealias.[b_u], sourcetablealias.[b_g], sourcetablealias.[b_r], sourcetablealias.[b_i], sourcetablealias.[b_z], sourcetablealias.[c_u], sourcetablealias.[c_g], sourcetablealias.[c_r], sourcetablealias.[c_i], sourcetablealias.[c_z], sourcetablealias.[d_u], sourcetablealias.[d_g], sourcetablealias.[d_r], sourcetablealias.[d_i], sourcetablealias.[d_z], sourcetablealias.[e_u], sourcetablealias.[e_g], sourcetablealias.[e_r], sourcetablealias.[e_i], sourcetablealias.[e_z], sourcetablealias.[f_u], sourcetablealias.[f_g], sourcetablealias.[f_r], sourcetablealias.[f_i], sourcetablealias.[f_z], sourcetablealias.[dRow0_u], sourcetablealias.[dRow0_g], sourcetablealias.[dRow0_r], sourcetablealias.[dRow0_i], sourcetablealias.[dRow0_z], sourcetablealias.[dRow1_u], sourcetablealias.[dRow1_g], sourcetablealias.[dRow1_r], sourcetablealias.[dRow1_i], sourcetablealias.[dRow1_z], sourcetablealias.[dRow2_u], sourcetablealias.[dRow2_g], sourcetablealias.[dRow2_r], sourcetablealias.[dRow2_i], sourcetablealias.[dRow2_z], sourcetablealias.[dRow3_u], sourcetablealias.[dRow3_g], sourcetablealias.[dRow3_r], sourcetablealias.[dRow3_i], sourcetablealias.[dRow3_z], sourcetablealias.[dCol0_u], sourcetablealias.[dCol0_g], sourcetablealias.[dCol0_r], sourcetablealias.[dCol0_i], sourcetablealias.[dCol0_z], sourcetablealias.[dCol1_u], sourcetablealias.[dCol1_g], sourcetablealias.[dCol1_r], sourcetablealias.[dCol1_i], sourcetablealias.[dCol1_z], sourcetablealias.[dCol2_u], sourcetablealias.[dCol2_g], sourcetablealias.[dCol2_r], sourcetablealias.[dCol2_i], sourcetablealias.[dCol2_z], sourcetablealias.[dCol3_u], sourcetablealias.[dCol3_g], sourcetablealias.[dCol3_r], sourcetablealias.[dCol3_i], sourcetablealias.[dCol3_z], sourcetablealias.[csRow_u], sourcetablealias.[csRow_g], sourcetablealias.[csRow_r], sourcetablealias.[csRow_i], sourcetablealias.[csRow_z], sourcetablealias.[csCol_u], sourcetablealias.[csCol_g], sourcetablealias.[csCol_r], sourcetablealias.[csCol_i], sourcetablealias.[csCol_z], sourcetablealias.[ccRow_u], sourcetablealias.[ccRow_g], sourcetablealias.[ccRow_r], sourcetablealias.[ccRow_i], sourcetablealias.[ccRow_z], sourcetablealias.[ccCol_u], sourcetablealias.[ccCol_g], sourcetablealias.[ccCol_r], sourcetablealias.[ccCol_i], sourcetablealias.[ccCol_z], sourcetablealias.[riCut_u], sourcetablealias.[riCut_g], sourcetablealias.[riCut_r], sourcetablealias.[riCut_i], sourcetablealias.[riCut_z], sourcetablealias.[airmass_u], sourcetablealias.[airmass_g], sourcetablealias.[airmass_r], sourcetablealias.[airmass_i], sourcetablealias.[airmass_z], sourcetablealias.[muErr_u], sourcetablealias.[muErr_g], sourcetablealias.[muErr_r], sourcetablealias.[muErr_i], sourcetablealias.[muErr_z], sourcetablealias.[nuErr_u], sourcetablealias.[nuErr_g], sourcetablealias.[nuErr_r], sourcetablealias.[nuErr_i], sourcetablealias.[nuErr_z], sourcetablealias.[raMin], sourcetablealias.[raMax], sourcetablealias.[decMin], sourcetablealias.[decMax], sourcetablealias.[scanlineArea], sourcetablealias.[stripeArea], sourcetablealias.[seqId], sourcetablealias.[aa_u], sourcetablealias.[aa_g], sourcetablealias.[aa_r], sourcetablealias.[aa_i], sourcetablealias.[aa_z], sourcetablealias.[aaErr_u], sourcetablealias.[aaErr_g], sourcetablealias.[aaErr_r], sourcetablealias.[aaErr_i], sourcetablealias.[aaErr_z], sourcetablealias.[bb_u], sourcetablealias.[bb_g], sourcetablealias.[bb_r], sourcetablealias.[bb_i], sourcetablealias.[bb_z], sourcetablealias.[bbErr_u], sourcetablealias.[bbErr_g], sourcetablealias.[bbErr_r], sourcetablealias.[bbErr_i], sourcetablealias.[bbErr_z], sourcetablealias.[cc_u], sourcetablealias.[cc_g], sourcetablealias.[cc_r], sourcetablealias.[cc_i], sourcetablealias.[cc_z], sourcetablealias.[ccErr_u], sourcetablealias.[ccErr_g], sourcetablealias.[ccErr_r], sourcetablealias.[ccErr_i], sourcetablealias.[ccErr_z], sourcetablealias.[kk_u], sourcetablealias.[kk_g], sourcetablealias.[kk_r], sourcetablealias.[kk_i], sourcetablealias.[kk_z], sourcetablealias.[kkErr_u], sourcetablealias.[kkErr_g], sourcetablealias.[kkErr_r], sourcetablealias.[kkErr_i], sourcetablealias.[kkErr_z], sourcetablealias.[framesStatus], sourcetablealias.[rowOffset_u], sourcetablealias.[rowOffset_g], sourcetablealias.[rowOffset_r], sourcetablealias.[rowOffset_i], sourcetablealias.[rowOffset_z], sourcetablealias.[colOffset_u], sourcetablealias.[colOffset_g], sourcetablealias.[colOffset_r], sourcetablealias.[colOffset_i], sourcetablealias.[colOffset_z], sourcetablealias.[saturationLevel_u], sourcetablealias.[saturationLevel_g], sourcetablealias.[saturationLevel_r], sourcetablealias.[saturationLevel_i], sourcetablealias.[saturationLevel_z], sourcetablealias.[nEffPsf_u], sourcetablealias.[nEffPsf_g], sourcetablealias.[nEffPsf_r], sourcetablealias.[nEffPsf_i], sourcetablealias.[nEffPsf_z], sourcetablealias.[skyPsp_u], sourcetablealias.[skyPsp_g], sourcetablealias.[skyPsp_r], sourcetablealias.[skyPsp_i], sourcetablealias.[skyPsp_z], sourcetablealias.[skyFrames_u], sourcetablealias.[skyFrames_g], sourcetablealias.[skyFrames_r], sourcetablealias.[skyFrames_i], sourcetablealias.[skyFrames_z], sourcetablealias.[skyFramesSub_u], sourcetablealias.[skyFramesSub_g], sourcetablealias.[skyFramesSub_r], sourcetablealias.[skyFramesSub_i], sourcetablealias.[skyFramesSub_z], sourcetablealias.[sigPix_u], sourcetablealias.[sigPix_g], sourcetablealias.[sigPix_r], sourcetablealias.[sigPix_i], sourcetablealias.[sigPix_z], sourcetablealias.[deVApCorrection_u], sourcetablealias.[deVApCorrection_g], sourcetablealias.[deVApCorrection_r], sourcetablealias.[deVApCorrection_i], sourcetablealias.[deVApCorrection_z], sourcetablealias.[deVApCorrectionErr_u], sourcetablealias.[deVApCorrectionErr_g], sourcetablealias.[deVApCorrectionErr_r], sourcetablealias.[deVApCorrectionErr_i], sourcetablealias.[deVApCorrectionErr_z], sourcetablealias.[expApCorrection_u], sourcetablealias.[expApCorrection_g], sourcetablealias.[expApCorrection_r], sourcetablealias.[expApCorrection_i], sourcetablealias.[expApCorrection_z], sourcetablealias.[expApCorrectionErr_u], sourcetablealias.[expApCorrectionErr_g], sourcetablealias.[expApCorrectionErr_r], sourcetablealias.[expApCorrectionErr_i], sourcetablealias.[expApCorrectionErr_z], sourcetablealias.[deVModelApCorrection_u], sourcetablealias.[deVModelApCorrection_g], sourcetablealias.[deVModelApCorrection_r], sourcetablealias.[deVModelApCorrection_i], sourcetablealias.[deVModelApCorrection_z], sourcetablealias.[deVModelApCorrectionErr_u], sourcetablealias.[deVModelApCorrectionErr_g], sourcetablealias.[deVModelApCorrectionErr_r], sourcetablealias.[deVModelApCorrectionErr_i], sourcetablealias.[deVModelApCorrectionErr_z], sourcetablealias.[expModelApCorrection_u], sourcetablealias.[expModelApCorrection_g], sourcetablealias.[expModelApCorrection_r], sourcetablealias.[expModelApCorrection_i], sourcetablealias.[expModelApCorrection_z], sourcetablealias.[expModelApCorrectionErr_u], sourcetablealias.[expModelApCorrectionErr_g], sourcetablealias.[expModelApCorrectionErr_r], sourcetablealias.[expModelApCorrectionErr_i], sourcetablealias.[expModelApCorrectionErr_z], sourcetablealias.[medianFiberColor_u], sourcetablealias.[medianFiberColor_g], sourcetablealias.[medianFiberColor_r], sourcetablealias.[medianFiberColor_i], sourcetablealias.[medianFiberColor_z], sourcetablealias.[medianPsfColor_u], sourcetablealias.[medianPsfColor_g], sourcetablealias.[medianPsfColor_r], sourcetablealias.[medianPsfColor_i], sourcetablealias.[medianPsfColor_z], sourcetablealias.[q_u], sourcetablealias.[q_g], sourcetablealias.[q_r], sourcetablealias.[q_i], sourcetablealias.[q_z], sourcetablealias.[u_u], sourcetablealias.[u_g], sourcetablealias.[u_r], sourcetablealias.[u_i], sourcetablealias.[u_z], sourcetablealias.[pspStatus], sourcetablealias.[culled], sourcetablealias.[badMask], sourcetablealias.[acceptableMask], sourcetablealias.[goodMask], sourcetablealias.[holeMask], sourcetablealias.[status_u], sourcetablealias.[status_g], sourcetablealias.[status_r], sourcetablealias.[status_i], sourcetablealias.[status_z], sourcetablealias.[sky_u], sourcetablealias.[sky_g], sourcetablealias.[sky_r], sourcetablealias.[sky_i], sourcetablealias.[sky_z], sourcetablealias.[skySig_u], sourcetablealias.[skySig_g], sourcetablealias.[skySig_r], sourcetablealias.[skySig_i], sourcetablealias.[skySig_z], sourcetablealias.[skyErr_u], sourcetablealias.[skyErr_g], sourcetablealias.[skyErr_r], sourcetablealias.[skyErr_i], sourcetablealias.[skyErr_z], sourcetablealias.[skySlope_u], sourcetablealias.[skySlope_g], sourcetablealias.[skySlope_r], sourcetablealias.[skySlope_i], sourcetablealias.[skySlope_z], sourcetablealias.[lbias_u], sourcetablealias.[lbias_g], sourcetablealias.[lbias_r], sourcetablealias.[lbias_i], sourcetablealias.[lbias_z], sourcetablealias.[rbias_u], sourcetablealias.[rbias_g], sourcetablealias.[rbias_r], sourcetablealias.[rbias_i], sourcetablealias.[rbias_z], sourcetablealias.[psfNStar_u], sourcetablealias.[psfNStar_g], sourcetablealias.[psfNStar_r], sourcetablealias.[psfNStar_i], sourcetablealias.[psfNStar_z], sourcetablealias.[psfApCorrectionErr_u], sourcetablealias.[psfApCorrectionErr_g], sourcetablealias.[psfApCorrectionErr_r], sourcetablealias.[psfApCorrectionErr_i], sourcetablealias.[psfApCorrectionErr_z], sourcetablealias.[psfSigma1_u], sourcetablealias.[psfSigma1_g], sourcetablealias.[psfSigma1_r], sourcetablealias.[psfSigma1_i], sourcetablealias.[psfSigma1_z], sourcetablealias.[psfSigma2_u], sourcetablealias.[psfSigma2_g], sourcetablealias.[psfSigma2_r], sourcetablealias.[psfSigma2_i], sourcetablealias.[psfSigma2_z], sourcetablealias.[psfB_u], sourcetablealias.[psfB_g], sourcetablealias.[psfB_r], sourcetablealias.[psfB_i], sourcetablealias.[psfB_z], sourcetablealias.[psfP0_u], sourcetablealias.[psfP0_g], sourcetablealias.[psfP0_r], sourcetablealias.[psfP0_i], sourcetablealias.[psfP0_z], sourcetablealias.[psfBeta_u], sourcetablealias.[psfBeta_g], sourcetablealias.[psfBeta_r], sourcetablealias.[psfBeta_i], sourcetablealias.[psfBeta_z], sourcetablealias.[psfSigmaP_u], sourcetablealias.[psfSigmaP_g], sourcetablealias.[psfSigmaP_r], sourcetablealias.[psfSigmaP_i], sourcetablealias.[psfSigmaP_z], sourcetablealias.[psfWidth_u], sourcetablealias.[psfWidth_g], sourcetablealias.[psfWidth_r], sourcetablealias.[psfWidth_i], sourcetablealias.[psfWidth_z], sourcetablealias.[psfPsfCounts_u], sourcetablealias.[psfPsfCounts_g], sourcetablealias.[psfPsfCounts_r], sourcetablealias.[psfPsfCounts_i], sourcetablealias.[psfPsfCounts_z], sourcetablealias.[psf2GSigma1_u], sourcetablealias.[psf2GSigma1_g], sourcetablealias.[psf2GSigma1_r], sourcetablealias.[psf2GSigma1_i], sourcetablealias.[psf2GSigma1_z], sourcetablealias.[psf2GSigma2_u], sourcetablealias.[psf2GSigma2_g], sourcetablealias.[psf2GSigma2_r], sourcetablealias.[psf2GSigma2_i], sourcetablealias.[psf2GSigma2_z], sourcetablealias.[psf2GB_u], sourcetablealias.[psf2GB_g], sourcetablealias.[psf2GB_r], sourcetablealias.[psf2GB_i], sourcetablealias.[psf2GB_z], sourcetablealias.[psfCounts_u], sourcetablealias.[psfCounts_g], sourcetablealias.[psfCounts_r], sourcetablealias.[psfCounts_i], sourcetablealias.[psfCounts_z], sourcetablealias.[gain_u], sourcetablealias.[gain_g], sourcetablealias.[gain_r], sourcetablealias.[gain_i], sourcetablealias.[gain_z], sourcetablealias.[darkVariance_u], sourcetablealias.[darkVariance_g], sourcetablealias.[darkVariance_r], sourcetablealias.[darkVariance_i], sourcetablealias.[darkVariance_z], sourcetablealias.[nProf_u], sourcetablealias.[nProf_g], sourcetablealias.[nProf_r], sourcetablealias.[nProf_i], sourcetablealias.[nProf_z], sourcetablealias.[loadVersion], sourcetablealias.[segmentID]
 FROM   [SkyNode_SDSSDR7].[dbo].[OrigField] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID
	;


GO

-- SUBSAMPLING TABLE 'OrigPhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[OrigPhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[OrigPhotoObjAll] WITH (TABLOCKX)
	([objID], [run], [rerun], [camcol], [field], [obj], [mode], [ra], [dec], [raErr], [decErr], [raDecCorr], [cx], [cy], [cz], [htmID], [zoneID], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [modelMagErr_u], [modelMagErr_g], [modelMagErr_r], [modelMagErr_i], [modelMagErr_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[raDecCorr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[modelMagErr_u], sourcetablealias.[modelMagErr_g], sourcetablealias.[modelMagErr_r], sourcetablealias.[modelMagErr_i], sourcetablealias.[modelMagErr_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[OrigPhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'PhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[PhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[PhotoObjAll] WITH (TABLOCKX)
	([objID], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [nChild], [type], [clean], [probPSF], [insideMask], [flags], [rowc], [rowcErr], [colc], [colcErr], [rowv], [rowvErr], [colv], [colvErr], [rowc_u], [rowc_g], [rowc_r], [rowc_i], [rowc_z], [rowcErr_u], [rowcErr_g], [rowcErr_r], [rowcErr_i], [rowcErr_z], [colc_u], [colc_g], [colc_r], [colc_i], [colc_z], [colcErr_u], [colcErr_g], [colcErr_r], [colcErr_i], [colcErr_z], [sky_u], [sky_g], [sky_r], [sky_i], [sky_z], [skyErr_u], [skyErr_g], [skyErr_r], [skyErr_i], [skyErr_z], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [fiberMag_u], [fiberMag_g], [fiberMag_r], [fiberMag_i], [fiberMag_z], [fiberMagErr_u], [fiberMagErr_g], [fiberMagErr_r], [fiberMagErr_i], [fiberMagErr_z], [petroMag_u], [petroMag_g], [petroMag_r], [petroMag_i], [petroMag_z], [petroMagErr_u], [petroMagErr_g], [petroMagErr_r], [petroMagErr_i], [petroMagErr_z], [petroRad_u], [petroRad_g], [petroRad_r], [petroRad_i], [petroRad_z], [petroRadErr_u], [petroRadErr_g], [petroRadErr_r], [petroRadErr_i], [petroRadErr_z], [petroR50_u], [petroR50_g], [petroR50_r], [petroR50_i], [petroR50_z], [petroR50Err_u], [petroR50Err_g], [petroR50Err_r], [petroR50Err_i], [petroR50Err_z], [petroR90_u], [petroR90_g], [petroR90_r], [petroR90_i], [petroR90_z], [petroR90Err_u], [petroR90Err_g], [petroR90Err_r], [petroR90Err_i], [petroR90Err_z], [q_u], [q_g], [q_r], [q_i], [q_z], [qErr_u], [qErr_g], [qErr_r], [qErr_i], [qErr_z], [u_u], [u_g], [u_r], [u_i], [u_z], [uErr_u], [uErr_g], [uErr_r], [uErr_i], [uErr_z], [mE1_u], [mE1_g], [mE1_r], [mE1_i], [mE1_z], [mE2_u], [mE2_g], [mE2_r], [mE2_i], [mE2_z], [mE1E1Err_u], [mE1E1Err_g], [mE1E1Err_r], [mE1E1Err_i], [mE1E1Err_z], [mE1E2Err_u], [mE1E2Err_g], [mE1E2Err_r], [mE1E2Err_i], [mE1E2Err_z], [mE2E2Err_u], [mE2E2Err_g], [mE2E2Err_r], [mE2E2Err_i], [mE2E2Err_z], [mRrCc_u], [mRrCc_g], [mRrCc_r], [mRrCc_i], [mRrCc_z], [mRrCcErr_u], [mRrCcErr_g], [mRrCcErr_r], [mRrCcErr_i], [mRrCcErr_z], [mCr4_u], [mCr4_g], [mCr4_r], [mCr4_i], [mCr4_z], [mE1PSF_u], [mE1PSF_g], [mE1PSF_r], [mE1PSF_i], [mE1PSF_z], [mE2PSF_u], [mE2PSF_g], [mE2PSF_r], [mE2PSF_i], [mE2PSF_z], [mRrCcPSF_u], [mRrCcPSF_g], [mRrCcPSF_r], [mRrCcPSF_i], [mRrCcPSF_z], [mCr4PSF_u], [mCr4PSF_g], [mCr4PSF_r], [mCr4PSF_i], [mCr4PSF_z], [isoRowc_u], [isoRowc_g], [isoRowc_r], [isoRowc_i], [isoRowc_z], [isoRowcErr_u], [isoRowcErr_g], [isoRowcErr_r], [isoRowcErr_i], [isoRowcErr_z], [isoRowcGrad_u], [isoRowcGrad_g], [isoRowcGrad_r], [isoRowcGrad_i], [isoRowcGrad_z], [isoColc_u], [isoColc_g], [isoColc_r], [isoColc_i], [isoColc_z], [isoColcErr_u], [isoColcErr_g], [isoColcErr_r], [isoColcErr_i], [isoColcErr_z], [isoColcGrad_u], [isoColcGrad_g], [isoColcGrad_r], [isoColcGrad_i], [isoColcGrad_z], [isoA_u], [isoA_g], [isoA_r], [isoA_i], [isoA_z], [isoAErr_u], [isoAErr_g], [isoAErr_r], [isoAErr_i], [isoAErr_z], [isoB_u], [isoB_g], [isoB_r], [isoB_i], [isoB_z], [isoBErr_u], [isoBErr_g], [isoBErr_r], [isoBErr_i], [isoBErr_z], [isoAGrad_u], [isoAGrad_g], [isoAGrad_r], [isoAGrad_i], [isoAGrad_z], [isoBGrad_u], [isoBGrad_g], [isoBGrad_r], [isoBGrad_i], [isoBGrad_z], [isoPhi_u], [isoPhi_g], [isoPhi_r], [isoPhi_i], [isoPhi_z], [isoPhiErr_u], [isoPhiErr_g], [isoPhiErr_r], [isoPhiErr_i], [isoPhiErr_z], [isoPhiGrad_u], [isoPhiGrad_g], [isoPhiGrad_r], [isoPhiGrad_i], [isoPhiGrad_z], [deVRad_u], [deVRad_g], [deVRad_r], [deVRad_i], [deVRad_z], [deVRadErr_u], [deVRadErr_g], [deVRadErr_r], [deVRadErr_i], [deVRadErr_z], [deVAB_u], [deVAB_g], [deVAB_r], [deVAB_i], [deVAB_z], [deVABErr_u], [deVABErr_g], [deVABErr_r], [deVABErr_i], [deVABErr_z], [deVPhi_u], [deVPhi_g], [deVPhi_r], [deVPhi_i], [deVPhi_z], [deVPhiErr_u], [deVPhiErr_g], [deVPhiErr_r], [deVPhiErr_i], [deVPhiErr_z], [deVMag_u], [deVMag_g], [deVMag_r], [deVMag_i], [deVMag_z], [deVMagErr_u], [deVMagErr_g], [deVMagErr_r], [deVMagErr_i], [deVMagErr_z], [expRad_u], [expRad_g], [expRad_r], [expRad_i], [expRad_z], [expRadErr_u], [expRadErr_g], [expRadErr_r], [expRadErr_i], [expRadErr_z], [expAB_u], [expAB_g], [expAB_r], [expAB_i], [expAB_z], [expABErr_u], [expABErr_g], [expABErr_r], [expABErr_i], [expABErr_z], [expPhi_u], [expPhi_g], [expPhi_r], [expPhi_i], [expPhi_z], [expPhiErr_u], [expPhiErr_g], [expPhiErr_r], [expPhiErr_i], [expPhiErr_z], [expMag_u], [expMag_g], [expMag_r], [expMag_i], [expMag_z], [expMagErr_u], [expMagErr_g], [expMagErr_r], [expMagErr_i], [expMagErr_z], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [modelMagErr_u], [modelMagErr_g], [modelMagErr_r], [modelMagErr_i], [modelMagErr_z], [texture_u], [texture_g], [texture_r], [texture_i], [texture_z], [lnLStar_u], [lnLStar_g], [lnLStar_r], [lnLStar_i], [lnLStar_z], [lnLExp_u], [lnLExp_g], [lnLExp_r], [lnLExp_i], [lnLExp_z], [lnLDeV_u], [lnLDeV_g], [lnLDeV_r], [lnLDeV_i], [lnLDeV_z], [fracDeV_u], [fracDeV_g], [fracDeV_r], [fracDeV_i], [fracDeV_z], [flags_u], [flags_g], [flags_r], [flags_i], [flags_z], [type_u], [type_g], [type_r], [type_i], [type_z], [probPSF_u], [probPSF_g], [probPSF_r], [probPSF_i], [probPSF_z], [status], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [raErr], [decErr], [raDecCorr], [b], [l], [offsetRa_u], [offsetRa_g], [offsetRa_r], [offsetRa_i], [offsetRa_z], [offsetDec_u], [offsetDec_g], [offsetDec_r], [offsetDec_i], [offsetDec_z], [primTarget], [secTarget], [seguePrimTarget], [segueSecTarget], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [priority], [rho], [nProf_u], [nProf_g], [nProf_r], [nProf_i], [nProf_z], [loadVersion], [fieldID], [parentID], [specObjID], [u], [g], [r], [i], [z], [err_u], [err_g], [err_r], [err_i], [err_z], [dered_u], [dered_g], [dered_r], [dered_i], [dered_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[nChild], sourcetablealias.[type], sourcetablealias.[clean], sourcetablealias.[probPSF], sourcetablealias.[insideMask], sourcetablealias.[flags], sourcetablealias.[rowc], sourcetablealias.[rowcErr], sourcetablealias.[colc], sourcetablealias.[colcErr], sourcetablealias.[rowv], sourcetablealias.[rowvErr], sourcetablealias.[colv], sourcetablealias.[colvErr], sourcetablealias.[rowc_u], sourcetablealias.[rowc_g], sourcetablealias.[rowc_r], sourcetablealias.[rowc_i], sourcetablealias.[rowc_z], sourcetablealias.[rowcErr_u], sourcetablealias.[rowcErr_g], sourcetablealias.[rowcErr_r], sourcetablealias.[rowcErr_i], sourcetablealias.[rowcErr_z], sourcetablealias.[colc_u], sourcetablealias.[colc_g], sourcetablealias.[colc_r], sourcetablealias.[colc_i], sourcetablealias.[colc_z], sourcetablealias.[colcErr_u], sourcetablealias.[colcErr_g], sourcetablealias.[colcErr_r], sourcetablealias.[colcErr_i], sourcetablealias.[colcErr_z], sourcetablealias.[sky_u], sourcetablealias.[sky_g], sourcetablealias.[sky_r], sourcetablealias.[sky_i], sourcetablealias.[sky_z], sourcetablealias.[skyErr_u], sourcetablealias.[skyErr_g], sourcetablealias.[skyErr_r], sourcetablealias.[skyErr_i], sourcetablealias.[skyErr_z], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[fiberMag_u], sourcetablealias.[fiberMag_g], sourcetablealias.[fiberMag_r], sourcetablealias.[fiberMag_i], sourcetablealias.[fiberMag_z], sourcetablealias.[fiberMagErr_u], sourcetablealias.[fiberMagErr_g], sourcetablealias.[fiberMagErr_r], sourcetablealias.[fiberMagErr_i], sourcetablealias.[fiberMagErr_z], sourcetablealias.[petroMag_u], sourcetablealias.[petroMag_g], sourcetablealias.[petroMag_r], sourcetablealias.[petroMag_i], sourcetablealias.[petroMag_z], sourcetablealias.[petroMagErr_u], sourcetablealias.[petroMagErr_g], sourcetablealias.[petroMagErr_r], sourcetablealias.[petroMagErr_i], sourcetablealias.[petroMagErr_z], sourcetablealias.[petroRad_u], sourcetablealias.[petroRad_g], sourcetablealias.[petroRad_r], sourcetablealias.[petroRad_i], sourcetablealias.[petroRad_z], sourcetablealias.[petroRadErr_u], sourcetablealias.[petroRadErr_g], sourcetablealias.[petroRadErr_r], sourcetablealias.[petroRadErr_i], sourcetablealias.[petroRadErr_z], sourcetablealias.[petroR50_u], sourcetablealias.[petroR50_g], sourcetablealias.[petroR50_r], sourcetablealias.[petroR50_i], sourcetablealias.[petroR50_z], sourcetablealias.[petroR50Err_u], sourcetablealias.[petroR50Err_g], sourcetablealias.[petroR50Err_r], sourcetablealias.[petroR50Err_i], sourcetablealias.[petroR50Err_z], sourcetablealias.[petroR90_u], sourcetablealias.[petroR90_g], sourcetablealias.[petroR90_r], sourcetablealias.[petroR90_i], sourcetablealias.[petroR90_z], sourcetablealias.[petroR90Err_u], sourcetablealias.[petroR90Err_g], sourcetablealias.[petroR90Err_r], sourcetablealias.[petroR90Err_i], sourcetablealias.[petroR90Err_z], sourcetablealias.[q_u], sourcetablealias.[q_g], sourcetablealias.[q_r], sourcetablealias.[q_i], sourcetablealias.[q_z], sourcetablealias.[qErr_u], sourcetablealias.[qErr_g], sourcetablealias.[qErr_r], sourcetablealias.[qErr_i], sourcetablealias.[qErr_z], sourcetablealias.[u_u], sourcetablealias.[u_g], sourcetablealias.[u_r], sourcetablealias.[u_i], sourcetablealias.[u_z], sourcetablealias.[uErr_u], sourcetablealias.[uErr_g], sourcetablealias.[uErr_r], sourcetablealias.[uErr_i], sourcetablealias.[uErr_z], sourcetablealias.[mE1_u], sourcetablealias.[mE1_g], sourcetablealias.[mE1_r], sourcetablealias.[mE1_i], sourcetablealias.[mE1_z], sourcetablealias.[mE2_u], sourcetablealias.[mE2_g], sourcetablealias.[mE2_r], sourcetablealias.[mE2_i], sourcetablealias.[mE2_z], sourcetablealias.[mE1E1Err_u], sourcetablealias.[mE1E1Err_g], sourcetablealias.[mE1E1Err_r], sourcetablealias.[mE1E1Err_i], sourcetablealias.[mE1E1Err_z], sourcetablealias.[mE1E2Err_u], sourcetablealias.[mE1E2Err_g], sourcetablealias.[mE1E2Err_r], sourcetablealias.[mE1E2Err_i], sourcetablealias.[mE1E2Err_z], sourcetablealias.[mE2E2Err_u], sourcetablealias.[mE2E2Err_g], sourcetablealias.[mE2E2Err_r], sourcetablealias.[mE2E2Err_i], sourcetablealias.[mE2E2Err_z], sourcetablealias.[mRrCc_u], sourcetablealias.[mRrCc_g], sourcetablealias.[mRrCc_r], sourcetablealias.[mRrCc_i], sourcetablealias.[mRrCc_z], sourcetablealias.[mRrCcErr_u], sourcetablealias.[mRrCcErr_g], sourcetablealias.[mRrCcErr_r], sourcetablealias.[mRrCcErr_i], sourcetablealias.[mRrCcErr_z], sourcetablealias.[mCr4_u], sourcetablealias.[mCr4_g], sourcetablealias.[mCr4_r], sourcetablealias.[mCr4_i], sourcetablealias.[mCr4_z], sourcetablealias.[mE1PSF_u], sourcetablealias.[mE1PSF_g], sourcetablealias.[mE1PSF_r], sourcetablealias.[mE1PSF_i], sourcetablealias.[mE1PSF_z], sourcetablealias.[mE2PSF_u], sourcetablealias.[mE2PSF_g], sourcetablealias.[mE2PSF_r], sourcetablealias.[mE2PSF_i], sourcetablealias.[mE2PSF_z], sourcetablealias.[mRrCcPSF_u], sourcetablealias.[mRrCcPSF_g], sourcetablealias.[mRrCcPSF_r], sourcetablealias.[mRrCcPSF_i], sourcetablealias.[mRrCcPSF_z], sourcetablealias.[mCr4PSF_u], sourcetablealias.[mCr4PSF_g], sourcetablealias.[mCr4PSF_r], sourcetablealias.[mCr4PSF_i], sourcetablealias.[mCr4PSF_z], sourcetablealias.[isoRowc_u], sourcetablealias.[isoRowc_g], sourcetablealias.[isoRowc_r], sourcetablealias.[isoRowc_i], sourcetablealias.[isoRowc_z], sourcetablealias.[isoRowcErr_u], sourcetablealias.[isoRowcErr_g], sourcetablealias.[isoRowcErr_r], sourcetablealias.[isoRowcErr_i], sourcetablealias.[isoRowcErr_z], sourcetablealias.[isoRowcGrad_u], sourcetablealias.[isoRowcGrad_g], sourcetablealias.[isoRowcGrad_r], sourcetablealias.[isoRowcGrad_i], sourcetablealias.[isoRowcGrad_z], sourcetablealias.[isoColc_u], sourcetablealias.[isoColc_g], sourcetablealias.[isoColc_r], sourcetablealias.[isoColc_i], sourcetablealias.[isoColc_z], sourcetablealias.[isoColcErr_u], sourcetablealias.[isoColcErr_g], sourcetablealias.[isoColcErr_r], sourcetablealias.[isoColcErr_i], sourcetablealias.[isoColcErr_z], sourcetablealias.[isoColcGrad_u], sourcetablealias.[isoColcGrad_g], sourcetablealias.[isoColcGrad_r], sourcetablealias.[isoColcGrad_i], sourcetablealias.[isoColcGrad_z], sourcetablealias.[isoA_u], sourcetablealias.[isoA_g], sourcetablealias.[isoA_r], sourcetablealias.[isoA_i], sourcetablealias.[isoA_z], sourcetablealias.[isoAErr_u], sourcetablealias.[isoAErr_g], sourcetablealias.[isoAErr_r], sourcetablealias.[isoAErr_i], sourcetablealias.[isoAErr_z], sourcetablealias.[isoB_u], sourcetablealias.[isoB_g], sourcetablealias.[isoB_r], sourcetablealias.[isoB_i], sourcetablealias.[isoB_z], sourcetablealias.[isoBErr_u], sourcetablealias.[isoBErr_g], sourcetablealias.[isoBErr_r], sourcetablealias.[isoBErr_i], sourcetablealias.[isoBErr_z], sourcetablealias.[isoAGrad_u], sourcetablealias.[isoAGrad_g], sourcetablealias.[isoAGrad_r], sourcetablealias.[isoAGrad_i], sourcetablealias.[isoAGrad_z], sourcetablealias.[isoBGrad_u], sourcetablealias.[isoBGrad_g], sourcetablealias.[isoBGrad_r], sourcetablealias.[isoBGrad_i], sourcetablealias.[isoBGrad_z], sourcetablealias.[isoPhi_u], sourcetablealias.[isoPhi_g], sourcetablealias.[isoPhi_r], sourcetablealias.[isoPhi_i], sourcetablealias.[isoPhi_z], sourcetablealias.[isoPhiErr_u], sourcetablealias.[isoPhiErr_g], sourcetablealias.[isoPhiErr_r], sourcetablealias.[isoPhiErr_i], sourcetablealias.[isoPhiErr_z], sourcetablealias.[isoPhiGrad_u], sourcetablealias.[isoPhiGrad_g], sourcetablealias.[isoPhiGrad_r], sourcetablealias.[isoPhiGrad_i], sourcetablealias.[isoPhiGrad_z], sourcetablealias.[deVRad_u], sourcetablealias.[deVRad_g], sourcetablealias.[deVRad_r], sourcetablealias.[deVRad_i], sourcetablealias.[deVRad_z], sourcetablealias.[deVRadErr_u], sourcetablealias.[deVRadErr_g], sourcetablealias.[deVRadErr_r], sourcetablealias.[deVRadErr_i], sourcetablealias.[deVRadErr_z], sourcetablealias.[deVAB_u], sourcetablealias.[deVAB_g], sourcetablealias.[deVAB_r], sourcetablealias.[deVAB_i], sourcetablealias.[deVAB_z], sourcetablealias.[deVABErr_u], sourcetablealias.[deVABErr_g], sourcetablealias.[deVABErr_r], sourcetablealias.[deVABErr_i], sourcetablealias.[deVABErr_z], sourcetablealias.[deVPhi_u], sourcetablealias.[deVPhi_g], sourcetablealias.[deVPhi_r], sourcetablealias.[deVPhi_i], sourcetablealias.[deVPhi_z], sourcetablealias.[deVPhiErr_u], sourcetablealias.[deVPhiErr_g], sourcetablealias.[deVPhiErr_r], sourcetablealias.[deVPhiErr_i], sourcetablealias.[deVPhiErr_z], sourcetablealias.[deVMag_u], sourcetablealias.[deVMag_g], sourcetablealias.[deVMag_r], sourcetablealias.[deVMag_i], sourcetablealias.[deVMag_z], sourcetablealias.[deVMagErr_u], sourcetablealias.[deVMagErr_g], sourcetablealias.[deVMagErr_r], sourcetablealias.[deVMagErr_i], sourcetablealias.[deVMagErr_z], sourcetablealias.[expRad_u], sourcetablealias.[expRad_g], sourcetablealias.[expRad_r], sourcetablealias.[expRad_i], sourcetablealias.[expRad_z], sourcetablealias.[expRadErr_u], sourcetablealias.[expRadErr_g], sourcetablealias.[expRadErr_r], sourcetablealias.[expRadErr_i], sourcetablealias.[expRadErr_z], sourcetablealias.[expAB_u], sourcetablealias.[expAB_g], sourcetablealias.[expAB_r], sourcetablealias.[expAB_i], sourcetablealias.[expAB_z], sourcetablealias.[expABErr_u], sourcetablealias.[expABErr_g], sourcetablealias.[expABErr_r], sourcetablealias.[expABErr_i], sourcetablealias.[expABErr_z], sourcetablealias.[expPhi_u], sourcetablealias.[expPhi_g], sourcetablealias.[expPhi_r], sourcetablealias.[expPhi_i], sourcetablealias.[expPhi_z], sourcetablealias.[expPhiErr_u], sourcetablealias.[expPhiErr_g], sourcetablealias.[expPhiErr_r], sourcetablealias.[expPhiErr_i], sourcetablealias.[expPhiErr_z], sourcetablealias.[expMag_u], sourcetablealias.[expMag_g], sourcetablealias.[expMag_r], sourcetablealias.[expMag_i], sourcetablealias.[expMag_z], sourcetablealias.[expMagErr_u], sourcetablealias.[expMagErr_g], sourcetablealias.[expMagErr_r], sourcetablealias.[expMagErr_i], sourcetablealias.[expMagErr_z], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[modelMagErr_u], sourcetablealias.[modelMagErr_g], sourcetablealias.[modelMagErr_r], sourcetablealias.[modelMagErr_i], sourcetablealias.[modelMagErr_z], sourcetablealias.[texture_u], sourcetablealias.[texture_g], sourcetablealias.[texture_r], sourcetablealias.[texture_i], sourcetablealias.[texture_z], sourcetablealias.[lnLStar_u], sourcetablealias.[lnLStar_g], sourcetablealias.[lnLStar_r], sourcetablealias.[lnLStar_i], sourcetablealias.[lnLStar_z], sourcetablealias.[lnLExp_u], sourcetablealias.[lnLExp_g], sourcetablealias.[lnLExp_r], sourcetablealias.[lnLExp_i], sourcetablealias.[lnLExp_z], sourcetablealias.[lnLDeV_u], sourcetablealias.[lnLDeV_g], sourcetablealias.[lnLDeV_r], sourcetablealias.[lnLDeV_i], sourcetablealias.[lnLDeV_z], sourcetablealias.[fracDeV_u], sourcetablealias.[fracDeV_g], sourcetablealias.[fracDeV_r], sourcetablealias.[fracDeV_i], sourcetablealias.[fracDeV_z], sourcetablealias.[flags_u], sourcetablealias.[flags_g], sourcetablealias.[flags_r], sourcetablealias.[flags_i], sourcetablealias.[flags_z], sourcetablealias.[type_u], sourcetablealias.[type_g], sourcetablealias.[type_r], sourcetablealias.[type_i], sourcetablealias.[type_z], sourcetablealias.[probPSF_u], sourcetablealias.[probPSF_g], sourcetablealias.[probPSF_r], sourcetablealias.[probPSF_i], sourcetablealias.[probPSF_z], sourcetablealias.[status], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[raDecCorr], sourcetablealias.[b], sourcetablealias.[l], sourcetablealias.[offsetRa_u], sourcetablealias.[offsetRa_g], sourcetablealias.[offsetRa_r], sourcetablealias.[offsetRa_i], sourcetablealias.[offsetRa_z], sourcetablealias.[offsetDec_u], sourcetablealias.[offsetDec_g], sourcetablealias.[offsetDec_r], sourcetablealias.[offsetDec_i], sourcetablealias.[offsetDec_z], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[seguePrimTarget], sourcetablealias.[segueSecTarget], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[priority], sourcetablealias.[rho], sourcetablealias.[nProf_u], sourcetablealias.[nProf_g], sourcetablealias.[nProf_r], sourcetablealias.[nProf_i], sourcetablealias.[nProf_z], sourcetablealias.[loadVersion], sourcetablealias.[fieldID], sourcetablealias.[parentID], sourcetablealias.[specObjID], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z], sourcetablealias.[err_u], sourcetablealias.[err_g], sourcetablealias.[err_r], sourcetablealias.[err_i], sourcetablealias.[err_z], sourcetablealias.[dered_u], sourcetablealias.[dered_g], sourcetablealias.[dered_r], sourcetablealias.[dered_i], sourcetablealias.[dered_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[PhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'PhotoProfile' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint, [bin] tinyint, [band] tinyint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], sourcetablealias.[bin], sourcetablealias.[band], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[PhotoProfile] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID], [bin], [band]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[PhotoProfile] WITH (TABLOCKX)
	([bin], [band], [profMean], [profErr], [objID])
 SELECT sourcetablealias.[bin], sourcetablealias.[band], sourcetablealias.[profMean], sourcetablealias.[profErr], sourcetablealias.[objID]
 FROM   [SkyNode_SDSSDR7].[dbo].[PhotoProfile] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID AND ##temporaryidlist.bin = sourcetablealias.bin AND ##temporaryidlist.band = sourcetablealias.band
	;


GO

-- SUBSAMPLING TABLE 'PhotoTag' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[PhotoTag] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[PhotoTag] WITH (TABLOCKX)
	([objID], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [nChild], [type], [probPSF], [insideMask], [flags], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [petroMag_u], [petroMag_g], [petroMag_r], [petroMag_i], [petroMag_z], [petroMagErr_u], [petroMagErr_g], [petroMagErr_r], [petroMagErr_i], [petroMagErr_z], [petroR50_r], [petroR90_r], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [modelMagErr_u], [modelMagErr_g], [modelMagErr_r], [modelMagErr_i], [modelMagErr_z], [mRrCc_r], [mRrCcErr_r], [lnLStar_r], [lnLExp_r], [lnLDeV_r], [status], [ra], [dec], [cx], [cy], [cz], [primTarget], [secTarget], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [htmID], [zoneid], [fieldID], [specObjID], [size])
 SELECT sourcetablealias.[objID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[nChild], sourcetablealias.[type], sourcetablealias.[probPSF], sourcetablealias.[insideMask], sourcetablealias.[flags], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[petroMag_u], sourcetablealias.[petroMag_g], sourcetablealias.[petroMag_r], sourcetablealias.[petroMag_i], sourcetablealias.[petroMag_z], sourcetablealias.[petroMagErr_u], sourcetablealias.[petroMagErr_g], sourcetablealias.[petroMagErr_r], sourcetablealias.[petroMagErr_i], sourcetablealias.[petroMagErr_z], sourcetablealias.[petroR50_r], sourcetablealias.[petroR90_r], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[modelMagErr_u], sourcetablealias.[modelMagErr_g], sourcetablealias.[modelMagErr_r], sourcetablealias.[modelMagErr_i], sourcetablealias.[modelMagErr_z], sourcetablealias.[mRrCc_r], sourcetablealias.[mRrCcErr_r], sourcetablealias.[lnLStar_r], sourcetablealias.[lnLExp_r], sourcetablealias.[lnLDeV_r], sourcetablealias.[status], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[htmID], sourcetablealias.[zoneid], sourcetablealias.[fieldID], sourcetablealias.[specObjID], sourcetablealias.[size]
 FROM   [SkyNode_SDSSDR7].[dbo].[PhotoTag] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'Photoz' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Photoz] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Photoz] WITH (TABLOCKX)
	([objID], [z], [zErr], [nnCount], [nnVol], [nnIsInside], [nnObjID], [nnSpecz], [nnFarObjID], [nnAvgZ], [dmod], [chiSq], [pzType], [rest_ug], [rest_gr], [rest_ri], [rest_iz], [kcorr_u], [kcorr_g], [kcorr_r], [kcorr_i], [kcorr_z], [absMag_u], [absMag_g], [absMag_r], [absMag_i], [absMag_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[nnCount], sourcetablealias.[nnVol], sourcetablealias.[nnIsInside], sourcetablealias.[nnObjID], sourcetablealias.[nnSpecz], sourcetablealias.[nnFarObjID], sourcetablealias.[nnAvgZ], sourcetablealias.[dmod], sourcetablealias.[chiSq], sourcetablealias.[pzType], sourcetablealias.[rest_ug], sourcetablealias.[rest_gr], sourcetablealias.[rest_ri], sourcetablealias.[rest_iz], sourcetablealias.[kcorr_u], sourcetablealias.[kcorr_g], sourcetablealias.[kcorr_r], sourcetablealias.[kcorr_i], sourcetablealias.[kcorr_z], sourcetablealias.[absMag_u], sourcetablealias.[absMag_g], sourcetablealias.[absMag_r], sourcetablealias.[absMag_i], sourcetablealias.[absMag_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[Photoz] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'Photoz2' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Photoz2] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Photoz2] WITH (TABLOCKX)
	([objID], [photozcc2], [photozerrcc2], [photozd1], [photozerrd1], [flag])
 SELECT sourcetablealias.[objID], sourcetablealias.[photozcc2], sourcetablealias.[photozerrcc2], sourcetablealias.[photozd1], sourcetablealias.[photozerrd1], sourcetablealias.[flag]
 FROM   [SkyNode_SDSSDR7].[dbo].[Photoz2] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'PlateX' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[PlateX] WITH (TABLOCKX)
    ([plateID], [spRerun], [mjd], [plate], [tile], [mapMjd], [nExp], [tai], [raBoresight], [decBoresight], [taiHMS], [expTime], [expTimeB1], [expTimeB2], [expTimeR1], [expTimeR2], [helioRV], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [sn1_0], [sn1_1], [sn1_2], [sn2_0], [sn2_1], [sn2_2], [dateObs], [timeSys], [quality], [name], [program], [version], [observer], [camVer], [spec2DVer], [utilsVer], [spec1DVer], [readVer], [combVer], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [rOffset1], [rSigma1], [grOff1], [grSigma1], [rOffset2], [rSigma2], [grOff2], [grSigma2], [sfd_used], [xygrSig1], [xygrSig2], [mpgrSig1], [mpgrSig2], [mpgrOff1], [mpgrOff2], [isPrimary], [cartridgeID], [plateVersion], [haMin], [haMax], [mjdDesign], [theta], [fscanVersion], [fmapVersion], [fscanMode], [fscanSpeed], [programType], [programName], [loadVersion], [expID])
 SELECT sourcetablealias.[plateID], sourcetablealias.[spRerun], sourcetablealias.[mjd], sourcetablealias.[plate], sourcetablealias.[tile], sourcetablealias.[mapMjd], sourcetablealias.[nExp], sourcetablealias.[tai], sourcetablealias.[raBoresight], sourcetablealias.[decBoresight], sourcetablealias.[taiHMS], sourcetablealias.[expTime], sourcetablealias.[expTimeB1], sourcetablealias.[expTimeB2], sourcetablealias.[expTimeR1], sourcetablealias.[expTimeR2], sourcetablealias.[helioRV], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[sn1_0], sourcetablealias.[sn1_1], sourcetablealias.[sn1_2], sourcetablealias.[sn2_0], sourcetablealias.[sn2_1], sourcetablealias.[sn2_2], sourcetablealias.[dateObs], sourcetablealias.[timeSys], sourcetablealias.[quality], sourcetablealias.[name], sourcetablealias.[program], sourcetablealias.[version], sourcetablealias.[observer], sourcetablealias.[camVer], sourcetablealias.[spec2DVer], sourcetablealias.[utilsVer], sourcetablealias.[spec1DVer], sourcetablealias.[readVer], sourcetablealias.[combVer], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[rOffset1], sourcetablealias.[rSigma1], sourcetablealias.[grOff1], sourcetablealias.[grSigma1], sourcetablealias.[rOffset2], sourcetablealias.[rSigma2], sourcetablealias.[grOff2], sourcetablealias.[grSigma2], sourcetablealias.[sfd_used], sourcetablealias.[xygrSig1], sourcetablealias.[xygrSig2], sourcetablealias.[mpgrSig1], sourcetablealias.[mpgrSig2], sourcetablealias.[mpgrOff1], sourcetablealias.[mpgrOff2], sourcetablealias.[isPrimary], sourcetablealias.[cartridgeID], sourcetablealias.[plateVersion], sourcetablealias.[haMin], sourcetablealias.[haMax], sourcetablealias.[mjdDesign], sourcetablealias.[theta], sourcetablealias.[fscanVersion], sourcetablealias.[fmapVersion], sourcetablealias.[fscanMode], sourcetablealias.[fscanSpeed], sourcetablealias.[programType], sourcetablealias.[programName], sourcetablealias.[loadVersion], sourcetablealias.[expID]
 FROM   [SkyNode_SDSSDR7].[dbo].[PlateX] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'ProfileDefs' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[ProfileDefs] WITH (TABLOCKX)
    ([bin], [cell], [sinc], [rInner], [rOuter], [aAnn], [aDisk])
 SELECT sourcetablealias.[bin], sourcetablealias.[cell], sourcetablealias.[sinc], sourcetablealias.[rInner], sourcetablealias.[rOuter], sourcetablealias.[aAnn], sourcetablealias.[aDisk]
 FROM   [SkyNode_SDSSDR7].[dbo].[ProfileDefs] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'ProperMotions' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objid] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objid], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[ProperMotions] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objid]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[ProperMotions] WITH (TABLOCKX)
	([raErr], [decErr], [raDecCorr], [delta], [match], [pmL], [pmB], [pmRa], [pmDec], [pmRaErr], [pmDecErr], [sigRa], [sigDec], [nFit], [O], [E], [J], [F], [N], [dist20], [dist22], [objid])
 SELECT sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[raDecCorr], sourcetablealias.[delta], sourcetablealias.[match], sourcetablealias.[pmL], sourcetablealias.[pmB], sourcetablealias.[pmRa], sourcetablealias.[pmDec], sourcetablealias.[pmRaErr], sourcetablealias.[pmDecErr], sourcetablealias.[sigRa], sourcetablealias.[sigDec], sourcetablealias.[nFit], sourcetablealias.[O], sourcetablealias.[E], sourcetablealias.[J], sourcetablealias.[F], sourcetablealias.[N], sourcetablealias.[dist20], sourcetablealias.[dist22], sourcetablealias.[objid]
 FROM   [SkyNode_SDSSDR7].[dbo].[ProperMotions] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objid = sourcetablealias.objid
	;


GO

-- SUBSAMPLING TABLE 'PsObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[PsObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[PsObjAll] WITH (TABLOCKX)
	([objID], [run], [rerun], [camcol], [field], [obj], [catId], [rowc], [rowcErr], [colc], [colcErr], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [offsetRa_u], [offsetRa_g], [offsetRa_r], [offsetRa_i], [offsetRa_z], [offsetDec_u], [offsetDec_g], [offsetDec_r], [offsetDec_i], [offsetDec_z], [calibStatus_u], [calibStatus_g], [calibStatus_r], [calibStatus_i], [calibStatus_z], [psPsfCounts_u], [psPsfCounts_g], [psPsfCounts_r], [psPsfCounts_i], [psPsfCounts_z], [psPsfCountsErr_u], [psPsfCountsErr_g], [psPsfCountsErr_r], [psPsfCountsErr_i], [psPsfCountsErr_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[catId], sourcetablealias.[rowc], sourcetablealias.[rowcErr], sourcetablealias.[colc], sourcetablealias.[colcErr], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[offsetRa_u], sourcetablealias.[offsetRa_g], sourcetablealias.[offsetRa_r], sourcetablealias.[offsetRa_i], sourcetablealias.[offsetRa_z], sourcetablealias.[offsetDec_u], sourcetablealias.[offsetDec_g], sourcetablealias.[offsetDec_r], sourcetablealias.[offsetDec_i], sourcetablealias.[offsetDec_z], sourcetablealias.[calibStatus_u], sourcetablealias.[calibStatus_g], sourcetablealias.[calibStatus_r], sourcetablealias.[calibStatus_i], sourcetablealias.[calibStatus_z], sourcetablealias.[psPsfCounts_u], sourcetablealias.[psPsfCounts_g], sourcetablealias.[psPsfCounts_r], sourcetablealias.[psPsfCounts_i], sourcetablealias.[psPsfCounts_z], sourcetablealias.[psPsfCountsErr_u], sourcetablealias.[psPsfCountsErr_g], sourcetablealias.[psPsfCountsErr_r], sourcetablealias.[psPsfCountsErr_i], sourcetablealias.[psPsfCountsErr_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[PsObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'QsoBest' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[bestObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[bestObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoBest] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [bestObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoBest] WITH (TABLOCKX)
	([bestObjID], [headObjID], [bestRa], [bestDec], [bestCx], [bestCy], [bestCz], [bestPsfMag_u], [bestPsfMag_g], [bestPsfMag_r], [bestPsfMag_i], [bestPsfMag_z], [bestPsfMagErr_u], [bestPsfMagErr_g], [bestPsfMagErr_r], [bestPsfMagErr_i], [bestPsfMagErr_z], [bestExtinction_u], [bestExtinction_g], [bestExtinction_r], [bestExtinction_i], [bestExtinction_z], [bestType], [bestMode], [bestFlags], [bestFlags_u], [bestFlags_g], [bestFlags_r], [bestFlags_i], [bestFlags_z], [bestRowC_i], [bestColC_i], [bestInsideMask], [bestPrimTarget], [bestPriTargHiZ], [bestPriTargLowZ], [bestPriTargFirst], [bestFieldID], [bestFieldMjd], [bestFieldQuality], [bestFieldCulled], [bestFirstID], [bestFirstPeak], [bestRosatID], [bestRosatCps], [bestMi], [BestQsoTargeted])
 SELECT sourcetablealias.[bestObjID], sourcetablealias.[headObjID], sourcetablealias.[bestRa], sourcetablealias.[bestDec], sourcetablealias.[bestCx], sourcetablealias.[bestCy], sourcetablealias.[bestCz], sourcetablealias.[bestPsfMag_u], sourcetablealias.[bestPsfMag_g], sourcetablealias.[bestPsfMag_r], sourcetablealias.[bestPsfMag_i], sourcetablealias.[bestPsfMag_z], sourcetablealias.[bestPsfMagErr_u], sourcetablealias.[bestPsfMagErr_g], sourcetablealias.[bestPsfMagErr_r], sourcetablealias.[bestPsfMagErr_i], sourcetablealias.[bestPsfMagErr_z], sourcetablealias.[bestExtinction_u], sourcetablealias.[bestExtinction_g], sourcetablealias.[bestExtinction_r], sourcetablealias.[bestExtinction_i], sourcetablealias.[bestExtinction_z], sourcetablealias.[bestType], sourcetablealias.[bestMode], sourcetablealias.[bestFlags], sourcetablealias.[bestFlags_u], sourcetablealias.[bestFlags_g], sourcetablealias.[bestFlags_r], sourcetablealias.[bestFlags_i], sourcetablealias.[bestFlags_z], sourcetablealias.[bestRowC_i], sourcetablealias.[bestColC_i], sourcetablealias.[bestInsideMask], sourcetablealias.[bestPrimTarget], sourcetablealias.[bestPriTargHiZ], sourcetablealias.[bestPriTargLowZ], sourcetablealias.[bestPriTargFirst], sourcetablealias.[bestFieldID], sourcetablealias.[bestFieldMjd], sourcetablealias.[bestFieldQuality], sourcetablealias.[bestFieldCulled], sourcetablealias.[bestFirstID], sourcetablealias.[bestFirstPeak], sourcetablealias.[bestRosatID], sourcetablealias.[bestRosatCps], sourcetablealias.[bestMi], sourcetablealias.[BestQsoTargeted]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoBest] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.bestObjID = sourcetablealias.bestObjID
	;


GO

-- SUBSAMPLING TABLE 'QsoBunch' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[HeadObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[HeadObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoBunch] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [HeadObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoBunch] WITH (TABLOCKX)
	([HeadObjID], [HeadObjType], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneID], [targetObjs], [specObjs], [bestObjs], [targetPrimaries], [specPrimaries], [bestPrimaries])
 SELECT sourcetablealias.[HeadObjID], sourcetablealias.[HeadObjType], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneID], sourcetablealias.[targetObjs], sourcetablealias.[specObjs], sourcetablealias.[bestObjs], sourcetablealias.[targetPrimaries], sourcetablealias.[specPrimaries], sourcetablealias.[bestPrimaries]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoBunch] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.HeadObjID = sourcetablealias.HeadObjID
	;


GO

-- SUBSAMPLING TABLE 'QsoCatalogAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[HeadObjID] bigint, [TargetObjID] bigint, [SpecObjID] bigint, [BestObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[HeadObjID], sourcetablealias.[TargetObjID], sourcetablealias.[SpecObjID], sourcetablealias.[BestObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoCatalogAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [HeadObjID], [TargetObjID], [SpecObjID], [BestObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoCatalogAll] ON;
 GO
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoCatalogAll] WITH (TABLOCKX)
	([HeadObjID], [tripleID], [QsoPrimary], [HeadObjType], [TargetObjID], [SpecObjID], [BestObjID], [TargetQsoTargeted], [SpecQsoConfirmed], [SpecQsoUnknown], [SpecQsoLargeZ], [SpecQsoTargeted], [BestQsoTargeted], [dist_Target_Best], [dist_Target_Spec], [dist_Best_Spec], [psfmag_i_diff], [psfmag_g_i_diff])
 SELECT sourcetablealias.[HeadObjID], sourcetablealias.[tripleID], sourcetablealias.[QsoPrimary], sourcetablealias.[HeadObjType], sourcetablealias.[TargetObjID], sourcetablealias.[SpecObjID], sourcetablealias.[BestObjID], sourcetablealias.[TargetQsoTargeted], sourcetablealias.[SpecQsoConfirmed], sourcetablealias.[SpecQsoUnknown], sourcetablealias.[SpecQsoLargeZ], sourcetablealias.[SpecQsoTargeted], sourcetablealias.[BestQsoTargeted], sourcetablealias.[dist_Target_Best], sourcetablealias.[dist_Target_Spec], sourcetablealias.[dist_Best_Spec], sourcetablealias.[psfmag_i_diff], sourcetablealias.[psfmag_g_i_diff]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoCatalogAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.HeadObjID = sourcetablealias.HeadObjID AND ##temporaryidlist.TargetObjID = sourcetablealias.TargetObjID AND ##temporaryidlist.SpecObjID = sourcetablealias.SpecObjID AND ##temporaryidlist.BestObjID = sourcetablealias.BestObjID
	;


GO

-- SUBSAMPLING TABLE 'QsoConcordanceAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[HeadObjID] bigint, [tripleID] int, [TargetObjID] bigint, [SpecObjID] bigint, [BestObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[HeadObjID], sourcetablealias.[tripleID], sourcetablealias.[TargetObjID], sourcetablealias.[SpecObjID], sourcetablealias.[BestObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoConcordanceAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [HeadObjID], [tripleID], [TargetObjID], [SpecObjID], [BestObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoConcordanceAll] WITH (TABLOCKX)
	([HeadObjID], [tripleID], [QsoPrimary], [TargetObjID], [SpecObjID], [BestObjID], [TargetQsoTargeted], [SpecQsoConfirmed], [SpecQsoUnknown], [SpecQsoLargeZ], [SpecQsoTargeted], [BestQsoTargeted], [dist_Target_Best], [dist_Target_Spec], [dist_Best_Spec], [psfmag_i_diff], [psfmag_g_i_diff], [SpecRa], [SpecDec], [SpecCx], [SpecCy], [SpecCz], [SpecZ], [SpecZerr], [SpecZConf], [SpecZStatus], [SpecZWarning], [SpecClass], [SpecPlate], [SpecFiberID], [SpecMjd], [SpecSciencePrimary], [SpecPrimTarget], [SpecTargetID], [SpecTargetObjID], [SpecBestObjID], [SpecLineID], [SpecMaxVelocity], [SpecPlateSn1_i], [SpecPlateSn2_i], [targetRa], [targetDec], [targetCx], [targetCy], [targetCz], [targetPsfMag_u], [targetPsfMag_g], [targetPsfMag_r], [targetPsfMag_i], [targetPsfMag_z], [targetPsfMagErr_u], [targetPsfMagErr_g], [targetPsfMagErr_r], [targetPsfMagErr_i], [targetPsfMagErr_z], [targetExtinction_u], [targetExtinction_g], [targetExtinction_r], [targetExtinction_i], [targetExtinction_z], [targetType], [targetMode], [targetStatus], [targetFlags], [targetFlags_u], [targetFlags_g], [targetFlags_r], [targetFlags_i], [targetFlags_z], [targetRowC_i], [targetColC_i], [targetInsideMask], [targetPrimTarget], [targetPriTargHiZ], [targetPriTargLowZ], [targetPriTargFirst], [targetFieldID], [targetFieldMjd], [targetFieldQuality], [targetFieldCulled], [targetSectorID], [targetFirstID], [targetFirstPeak], [targetRosatID], [targetRosatCps], [targetMi], [targetUniform], [bestRa], [bestDec], [bestCx], [bestCy], [bestCz], [bestPsfMag_u], [bestPsfMag_g], [bestPsfMag_r], [bestPsfMag_i], [bestPsfMag_z], [bestPsfMagErr_u], [bestPsfMagErr_g], [bestPsfMagErr_r], [bestPsfMagErr_i], [bestPsfMagErr_z], [bestExtinction_u], [bestExtinction_g], [bestExtinction_r], [bestExtinction_i], [bestExtinction_z], [bestType], [bestMode], [bestFlags], [bestFlags_u], [bestFlags_g], [bestFlags_r], [bestFlags_i], [bestFlags_z], [bestRowC_i], [bestColC_i], [bestInsideMask], [bestPrimTarget], [bestPriTargHiZ], [bestPriTargLowZ], [bestPriTargFirst], [bestFieldID], [bestFieldMjd], [bestFieldQuality], [bestFieldCulled], [bestFirstID], [bestFirstPeak], [bestRosatID], [bestRosatCps], [bestMi])
 SELECT sourcetablealias.[HeadObjID], sourcetablealias.[tripleID], sourcetablealias.[QsoPrimary], sourcetablealias.[TargetObjID], sourcetablealias.[SpecObjID], sourcetablealias.[BestObjID], sourcetablealias.[TargetQsoTargeted], sourcetablealias.[SpecQsoConfirmed], sourcetablealias.[SpecQsoUnknown], sourcetablealias.[SpecQsoLargeZ], sourcetablealias.[SpecQsoTargeted], sourcetablealias.[BestQsoTargeted], sourcetablealias.[dist_Target_Best], sourcetablealias.[dist_Target_Spec], sourcetablealias.[dist_Best_Spec], sourcetablealias.[psfmag_i_diff], sourcetablealias.[psfmag_g_i_diff], sourcetablealias.[SpecRa], sourcetablealias.[SpecDec], sourcetablealias.[SpecCx], sourcetablealias.[SpecCy], sourcetablealias.[SpecCz], sourcetablealias.[SpecZ], sourcetablealias.[SpecZerr], sourcetablealias.[SpecZConf], sourcetablealias.[SpecZStatus], sourcetablealias.[SpecZWarning], sourcetablealias.[SpecClass], sourcetablealias.[SpecPlate], sourcetablealias.[SpecFiberID], sourcetablealias.[SpecMjd], sourcetablealias.[SpecSciencePrimary], sourcetablealias.[SpecPrimTarget], sourcetablealias.[SpecTargetID], sourcetablealias.[SpecTargetObjID], sourcetablealias.[SpecBestObjID], sourcetablealias.[SpecLineID], sourcetablealias.[SpecMaxVelocity], sourcetablealias.[SpecPlateSn1_i], sourcetablealias.[SpecPlateSn2_i], sourcetablealias.[targetRa], sourcetablealias.[targetDec], sourcetablealias.[targetCx], sourcetablealias.[targetCy], sourcetablealias.[targetCz], sourcetablealias.[targetPsfMag_u], sourcetablealias.[targetPsfMag_g], sourcetablealias.[targetPsfMag_r], sourcetablealias.[targetPsfMag_i], sourcetablealias.[targetPsfMag_z], sourcetablealias.[targetPsfMagErr_u], sourcetablealias.[targetPsfMagErr_g], sourcetablealias.[targetPsfMagErr_r], sourcetablealias.[targetPsfMagErr_i], sourcetablealias.[targetPsfMagErr_z], sourcetablealias.[targetExtinction_u], sourcetablealias.[targetExtinction_g], sourcetablealias.[targetExtinction_r], sourcetablealias.[targetExtinction_i], sourcetablealias.[targetExtinction_z], sourcetablealias.[targetType], sourcetablealias.[targetMode], sourcetablealias.[targetStatus], sourcetablealias.[targetFlags], sourcetablealias.[targetFlags_u], sourcetablealias.[targetFlags_g], sourcetablealias.[targetFlags_r], sourcetablealias.[targetFlags_i], sourcetablealias.[targetFlags_z], sourcetablealias.[targetRowC_i], sourcetablealias.[targetColC_i], sourcetablealias.[targetInsideMask], sourcetablealias.[targetPrimTarget], sourcetablealias.[targetPriTargHiZ], sourcetablealias.[targetPriTargLowZ], sourcetablealias.[targetPriTargFirst], sourcetablealias.[targetFieldID], sourcetablealias.[targetFieldMjd], sourcetablealias.[targetFieldQuality], sourcetablealias.[targetFieldCulled], sourcetablealias.[targetSectorID], sourcetablealias.[targetFirstID], sourcetablealias.[targetFirstPeak], sourcetablealias.[targetRosatID], sourcetablealias.[targetRosatCps], sourcetablealias.[targetMi], sourcetablealias.[targetUniform], sourcetablealias.[bestRa], sourcetablealias.[bestDec], sourcetablealias.[bestCx], sourcetablealias.[bestCy], sourcetablealias.[bestCz], sourcetablealias.[bestPsfMag_u], sourcetablealias.[bestPsfMag_g], sourcetablealias.[bestPsfMag_r], sourcetablealias.[bestPsfMag_i], sourcetablealias.[bestPsfMag_z], sourcetablealias.[bestPsfMagErr_u], sourcetablealias.[bestPsfMagErr_g], sourcetablealias.[bestPsfMagErr_r], sourcetablealias.[bestPsfMagErr_i], sourcetablealias.[bestPsfMagErr_z], sourcetablealias.[bestExtinction_u], sourcetablealias.[bestExtinction_g], sourcetablealias.[bestExtinction_r], sourcetablealias.[bestExtinction_i], sourcetablealias.[bestExtinction_z], sourcetablealias.[bestType], sourcetablealias.[bestMode], sourcetablealias.[bestFlags], sourcetablealias.[bestFlags_u], sourcetablealias.[bestFlags_g], sourcetablealias.[bestFlags_r], sourcetablealias.[bestFlags_i], sourcetablealias.[bestFlags_z], sourcetablealias.[bestRowC_i], sourcetablealias.[bestColC_i], sourcetablealias.[bestInsideMask], sourcetablealias.[bestPrimTarget], sourcetablealias.[bestPriTargHiZ], sourcetablealias.[bestPriTargLowZ], sourcetablealias.[bestPriTargFirst], sourcetablealias.[bestFieldID], sourcetablealias.[bestFieldMjd], sourcetablealias.[bestFieldQuality], sourcetablealias.[bestFieldCulled], sourcetablealias.[bestFirstID], sourcetablealias.[bestFirstPeak], sourcetablealias.[bestRosatID], sourcetablealias.[bestRosatCps], sourcetablealias.[bestMi]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoConcordanceAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.HeadObjID = sourcetablealias.HeadObjID AND ##temporaryidlist.tripleID = sourcetablealias.tripleID AND ##temporaryidlist.TargetObjID = sourcetablealias.TargetObjID AND ##temporaryidlist.SpecObjID = sourcetablealias.SpecObjID AND ##temporaryidlist.BestObjID = sourcetablealias.BestObjID
	;


GO

-- SUBSAMPLING TABLE 'QsoSpec' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[SpecObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[SpecObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoSpec] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [SpecObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoSpec] WITH (TABLOCKX)
	([SpecObjID], [HeadObjID], [SpecRa], [SpecDec], [SpecCx], [SpecCy], [SpecCz], [SpecZ], [SpecZerr], [SpecZConf], [SpecZStatus], [SpecZWarning], [SpecClass], [SpecPlate], [SpecFiberID], [SpecMjd], [SpecSciencePrimary], [SpecPrimTarget], [SpecLineID], [SpecMaxVelocity], [SpecQsoConfirmed], [SpecBestObjID], [SpecTargetObjID], [SpecTargetID], [SpecPlateSn1_i], [SpecPlateSn2_i])
 SELECT sourcetablealias.[SpecObjID], sourcetablealias.[HeadObjID], sourcetablealias.[SpecRa], sourcetablealias.[SpecDec], sourcetablealias.[SpecCx], sourcetablealias.[SpecCy], sourcetablealias.[SpecCz], sourcetablealias.[SpecZ], sourcetablealias.[SpecZerr], sourcetablealias.[SpecZConf], sourcetablealias.[SpecZStatus], sourcetablealias.[SpecZWarning], sourcetablealias.[SpecClass], sourcetablealias.[SpecPlate], sourcetablealias.[SpecFiberID], sourcetablealias.[SpecMjd], sourcetablealias.[SpecSciencePrimary], sourcetablealias.[SpecPrimTarget], sourcetablealias.[SpecLineID], sourcetablealias.[SpecMaxVelocity], sourcetablealias.[SpecQsoConfirmed], sourcetablealias.[SpecBestObjID], sourcetablealias.[SpecTargetObjID], sourcetablealias.[SpecTargetID], sourcetablealias.[SpecPlateSn1_i], sourcetablealias.[SpecPlateSn2_i]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoSpec] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.SpecObjID = sourcetablealias.SpecObjID
	;


GO

-- SUBSAMPLING TABLE 'QsoTarget' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[targetObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[targetObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[QsoTarget] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [targetObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[QsoTarget] WITH (TABLOCKX)
	([targetObjID], [headObjID], [targetRa], [targetDec], [targetCx], [targetCy], [targetCz], [targetPsfMag_u], [targetPsfMag_g], [targetPsfMag_r], [targetPsfMag_i], [targetPsfMag_z], [targetPsfMagErr_u], [targetPsfMagErr_g], [targetPsfMagErr_r], [targetPsfMagErr_i], [targetPsfMagErr_z], [targetExtinction_u], [targetExtinction_g], [targetExtinction_r], [targetExtinction_i], [targetExtinction_z], [targetType], [targetMode], [targetStatus], [targetFlags], [targetFlags_u], [targetFlags_g], [targetFlags_r], [targetFlags_i], [targetFlags_z], [targetRowC_i], [targetColC_i], [targetInsideMask], [targetPrimTarget], [targetPriTargHiZ], [targetPriTargLowZ], [targetPriTargFirst], [targetFieldID], [targetFieldMjd], [targetFieldQuality], [targetFieldCulled], [targetSectorID], [targetFirstID], [targetFirstPeak], [targetRosatID], [targetRosatCps], [targetMi], [TargetQsoTargeted], [targetUniform])
 SELECT sourcetablealias.[targetObjID], sourcetablealias.[headObjID], sourcetablealias.[targetRa], sourcetablealias.[targetDec], sourcetablealias.[targetCx], sourcetablealias.[targetCy], sourcetablealias.[targetCz], sourcetablealias.[targetPsfMag_u], sourcetablealias.[targetPsfMag_g], sourcetablealias.[targetPsfMag_r], sourcetablealias.[targetPsfMag_i], sourcetablealias.[targetPsfMag_z], sourcetablealias.[targetPsfMagErr_u], sourcetablealias.[targetPsfMagErr_g], sourcetablealias.[targetPsfMagErr_r], sourcetablealias.[targetPsfMagErr_i], sourcetablealias.[targetPsfMagErr_z], sourcetablealias.[targetExtinction_u], sourcetablealias.[targetExtinction_g], sourcetablealias.[targetExtinction_r], sourcetablealias.[targetExtinction_i], sourcetablealias.[targetExtinction_z], sourcetablealias.[targetType], sourcetablealias.[targetMode], sourcetablealias.[targetStatus], sourcetablealias.[targetFlags], sourcetablealias.[targetFlags_u], sourcetablealias.[targetFlags_g], sourcetablealias.[targetFlags_r], sourcetablealias.[targetFlags_i], sourcetablealias.[targetFlags_z], sourcetablealias.[targetRowC_i], sourcetablealias.[targetColC_i], sourcetablealias.[targetInsideMask], sourcetablealias.[targetPrimTarget], sourcetablealias.[targetPriTargHiZ], sourcetablealias.[targetPriTargLowZ], sourcetablealias.[targetPriTargFirst], sourcetablealias.[targetFieldID], sourcetablealias.[targetFieldMjd], sourcetablealias.[targetFieldQuality], sourcetablealias.[targetFieldCulled], sourcetablealias.[targetSectorID], sourcetablealias.[targetFirstID], sourcetablealias.[targetFirstPeak], sourcetablealias.[targetRosatID], sourcetablealias.[targetRosatCps], sourcetablealias.[targetMi], sourcetablealias.[TargetQsoTargeted], sourcetablealias.[targetUniform]
 FROM   [SkyNode_SDSSDR7].[dbo].[QsoTarget] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.targetObjID = sourcetablealias.targetObjID
	;


GO

-- SUBSAMPLING TABLE 'Region' ---

 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Region] ON;
  -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Region] WITH (TABLOCKX)
    ([regionid], [id], [type], [comment], [ismask], [area], [regionString], [regionBinary])
 SELECT sourcetablealias.[regionid], sourcetablealias.[id], sourcetablealias.[type], sourcetablealias.[comment], sourcetablealias.[ismask], sourcetablealias.[area], sourcetablealias.[regionString], sourcetablealias.[regionBinary]
 FROM   [SkyNode_SDSSDR7].[dbo].[Region] sourcetablealias WITH (NOLOCK)
	;
  --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Region] OFF;
 

GO

-- SUBSAMPLING TABLE 'Region2Box' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Region2Box] WITH (TABLOCKX)
    ([regionType], [id], [boxType], [boxid])
 SELECT sourcetablealias.[regionType], sourcetablealias.[id], sourcetablealias.[boxType], sourcetablealias.[boxid]
 FROM   [SkyNode_SDSSDR7].[dbo].[Region2Box] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'RegionArcs' ---

 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RegionArcs] ON;
  -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RegionArcs] WITH (TABLOCKX)
    ([arcid], [regionid], [convexid], [constraintid], [patch], [state], [draw], [ra1], [dec1], [ra2], [dec2], [x], [y], [z], [c], [length])
 SELECT sourcetablealias.[arcid], sourcetablealias.[regionid], sourcetablealias.[convexid], sourcetablealias.[constraintid], sourcetablealias.[patch], sourcetablealias.[state], sourcetablealias.[draw], sourcetablealias.[ra1], sourcetablealias.[dec1], sourcetablealias.[ra2], sourcetablealias.[dec2], sourcetablealias.[x], sourcetablealias.[y], sourcetablealias.[z], sourcetablealias.[c], sourcetablealias.[length]
 FROM   [SkyNode_SDSSDR7].[dbo].[RegionArcs] sourcetablealias WITH (NOLOCK)
	;
  --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RegionArcs] OFF;
 

GO

-- SUBSAMPLING TABLE 'RegionPatch' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RegionPatch] WITH (TABLOCKX)
    ([regionid], [convexid], [patchid], [type], [radius], [ra], [dec], [x], [y], [z], [c], [htmid], [area], [convexString])
 SELECT sourcetablealias.[regionid], sourcetablealias.[convexid], sourcetablealias.[patchid], sourcetablealias.[type], sourcetablealias.[radius], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[x], sourcetablealias.[y], sourcetablealias.[z], sourcetablealias.[c], sourcetablealias.[htmid], sourcetablealias.[area], sourcetablealias.[convexString]
 FROM   [SkyNode_SDSSDR7].[dbo].[RegionPatch] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Rmatrix' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Rmatrix] WITH (TABLOCKX)
    ([mode], [row], [x], [y], [z])
 SELECT sourcetablealias.[mode], sourcetablealias.[row], sourcetablealias.[x], sourcetablealias.[y], sourcetablealias.[z]
 FROM   [SkyNode_SDSSDR7].[dbo].[Rmatrix] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'RunQA' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[fieldID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[fieldID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[RunQA] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [fieldID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RunQA] WITH (TABLOCKX)
	([fieldID], [skyVersion], [first], [run], [rerun], [camcol], [field], [fieldQall], [opdbq], [appsfq], [pcmedq], [pcrmsq], [PSFwcondq], [pc_s], [pc_w], [pc_x], [pc_y], [rmsPC_s], [rmsPC_w], [rmsPC_x], [rmsPC_y], [medAp7mPSF_u], [medAp7mPSF_g], [medAp7mPSF_r], [medAp7mPSF_i], [medAp7mPSF_z], [rmsAp7mPSF_u], [rmsAp7mPSF_g], [rmsAp7mPSF_r], [rmsAp7mPSF_i], [rmsAp7mPSF_z], [seeing_u], [seeing_g], [seeing_r], [seeing_i], [seeing_z])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[skyVersion], sourcetablealias.[first], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[fieldQall], sourcetablealias.[opdbq], sourcetablealias.[appsfq], sourcetablealias.[pcmedq], sourcetablealias.[pcrmsq], sourcetablealias.[PSFwcondq], sourcetablealias.[pc_s], sourcetablealias.[pc_w], sourcetablealias.[pc_x], sourcetablealias.[pc_y], sourcetablealias.[rmsPC_s], sourcetablealias.[rmsPC_w], sourcetablealias.[rmsPC_x], sourcetablealias.[rmsPC_y], sourcetablealias.[medAp7mPSF_u], sourcetablealias.[medAp7mPSF_g], sourcetablealias.[medAp7mPSF_r], sourcetablealias.[medAp7mPSF_i], sourcetablealias.[medAp7mPSF_z], sourcetablealias.[rmsAp7mPSF_u], sourcetablealias.[rmsAp7mPSF_g], sourcetablealias.[rmsAp7mPSF_r], sourcetablealias.[rmsAp7mPSF_i], sourcetablealias.[rmsAp7mPSF_z], sourcetablealias.[seeing_u], sourcetablealias.[seeing_g], sourcetablealias.[seeing_r], sourcetablealias.[seeing_i], sourcetablealias.[seeing_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[RunQA] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.fieldID = sourcetablealias.fieldID
	;


GO

-- SUBSAMPLING TABLE 'RunShift' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[RunShift] WITH (TABLOCKX)
    ([run], [shift])
 SELECT sourcetablealias.[run], sourcetablealias.[shift]
 FROM   [SkyNode_SDSSDR7].[dbo].[RunShift] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SDSSConstants' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[SDSSConstants] WITH (TABLOCKX)
    ([name], [value], [unit], [description])
 SELECT sourcetablealias.[name], sourcetablealias.[value], sourcetablealias.[unit], sourcetablealias.[description]
 FROM   [SkyNode_SDSSDR7].[dbo].[SDSSConstants] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Sector' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Sector] WITH (TABLOCKX)
    ([regionID], [nTiles], [tiles], [targetVersion], [area])
 SELECT sourcetablealias.[regionID], sourcetablealias.[nTiles], sourcetablealias.[tiles], sourcetablealias.[targetVersion], sourcetablealias.[area]
 FROM   [SkyNode_SDSSDR7].[dbo].[Sector] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Sector2Tile' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Sector2Tile] WITH (TABLOCKX)
    ([regionID], [type], [tile], [isMask])
 SELECT sourcetablealias.[regionID], sourcetablealias.[type], sourcetablealias.[tile], sourcetablealias.[isMask]
 FROM   [SkyNode_SDSSDR7].[dbo].[Sector2Tile] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Segment' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Segment] WITH (TABLOCKX)
    ([segmentID], [skyVersion], [run], [camCol], [rerun], [field0], [nFields], [dscale], [chunkID], [startMu], [endMu], [stripe], [strip], [status], [resolved], [exported], [families], [equinox], [node], [incl], [cObs], [tracking], [raMin], [raMax], [decMin], [decMax], [lMin], [lMax], [bMin], [bMax], [lambdaMin], [lambdaMax], [etaMin], [etaMax], [photoId], [photoVersion], [targetAstroId], [targetAstroVersion], [exportAstroId], [exportAstroVersion], [targetFCalibId], [targetFCalibVersion], [exportFCalibID], [exportFCalibVersion], [loaderVersion], [objectSource], [targetSource], [targetVersion], [loadVersion])
 SELECT sourcetablealias.[segmentID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[camCol], sourcetablealias.[rerun], sourcetablealias.[field0], sourcetablealias.[nFields], sourcetablealias.[dscale], sourcetablealias.[chunkID], sourcetablealias.[startMu], sourcetablealias.[endMu], sourcetablealias.[stripe], sourcetablealias.[strip], sourcetablealias.[status], sourcetablealias.[resolved], sourcetablealias.[exported], sourcetablealias.[families], sourcetablealias.[equinox], sourcetablealias.[node], sourcetablealias.[incl], sourcetablealias.[cObs], sourcetablealias.[tracking], sourcetablealias.[raMin], sourcetablealias.[raMax], sourcetablealias.[decMin], sourcetablealias.[decMax], sourcetablealias.[lMin], sourcetablealias.[lMax], sourcetablealias.[bMin], sourcetablealias.[bMax], sourcetablealias.[lambdaMin], sourcetablealias.[lambdaMax], sourcetablealias.[etaMin], sourcetablealias.[etaMax], sourcetablealias.[photoId], sourcetablealias.[photoVersion], sourcetablealias.[targetAstroId], sourcetablealias.[targetAstroVersion], sourcetablealias.[exportAstroId], sourcetablealias.[exportAstroVersion], sourcetablealias.[targetFCalibId], sourcetablealias.[targetFCalibVersion], sourcetablealias.[exportFCalibID], sourcetablealias.[exportFCalibVersion], sourcetablealias.[loaderVersion], sourcetablealias.[objectSource], sourcetablealias.[targetSource], sourcetablealias.[targetVersion], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[Segment] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SpecLineAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specLineID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specLineID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[SpecLineAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specLineID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[SpecLineAll] WITH (TABLOCKX)
	([specLineID], [wave], [waveErr], [waveMin], [waveMax], [sigma], [sigmaErr], [sigmaMin], [sigmaMax], [height], [heightErr], [continuum], [ew], [ewErr], [ewMin], [specIndex], [nSigma], [chisq], [nu], [restWave], [lineID], [weight], [z], [zErr], [lineMask], [category], [specobjID])
 SELECT sourcetablealias.[specLineID], sourcetablealias.[wave], sourcetablealias.[waveErr], sourcetablealias.[waveMin], sourcetablealias.[waveMax], sourcetablealias.[sigma], sourcetablealias.[sigmaErr], sourcetablealias.[sigmaMin], sourcetablealias.[sigmaMax], sourcetablealias.[height], sourcetablealias.[heightErr], sourcetablealias.[continuum], sourcetablealias.[ew], sourcetablealias.[ewErr], sourcetablealias.[ewMin], sourcetablealias.[specIndex], sourcetablealias.[nSigma], sourcetablealias.[chisq], sourcetablealias.[nu], sourcetablealias.[restWave], sourcetablealias.[lineID], sourcetablealias.[weight], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[lineMask], sourcetablealias.[category], sourcetablealias.[specobjID]
 FROM   [SkyNode_SDSSDR7].[dbo].[SpecLineAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specLineID = sourcetablealias.specLineID
	;


GO

-- SUBSAMPLING TABLE 'SpecLineIndex' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specLineIndexID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specLineIndexID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[SpecLineIndex] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specLineIndexID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[SpecLineIndex] WITH (TABLOCKX)
	([specLineIndexID], [name], [ew], [ewErr], [mag], [magErr], [waveMin], [waveMax], [z], [sn], [specobjID])
 SELECT sourcetablealias.[specLineIndexID], sourcetablealias.[name], sourcetablealias.[ew], sourcetablealias.[ewErr], sourcetablealias.[mag], sourcetablealias.[magErr], sourcetablealias.[waveMin], sourcetablealias.[waveMax], sourcetablealias.[z], sourcetablealias.[sn], sourcetablealias.[specobjID]
 FROM   [SkyNode_SDSSDR7].[dbo].[SpecLineIndex] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specLineIndexID = sourcetablealias.specLineIndexID
	;


GO

-- SUBSAMPLING TABLE 'SpecObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[SpecObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[SpecObjAll] WITH (TABLOCKX)
	([specObjID], [mjd], [plate], [tile], [xFocal], [yFocal], [fiberID], [z], [zErr], [zConf], [zStatus], [specClass], [zWarning], [velDisp], [velDispErr], [eCoeff_0], [eCoeff_1], [eCoeff_2], [eCoeff_3], [eCoeff_4], [eClass], [nGood], [sn_0], [sn_1], [sn_2], [mag_0], [mag_1], [mag_2], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [fiberMag_u], [fiberMag_g], [fiberMag_r], [fiberMag_i], [fiberMag_z], [primTarget], [secTarget], [seguePrimTarget], [segueSecTarget], [otherPrimTarget], [otherSecTarget], [pixMin], [pixMax], [sci_sn], [smear_sn], [sm_leg_0], [sm_leg_1], [sm_leg_2], [sciencePrimary], [loadVersion], [plateID], [spectrographID], [throughput], [objType], [objTypeName], [targetID], [targetObjID], [bestObjID])
 SELECT sourcetablealias.[specObjID], sourcetablealias.[mjd], sourcetablealias.[plate], sourcetablealias.[tile], sourcetablealias.[xFocal], sourcetablealias.[yFocal], sourcetablealias.[fiberID], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[zConf], sourcetablealias.[zStatus], sourcetablealias.[specClass], sourcetablealias.[zWarning], sourcetablealias.[velDisp], sourcetablealias.[velDispErr], sourcetablealias.[eCoeff_0], sourcetablealias.[eCoeff_1], sourcetablealias.[eCoeff_2], sourcetablealias.[eCoeff_3], sourcetablealias.[eCoeff_4], sourcetablealias.[eClass], sourcetablealias.[nGood], sourcetablealias.[sn_0], sourcetablealias.[sn_1], sourcetablealias.[sn_2], sourcetablealias.[mag_0], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[fiberMag_u], sourcetablealias.[fiberMag_g], sourcetablealias.[fiberMag_r], sourcetablealias.[fiberMag_i], sourcetablealias.[fiberMag_z], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[seguePrimTarget], sourcetablealias.[segueSecTarget], sourcetablealias.[otherPrimTarget], sourcetablealias.[otherSecTarget], sourcetablealias.[pixMin], sourcetablealias.[pixMax], sourcetablealias.[sci_sn], sourcetablealias.[smear_sn], sourcetablealias.[sm_leg_0], sourcetablealias.[sm_leg_1], sourcetablealias.[sm_leg_2], sourcetablealias.[sciencePrimary], sourcetablealias.[loadVersion], sourcetablealias.[plateID], sourcetablealias.[spectrographID], sourcetablealias.[throughput], sourcetablealias.[objType], sourcetablealias.[objTypeName], sourcetablealias.[targetID], sourcetablealias.[targetObjID], sourcetablealias.[bestObjID]
 FROM   [SkyNode_SDSSDR7].[dbo].[SpecObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specObjID = sourcetablealias.specObjID
	;


GO

-- SUBSAMPLING TABLE 'SpecPhotoAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specObjID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specObjID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[SpecPhotoAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specObjID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[SpecPhotoAll] WITH (TABLOCKX)
	([specObjID], [mjd], [plate], [tile], [fiberID], [z], [zErr], [zConf], [zStatus], [specClass], [zWarning], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [primTarget], [secTarget], [sciencePrimary], [plateID], [objType], [targetID], [targetObjID], [targetMode], [objID], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [nChild], [type], [flags], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [fiberMag_u], [fiberMag_g], [fiberMag_r], [fiberMag_i], [fiberMag_z], [fiberMagErr_u], [fiberMagErr_g], [fiberMagErr_r], [fiberMagErr_i], [fiberMagErr_z], [petroMag_u], [petroMag_g], [petroMag_r], [petroMag_i], [petroMag_z], [petroMagErr_u], [petroMagErr_g], [petroMagErr_r], [petroMagErr_i], [petroMagErr_z], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [modelMagErr_u], [modelMagErr_g], [modelMagErr_r], [modelMagErr_i], [modelMagErr_z], [mRrCc_r], [mRrCcErr_r], [status], [photoRa], [photoDec], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [bestPrimTarget], [bestSecTarget], [priority], [fieldID], [dered_u], [dered_g], [dered_r], [dered_i], [dered_z], [size], [tileRun], [tiPriority], [tiMask], [collisionGroupID])
 SELECT sourcetablealias.[specObjID], sourcetablealias.[mjd], sourcetablealias.[plate], sourcetablealias.[tile], sourcetablealias.[fiberID], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[zConf], sourcetablealias.[zStatus], sourcetablealias.[specClass], sourcetablealias.[zWarning], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[sciencePrimary], sourcetablealias.[plateID], sourcetablealias.[objType], sourcetablealias.[targetID], sourcetablealias.[targetObjID], sourcetablealias.[targetMode], sourcetablealias.[objID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[nChild], sourcetablealias.[type], sourcetablealias.[flags], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[fiberMag_u], sourcetablealias.[fiberMag_g], sourcetablealias.[fiberMag_r], sourcetablealias.[fiberMag_i], sourcetablealias.[fiberMag_z], sourcetablealias.[fiberMagErr_u], sourcetablealias.[fiberMagErr_g], sourcetablealias.[fiberMagErr_r], sourcetablealias.[fiberMagErr_i], sourcetablealias.[fiberMagErr_z], sourcetablealias.[petroMag_u], sourcetablealias.[petroMag_g], sourcetablealias.[petroMag_r], sourcetablealias.[petroMag_i], sourcetablealias.[petroMag_z], sourcetablealias.[petroMagErr_u], sourcetablealias.[petroMagErr_g], sourcetablealias.[petroMagErr_r], sourcetablealias.[petroMagErr_i], sourcetablealias.[petroMagErr_z], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[modelMagErr_u], sourcetablealias.[modelMagErr_g], sourcetablealias.[modelMagErr_r], sourcetablealias.[modelMagErr_i], sourcetablealias.[modelMagErr_z], sourcetablealias.[mRrCc_r], sourcetablealias.[mRrCcErr_r], sourcetablealias.[status], sourcetablealias.[photoRa], sourcetablealias.[photoDec], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[bestPrimTarget], sourcetablealias.[bestSecTarget], sourcetablealias.[priority], sourcetablealias.[fieldID], sourcetablealias.[dered_u], sourcetablealias.[dered_g], sourcetablealias.[dered_r], sourcetablealias.[dered_i], sourcetablealias.[dered_z], sourcetablealias.[size], sourcetablealias.[tileRun], sourcetablealias.[tiPriority], sourcetablealias.[tiMask], sourcetablealias.[collisionGroupID]
 FROM   [SkyNode_SDSSDR7].[dbo].[SpecPhotoAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specObjID = sourcetablealias.specObjID
	;


GO

-- SUBSAMPLING TABLE 'sppLines' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specobjid] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specobjid], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[sppLines] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specobjid]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[sppLines] WITH (TABLOCKX)
	([specobjid], [plate], [mjd], [fiberid], [H8w3], [H8w3cont], [H8w3err], [H8w3mask], [H8w12], [H8w12cont], [H8w12err], [H8w12mask], [H8w24], [H8w24cont], [H8w24err], [H8w24mask], [H8w48], [H8w48cont], [H8w48err], [H8w48mask], [KPw12], [KPw12cont], [KPw12err], [KPw12mask], [KPw18], [KPw18cont], [KPw18err], [KPw18mask], [KPw6], [KPw6cont], [KPw6err], [KPw6mask], [CaIIK], [CaIIKcont], [CaIIKerr], [CaIIKmask], [CaIIHKp], [CaIIHKpcont], [CaIIHKperr], [CaIIHKpmask], [Heps], [Hepscont], [Hepserr], [Hepsmask], [KPw16], [KPw16cont], [KPw16err], [KPw16mask], [Sr], [Srcont], [Srerr], [Srmask], [HeI], [HeIcont], [HeIerr], [HeImask], [Hdeltaw12], [Hdeltaw12cont], [Hdeltaw12err], [Hdeltaw12mask], [Hdeltaw24], [Hdeltaw24cont], [Hdeltaw24err], [Hdeltaw24mask], [Hdeltaw48], [Hdeltaw48cont], [Hdeltaw48err], [Hdeltaw48mask], [Hdelta], [Hdeltacont], [Hdeltaerr], [Hdeltamask], [CaI], [CaIcont], [CaIerr], [CaImask], [CaIw12], [CaIw12cont], [CaIw12err], [CaIw12mask], [CaIw24], [CaIw24cont], [CaIw24err], [CaIw24mask], [CaIw6], [CaIw6cont], [CaIw6err], [CaIw6mask], [G], [Gcont], [Gerr], [Gmask], [Hgammaw12], [Hgammaw12cont], [Hgammaw12err], [Hgammaw12mask], [Hgammaw24], [Hgammaw24cont], [Hgammaw24err], [Hgammaw24mask], [Hgammaw48], [Hgammaw48cont], [Hgammaw48err], [Hgammaw48mask], [Hgamma], [Hgammacont], [Hgammaerr], [Hgammamask], [HeIa], [HeIacont], [HeIaerr], [HeIamask], [G_blue], [G_bluecont], [G_blueerr], [G_bluemask], [G_whole], [G_wholecont], [G_wholeerr], [G_wholemask], [Ba], [Bacont], [Baerr], [Bamask], [12C13C], [12C13Ccont], [12C13Cerr], [12C13Cmask], [CC12], [CC12cont], [CC12err], [CC12mask], [metal1], [metal1cont], [metal1err], [metal1mask], [Hbetaw12], [Hbetaw12cont], [Hbetaw12err], [Hbetaw12mask], [Hbetaw24], [Hbetaw24cont], [Hbetaw24err], [Hbetaw24mask], [Hbetaw48], [Hbetaw48cont], [Hbetaw48err], [Hbetaw48mask], [Hbeta], [Hbetacont], [Hbetaerr], [Hbetamask], [C2], [C2cont], [C2err], [C2mask], [C2pMgI], [C2pMgIcont], [C2pMgIerr], [C2pMgImask], [MgHpMgIpC2], [MgHpMgIpC2cont], [MgHpMgIpC2err], [MgHpMgIpC2mask], [MgHpMgI], [MgHpMgIcont], [MgHpMgIerr], [MgHpMgImask], [MgH], [MgHcont], [MgHerr], [MgHmask], [CrI], [CrIcont], [CrIerr], [CrImask], [MgIpFeII], [MgIpFeIIcont], [MgIpFeIIerr], [MgIpFeIImask], [MgI], [MgIcont], [MgIerr], [MgImask], [MgIa], [MgIacont], [MgIaerr], [MgIamask], [MgIb], [MgIbcont], [MgIberr], [MgIbmask], [MgIc], [MgIccont], [MgIcerr], [MgIcmask], [NaI], [NaIcont], [NaIerr], [NaImask], [Naw12], [Naw12cont], [Naw12err], [Naw12mask], [Naw24], [Naw24cont], [Naw24err], [Naw24mask], [Halphaw12], [Halphaw12cont], [Halphaw12err], [Halphaw12mask], [Halphaw24], [Halphaw24cont], [Halphaw24err], [Halphaw24mask], [Halphaw48], [Halphaw48cont], [Halphaw48err], [Halphaw48mask], [Halphaw70], [Halphaw70cont], [Halphaw70err], [Halphaw70mask], [CaH], [CaHcont], [CaHerr], [CaHmask], [TiO], [TiOcont], [TiOerr], [TiOmask], [CN], [CNcont], [CNerr], [CNmask], [OItrip], [OItripcont], [OItriperr], [OItripmask], [KI], [KIcont], [KIerr], [KImask], [KIa], [KIacont], [KIaerr], [KIamask], [NaIa], [NaIacont], [NaIaerr], [NaIamask], [NaIred], [NaIredcont], [NaIrederr], [NaIredmask], [CaIIw26], [CaIIw26cont], [CaIIw26err], [CaIIw26mask], [Paschenw13], [Paschenw13cont], [Paschenw13err], [Paschenw13mask], [CaII], [CaIIcont], [CaIIerr], [CaIImask], [CaIIw40], [CaIIw40cont], [CaIIw40err], [CaIIw40mask], [CaIIa], [CaIIacont], [CaIIaerr], [CaIIamask], [Paschenw42], [Paschenw42cont], [Paschenw42err], [Paschenw42mask], [CaIIb], [CaIIbcont], [CaIIberr], [CaIIbmask], [CaIIaw40], [CaIIaw40cont], [CaIIaw40err], [CaIIaw40mask], [Paschenaw42], [Paschenaw42cont], [Paschenaw42err], [Paschenaw42mask], [TiO5], [TiO5cont], [TiO5err], [TiO5mask], [TiO8], [TiO8cont], [TiO8err], [TiO8mask], [CaH1], [CaH1cont], [CaH1err], [CaH1mask], [CaH2], [CaH2cont], [CaH2err], [CaH2mask], [CaH3], [CaH3cont], [CaH3err], [CaH3mask])
 SELECT sourcetablealias.[specobjid], sourcetablealias.[plate], sourcetablealias.[mjd], sourcetablealias.[fiberid], sourcetablealias.[H8w3], sourcetablealias.[H8w3cont], sourcetablealias.[H8w3err], sourcetablealias.[H8w3mask], sourcetablealias.[H8w12], sourcetablealias.[H8w12cont], sourcetablealias.[H8w12err], sourcetablealias.[H8w12mask], sourcetablealias.[H8w24], sourcetablealias.[H8w24cont], sourcetablealias.[H8w24err], sourcetablealias.[H8w24mask], sourcetablealias.[H8w48], sourcetablealias.[H8w48cont], sourcetablealias.[H8w48err], sourcetablealias.[H8w48mask], sourcetablealias.[KPw12], sourcetablealias.[KPw12cont], sourcetablealias.[KPw12err], sourcetablealias.[KPw12mask], sourcetablealias.[KPw18], sourcetablealias.[KPw18cont], sourcetablealias.[KPw18err], sourcetablealias.[KPw18mask], sourcetablealias.[KPw6], sourcetablealias.[KPw6cont], sourcetablealias.[KPw6err], sourcetablealias.[KPw6mask], sourcetablealias.[CaIIK], sourcetablealias.[CaIIKcont], sourcetablealias.[CaIIKerr], sourcetablealias.[CaIIKmask], sourcetablealias.[CaIIHKp], sourcetablealias.[CaIIHKpcont], sourcetablealias.[CaIIHKperr], sourcetablealias.[CaIIHKpmask], sourcetablealias.[Heps], sourcetablealias.[Hepscont], sourcetablealias.[Hepserr], sourcetablealias.[Hepsmask], sourcetablealias.[KPw16], sourcetablealias.[KPw16cont], sourcetablealias.[KPw16err], sourcetablealias.[KPw16mask], sourcetablealias.[Sr], sourcetablealias.[Srcont], sourcetablealias.[Srerr], sourcetablealias.[Srmask], sourcetablealias.[HeI], sourcetablealias.[HeIcont], sourcetablealias.[HeIerr], sourcetablealias.[HeImask], sourcetablealias.[Hdeltaw12], sourcetablealias.[Hdeltaw12cont], sourcetablealias.[Hdeltaw12err], sourcetablealias.[Hdeltaw12mask], sourcetablealias.[Hdeltaw24], sourcetablealias.[Hdeltaw24cont], sourcetablealias.[Hdeltaw24err], sourcetablealias.[Hdeltaw24mask], sourcetablealias.[Hdeltaw48], sourcetablealias.[Hdeltaw48cont], sourcetablealias.[Hdeltaw48err], sourcetablealias.[Hdeltaw48mask], sourcetablealias.[Hdelta], sourcetablealias.[Hdeltacont], sourcetablealias.[Hdeltaerr], sourcetablealias.[Hdeltamask], sourcetablealias.[CaI], sourcetablealias.[CaIcont], sourcetablealias.[CaIerr], sourcetablealias.[CaImask], sourcetablealias.[CaIw12], sourcetablealias.[CaIw12cont], sourcetablealias.[CaIw12err], sourcetablealias.[CaIw12mask], sourcetablealias.[CaIw24], sourcetablealias.[CaIw24cont], sourcetablealias.[CaIw24err], sourcetablealias.[CaIw24mask], sourcetablealias.[CaIw6], sourcetablealias.[CaIw6cont], sourcetablealias.[CaIw6err], sourcetablealias.[CaIw6mask], sourcetablealias.[G], sourcetablealias.[Gcont], sourcetablealias.[Gerr], sourcetablealias.[Gmask], sourcetablealias.[Hgammaw12], sourcetablealias.[Hgammaw12cont], sourcetablealias.[Hgammaw12err], sourcetablealias.[Hgammaw12mask], sourcetablealias.[Hgammaw24], sourcetablealias.[Hgammaw24cont], sourcetablealias.[Hgammaw24err], sourcetablealias.[Hgammaw24mask], sourcetablealias.[Hgammaw48], sourcetablealias.[Hgammaw48cont], sourcetablealias.[Hgammaw48err], sourcetablealias.[Hgammaw48mask], sourcetablealias.[Hgamma], sourcetablealias.[Hgammacont], sourcetablealias.[Hgammaerr], sourcetablealias.[Hgammamask], sourcetablealias.[HeIa], sourcetablealias.[HeIacont], sourcetablealias.[HeIaerr], sourcetablealias.[HeIamask], sourcetablealias.[G_blue], sourcetablealias.[G_bluecont], sourcetablealias.[G_blueerr], sourcetablealias.[G_bluemask], sourcetablealias.[G_whole], sourcetablealias.[G_wholecont], sourcetablealias.[G_wholeerr], sourcetablealias.[G_wholemask], sourcetablealias.[Ba], sourcetablealias.[Bacont], sourcetablealias.[Baerr], sourcetablealias.[Bamask], sourcetablealias.[12C13C], sourcetablealias.[12C13Ccont], sourcetablealias.[12C13Cerr], sourcetablealias.[12C13Cmask], sourcetablealias.[CC12], sourcetablealias.[CC12cont], sourcetablealias.[CC12err], sourcetablealias.[CC12mask], sourcetablealias.[metal1], sourcetablealias.[metal1cont], sourcetablealias.[metal1err], sourcetablealias.[metal1mask], sourcetablealias.[Hbetaw12], sourcetablealias.[Hbetaw12cont], sourcetablealias.[Hbetaw12err], sourcetablealias.[Hbetaw12mask], sourcetablealias.[Hbetaw24], sourcetablealias.[Hbetaw24cont], sourcetablealias.[Hbetaw24err], sourcetablealias.[Hbetaw24mask], sourcetablealias.[Hbetaw48], sourcetablealias.[Hbetaw48cont], sourcetablealias.[Hbetaw48err], sourcetablealias.[Hbetaw48mask], sourcetablealias.[Hbeta], sourcetablealias.[Hbetacont], sourcetablealias.[Hbetaerr], sourcetablealias.[Hbetamask], sourcetablealias.[C2], sourcetablealias.[C2cont], sourcetablealias.[C2err], sourcetablealias.[C2mask], sourcetablealias.[C2pMgI], sourcetablealias.[C2pMgIcont], sourcetablealias.[C2pMgIerr], sourcetablealias.[C2pMgImask], sourcetablealias.[MgHpMgIpC2], sourcetablealias.[MgHpMgIpC2cont], sourcetablealias.[MgHpMgIpC2err], sourcetablealias.[MgHpMgIpC2mask], sourcetablealias.[MgHpMgI], sourcetablealias.[MgHpMgIcont], sourcetablealias.[MgHpMgIerr], sourcetablealias.[MgHpMgImask], sourcetablealias.[MgH], sourcetablealias.[MgHcont], sourcetablealias.[MgHerr], sourcetablealias.[MgHmask], sourcetablealias.[CrI], sourcetablealias.[CrIcont], sourcetablealias.[CrIerr], sourcetablealias.[CrImask], sourcetablealias.[MgIpFeII], sourcetablealias.[MgIpFeIIcont], sourcetablealias.[MgIpFeIIerr], sourcetablealias.[MgIpFeIImask], sourcetablealias.[MgI], sourcetablealias.[MgIcont], sourcetablealias.[MgIerr], sourcetablealias.[MgImask], sourcetablealias.[MgIa], sourcetablealias.[MgIacont], sourcetablealias.[MgIaerr], sourcetablealias.[MgIamask], sourcetablealias.[MgIb], sourcetablealias.[MgIbcont], sourcetablealias.[MgIberr], sourcetablealias.[MgIbmask], sourcetablealias.[MgIc], sourcetablealias.[MgIccont], sourcetablealias.[MgIcerr], sourcetablealias.[MgIcmask], sourcetablealias.[NaI], sourcetablealias.[NaIcont], sourcetablealias.[NaIerr], sourcetablealias.[NaImask], sourcetablealias.[Naw12], sourcetablealias.[Naw12cont], sourcetablealias.[Naw12err], sourcetablealias.[Naw12mask], sourcetablealias.[Naw24], sourcetablealias.[Naw24cont], sourcetablealias.[Naw24err], sourcetablealias.[Naw24mask], sourcetablealias.[Halphaw12], sourcetablealias.[Halphaw12cont], sourcetablealias.[Halphaw12err], sourcetablealias.[Halphaw12mask], sourcetablealias.[Halphaw24], sourcetablealias.[Halphaw24cont], sourcetablealias.[Halphaw24err], sourcetablealias.[Halphaw24mask], sourcetablealias.[Halphaw48], sourcetablealias.[Halphaw48cont], sourcetablealias.[Halphaw48err], sourcetablealias.[Halphaw48mask], sourcetablealias.[Halphaw70], sourcetablealias.[Halphaw70cont], sourcetablealias.[Halphaw70err], sourcetablealias.[Halphaw70mask], sourcetablealias.[CaH], sourcetablealias.[CaHcont], sourcetablealias.[CaHerr], sourcetablealias.[CaHmask], sourcetablealias.[TiO], sourcetablealias.[TiOcont], sourcetablealias.[TiOerr], sourcetablealias.[TiOmask], sourcetablealias.[CN], sourcetablealias.[CNcont], sourcetablealias.[CNerr], sourcetablealias.[CNmask], sourcetablealias.[OItrip], sourcetablealias.[OItripcont], sourcetablealias.[OItriperr], sourcetablealias.[OItripmask], sourcetablealias.[KI], sourcetablealias.[KIcont], sourcetablealias.[KIerr], sourcetablealias.[KImask], sourcetablealias.[KIa], sourcetablealias.[KIacont], sourcetablealias.[KIaerr], sourcetablealias.[KIamask], sourcetablealias.[NaIa], sourcetablealias.[NaIacont], sourcetablealias.[NaIaerr], sourcetablealias.[NaIamask], sourcetablealias.[NaIred], sourcetablealias.[NaIredcont], sourcetablealias.[NaIrederr], sourcetablealias.[NaIredmask], sourcetablealias.[CaIIw26], sourcetablealias.[CaIIw26cont], sourcetablealias.[CaIIw26err], sourcetablealias.[CaIIw26mask], sourcetablealias.[Paschenw13], sourcetablealias.[Paschenw13cont], sourcetablealias.[Paschenw13err], sourcetablealias.[Paschenw13mask], sourcetablealias.[CaII], sourcetablealias.[CaIIcont], sourcetablealias.[CaIIerr], sourcetablealias.[CaIImask], sourcetablealias.[CaIIw40], sourcetablealias.[CaIIw40cont], sourcetablealias.[CaIIw40err], sourcetablealias.[CaIIw40mask], sourcetablealias.[CaIIa], sourcetablealias.[CaIIacont], sourcetablealias.[CaIIaerr], sourcetablealias.[CaIIamask], sourcetablealias.[Paschenw42], sourcetablealias.[Paschenw42cont], sourcetablealias.[Paschenw42err], sourcetablealias.[Paschenw42mask], sourcetablealias.[CaIIb], sourcetablealias.[CaIIbcont], sourcetablealias.[CaIIberr], sourcetablealias.[CaIIbmask], sourcetablealias.[CaIIaw40], sourcetablealias.[CaIIaw40cont], sourcetablealias.[CaIIaw40err], sourcetablealias.[CaIIaw40mask], sourcetablealias.[Paschenaw42], sourcetablealias.[Paschenaw42cont], sourcetablealias.[Paschenaw42err], sourcetablealias.[Paschenaw42mask], sourcetablealias.[TiO5], sourcetablealias.[TiO5cont], sourcetablealias.[TiO5err], sourcetablealias.[TiO5mask], sourcetablealias.[TiO8], sourcetablealias.[TiO8cont], sourcetablealias.[TiO8err], sourcetablealias.[TiO8mask], sourcetablealias.[CaH1], sourcetablealias.[CaH1cont], sourcetablealias.[CaH1err], sourcetablealias.[CaH1mask], sourcetablealias.[CaH2], sourcetablealias.[CaH2cont], sourcetablealias.[CaH2err], sourcetablealias.[CaH2mask], sourcetablealias.[CaH3], sourcetablealias.[CaH3cont], sourcetablealias.[CaH3err], sourcetablealias.[CaH3mask]
 FROM   [SkyNode_SDSSDR7].[dbo].[sppLines] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specobjid = sourcetablealias.specobjid
	;


GO

-- SUBSAMPLING TABLE 'sppParams' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[specobjid] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[specobjid], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[sppParams] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [specobjid]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[sppParams] WITH (TABLOCKX)
	([specobjid], [plate], [mjd], [fiberid], [seguetargetclass], [hammersptype], [sptypea], [flag], [feha], [fehan], [fehaerr], [feh1], [feh1n], [feh1err], [feh2], [feh2n], [feh2err], [feh3], [feh3n], [feh3err], [feh4], [feh4n], [feh4err], [feh5], [feh5n], [feh5err], [feh6], [feh6n], [feh6err], [feh7], [feh7n], [feh7err], [feh8], [feh8n], [feh8err], [feh9], [feh9n], [feh9err], [feh10], [feh10n], [feh10err], [feh11], [feh11n], [feh11err], [feh12], [feh12n], [feh12err], [teffa], [teffan], [teffaerr], [teff1], [teff1n], [teff1err], [teff2], [teff2n], [teff2err], [teff3], [teff3n], [teff3err], [teff4], [teff4n], [teff4err], [teff5], [teff5n], [teff5err], [teff6], [teff6n], [teff6err], [teff7], [teff7n], [teff7err], [teff8], [teff8n], [teff8err], [teff9], [teff9n], [teff9err], [teff10], [teff10n], [teff10err], [teff11], [teff11n], [teff11err], [logga], [loggan], [loggaerr], [logg1], [logg1n], [logg1err], [logg2], [logg2n], [logg2err], [logg3], [logg3n], [logg3err], [logg4], [logg4n], [logg4err], [logg5], [logg5n], [logg5err], [logg6], [logg6n], [logg6err], [logg7], [logg7n], [logg7err], [logg8], [logg8n], [logg8err], [logg9], [logg9n], [logg9err], [logg10], [logg10n], [logg10err], [alphafe], [alphafen], [alphafeerr], [elodierv], [elodierverr], [g0], [gmr0], [grhbaa], [grbha], [grbhd], [grhp], [umg0], [rmi0], [imz0], [uerr], [gerr], [rerr], [ierr], [zerr], [ebv], [sna], [qualitycheck], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneID], [l], [b], [chiHK], [chiGband], [targ_pmepoch], [targ_pmmatch], [targ_pmdelta], [targ_pml], [targ_pmb], [targ_pmra], [targ_pmdec], [targ_pmraerr], [targ_pmdecerr], [targ_pmsigra], [targ_pmsigdec], [targ_pmnfit], [targ_usnomag_u], [targ_usnomag_g], [targ_usnomag_r], [targ_usnomag_i], [targ_usnomag_z], [targ_pmdist20], [targ_pmdist22], [targ_raErr], [targ_decErr], [targ_raDecErr], [brun], [brerun], [bcamcol], [bfield], [bobj], [lpar], [spar], [wpar], [p1spar], [bsz], [bszerr], [targettype], [zbclass], [zbsubclass], [zbelodiesptype], [zbrchi2], [zbdof], [zbvdisp], [zbvdisperr], [zbzwarning], [spec_cln], [spz], [spzerr], [vel_dis], [vel_disperr], [spz_conf], [spz_status], [spz_warning], [eclass], [ecoeff1], [ecoeff2], [ecoeff3], [ecoeff4], [ecoeff5], [tsver], [amnhtype], [amnhsubtype], [amnhmindex], [amnhmvalue], [inspect])
 SELECT sourcetablealias.[specobjid], sourcetablealias.[plate], sourcetablealias.[mjd], sourcetablealias.[fiberid], sourcetablealias.[seguetargetclass], sourcetablealias.[hammersptype], sourcetablealias.[sptypea], sourcetablealias.[flag], sourcetablealias.[feha], sourcetablealias.[fehan], sourcetablealias.[fehaerr], sourcetablealias.[feh1], sourcetablealias.[feh1n], sourcetablealias.[feh1err], sourcetablealias.[feh2], sourcetablealias.[feh2n], sourcetablealias.[feh2err], sourcetablealias.[feh3], sourcetablealias.[feh3n], sourcetablealias.[feh3err], sourcetablealias.[feh4], sourcetablealias.[feh4n], sourcetablealias.[feh4err], sourcetablealias.[feh5], sourcetablealias.[feh5n], sourcetablealias.[feh5err], sourcetablealias.[feh6], sourcetablealias.[feh6n], sourcetablealias.[feh6err], sourcetablealias.[feh7], sourcetablealias.[feh7n], sourcetablealias.[feh7err], sourcetablealias.[feh8], sourcetablealias.[feh8n], sourcetablealias.[feh8err], sourcetablealias.[feh9], sourcetablealias.[feh9n], sourcetablealias.[feh9err], sourcetablealias.[feh10], sourcetablealias.[feh10n], sourcetablealias.[feh10err], sourcetablealias.[feh11], sourcetablealias.[feh11n], sourcetablealias.[feh11err], sourcetablealias.[feh12], sourcetablealias.[feh12n], sourcetablealias.[feh12err], sourcetablealias.[teffa], sourcetablealias.[teffan], sourcetablealias.[teffaerr], sourcetablealias.[teff1], sourcetablealias.[teff1n], sourcetablealias.[teff1err], sourcetablealias.[teff2], sourcetablealias.[teff2n], sourcetablealias.[teff2err], sourcetablealias.[teff3], sourcetablealias.[teff3n], sourcetablealias.[teff3err], sourcetablealias.[teff4], sourcetablealias.[teff4n], sourcetablealias.[teff4err], sourcetablealias.[teff5], sourcetablealias.[teff5n], sourcetablealias.[teff5err], sourcetablealias.[teff6], sourcetablealias.[teff6n], sourcetablealias.[teff6err], sourcetablealias.[teff7], sourcetablealias.[teff7n], sourcetablealias.[teff7err], sourcetablealias.[teff8], sourcetablealias.[teff8n], sourcetablealias.[teff8err], sourcetablealias.[teff9], sourcetablealias.[teff9n], sourcetablealias.[teff9err], sourcetablealias.[teff10], sourcetablealias.[teff10n], sourcetablealias.[teff10err], sourcetablealias.[teff11], sourcetablealias.[teff11n], sourcetablealias.[teff11err], sourcetablealias.[logga], sourcetablealias.[loggan], sourcetablealias.[loggaerr], sourcetablealias.[logg1], sourcetablealias.[logg1n], sourcetablealias.[logg1err], sourcetablealias.[logg2], sourcetablealias.[logg2n], sourcetablealias.[logg2err], sourcetablealias.[logg3], sourcetablealias.[logg3n], sourcetablealias.[logg3err], sourcetablealias.[logg4], sourcetablealias.[logg4n], sourcetablealias.[logg4err], sourcetablealias.[logg5], sourcetablealias.[logg5n], sourcetablealias.[logg5err], sourcetablealias.[logg6], sourcetablealias.[logg6n], sourcetablealias.[logg6err], sourcetablealias.[logg7], sourcetablealias.[logg7n], sourcetablealias.[logg7err], sourcetablealias.[logg8], sourcetablealias.[logg8n], sourcetablealias.[logg8err], sourcetablealias.[logg9], sourcetablealias.[logg9n], sourcetablealias.[logg9err], sourcetablealias.[logg10], sourcetablealias.[logg10n], sourcetablealias.[logg10err], sourcetablealias.[alphafe], sourcetablealias.[alphafen], sourcetablealias.[alphafeerr], sourcetablealias.[elodierv], sourcetablealias.[elodierverr], sourcetablealias.[g0], sourcetablealias.[gmr0], sourcetablealias.[grhbaa], sourcetablealias.[grbha], sourcetablealias.[grbhd], sourcetablealias.[grhp], sourcetablealias.[umg0], sourcetablealias.[rmi0], sourcetablealias.[imz0], sourcetablealias.[uerr], sourcetablealias.[gerr], sourcetablealias.[rerr], sourcetablealias.[ierr], sourcetablealias.[zerr], sourcetablealias.[ebv], sourcetablealias.[sna], sourcetablealias.[qualitycheck], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneID], sourcetablealias.[l], sourcetablealias.[b], sourcetablealias.[chiHK], sourcetablealias.[chiGband], sourcetablealias.[targ_pmepoch], sourcetablealias.[targ_pmmatch], sourcetablealias.[targ_pmdelta], sourcetablealias.[targ_pml], sourcetablealias.[targ_pmb], sourcetablealias.[targ_pmra], sourcetablealias.[targ_pmdec], sourcetablealias.[targ_pmraerr], sourcetablealias.[targ_pmdecerr], sourcetablealias.[targ_pmsigra], sourcetablealias.[targ_pmsigdec], sourcetablealias.[targ_pmnfit], sourcetablealias.[targ_usnomag_u], sourcetablealias.[targ_usnomag_g], sourcetablealias.[targ_usnomag_r], sourcetablealias.[targ_usnomag_i], sourcetablealias.[targ_usnomag_z], sourcetablealias.[targ_pmdist20], sourcetablealias.[targ_pmdist22], sourcetablealias.[targ_raErr], sourcetablealias.[targ_decErr], sourcetablealias.[targ_raDecErr], sourcetablealias.[brun], sourcetablealias.[brerun], sourcetablealias.[bcamcol], sourcetablealias.[bfield], sourcetablealias.[bobj], sourcetablealias.[lpar], sourcetablealias.[spar], sourcetablealias.[wpar], sourcetablealias.[p1spar], sourcetablealias.[bsz], sourcetablealias.[bszerr], sourcetablealias.[targettype], sourcetablealias.[zbclass], sourcetablealias.[zbsubclass], sourcetablealias.[zbelodiesptype], sourcetablealias.[zbrchi2], sourcetablealias.[zbdof], sourcetablealias.[zbvdisp], sourcetablealias.[zbvdisperr], sourcetablealias.[zbzwarning], sourcetablealias.[spec_cln], sourcetablealias.[spz], sourcetablealias.[spzerr], sourcetablealias.[vel_dis], sourcetablealias.[vel_disperr], sourcetablealias.[spz_conf], sourcetablealias.[spz_status], sourcetablealias.[spz_warning], sourcetablealias.[eclass], sourcetablealias.[ecoeff1], sourcetablealias.[ecoeff2], sourcetablealias.[ecoeff3], sourcetablealias.[ecoeff4], sourcetablealias.[ecoeff5], sourcetablealias.[tsver], sourcetablealias.[amnhtype], sourcetablealias.[amnhsubtype], sourcetablealias.[amnhmindex], sourcetablealias.[amnhmvalue], sourcetablealias.[inspect]
 FROM   [SkyNode_SDSSDR7].[dbo].[sppParams] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.specobjid = sourcetablealias.specobjid
	;


GO

-- SUBSAMPLING TABLE 'StripeDefs' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[StripeDefs] WITH (TABLOCKX)
    ([stripe], [hemisphere], [eta], [lambdaMin], [lambdaMax], [htmArea])
 SELECT sourcetablealias.[stripe], sourcetablealias.[hemisphere], sourcetablealias.[eta], sourcetablealias.[lambdaMin], sourcetablealias.[lambdaMax], sourcetablealias.[htmArea]
 FROM   [SkyNode_SDSSDR7].[dbo].[StripeDefs] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'Target' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[targetID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[targetID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[Target] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [targetID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[Target] WITH (TABLOCKX)
	([targetID], [run], [rerun], [camcol], [field], [obj], [regionID], [ra], [dec], [duplicate], [htmID], [zoneID], [cx], [cy], [cz], [bestObjID], [specObjID], [bestMode], [loadVersion])
 SELECT sourcetablealias.[targetID], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[regionID], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[duplicate], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[bestObjID], sourcetablealias.[specObjID], sourcetablealias.[bestMode], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[Target] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.targetID = sourcetablealias.targetID
	;


GO

-- SUBSAMPLING TABLE 'TargetInfo' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[skyVersion] int, [targetID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[skyVersion], sourcetablealias.[targetID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[TargetInfo] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [skyVersion], [targetID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TargetInfo] WITH (TABLOCKX)
	([targetObjID], [targetID], [skyVersion], [primTarget], [secTarget], [priority], [programType], [programName], [targetMode], [loadVersion])
 SELECT sourcetablealias.[targetObjID], sourcetablealias.[targetID], sourcetablealias.[skyVersion], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[priority], sourcetablealias.[programType], sourcetablealias.[programName], sourcetablealias.[targetMode], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TargetInfo] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.skyVersion = sourcetablealias.skyVersion AND ##temporaryidlist.targetID = sourcetablealias.targetID
	;


GO

-- SUBSAMPLING TABLE 'TargPhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[TargPhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TargPhotoObjAll] WITH (TABLOCKX)
	([objID], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [nChild], [type], [probPSF], [insideMask], [flags], [rowc], [rowcErr], [colc], [colcErr], [rowv], [rowvErr], [colv], [colvErr], [rowc_u], [rowc_g], [rowc_r], [rowc_i], [rowc_z], [rowcErr_u], [rowcErr_g], [rowcErr_r], [rowcErr_i], [rowcErr_z], [colc_u], [colc_g], [colc_r], [colc_i], [colc_z], [colcErr_u], [colcErr_g], [colcErr_r], [colcErr_i], [colcErr_z], [sky_u], [sky_g], [sky_r], [sky_i], [sky_z], [skyErr_u], [skyErr_g], [skyErr_r], [skyErr_i], [skyErr_z], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [psfMagErr_u], [psfMagErr_g], [psfMagErr_r], [psfMagErr_i], [psfMagErr_z], [fiberMag_u], [fiberMag_g], [fiberMag_r], [fiberMag_i], [fiberMag_z], [fiberMagErr_u], [fiberMagErr_g], [fiberMagErr_r], [fiberMagErr_i], [fiberMagErr_z], [petroMag_u], [petroMag_g], [petroMag_r], [petroMag_i], [petroMag_z], [petroMagErr_u], [petroMagErr_g], [petroMagErr_r], [petroMagErr_i], [petroMagErr_z], [petroRad_u], [petroRad_g], [petroRad_r], [petroRad_i], [petroRad_z], [petroRadErr_u], [petroRadErr_g], [petroRadErr_r], [petroRadErr_i], [petroRadErr_z], [petroR50_u], [petroR50_g], [petroR50_r], [petroR50_i], [petroR50_z], [petroR50Err_u], [petroR50Err_g], [petroR50Err_r], [petroR50Err_i], [petroR50Err_z], [petroR90_u], [petroR90_g], [petroR90_r], [petroR90_i], [petroR90_z], [petroR90Err_u], [petroR90Err_g], [petroR90Err_r], [petroR90Err_i], [petroR90Err_z], [q_u], [q_g], [q_r], [q_i], [q_z], [qErr_u], [qErr_g], [qErr_r], [qErr_i], [qErr_z], [u_u], [u_g], [u_r], [u_i], [u_z], [uErr_u], [uErr_g], [uErr_r], [uErr_i], [uErr_z], [mE1_u], [mE1_g], [mE1_r], [mE1_i], [mE1_z], [mE2_u], [mE2_g], [mE2_r], [mE2_i], [mE2_z], [mE1E1Err_u], [mE1E1Err_g], [mE1E1Err_r], [mE1E1Err_i], [mE1E1Err_z], [mE1E2Err_u], [mE1E2Err_g], [mE1E2Err_r], [mE1E2Err_i], [mE1E2Err_z], [mE2E2Err_u], [mE2E2Err_g], [mE2E2Err_r], [mE2E2Err_i], [mE2E2Err_z], [mRrCc_u], [mRrCc_g], [mRrCc_r], [mRrCc_i], [mRrCc_z], [mRrCcErr_u], [mRrCcErr_g], [mRrCcErr_r], [mRrCcErr_i], [mRrCcErr_z], [mCr4_u], [mCr4_g], [mCr4_r], [mCr4_i], [mCr4_z], [mE1PSF_u], [mE1PSF_g], [mE1PSF_r], [mE1PSF_i], [mE1PSF_z], [mE2PSF_u], [mE2PSF_g], [mE2PSF_r], [mE2PSF_i], [mE2PSF_z], [mRrCcPSF_u], [mRrCcPSF_g], [mRrCcPSF_r], [mRrCcPSF_i], [mRrCcPSF_z], [mCr4PSF_u], [mCr4PSF_g], [mCr4PSF_r], [mCr4PSF_i], [mCr4PSF_z], [isoRowc_u], [isoRowc_g], [isoRowc_r], [isoRowc_i], [isoRowc_z], [isoRowcErr_u], [isoRowcErr_g], [isoRowcErr_r], [isoRowcErr_i], [isoRowcErr_z], [isoRowcGrad_u], [isoRowcGrad_g], [isoRowcGrad_r], [isoRowcGrad_i], [isoRowcGrad_z], [isoColc_u], [isoColc_g], [isoColc_r], [isoColc_i], [isoColc_z], [isoColcErr_u], [isoColcErr_g], [isoColcErr_r], [isoColcErr_i], [isoColcErr_z], [isoColcGrad_u], [isoColcGrad_g], [isoColcGrad_r], [isoColcGrad_i], [isoColcGrad_z], [isoA_u], [isoA_g], [isoA_r], [isoA_i], [isoA_z], [isoAErr_u], [isoAErr_g], [isoAErr_r], [isoAErr_i], [isoAErr_z], [isoB_u], [isoB_g], [isoB_r], [isoB_i], [isoB_z], [isoBErr_u], [isoBErr_g], [isoBErr_r], [isoBErr_i], [isoBErr_z], [isoAGrad_u], [isoAGrad_g], [isoAGrad_r], [isoAGrad_i], [isoAGrad_z], [isoBGrad_u], [isoBGrad_g], [isoBGrad_r], [isoBGrad_i], [isoBGrad_z], [isoPhi_u], [isoPhi_g], [isoPhi_r], [isoPhi_i], [isoPhi_z], [isoPhiErr_u], [isoPhiErr_g], [isoPhiErr_r], [isoPhiErr_i], [isoPhiErr_z], [isoPhiGrad_u], [isoPhiGrad_g], [isoPhiGrad_r], [isoPhiGrad_i], [isoPhiGrad_z], [deVRad_u], [deVRad_g], [deVRad_r], [deVRad_i], [deVRad_z], [deVRadErr_u], [deVRadErr_g], [deVRadErr_r], [deVRadErr_i], [deVRadErr_z], [deVAB_u], [deVAB_g], [deVAB_r], [deVAB_i], [deVAB_z], [deVABErr_u], [deVABErr_g], [deVABErr_r], [deVABErr_i], [deVABErr_z], [deVPhi_u], [deVPhi_g], [deVPhi_r], [deVPhi_i], [deVPhi_z], [deVPhiErr_u], [deVPhiErr_g], [deVPhiErr_r], [deVPhiErr_i], [deVPhiErr_z], [deVMag_u], [deVMag_g], [deVMag_r], [deVMag_i], [deVMag_z], [deVMagErr_u], [deVMagErr_g], [deVMagErr_r], [deVMagErr_i], [deVMagErr_z], [expRad_u], [expRad_g], [expRad_r], [expRad_i], [expRad_z], [expRadErr_u], [expRadErr_g], [expRadErr_r], [expRadErr_i], [expRadErr_z], [expAB_u], [expAB_g], [expAB_r], [expAB_i], [expAB_z], [expABErr_u], [expABErr_g], [expABErr_r], [expABErr_i], [expABErr_z], [expPhi_u], [expPhi_g], [expPhi_r], [expPhi_i], [expPhi_z], [expPhiErr_u], [expPhiErr_g], [expPhiErr_r], [expPhiErr_i], [expPhiErr_z], [expMag_u], [expMag_g], [expMag_r], [expMag_i], [expMag_z], [expMagErr_u], [expMagErr_g], [expMagErr_r], [expMagErr_i], [expMagErr_z], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [modelMagErr_u], [modelMagErr_g], [modelMagErr_r], [modelMagErr_i], [modelMagErr_z], [texture_u], [texture_g], [texture_r], [texture_i], [texture_z], [lnLStar_u], [lnLStar_g], [lnLStar_r], [lnLStar_i], [lnLStar_z], [lnLExp_u], [lnLExp_g], [lnLExp_r], [lnLExp_i], [lnLExp_z], [lnLDeV_u], [lnLDeV_g], [lnLDeV_r], [lnLDeV_i], [lnLDeV_z], [fracDeV_u], [fracDeV_g], [fracDeV_r], [fracDeV_i], [fracDeV_z], [flags_u], [flags_g], [flags_r], [flags_i], [flags_z], [type_u], [type_g], [type_r], [type_i], [type_z], [probPSF_u], [probPSF_g], [probPSF_r], [probPSF_i], [probPSF_z], [status], [ra], [dec], [cx], [cy], [cz], [offsetRa_u], [offsetRa_g], [offsetRa_r], [offsetRa_i], [offsetRa_z], [offsetDec_u], [offsetDec_g], [offsetDec_r], [offsetDec_i], [offsetDec_z], [primTarget], [secTarget], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [priority], [rho], [nProf_u], [nProf_g], [nProf_r], [nProf_i], [nProf_z], [loadVersion], [htmID], [zoneID], [fieldID], [parentID], [specObjID], [u], [g], [r], [i], [z], [err_u], [err_g], [err_r], [err_i], [err_z], [dered_u], [dered_g], [dered_r], [dered_i], [dered_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[nChild], sourcetablealias.[type], sourcetablealias.[probPSF], sourcetablealias.[insideMask], sourcetablealias.[flags], sourcetablealias.[rowc], sourcetablealias.[rowcErr], sourcetablealias.[colc], sourcetablealias.[colcErr], sourcetablealias.[rowv], sourcetablealias.[rowvErr], sourcetablealias.[colv], sourcetablealias.[colvErr], sourcetablealias.[rowc_u], sourcetablealias.[rowc_g], sourcetablealias.[rowc_r], sourcetablealias.[rowc_i], sourcetablealias.[rowc_z], sourcetablealias.[rowcErr_u], sourcetablealias.[rowcErr_g], sourcetablealias.[rowcErr_r], sourcetablealias.[rowcErr_i], sourcetablealias.[rowcErr_z], sourcetablealias.[colc_u], sourcetablealias.[colc_g], sourcetablealias.[colc_r], sourcetablealias.[colc_i], sourcetablealias.[colc_z], sourcetablealias.[colcErr_u], sourcetablealias.[colcErr_g], sourcetablealias.[colcErr_r], sourcetablealias.[colcErr_i], sourcetablealias.[colcErr_z], sourcetablealias.[sky_u], sourcetablealias.[sky_g], sourcetablealias.[sky_r], sourcetablealias.[sky_i], sourcetablealias.[sky_z], sourcetablealias.[skyErr_u], sourcetablealias.[skyErr_g], sourcetablealias.[skyErr_r], sourcetablealias.[skyErr_i], sourcetablealias.[skyErr_z], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[psfMagErr_u], sourcetablealias.[psfMagErr_g], sourcetablealias.[psfMagErr_r], sourcetablealias.[psfMagErr_i], sourcetablealias.[psfMagErr_z], sourcetablealias.[fiberMag_u], sourcetablealias.[fiberMag_g], sourcetablealias.[fiberMag_r], sourcetablealias.[fiberMag_i], sourcetablealias.[fiberMag_z], sourcetablealias.[fiberMagErr_u], sourcetablealias.[fiberMagErr_g], sourcetablealias.[fiberMagErr_r], sourcetablealias.[fiberMagErr_i], sourcetablealias.[fiberMagErr_z], sourcetablealias.[petroMag_u], sourcetablealias.[petroMag_g], sourcetablealias.[petroMag_r], sourcetablealias.[petroMag_i], sourcetablealias.[petroMag_z], sourcetablealias.[petroMagErr_u], sourcetablealias.[petroMagErr_g], sourcetablealias.[petroMagErr_r], sourcetablealias.[petroMagErr_i], sourcetablealias.[petroMagErr_z], sourcetablealias.[petroRad_u], sourcetablealias.[petroRad_g], sourcetablealias.[petroRad_r], sourcetablealias.[petroRad_i], sourcetablealias.[petroRad_z], sourcetablealias.[petroRadErr_u], sourcetablealias.[petroRadErr_g], sourcetablealias.[petroRadErr_r], sourcetablealias.[petroRadErr_i], sourcetablealias.[petroRadErr_z], sourcetablealias.[petroR50_u], sourcetablealias.[petroR50_g], sourcetablealias.[petroR50_r], sourcetablealias.[petroR50_i], sourcetablealias.[petroR50_z], sourcetablealias.[petroR50Err_u], sourcetablealias.[petroR50Err_g], sourcetablealias.[petroR50Err_r], sourcetablealias.[petroR50Err_i], sourcetablealias.[petroR50Err_z], sourcetablealias.[petroR90_u], sourcetablealias.[petroR90_g], sourcetablealias.[petroR90_r], sourcetablealias.[petroR90_i], sourcetablealias.[petroR90_z], sourcetablealias.[petroR90Err_u], sourcetablealias.[petroR90Err_g], sourcetablealias.[petroR90Err_r], sourcetablealias.[petroR90Err_i], sourcetablealias.[petroR90Err_z], sourcetablealias.[q_u], sourcetablealias.[q_g], sourcetablealias.[q_r], sourcetablealias.[q_i], sourcetablealias.[q_z], sourcetablealias.[qErr_u], sourcetablealias.[qErr_g], sourcetablealias.[qErr_r], sourcetablealias.[qErr_i], sourcetablealias.[qErr_z], sourcetablealias.[u_u], sourcetablealias.[u_g], sourcetablealias.[u_r], sourcetablealias.[u_i], sourcetablealias.[u_z], sourcetablealias.[uErr_u], sourcetablealias.[uErr_g], sourcetablealias.[uErr_r], sourcetablealias.[uErr_i], sourcetablealias.[uErr_z], sourcetablealias.[mE1_u], sourcetablealias.[mE1_g], sourcetablealias.[mE1_r], sourcetablealias.[mE1_i], sourcetablealias.[mE1_z], sourcetablealias.[mE2_u], sourcetablealias.[mE2_g], sourcetablealias.[mE2_r], sourcetablealias.[mE2_i], sourcetablealias.[mE2_z], sourcetablealias.[mE1E1Err_u], sourcetablealias.[mE1E1Err_g], sourcetablealias.[mE1E1Err_r], sourcetablealias.[mE1E1Err_i], sourcetablealias.[mE1E1Err_z], sourcetablealias.[mE1E2Err_u], sourcetablealias.[mE1E2Err_g], sourcetablealias.[mE1E2Err_r], sourcetablealias.[mE1E2Err_i], sourcetablealias.[mE1E2Err_z], sourcetablealias.[mE2E2Err_u], sourcetablealias.[mE2E2Err_g], sourcetablealias.[mE2E2Err_r], sourcetablealias.[mE2E2Err_i], sourcetablealias.[mE2E2Err_z], sourcetablealias.[mRrCc_u], sourcetablealias.[mRrCc_g], sourcetablealias.[mRrCc_r], sourcetablealias.[mRrCc_i], sourcetablealias.[mRrCc_z], sourcetablealias.[mRrCcErr_u], sourcetablealias.[mRrCcErr_g], sourcetablealias.[mRrCcErr_r], sourcetablealias.[mRrCcErr_i], sourcetablealias.[mRrCcErr_z], sourcetablealias.[mCr4_u], sourcetablealias.[mCr4_g], sourcetablealias.[mCr4_r], sourcetablealias.[mCr4_i], sourcetablealias.[mCr4_z], sourcetablealias.[mE1PSF_u], sourcetablealias.[mE1PSF_g], sourcetablealias.[mE1PSF_r], sourcetablealias.[mE1PSF_i], sourcetablealias.[mE1PSF_z], sourcetablealias.[mE2PSF_u], sourcetablealias.[mE2PSF_g], sourcetablealias.[mE2PSF_r], sourcetablealias.[mE2PSF_i], sourcetablealias.[mE2PSF_z], sourcetablealias.[mRrCcPSF_u], sourcetablealias.[mRrCcPSF_g], sourcetablealias.[mRrCcPSF_r], sourcetablealias.[mRrCcPSF_i], sourcetablealias.[mRrCcPSF_z], sourcetablealias.[mCr4PSF_u], sourcetablealias.[mCr4PSF_g], sourcetablealias.[mCr4PSF_r], sourcetablealias.[mCr4PSF_i], sourcetablealias.[mCr4PSF_z], sourcetablealias.[isoRowc_u], sourcetablealias.[isoRowc_g], sourcetablealias.[isoRowc_r], sourcetablealias.[isoRowc_i], sourcetablealias.[isoRowc_z], sourcetablealias.[isoRowcErr_u], sourcetablealias.[isoRowcErr_g], sourcetablealias.[isoRowcErr_r], sourcetablealias.[isoRowcErr_i], sourcetablealias.[isoRowcErr_z], sourcetablealias.[isoRowcGrad_u], sourcetablealias.[isoRowcGrad_g], sourcetablealias.[isoRowcGrad_r], sourcetablealias.[isoRowcGrad_i], sourcetablealias.[isoRowcGrad_z], sourcetablealias.[isoColc_u], sourcetablealias.[isoColc_g], sourcetablealias.[isoColc_r], sourcetablealias.[isoColc_i], sourcetablealias.[isoColc_z], sourcetablealias.[isoColcErr_u], sourcetablealias.[isoColcErr_g], sourcetablealias.[isoColcErr_r], sourcetablealias.[isoColcErr_i], sourcetablealias.[isoColcErr_z], sourcetablealias.[isoColcGrad_u], sourcetablealias.[isoColcGrad_g], sourcetablealias.[isoColcGrad_r], sourcetablealias.[isoColcGrad_i], sourcetablealias.[isoColcGrad_z], sourcetablealias.[isoA_u], sourcetablealias.[isoA_g], sourcetablealias.[isoA_r], sourcetablealias.[isoA_i], sourcetablealias.[isoA_z], sourcetablealias.[isoAErr_u], sourcetablealias.[isoAErr_g], sourcetablealias.[isoAErr_r], sourcetablealias.[isoAErr_i], sourcetablealias.[isoAErr_z], sourcetablealias.[isoB_u], sourcetablealias.[isoB_g], sourcetablealias.[isoB_r], sourcetablealias.[isoB_i], sourcetablealias.[isoB_z], sourcetablealias.[isoBErr_u], sourcetablealias.[isoBErr_g], sourcetablealias.[isoBErr_r], sourcetablealias.[isoBErr_i], sourcetablealias.[isoBErr_z], sourcetablealias.[isoAGrad_u], sourcetablealias.[isoAGrad_g], sourcetablealias.[isoAGrad_r], sourcetablealias.[isoAGrad_i], sourcetablealias.[isoAGrad_z], sourcetablealias.[isoBGrad_u], sourcetablealias.[isoBGrad_g], sourcetablealias.[isoBGrad_r], sourcetablealias.[isoBGrad_i], sourcetablealias.[isoBGrad_z], sourcetablealias.[isoPhi_u], sourcetablealias.[isoPhi_g], sourcetablealias.[isoPhi_r], sourcetablealias.[isoPhi_i], sourcetablealias.[isoPhi_z], sourcetablealias.[isoPhiErr_u], sourcetablealias.[isoPhiErr_g], sourcetablealias.[isoPhiErr_r], sourcetablealias.[isoPhiErr_i], sourcetablealias.[isoPhiErr_z], sourcetablealias.[isoPhiGrad_u], sourcetablealias.[isoPhiGrad_g], sourcetablealias.[isoPhiGrad_r], sourcetablealias.[isoPhiGrad_i], sourcetablealias.[isoPhiGrad_z], sourcetablealias.[deVRad_u], sourcetablealias.[deVRad_g], sourcetablealias.[deVRad_r], sourcetablealias.[deVRad_i], sourcetablealias.[deVRad_z], sourcetablealias.[deVRadErr_u], sourcetablealias.[deVRadErr_g], sourcetablealias.[deVRadErr_r], sourcetablealias.[deVRadErr_i], sourcetablealias.[deVRadErr_z], sourcetablealias.[deVAB_u], sourcetablealias.[deVAB_g], sourcetablealias.[deVAB_r], sourcetablealias.[deVAB_i], sourcetablealias.[deVAB_z], sourcetablealias.[deVABErr_u], sourcetablealias.[deVABErr_g], sourcetablealias.[deVABErr_r], sourcetablealias.[deVABErr_i], sourcetablealias.[deVABErr_z], sourcetablealias.[deVPhi_u], sourcetablealias.[deVPhi_g], sourcetablealias.[deVPhi_r], sourcetablealias.[deVPhi_i], sourcetablealias.[deVPhi_z], sourcetablealias.[deVPhiErr_u], sourcetablealias.[deVPhiErr_g], sourcetablealias.[deVPhiErr_r], sourcetablealias.[deVPhiErr_i], sourcetablealias.[deVPhiErr_z], sourcetablealias.[deVMag_u], sourcetablealias.[deVMag_g], sourcetablealias.[deVMag_r], sourcetablealias.[deVMag_i], sourcetablealias.[deVMag_z], sourcetablealias.[deVMagErr_u], sourcetablealias.[deVMagErr_g], sourcetablealias.[deVMagErr_r], sourcetablealias.[deVMagErr_i], sourcetablealias.[deVMagErr_z], sourcetablealias.[expRad_u], sourcetablealias.[expRad_g], sourcetablealias.[expRad_r], sourcetablealias.[expRad_i], sourcetablealias.[expRad_z], sourcetablealias.[expRadErr_u], sourcetablealias.[expRadErr_g], sourcetablealias.[expRadErr_r], sourcetablealias.[expRadErr_i], sourcetablealias.[expRadErr_z], sourcetablealias.[expAB_u], sourcetablealias.[expAB_g], sourcetablealias.[expAB_r], sourcetablealias.[expAB_i], sourcetablealias.[expAB_z], sourcetablealias.[expABErr_u], sourcetablealias.[expABErr_g], sourcetablealias.[expABErr_r], sourcetablealias.[expABErr_i], sourcetablealias.[expABErr_z], sourcetablealias.[expPhi_u], sourcetablealias.[expPhi_g], sourcetablealias.[expPhi_r], sourcetablealias.[expPhi_i], sourcetablealias.[expPhi_z], sourcetablealias.[expPhiErr_u], sourcetablealias.[expPhiErr_g], sourcetablealias.[expPhiErr_r], sourcetablealias.[expPhiErr_i], sourcetablealias.[expPhiErr_z], sourcetablealias.[expMag_u], sourcetablealias.[expMag_g], sourcetablealias.[expMag_r], sourcetablealias.[expMag_i], sourcetablealias.[expMag_z], sourcetablealias.[expMagErr_u], sourcetablealias.[expMagErr_g], sourcetablealias.[expMagErr_r], sourcetablealias.[expMagErr_i], sourcetablealias.[expMagErr_z], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[modelMagErr_u], sourcetablealias.[modelMagErr_g], sourcetablealias.[modelMagErr_r], sourcetablealias.[modelMagErr_i], sourcetablealias.[modelMagErr_z], sourcetablealias.[texture_u], sourcetablealias.[texture_g], sourcetablealias.[texture_r], sourcetablealias.[texture_i], sourcetablealias.[texture_z], sourcetablealias.[lnLStar_u], sourcetablealias.[lnLStar_g], sourcetablealias.[lnLStar_r], sourcetablealias.[lnLStar_i], sourcetablealias.[lnLStar_z], sourcetablealias.[lnLExp_u], sourcetablealias.[lnLExp_g], sourcetablealias.[lnLExp_r], sourcetablealias.[lnLExp_i], sourcetablealias.[lnLExp_z], sourcetablealias.[lnLDeV_u], sourcetablealias.[lnLDeV_g], sourcetablealias.[lnLDeV_r], sourcetablealias.[lnLDeV_i], sourcetablealias.[lnLDeV_z], sourcetablealias.[fracDeV_u], sourcetablealias.[fracDeV_g], sourcetablealias.[fracDeV_r], sourcetablealias.[fracDeV_i], sourcetablealias.[fracDeV_z], sourcetablealias.[flags_u], sourcetablealias.[flags_g], sourcetablealias.[flags_r], sourcetablealias.[flags_i], sourcetablealias.[flags_z], sourcetablealias.[type_u], sourcetablealias.[type_g], sourcetablealias.[type_r], sourcetablealias.[type_i], sourcetablealias.[type_z], sourcetablealias.[probPSF_u], sourcetablealias.[probPSF_g], sourcetablealias.[probPSF_r], sourcetablealias.[probPSF_i], sourcetablealias.[probPSF_z], sourcetablealias.[status], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[offsetRa_u], sourcetablealias.[offsetRa_g], sourcetablealias.[offsetRa_r], sourcetablealias.[offsetRa_i], sourcetablealias.[offsetRa_z], sourcetablealias.[offsetDec_u], sourcetablealias.[offsetDec_g], sourcetablealias.[offsetDec_r], sourcetablealias.[offsetDec_i], sourcetablealias.[offsetDec_z], sourcetablealias.[primTarget], sourcetablealias.[secTarget], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[priority], sourcetablealias.[rho], sourcetablealias.[nProf_u], sourcetablealias.[nProf_g], sourcetablealias.[nProf_r], sourcetablealias.[nProf_i], sourcetablealias.[nProf_z], sourcetablealias.[loadVersion], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[fieldID], sourcetablealias.[parentID], sourcetablealias.[specObjID], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z], sourcetablealias.[err_u], sourcetablealias.[err_g], sourcetablealias.[err_r], sourcetablealias.[err_i], sourcetablealias.[err_z], sourcetablealias.[dered_u], sourcetablealias.[dered_g], sourcetablealias.[dered_r], sourcetablealias.[dered_i], sourcetablealias.[dered_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[TargPhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'TargRunQA' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TargRunQA] WITH (TABLOCKX)
    ([fieldID], [skyVersion], [first], [run], [rerun], [camcol], [field], [fieldQall], [opdbq], [appsfq], [pcmedq], [pcrmsq], [PSFwcondq], [pc_s], [pc_w], [pc_x], [pc_y], [rmsPC_s], [rmsPC_w], [rmsPC_x], [rmsPC_y], [medAp7mPSF_u], [medAp7mPSF_g], [medAp7mPSF_r], [medAp7mPSF_i], [medAp7mPSF_z], [rmsAp7mPSF_u], [rmsAp7mPSF_g], [rmsAp7mPSF_r], [rmsAp7mPSF_i], [rmsAp7mPSF_z], [seeing_u], [seeing_g], [seeing_r], [seeing_i], [seeing_z])
 SELECT sourcetablealias.[fieldID], sourcetablealias.[skyVersion], sourcetablealias.[first], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[fieldQall], sourcetablealias.[opdbq], sourcetablealias.[appsfq], sourcetablealias.[pcmedq], sourcetablealias.[pcrmsq], sourcetablealias.[PSFwcondq], sourcetablealias.[pc_s], sourcetablealias.[pc_w], sourcetablealias.[pc_x], sourcetablealias.[pc_y], sourcetablealias.[rmsPC_s], sourcetablealias.[rmsPC_w], sourcetablealias.[rmsPC_x], sourcetablealias.[rmsPC_y], sourcetablealias.[medAp7mPSF_u], sourcetablealias.[medAp7mPSF_g], sourcetablealias.[medAp7mPSF_r], sourcetablealias.[medAp7mPSF_i], sourcetablealias.[medAp7mPSF_z], sourcetablealias.[rmsAp7mPSF_u], sourcetablealias.[rmsAp7mPSF_g], sourcetablealias.[rmsAp7mPSF_r], sourcetablealias.[rmsAp7mPSF_i], sourcetablealias.[rmsAp7mPSF_z], sourcetablealias.[seeing_u], sourcetablealias.[seeing_g], sourcetablealias.[seeing_r], sourcetablealias.[seeing_i], sourcetablealias.[seeing_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[TargRunQA] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'TileAll' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TileAll] WITH (TABLOCKX)
    ([tile], [tileRun], [raCen], [decCen], [htmID], [cx], [cy], [cz], [untiled], [nTargets], [programType], [programName], [extinction_u], [extinction_g], [extinction_r], [extinction_i], [extinction_z], [completeTileVersion], [loadVersion])
 SELECT sourcetablealias.[tile], sourcetablealias.[tileRun], sourcetablealias.[raCen], sourcetablealias.[decCen], sourcetablealias.[htmID], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[untiled], sourcetablealias.[nTargets], sourcetablealias.[programType], sourcetablealias.[programName], sourcetablealias.[extinction_u], sourcetablealias.[extinction_g], sourcetablealias.[extinction_r], sourcetablealias.[extinction_i], sourcetablealias.[extinction_z], sourcetablealias.[completeTileVersion], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TileAll] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'TiledTargetAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[tile] smallint, [targetID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[tile], sourcetablealias.[targetID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[TiledTargetAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [tile], [targetID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TiledTargetAll] WITH (TABLOCKX)
	([tile], [targetID], [ra], [dec], [htmID], [zoneID], [cx], [cy], [cz], [objType], [duplicate], [untiled], [loadVersion])
 SELECT sourcetablealias.[tile], sourcetablealias.[targetID], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[objType], sourcetablealias.[duplicate], sourcetablealias.[untiled], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TiledTargetAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.tile = sourcetablealias.tile AND ##temporaryidlist.targetID = sourcetablealias.targetID
	;


GO

-- SUBSAMPLING TABLE 'TilingGeometry' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TilingGeometry] WITH (TABLOCKX)
    ([tilingGeometryID], [tileRun], [stripe], [nsbx], [isMask], [coordType], [lambdamu_0], [lambdamu_1], [etanu_0], [etanu_1], [lambdaLimit_0], [lambdaLimit_1], [targetVersion], [firstArea], [loadVersion])
 SELECT sourcetablealias.[tilingGeometryID], sourcetablealias.[tileRun], sourcetablealias.[stripe], sourcetablealias.[nsbx], sourcetablealias.[isMask], sourcetablealias.[coordType], sourcetablealias.[lambdamu_0], sourcetablealias.[lambdamu_1], sourcetablealias.[etanu_0], sourcetablealias.[etanu_1], sourcetablealias.[lambdaLimit_0], sourcetablealias.[lambdaLimit_1], sourcetablealias.[targetVersion], sourcetablealias.[firstArea], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TilingGeometry] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'TilingInfo' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[tileRun] smallint, [targetID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[tileRun], sourcetablealias.[targetID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[TilingInfo] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [tileRun], [targetID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TilingInfo] WITH (TABLOCKX)
	([tileRun], [tid], [tile], [tiPriority], [tiMask], [collisionGroupID], [targetID], [loadVersion])
 SELECT sourcetablealias.[tileRun], sourcetablealias.[tid], sourcetablealias.[tile], sourcetablealias.[tiPriority], sourcetablealias.[tiMask], sourcetablealias.[collisionGroupID], sourcetablealias.[targetID], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TilingInfo] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.tileRun = sourcetablealias.tileRun AND ##temporaryidlist.targetID = sourcetablealias.targetID
	;


GO

-- SUBSAMPLING TABLE 'TilingNote' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TilingNote] WITH (TABLOCKX)
    ([tilingNoteID], [tileRun], [tilingNote])
 SELECT sourcetablealias.[tilingNoteID], sourcetablealias.[tileRun], sourcetablealias.[tilingNote]
 FROM   [SkyNode_SDSSDR7].[dbo].[TilingNote] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'TilingRun' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[TilingRun] WITH (TABLOCKX)
    ([tileRun], [tileVersion], [tilepId], [programType], [programName], [primTargetMask], [secTargetMask], [loadVersion])
 SELECT sourcetablealias.[tileRun], sourcetablealias.[tileVersion], sourcetablealias.[tilepId], sourcetablealias.[programType], sourcetablealias.[programName], sourcetablealias.[primTargetMask], sourcetablealias.[secTargetMask], sourcetablealias.[loadVersion]
 FROM   [SkyNode_SDSSDR7].[dbo].[TilingRun] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'UberAstro' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[UberAstro] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[UberAstro] WITH (TABLOCKX)
	([objID], [conv_u], [conv_g], [conv_r], [conv_i], [conv_z], [run], [rerun], [camcol], [field], [obj], [conv_status_u], [conv_status_g], [conv_status_r], [conv_status_i], [conv_status_z], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [l], [b], [offsetRa_u], [offsetRa_g], [offsetRa_r], [offsetRa_i], [offsetRa_z], [offsetDec_u], [offsetDec_g], [offsetDec_r], [offsetDec_i], [offsetDec_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[conv_u], sourcetablealias.[conv_g], sourcetablealias.[conv_r], sourcetablealias.[conv_i], sourcetablealias.[conv_z], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[conv_status_u], sourcetablealias.[conv_status_g], sourcetablealias.[conv_status_r], sourcetablealias.[conv_status_i], sourcetablealias.[conv_status_z], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[l], sourcetablealias.[b], sourcetablealias.[offsetRa_u], sourcetablealias.[offsetRa_g], sourcetablealias.[offsetRa_r], sourcetablealias.[offsetRa_i], sourcetablealias.[offsetRa_z], sourcetablealias.[offsetDec_u], sourcetablealias.[offsetDec_g], sourcetablealias.[offsetDec_r], sourcetablealias.[offsetDec_i], sourcetablealias.[offsetDec_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[UberAstro] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'UberCal' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[UberCal] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[UberCal] WITH (TABLOCKX)
	([objID], [conv_u], [conv_g], [conv_r], [conv_i], [conv_z], [psfMag_u], [psfMag_g], [psfMag_r], [psfMag_i], [psfMag_z], [petroMag_u], [petroMag_g], [petroMag_r], [petroMag_i], [petroMag_z], [modelMag_u], [modelMag_g], [modelMag_r], [modelMag_i], [modelMag_z], [calibStatus_u], [calibStatus_g], [calibStatus_r], [calibStatus_i], [calibStatus_z])
 SELECT sourcetablealias.[objID], sourcetablealias.[conv_u], sourcetablealias.[conv_g], sourcetablealias.[conv_r], sourcetablealias.[conv_i], sourcetablealias.[conv_z], sourcetablealias.[psfMag_u], sourcetablealias.[psfMag_g], sourcetablealias.[psfMag_r], sourcetablealias.[psfMag_i], sourcetablealias.[psfMag_z], sourcetablealias.[petroMag_u], sourcetablealias.[petroMag_g], sourcetablealias.[petroMag_r], sourcetablealias.[petroMag_i], sourcetablealias.[petroMag_z], sourcetablealias.[modelMag_u], sourcetablealias.[modelMag_g], sourcetablealias.[modelMag_r], sourcetablealias.[modelMag_i], sourcetablealias.[modelMag_z], sourcetablealias.[calibStatus_u], sourcetablealias.[calibStatus_g], sourcetablealias.[calibStatus_r], sourcetablealias.[calibStatus_i], sourcetablealias.[calibStatus_z]
 FROM   [SkyNode_SDSSDR7].[dbo].[UberCal] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

-- SUBSAMPLING TABLE 'XCRedshift' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[xcRedShiftID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[xcRedShiftID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_SDSSDR7].[dbo].[XCRedshift] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [xcRedShiftID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_SDSSDR7_STAT].[dbo].[XCRedshift] WITH (TABLOCKX)
	([xcRedShiftID], [tempNo], [peakNo], [shift], [z], [zErr], [r], [zConf], [height], [width], [widthErr], [delta], [rms], [specObjID])
 SELECT sourcetablealias.[xcRedShiftID], sourcetablealias.[tempNo], sourcetablealias.[peakNo], sourcetablealias.[shift], sourcetablealias.[z], sourcetablealias.[zErr], sourcetablealias.[r], sourcetablealias.[zConf], sourcetablealias.[height], sourcetablealias.[width], sourcetablealias.[widthErr], sourcetablealias.[delta], sourcetablealias.[rms], sourcetablealias.[specObjID]
 FROM   [SkyNode_SDSSDR7].[dbo].[XCRedshift] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.xcRedShiftID = sourcetablealias.xcRedShiftID
	;


GO

