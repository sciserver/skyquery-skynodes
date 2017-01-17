-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TwoMRS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [ID], [A], [RA], [DEC], [GLON], [GLAT], [Kcmag], [e_Kcmag], [Hcmag], [e_Hcmag], [Jcmag], [e_Jcmag], [Ktmag], [e_Ktmag], [Htmag], [e_Htmag], [Jtmag], [e_Jtmag], [E_B_V], [Riso], [Rext], [bpa], [flags], [type], [r_type], [bz], [e_bz], [n_bz], [r_bz], [CAT])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[ID], sourcetablealias.[A], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[GLON], sourcetablealias.[GLAT], sourcetablealias.[Kcmag], sourcetablealias.[e_Kcmag], sourcetablealias.[Hcmag], sourcetablealias.[e_Hcmag], sourcetablealias.[Jcmag], sourcetablealias.[e_Jcmag], sourcetablealias.[Ktmag], sourcetablealias.[e_Ktmag], sourcetablealias.[Htmag], sourcetablealias.[e_Htmag], sourcetablealias.[Jtmag], sourcetablealias.[e_Jtmag], sourcetablealias.[E_B_V], sourcetablealias.[Riso], sourcetablealias.[Rext], sourcetablealias.[bpa], sourcetablealias.[flags], sourcetablealias.[type], sourcetablealias.[r_type], sourcetablealias.[bz], sourcetablealias.[e_bz], sourcetablealias.[n_bz], sourcetablealias.[r_bz], sourcetablealias.[CAT]
 FROM   [SkyNode_TwoMRS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

