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
	FROM [SkyNode_CHANDRA].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_CHANDRA_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([objID], [CXO], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [ePos], [SN], [Fb], [lower_Fb], [upper_Fb], [Fw], [lower_Fw], [upper_Fw], [hr2], [lower_hr2], [upper_hr2], [hr1], [lower_hr1], [upper_hr1], [fc], [fe], [fs], [Vab], [Vib], [Vaw], [Viw])
 SELECT sourcetablealias.[objID], sourcetablealias.[CXO], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[ePos], sourcetablealias.[SN], sourcetablealias.[Fb], sourcetablealias.[lower_Fb], sourcetablealias.[upper_Fb], sourcetablealias.[Fw], sourcetablealias.[lower_Fw], sourcetablealias.[upper_Fw], sourcetablealias.[hr2], sourcetablealias.[lower_hr2], sourcetablealias.[upper_hr2], sourcetablealias.[hr1], sourcetablealias.[lower_hr1], sourcetablealias.[upper_hr1], sourcetablealias.[fc], sourcetablealias.[fe], sourcetablealias.[fs], sourcetablealias.[Vab], sourcetablealias.[Vib], sourcetablealias.[Vaw], sourcetablealias.[Viw]
 FROM   [SkyNode_CHANDRA].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

