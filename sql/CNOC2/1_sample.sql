-- SUBSAMPLING TABLE 'SpecObj' ---

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
	FROM [SkyNode_CNOC2].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.5;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_CNOC2_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([objID], [CNOC2sp], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [oRA], [oDE], [z], [e_z], [Rval], [Sc], [w_z], [Imag], [e_Imag], [Ice], [w_Imag], [IWc], [IWxy], [Rmag], [e_Rmag], [Rce], [w_Rmag], [RWc], [RWxy], [Vmag], [e_Vmag], [Vce], [w_Vmag], [VWc], [VWxy], [Bmag], [e_Bmag], [Bce], [w_Bmag], [BWc], [BWxy], [Umag], [e_Umag], [Uce], [w_Umag], [UWc], [UWxy], [Pcl], [Rkcor], [xpos], [ypos])
 SELECT sourcetablealias.[objID], sourcetablealias.[CNOC2sp], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[oRA], sourcetablealias.[oDE], sourcetablealias.[z], sourcetablealias.[e_z], sourcetablealias.[Rval], sourcetablealias.[Sc], sourcetablealias.[w_z], sourcetablealias.[Imag], sourcetablealias.[e_Imag], sourcetablealias.[Ice], sourcetablealias.[w_Imag], sourcetablealias.[IWc], sourcetablealias.[IWxy], sourcetablealias.[Rmag], sourcetablealias.[e_Rmag], sourcetablealias.[Rce], sourcetablealias.[w_Rmag], sourcetablealias.[RWc], sourcetablealias.[RWxy], sourcetablealias.[Vmag], sourcetablealias.[e_Vmag], sourcetablealias.[Vce], sourcetablealias.[w_Vmag], sourcetablealias.[VWc], sourcetablealias.[VWxy], sourcetablealias.[Bmag], sourcetablealias.[e_Bmag], sourcetablealias.[Bce], sourcetablealias.[w_Bmag], sourcetablealias.[BWc], sourcetablealias.[BWxy], sourcetablealias.[Umag], sourcetablealias.[e_Umag], sourcetablealias.[Uce], sourcetablealias.[w_Umag], sourcetablealias.[UWc], sourcetablealias.[UWxy], sourcetablealias.[Pcl], sourcetablealias.[Rkcor], sourcetablealias.[xpos], sourcetablealias.[ypos]
 FROM   [SkyNode_CNOC2].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

