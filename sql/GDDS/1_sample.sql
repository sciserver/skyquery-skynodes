-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_GDDS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [GDDS], [RA], [DEC], [z], [Conf], [Ovlap], [Weight], [Bmag], [n_Bmag], [e_Bmag], [Vmag], [n_Vmag], [e_Vmag], [Rmag], [n_Rmag], [e_Rmag], [Icmag], [n_Icmag], [e_Icmag], [z_mag], [n_z_mag], [e_z_mag], [Hmag], [n_Hmag], [e_Hmag], [Ksmag], [n_Ksmag], [e_Ksmag])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[GDDS], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[z], sourcetablealias.[Conf], sourcetablealias.[Ovlap], sourcetablealias.[Weight], sourcetablealias.[Bmag], sourcetablealias.[n_Bmag], sourcetablealias.[e_Bmag], sourcetablealias.[Vmag], sourcetablealias.[n_Vmag], sourcetablealias.[e_Vmag], sourcetablealias.[Rmag], sourcetablealias.[n_Rmag], sourcetablealias.[e_Rmag], sourcetablealias.[Icmag], sourcetablealias.[n_Icmag], sourcetablealias.[e_Icmag], sourcetablealias.[z_mag], sourcetablealias.[n_z_mag], sourcetablealias.[e_z_mag], sourcetablealias.[Hmag], sourcetablealias.[n_Hmag], sourcetablealias.[e_Hmag], sourcetablealias.[Ksmag], sourcetablealias.[n_Ksmag], sourcetablealias.[e_Ksmag]
 FROM   [SkyNode_GDDS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

