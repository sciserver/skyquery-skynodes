-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_K20_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [Seq], [RA], [DEC], [Ksmag], [R_K], [z], [q_z], [Class], [FileName], [Com])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[Seq], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Ksmag], sourcetablealias.[R_K], sourcetablealias.[z], sourcetablealias.[q_z], sourcetablealias.[Class], sourcetablealias.[FileName], sourcetablealias.[Com]
 FROM   [SkyNode_K20].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

