-- SUBSAMPLING TABLE 'KIC' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[seqID] float
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[seqID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_KEPLER].[dbo].[KIC] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [seqID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_KEPLER_STAT].[dbo].[KIC] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [seqID], [RA], [DEC], [pmra], [pmdec], [umag], [gmag], [rmag], [imag], [zmag], [gredmag], [d51mag], [jmag], [hmag], [kmag], [kepmag], [kepler_id], [tmid], [scpid], [altid], [altsource], [galaxy], [blend], [variable], [teff], [logg], [feh], [ebminusv], [av], [radius], [cq], [pq], [aq], [catkey], [scpkey], [parallax], [glon], [glat], [pmtotal], [grcolor], [jkcolor], [gkcolor], [fov_flag], [tm_designation])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[pmra], sourcetablealias.[pmdec], sourcetablealias.[umag], sourcetablealias.[gmag], sourcetablealias.[rmag], sourcetablealias.[imag], sourcetablealias.[zmag], sourcetablealias.[gredmag], sourcetablealias.[d51mag], sourcetablealias.[jmag], sourcetablealias.[hmag], sourcetablealias.[kmag], sourcetablealias.[kepmag], sourcetablealias.[kepler_id], sourcetablealias.[tmid], sourcetablealias.[scpid], sourcetablealias.[altid], sourcetablealias.[altsource], sourcetablealias.[galaxy], sourcetablealias.[blend], sourcetablealias.[variable], sourcetablealias.[teff], sourcetablealias.[logg], sourcetablealias.[feh], sourcetablealias.[ebminusv], sourcetablealias.[av], sourcetablealias.[radius], sourcetablealias.[cq], sourcetablealias.[pq], sourcetablealias.[aq], sourcetablealias.[catkey], sourcetablealias.[scpkey], sourcetablealias.[parallax], sourcetablealias.[glon], sourcetablealias.[glat], sourcetablealias.[pmtotal], sourcetablealias.[grcolor], sourcetablealias.[jkcolor], sourcetablealias.[gkcolor], sourcetablealias.[fov_flag], sourcetablealias.[tm_designation]
 FROM   [SkyNode_KEPLER].[dbo].[KIC] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[seqID] = sourcetablealias.[seqID]
	;


GO

