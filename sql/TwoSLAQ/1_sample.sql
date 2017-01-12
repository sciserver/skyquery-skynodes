-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TwoSLAQ_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [Name], [n_Name], [RA], [DEC], [Pr], [Run], [Rerun], [Camcol], [Field], [ID], [umag], [e_umag], [gmag], [e_gmag], [rmag], [e_rmag], [imag], [e_imag], [zmag], [e_zmag], [ured], [gred], [rred], [ired], [zred], [SpG], [Cl], [zem_S], [q_zem_S], [ID_S], [bj], [zem2q], [q_zem2q], [ID2q], [q_ID2q], [TwoQZ], [z2S], [q_z2S], [ID2S], [q_ID2S], [Date], [Fl2S], [Fb2S], [SpN], [dmag], [FX], [F1p4], [n_F1p4], [Com])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[Name], sourcetablealias.[n_Name], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Pr], sourcetablealias.[Run], sourcetablealias.[Rerun], sourcetablealias.[Camcol], sourcetablealias.[Field], sourcetablealias.[ID], sourcetablealias.[umag], sourcetablealias.[e_umag], sourcetablealias.[gmag], sourcetablealias.[e_gmag], sourcetablealias.[rmag], sourcetablealias.[e_rmag], sourcetablealias.[imag], sourcetablealias.[e_imag], sourcetablealias.[zmag], sourcetablealias.[e_zmag], sourcetablealias.[ured], sourcetablealias.[gred], sourcetablealias.[rred], sourcetablealias.[ired], sourcetablealias.[zred], sourcetablealias.[SpG], sourcetablealias.[Cl], sourcetablealias.[zem_S], sourcetablealias.[q_zem_S], sourcetablealias.[ID_S], sourcetablealias.[bj], sourcetablealias.[zem2q], sourcetablealias.[q_zem2q], sourcetablealias.[ID2q], sourcetablealias.[q_ID2q], sourcetablealias.[TwoQZ], sourcetablealias.[z2S], sourcetablealias.[q_z2S], sourcetablealias.[ID2S], sourcetablealias.[q_ID2S], sourcetablealias.[Date], sourcetablealias.[Fl2S], sourcetablealias.[Fb2S], sourcetablealias.[SpN], sourcetablealias.[dmag], sourcetablealias.[FX], sourcetablealias.[F1p4], sourcetablealias.[n_F1p4], sourcetablealias.[Com]
 FROM   [SkyNode_TwoSLAQ].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

