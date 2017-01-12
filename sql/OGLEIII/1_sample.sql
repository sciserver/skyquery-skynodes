-- SUBSAMPLING TABLE 'VariableStars' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[ID] char(20)
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[ID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_OGLEIII].[dbo].[VariableStars] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [ID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_OGLEIII_STAT].[dbo].[VariableStars] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [ID], [Field], [StarID], [Type], [Subtype], [ra], [dec], [ID_OGLE_II], [ID_MACHO], [ID_ASAS], [ID_GCVS], [ID_OTHER], [I], [V], [P_1], [dP_1], [T0_1], [A_1], [R21_1], [phi21_1], [R31_1], [phi31_1], [P_2], [dP_2], [T0_2], [A_2], [R21_2], [phi21_2], [R31_2], [phi31_2], [P_3], [dP_3], [T0_3], [A_3], [R21_3], [phi21_3], [R31_3], [phi31_3], [Remarks])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[ID], sourcetablealias.[Field], sourcetablealias.[StarID], sourcetablealias.[Type], sourcetablealias.[Subtype], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[ID_OGLE_II], sourcetablealias.[ID_MACHO], sourcetablealias.[ID_ASAS], sourcetablealias.[ID_GCVS], sourcetablealias.[ID_OTHER], sourcetablealias.[I], sourcetablealias.[V], sourcetablealias.[P_1], sourcetablealias.[dP_1], sourcetablealias.[T0_1], sourcetablealias.[A_1], sourcetablealias.[R21_1], sourcetablealias.[phi21_1], sourcetablealias.[R31_1], sourcetablealias.[phi31_1], sourcetablealias.[P_2], sourcetablealias.[dP_2], sourcetablealias.[T0_2], sourcetablealias.[A_2], sourcetablealias.[R21_2], sourcetablealias.[phi21_2], sourcetablealias.[R31_2], sourcetablealias.[phi31_2], sourcetablealias.[P_3], sourcetablealias.[dP_3], sourcetablealias.[T0_3], sourcetablealias.[A_3], sourcetablealias.[R21_3], sourcetablealias.[phi21_3], sourcetablealias.[R31_3], sourcetablealias.[phi31_3], sourcetablealias.[Remarks]
 FROM   [SkyNode_OGLEIII].[dbo].[VariableStars] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[ID] = sourcetablealias.[ID]
	;


GO

