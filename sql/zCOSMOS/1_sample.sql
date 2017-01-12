-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_zCOSMOS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([objID], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [z], [CC], [Imag])
 SELECT sourcetablealias.[objID], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[z], sourcetablealias.[CC], sourcetablealias.[Imag]
 FROM   [SkyNode_zCOSMOS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

