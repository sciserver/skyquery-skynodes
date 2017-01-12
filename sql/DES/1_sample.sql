-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[seqID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[seqID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_DES].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [seqID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_DES_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [seqID], [dtpropid], [surveyid], [release_date], [start_date], [date_obs], [dtpi], [ra], [dec], [telescope], [instrument], [filter], [exposure], [obstype], [obsmode], [proctype], [prodtype], [seeing], [depth], [dtacqnam], [archive_file], [filesize], [reference], [md5sum])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[dtpropid], sourcetablealias.[surveyid], sourcetablealias.[release_date], sourcetablealias.[start_date], sourcetablealias.[date_obs], sourcetablealias.[dtpi], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[telescope], sourcetablealias.[instrument], sourcetablealias.[filter], sourcetablealias.[exposure], sourcetablealias.[obstype], sourcetablealias.[obsmode], sourcetablealias.[proctype], sourcetablealias.[prodtype], sourcetablealias.[seeing], sourcetablealias.[depth], sourcetablealias.[dtacqnam], sourcetablealias.[archive_file], sourcetablealias.[filesize], sourcetablealias.[reference], sourcetablealias.[md5sum]
 FROM   [SkyNode_DES].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[seqID] = sourcetablealias.[seqID]
	;


GO

