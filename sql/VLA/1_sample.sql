-- SUBSAMPLING TABLE 'GOODSN' ---

 -- Insert subset into destination table
 INSERT [SkyNode_VLA_STAT].[dbo].[GOODSN] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [Name], [RA], [e_RAs], [DEC], [e_DECs], [SN], [Peak], [e_Peak], [Total], [e_Total], [bmaj], [bmin], [PA], [ulim], [beam])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[Name], sourcetablealias.[RA], sourcetablealias.[e_RAs], sourcetablealias.[DEC], sourcetablealias.[e_DECs], sourcetablealias.[SN], sourcetablealias.[Peak], sourcetablealias.[e_Peak], sourcetablealias.[Total], sourcetablealias.[e_Total], sourcetablealias.[bmaj], sourcetablealias.[bmin], sourcetablealias.[PA], sourcetablealias.[ulim], sourcetablealias.[beam]
 FROM   [SkyNode_VLA].[dbo].[GOODSN] sourcetablealias WITH (NOLOCK)
	;
 

GO

