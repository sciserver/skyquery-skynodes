-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SSRS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [seqID], [n_GSC], [GSC], [m_GSC], [ESO_MCG], [RA], [DEC], [RA_1950], [DEC_1950], [mSSR], [RV], [e_RV], [TT], [r_RV], [Note], [NGC_IC])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[n_GSC], sourcetablealias.[GSC], sourcetablealias.[m_GSC], sourcetablealias.[ESO_MCG], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[RA_1950], sourcetablealias.[DEC_1950], sourcetablealias.[mSSR], sourcetablealias.[RV], sourcetablealias.[e_RV], sourcetablealias.[TT], sourcetablealias.[r_RV], sourcetablealias.[Note], sourcetablealias.[NGC_IC]
 FROM   [SkyNode_SSRS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

