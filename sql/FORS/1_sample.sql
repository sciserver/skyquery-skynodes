-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_FORS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [RA], [DEC], [BTmag], [ITmag], [Texp], [ff0], [SN], [n_SN], [Qs], [Type], [z], [e_z], [e_Type], [q_z], [Notes], [FileName])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[BTmag], sourcetablealias.[ITmag], sourcetablealias.[Texp], sourcetablealias.[ff0], sourcetablealias.[SN], sourcetablealias.[n_SN], sourcetablealias.[Qs], sourcetablealias.[Type], sourcetablealias.[z], sourcetablealias.[e_z], sourcetablealias.[e_Type], sourcetablealias.[q_z], sourcetablealias.[Notes], sourcetablealias.[FileName]
 FROM   [SkyNode_FORS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

