-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[MGC] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[MGC], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_MGC].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [MGC]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_MGC_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [MGC], [MGCFN], [CCD], [Xpos], [Ypos], [RA], [DEC], [a], [b], [PA], [HLRad], [FWHM], [Bkgrnd], [Bmag], [Bmagc], [Bmu], [Qual], [Stel], [Class], [xReg], [NSDSS], [SDSSid], [SDSSrun], [SDSSrun2], [SDSScam], [SDSSfld], [RA1deg], [DE1deg], [psfUmag], [psfGmag], [psfRmag], [psfImag], [psfZmag], [petUmag], [petGmag], [petRmag], [petImag], [petZmag], [modUmag], [modGmag], [modRmag], [modImag], [modZmag], [galUext], [galGext], [galRext], [galIext], [galZext], [R50U], [R50G], [R50R], [R50I], [R50Z], [MType], [Class1], [SpClass], [Class2], [N2dFGRS], [twodFGRS], [ID2dFGRS], [RA2deg], [DE2deg], [UKST], [bJmag], [bJmagc], [bJmagS], [RmagS], [Class3], [Class4], [twoQZ], [RA3deg], [DE3deg], [UKST2qz], [bJmag2], [U_bJ], [bJ_R], [Ext_B_V], [N2qz], [T2qz], [Class5], [NNED], [NEDname], [RA4deg], [DE4deg], [NEDID], [Class6], [PFr], [RA5deg], [DE5deg], [Rmag], [Kmag], [J_K], [LSBG], [RA6deg], [DE6deg], [BTOT], [SuBr], [SuBreff], [Reff], [z1], [q_z1], [z2], [q_z2], [z3], [q_z3], [z4], [q_z4], [z5], [q_z5], [z6], [q_z6], [z7], [q_z7], [r_z], [z], [q_z], [Nsp])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[MGC], sourcetablealias.[MGCFN], sourcetablealias.[CCD], sourcetablealias.[Xpos], sourcetablealias.[Ypos], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[a], sourcetablealias.[b], sourcetablealias.[PA], sourcetablealias.[HLRad], sourcetablealias.[FWHM], sourcetablealias.[Bkgrnd], sourcetablealias.[Bmag], sourcetablealias.[Bmagc], sourcetablealias.[Bmu], sourcetablealias.[Qual], sourcetablealias.[Stel], sourcetablealias.[Class], sourcetablealias.[xReg], sourcetablealias.[NSDSS], sourcetablealias.[SDSSid], sourcetablealias.[SDSSrun], sourcetablealias.[SDSSrun2], sourcetablealias.[SDSScam], sourcetablealias.[SDSSfld], sourcetablealias.[RA1deg], sourcetablealias.[DE1deg], sourcetablealias.[psfUmag], sourcetablealias.[psfGmag], sourcetablealias.[psfRmag], sourcetablealias.[psfImag], sourcetablealias.[psfZmag], sourcetablealias.[petUmag], sourcetablealias.[petGmag], sourcetablealias.[petRmag], sourcetablealias.[petImag], sourcetablealias.[petZmag], sourcetablealias.[modUmag], sourcetablealias.[modGmag], sourcetablealias.[modRmag], sourcetablealias.[modImag], sourcetablealias.[modZmag], sourcetablealias.[galUext], sourcetablealias.[galGext], sourcetablealias.[galRext], sourcetablealias.[galIext], sourcetablealias.[galZext], sourcetablealias.[R50U], sourcetablealias.[R50G], sourcetablealias.[R50R], sourcetablealias.[R50I], sourcetablealias.[R50Z], sourcetablealias.[MType], sourcetablealias.[Class1], sourcetablealias.[SpClass], sourcetablealias.[Class2], sourcetablealias.[N2dFGRS], sourcetablealias.[twodFGRS], sourcetablealias.[ID2dFGRS], sourcetablealias.[RA2deg], sourcetablealias.[DE2deg], sourcetablealias.[UKST], sourcetablealias.[bJmag], sourcetablealias.[bJmagc], sourcetablealias.[bJmagS], sourcetablealias.[RmagS], sourcetablealias.[Class3], sourcetablealias.[Class4], sourcetablealias.[twoQZ], sourcetablealias.[RA3deg], sourcetablealias.[DE3deg], sourcetablealias.[UKST2qz], sourcetablealias.[bJmag2], sourcetablealias.[U_bJ], sourcetablealias.[bJ_R], sourcetablealias.[Ext_B_V], sourcetablealias.[N2qz], sourcetablealias.[T2qz], sourcetablealias.[Class5], sourcetablealias.[NNED], sourcetablealias.[NEDname], sourcetablealias.[RA4deg], sourcetablealias.[DE4deg], sourcetablealias.[NEDID], sourcetablealias.[Class6], sourcetablealias.[PFr], sourcetablealias.[RA5deg], sourcetablealias.[DE5deg], sourcetablealias.[Rmag], sourcetablealias.[Kmag], sourcetablealias.[J_K], sourcetablealias.[LSBG], sourcetablealias.[RA6deg], sourcetablealias.[DE6deg], sourcetablealias.[BTOT], sourcetablealias.[SuBr], sourcetablealias.[SuBreff], sourcetablealias.[Reff], sourcetablealias.[z1], sourcetablealias.[q_z1], sourcetablealias.[z2], sourcetablealias.[q_z2], sourcetablealias.[z3], sourcetablealias.[q_z3], sourcetablealias.[z4], sourcetablealias.[q_z4], sourcetablealias.[z5], sourcetablealias.[q_z5], sourcetablealias.[z6], sourcetablealias.[q_z6], sourcetablealias.[z7], sourcetablealias.[q_z7], sourcetablealias.[r_z], sourcetablealias.[z], sourcetablealias.[q_z], sourcetablealias.[Nsp]
 FROM   [SkyNode_MGC].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[MGC] = sourcetablealias.[MGC]
	;


GO

