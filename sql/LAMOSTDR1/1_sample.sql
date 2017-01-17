-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[obsid] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[obsid], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_LAMOSTDR1].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [obsid]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_LAMOSTDR1_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [obsid], [designation], [obsdate], [lmjd], [planid], [spid], [fiberid], [ra], [dec], [snru], [snrg], [snrr], [snri], [snrz], [objtype], [class], [subclass], [magtype], [mag1], [mag2], [mag3], [mag4], [mag5], [mag6], [mag7], [tsource], [fibertype], [tfrom], [t_info], [rv], [z], [z_err])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[obsid], sourcetablealias.[designation], sourcetablealias.[obsdate], sourcetablealias.[lmjd], sourcetablealias.[planid], sourcetablealias.[spid], sourcetablealias.[fiberid], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[snru], sourcetablealias.[snrg], sourcetablealias.[snrr], sourcetablealias.[snri], sourcetablealias.[snrz], sourcetablealias.[objtype], sourcetablealias.[class], sourcetablealias.[subclass], sourcetablealias.[magtype], sourcetablealias.[mag1], sourcetablealias.[mag2], sourcetablealias.[mag3], sourcetablealias.[mag4], sourcetablealias.[mag5], sourcetablealias.[mag6], sourcetablealias.[mag7], sourcetablealias.[tsource], sourcetablealias.[fibertype], sourcetablealias.[tfrom], sourcetablealias.[t_info], sourcetablealias.[rv], sourcetablealias.[z], sourcetablealias.[z_err]
 FROM   [SkyNode_LAMOSTDR1].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[obsid] = sourcetablealias.[obsid]
	;


GO

