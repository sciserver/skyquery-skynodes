-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[id_IAU] char(16)
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[id_IAU], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_VIPERSPDR2].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [id_IAU]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_VIPERSPDR2_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [id_IAU], [num], [id_T07], [ra], [dec], [selmag], [errselmag], [u], [g], [r], [i], [z], [erru], [errg], [errr], [erri], [errz], [u_T07], [g_T07], [r_T07], [i_T07], [iy_T07], [z_T07], [erru_T07], [errg_T07], [errr_T07], [erri_T07], [erriy_T07], [errz_T07], [K_video], [Ks], [FUV], [NUV], [errK_video], [errKs], [errFUV], [errNUV], [DeltaUG], [DeltaGR], [DeltaRI], [ebv], [r2], [r2_T07], [classFlag], [photoMask], [spectroMask])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[id_IAU], sourcetablealias.[num], sourcetablealias.[id_T07], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[selmag], sourcetablealias.[errselmag], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z], sourcetablealias.[erru], sourcetablealias.[errg], sourcetablealias.[errr], sourcetablealias.[erri], sourcetablealias.[errz], sourcetablealias.[u_T07], sourcetablealias.[g_T07], sourcetablealias.[r_T07], sourcetablealias.[i_T07], sourcetablealias.[iy_T07], sourcetablealias.[z_T07], sourcetablealias.[erru_T07], sourcetablealias.[errg_T07], sourcetablealias.[errr_T07], sourcetablealias.[erri_T07], sourcetablealias.[erriy_T07], sourcetablealias.[errz_T07], sourcetablealias.[K_video], sourcetablealias.[Ks], sourcetablealias.[FUV], sourcetablealias.[NUV], sourcetablealias.[errK_video], sourcetablealias.[errKs], sourcetablealias.[errFUV], sourcetablealias.[errNUV], sourcetablealias.[DeltaUG], sourcetablealias.[DeltaGR], sourcetablealias.[DeltaRI], sourcetablealias.[ebv], sourcetablealias.[r2], sourcetablealias.[r2_T07], sourcetablealias.[classFlag], sourcetablealias.[photoMask], sourcetablealias.[spectroMask]
 FROM   [SkyNode_VIPERSPDR2].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[id_IAU] = sourcetablealias.[id_IAU]
	;


GO

-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[id_IAU] char(16)
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[id_IAU], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_VIPERSPDR2].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [id_IAU]
 FROM temporaryidlistquery
 WHERE randomnumber < 1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_VIPERSPDR2_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [id_IAU], [num], [ra], [dec], [selmag], [errselmag], [pointing], [quadrant], [zspec], [zflg], [norm], [epoch], [photoMask], [tsr], [ssr], [classFlag])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[id_IAU], sourcetablealias.[num], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[selmag], sourcetablealias.[errselmag], sourcetablealias.[pointing], sourcetablealias.[quadrant], sourcetablealias.[zspec], sourcetablealias.[zflg], sourcetablealias.[norm], sourcetablealias.[epoch], sourcetablealias.[photoMask], sourcetablealias.[tsr], sourcetablealias.[ssr], sourcetablealias.[classFlag]
 FROM   [SkyNode_VIPERSPDR2].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[id_IAU] = sourcetablealias.[id_IAU]
	;


GO

