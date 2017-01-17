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
	FROM [SkyNode_ACVS].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_ACVS_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([objID], [objName], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [PER], [HJD0], [VMAX], [VAMP], [TYPE], [GCVS_ID], [GCVS_TYPE], [IR12], [IR25], [IR60], [IR100], [J], [H], [K], [V_IR12], [V_J], [V_H], [V_K], [J_H], [H_K])
 SELECT sourcetablealias.[objID], sourcetablealias.[objName], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[PER], sourcetablealias.[HJD0], sourcetablealias.[VMAX], sourcetablealias.[VAMP], sourcetablealias.[TYPE], sourcetablealias.[GCVS_ID], sourcetablealias.[GCVS_TYPE], sourcetablealias.[IR12], sourcetablealias.[IR25], sourcetablealias.[IR60], sourcetablealias.[IR100], sourcetablealias.[J], sourcetablealias.[H], sourcetablealias.[K], sourcetablealias.[V_IR12], sourcetablealias.[V_J], sourcetablealias.[V_H], sourcetablealias.[V_K], sourcetablealias.[J_H], sourcetablealias.[H_K]
 FROM   [SkyNode_ACVS].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

