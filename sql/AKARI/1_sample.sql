-- SUBSAMPLING TABLE 'FIS' ---

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
	FROM [SkyNode_AKARI].[dbo].[FIS] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_AKARI_STAT].[dbo].[FIS] WITH (TABLOCKX)
	([objID], [OBJNAME], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [POSERRMJ], [POSERRMI], [POSERRPA], [FLUX65], [FLUX90], [FLUX140], [FLUX160], [FERR65], [FERR90], [FERR140], [FERR160], [FQUAL65], [FQUAL90], [FQUAL140], [FQUAL160], [FLAGS65], [FLAGS90], [FLAGS140], [FLAGS160], [NSCANC65], [NSCANC90], [NSCANC140], [NSCANC160], [NSCANP65], [NSCANP90], [NSCANP140], [NSCANP160], [MCONF65], [MCONF90], [MCONF140], [MCONF160], [NDENS])
 SELECT sourcetablealias.[objID], sourcetablealias.[OBJNAME], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[POSERRMJ], sourcetablealias.[POSERRMI], sourcetablealias.[POSERRPA], sourcetablealias.[FLUX65], sourcetablealias.[FLUX90], sourcetablealias.[FLUX140], sourcetablealias.[FLUX160], sourcetablealias.[FERR65], sourcetablealias.[FERR90], sourcetablealias.[FERR140], sourcetablealias.[FERR160], sourcetablealias.[FQUAL65], sourcetablealias.[FQUAL90], sourcetablealias.[FQUAL140], sourcetablealias.[FQUAL160], sourcetablealias.[FLAGS65], sourcetablealias.[FLAGS90], sourcetablealias.[FLAGS140], sourcetablealias.[FLAGS160], sourcetablealias.[NSCANC65], sourcetablealias.[NSCANC90], sourcetablealias.[NSCANC140], sourcetablealias.[NSCANC160], sourcetablealias.[NSCANP65], sourcetablealias.[NSCANP90], sourcetablealias.[NSCANP140], sourcetablealias.[NSCANP160], sourcetablealias.[MCONF65], sourcetablealias.[MCONF90], sourcetablealias.[MCONF140], sourcetablealias.[MCONF160], sourcetablealias.[NDENS]
 FROM   [SkyNode_AKARI].[dbo].[FIS] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

-- SUBSAMPLING TABLE 'IRC' ---

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
	FROM [SkyNode_AKARI].[dbo].[IRC] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_AKARI_STAT].[dbo].[IRC] WITH (TABLOCKX)
	([objID], [OBJNAME], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [POSERRMJ], [POSERRMI], [POSERRPA], [FLUX09], [FLUX18], [FERR09], [FERR18], [FQUAL09], [FQUAL18], [FLAGS09], [FLAGS18], [NSCANC09], [NSCANC18], [NSCANP09], [NSCANP18], [MCONF09], [MCONF18], [NDENS09], [NDENS18], [EXTENDED09], [EXTENDED18], [MEAN_AB09], [MEAN_AB18], [NDATA_POS], [NDATA09], [NDATA18])
 SELECT sourcetablealias.[objID], sourcetablealias.[OBJNAME], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[POSERRMJ], sourcetablealias.[POSERRMI], sourcetablealias.[POSERRPA], sourcetablealias.[FLUX09], sourcetablealias.[FLUX18], sourcetablealias.[FERR09], sourcetablealias.[FERR18], sourcetablealias.[FQUAL09], sourcetablealias.[FQUAL18], sourcetablealias.[FLAGS09], sourcetablealias.[FLAGS18], sourcetablealias.[NSCANC09], sourcetablealias.[NSCANC18], sourcetablealias.[NSCANP09], sourcetablealias.[NSCANP18], sourcetablealias.[MCONF09], sourcetablealias.[MCONF18], sourcetablealias.[NDENS09], sourcetablealias.[NDENS18], sourcetablealias.[EXTENDED09], sourcetablealias.[EXTENDED18], sourcetablealias.[MEAN_AB09], sourcetablealias.[MEAN_AB18], sourcetablealias.[NDATA_POS], sourcetablealias.[NDATA09], sourcetablealias.[NDATA18]
 FROM   [SkyNode_AKARI].[dbo].[IRC] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

