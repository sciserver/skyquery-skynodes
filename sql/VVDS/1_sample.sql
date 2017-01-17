-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_VVDS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [ID], [RA], [DEC], [Jname], [z], [q_z], [phf], [UEmag], [e_UEmag], [ULmag], [e_ULmag], [Bmag], [e_Bmag], [Vmag], [e_Vmag], [Rmag], [e_Rmag], [Imag], [e_Imag], [Jmag], [e_Jmag], [Kmag], [e_Kmag])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[ID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Jname], sourcetablealias.[z], sourcetablealias.[q_z], sourcetablealias.[phf], sourcetablealias.[UEmag], sourcetablealias.[e_UEmag], sourcetablealias.[ULmag], sourcetablealias.[e_ULmag], sourcetablealias.[Bmag], sourcetablealias.[e_Bmag], sourcetablealias.[Vmag], sourcetablealias.[e_Vmag], sourcetablealias.[Rmag], sourcetablealias.[e_Rmag], sourcetablealias.[Imag], sourcetablealias.[e_Imag], sourcetablealias.[Jmag], sourcetablealias.[e_Jmag], sourcetablealias.[Kmag], sourcetablealias.[e_Kmag]
 FROM   [SkyNode_VVDS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

