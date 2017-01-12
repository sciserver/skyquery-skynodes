-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_UCZ_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [seqID], [RA], [DEC], [Bmag], [z], [e_z], [T], [U], [N], [Zname], [f_z], [r_z], [Name], [UZC], [mul])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Bmag], sourcetablealias.[z], sourcetablealias.[e_z], sourcetablealias.[T], sourcetablealias.[U], sourcetablealias.[N], sourcetablealias.[Zname], sourcetablealias.[f_z], sourcetablealias.[r_z], sourcetablealias.[Name], sourcetablealias.[UZC], sourcetablealias.[mul]
 FROM   [SkyNode_UCZ].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

