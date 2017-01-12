-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[ID] char(22)
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[ID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_WiggleZ].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [ID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_WiggleZ_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [ID], [RA], [DEC], [Redshift], [Qop], [u_SDSS], [g_SDSS], [r_SDSS], [i_SDSS], [z_SDSS], [g_RCS2], [r_RCS2], [z_RCS2], [NUV], [FUV])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[ID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Redshift], sourcetablealias.[Qop], sourcetablealias.[u_SDSS], sourcetablealias.[g_SDSS], sourcetablealias.[r_SDSS], sourcetablealias.[i_SDSS], sourcetablealias.[z_SDSS], sourcetablealias.[g_RCS2], sourcetablealias.[r_RCS2], sourcetablealias.[z_RCS2], sourcetablealias.[NUV], sourcetablealias.[FUV]
 FROM   [SkyNode_WiggleZ].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[ID] = sourcetablealias.[ID]
	;


GO

