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
	FROM [SkyNode_VIPERSPDR1].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [id_IAU]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_VIPERSPDR1_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [id_IAU], [num], [ra], [dec], [selmag], [errselmag], [u], [g], [r], [i], [z], [erru], [errg], [errr], [erri], [errz], [u_T07], [g_T07], [r_T07], [i_T07], [iy_T07], [z_T07], [erru_T07], [errg_T07], [errr_T07], [erri_T07], [erriy_T07], [errz_T07], [DeltaUG], [DeltaGR], [DeltaRI], [E_BV], [r2], [r2_T07], [classFlag], [agnFlag], [photoMask], [spectroMask])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[id_IAU], sourcetablealias.[num], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[selmag], sourcetablealias.[errselmag], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z], sourcetablealias.[erru], sourcetablealias.[errg], sourcetablealias.[errr], sourcetablealias.[erri], sourcetablealias.[errz], sourcetablealias.[u_T07], sourcetablealias.[g_T07], sourcetablealias.[r_T07], sourcetablealias.[i_T07], sourcetablealias.[iy_T07], sourcetablealias.[z_T07], sourcetablealias.[erru_T07], sourcetablealias.[errg_T07], sourcetablealias.[errr_T07], sourcetablealias.[erri_T07], sourcetablealias.[erriy_T07], sourcetablealias.[errz_T07], sourcetablealias.[DeltaUG], sourcetablealias.[DeltaGR], sourcetablealias.[DeltaRI], sourcetablealias.[E_BV], sourcetablealias.[r2], sourcetablealias.[r2_T07], sourcetablealias.[classFlag], sourcetablealias.[agnFlag], sourcetablealias.[photoMask], sourcetablealias.[spectroMask]
 FROM   [SkyNode_VIPERSPDR1].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
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
	FROM [SkyNode_VIPERSPDR1].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [id_IAU]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_VIPERSPDR1_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [id_IAU], [num], [ra], [dec], [selmag], [errselmag], [pointing], [quadrant], [zflg], [zspec], [epoch], [photoMask], [tsr], [ssr])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[id_IAU], sourcetablealias.[num], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[selmag], sourcetablealias.[errselmag], sourcetablealias.[pointing], sourcetablealias.[quadrant], sourcetablealias.[zflg], sourcetablealias.[zspec], sourcetablealias.[epoch], sourcetablealias.[photoMask], sourcetablealias.[tsr], sourcetablealias.[ssr]
 FROM   [SkyNode_VIPERSPDR1].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[id_IAU] = sourcetablealias.[id_IAU]
	;


GO

