-- SUBSAMPLING TABLE 'PhotoObj' ---

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
	FROM [SkyNode_COMBO17].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_COMBO17_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [objID], [RA], [DEC], [x_pos], [y_pos], [Rmag], [e_Rmag], [Ap_Rmag], [ApD_Rmag], [mu_max], [MajAxis], [MinAxis], [PA], [phot_flag], [var_flag], [stellarity], [MC_class], [MC_z], [e_MC_z], [MC_z2], [e_MC_z2], [MC_z_ml], [dl], [chi2red], [UjMag], [e_UjMag], [BjMag], [e_BjMag], [VjMag], [e_VjMag], [usMag], [e_usMag], [gsMag], [e_gsMag], [rsMag], [e_rsMag], [UbMag], [e_UbMag], [BbMag], [e_BbMag], [VbMag], [e_VbMag], [S280Mag], [e_S280Mag], [S145Mag], [e_S145Mag], [W420F_E], [e_W420F_E], [W462F_E], [e_W462F_E], [W485F_D], [e_W485F_D], [W518F_E], [e_W518F_E], [W571F_D], [e_W571F_D], [W571F_E], [e_W571F_E], [W571F_S], [e_W571F_S], [W604F_E], [e_W604F_E], [W646F_D], [e_W646F_D], [W696F_E], [e_W696F_E], [W753F_E], [e_W753F_E], [W815F_E], [e_W815F_E], [W815F_G], [e_W815F_G], [W815F_S], [e_W815F_S], [W856F_D], [e_W856F_D], [W914F_D], [e_W914F_D], [W914F_E], [e_W914F_E], [UF_F], [e_UF_F], [UF_G], [e_UF_G], [UF_S], [e_UF_S], [BF_D], [e_BF_D], [BF_F], [e_BF_F], [BF_S], [e_BF_S], [VF_D], [e_VF_D], [RF_D], [e_RF_D], [RF_E], [e_RF_E], [RF_F], [e_RF_F], [RF_G], [e_RF_G], [RF_S], [e_RF_S], [IF_D], [e_IF_D])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[x_pos], sourcetablealias.[y_pos], sourcetablealias.[Rmag], sourcetablealias.[e_Rmag], sourcetablealias.[Ap_Rmag], sourcetablealias.[ApD_Rmag], sourcetablealias.[mu_max], sourcetablealias.[MajAxis], sourcetablealias.[MinAxis], sourcetablealias.[PA], sourcetablealias.[phot_flag], sourcetablealias.[var_flag], sourcetablealias.[stellarity], sourcetablealias.[MC_class], sourcetablealias.[MC_z], sourcetablealias.[e_MC_z], sourcetablealias.[MC_z2], sourcetablealias.[e_MC_z2], sourcetablealias.[MC_z_ml], sourcetablealias.[dl], sourcetablealias.[chi2red], sourcetablealias.[UjMag], sourcetablealias.[e_UjMag], sourcetablealias.[BjMag], sourcetablealias.[e_BjMag], sourcetablealias.[VjMag], sourcetablealias.[e_VjMag], sourcetablealias.[usMag], sourcetablealias.[e_usMag], sourcetablealias.[gsMag], sourcetablealias.[e_gsMag], sourcetablealias.[rsMag], sourcetablealias.[e_rsMag], sourcetablealias.[UbMag], sourcetablealias.[e_UbMag], sourcetablealias.[BbMag], sourcetablealias.[e_BbMag], sourcetablealias.[VbMag], sourcetablealias.[e_VbMag], sourcetablealias.[S280Mag], sourcetablealias.[e_S280Mag], sourcetablealias.[S145Mag], sourcetablealias.[e_S145Mag], sourcetablealias.[W420F_E], sourcetablealias.[e_W420F_E], sourcetablealias.[W462F_E], sourcetablealias.[e_W462F_E], sourcetablealias.[W485F_D], sourcetablealias.[e_W485F_D], sourcetablealias.[W518F_E], sourcetablealias.[e_W518F_E], sourcetablealias.[W571F_D], sourcetablealias.[e_W571F_D], sourcetablealias.[W571F_E], sourcetablealias.[e_W571F_E], sourcetablealias.[W571F_S], sourcetablealias.[e_W571F_S], sourcetablealias.[W604F_E], sourcetablealias.[e_W604F_E], sourcetablealias.[W646F_D], sourcetablealias.[e_W646F_D], sourcetablealias.[W696F_E], sourcetablealias.[e_W696F_E], sourcetablealias.[W753F_E], sourcetablealias.[e_W753F_E], sourcetablealias.[W815F_E], sourcetablealias.[e_W815F_E], sourcetablealias.[W815F_G], sourcetablealias.[e_W815F_G], sourcetablealias.[W815F_S], sourcetablealias.[e_W815F_S], sourcetablealias.[W856F_D], sourcetablealias.[e_W856F_D], sourcetablealias.[W914F_D], sourcetablealias.[e_W914F_D], sourcetablealias.[W914F_E], sourcetablealias.[e_W914F_E], sourcetablealias.[UF_F], sourcetablealias.[e_UF_F], sourcetablealias.[UF_G], sourcetablealias.[e_UF_G], sourcetablealias.[UF_S], sourcetablealias.[e_UF_S], sourcetablealias.[BF_D], sourcetablealias.[e_BF_D], sourcetablealias.[BF_F], sourcetablealias.[e_BF_F], sourcetablealias.[BF_S], sourcetablealias.[e_BF_S], sourcetablealias.[VF_D], sourcetablealias.[e_VF_D], sourcetablealias.[RF_D], sourcetablealias.[e_RF_D], sourcetablealias.[RF_E], sourcetablealias.[e_RF_E], sourcetablealias.[RF_F], sourcetablealias.[e_RF_F], sourcetablealias.[RF_G], sourcetablealias.[e_RF_G], sourcetablealias.[RF_S], sourcetablealias.[e_RF_S], sourcetablealias.[IF_D], sourcetablealias.[e_IF_D]
 FROM   [SkyNode_COMBO17].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

