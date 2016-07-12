-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 --GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_NVSS].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_NVSS_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([objID], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [raErr], [decErr], [flux], [fluxErr], [major], [majorErr], [minor], [minorErr], [pa], [paErr], [res], [resOff], [p_flux], [p_fluxErr], [p_ang], [p_angErr], [field], [x_pix], [y_pix])
 SELECT sourcetablealias.[objID], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[flux], sourcetablealias.[fluxErr], sourcetablealias.[major], sourcetablealias.[majorErr], sourcetablealias.[minor], sourcetablealias.[minorErr], sourcetablealias.[pa], sourcetablealias.[paErr], sourcetablealias.[res], sourcetablealias.[resOff], sourcetablealias.[p_flux], sourcetablealias.[p_fluxErr], sourcetablealias.[p_ang], sourcetablealias.[p_angErr], sourcetablealias.[field], sourcetablealias.[x_pix], sourcetablealias.[y_pix]
 FROM   [SkyNode_NVSS].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objID = sourcetablealias.objID
	;


GO

