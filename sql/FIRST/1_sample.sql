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
	FROM [SkyNode_FIRST].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_FIRST_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([objID], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [Ps], [Fpeak], [Fint], [RMS], [Maj], [Min], [PA], [fMaj], [fMin], [fPA], [Field], [num_SDSS], [Sep_SDSS], [i_SDSS], [Cl_SDSS], [num_2MASS], [Sep_2MASS], [K_2MASS], [Mean_yr], [Mean_MJD], [rms_MJD])
 SELECT sourcetablealias.[objID], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[Ps], sourcetablealias.[Fpeak], sourcetablealias.[Fint], sourcetablealias.[RMS], sourcetablealias.[Maj], sourcetablealias.[Min], sourcetablealias.[PA], sourcetablealias.[fMaj], sourcetablealias.[fMin], sourcetablealias.[fPA], sourcetablealias.[Field], sourcetablealias.[num_SDSS], sourcetablealias.[Sep_SDSS], sourcetablealias.[i_SDSS], sourcetablealias.[Cl_SDSS], sourcetablealias.[num_2MASS], sourcetablealias.[Sep_2MASS], sourcetablealias.[K_2MASS], sourcetablealias.[Mean_yr], sourcetablealias.[Mean_MJD], sourcetablealias.[rms_MJD]
 FROM   [SkyNode_FIRST].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

