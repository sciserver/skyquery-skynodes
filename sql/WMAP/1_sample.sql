-- SUBSAMPLING TABLE 'Obs' ---

 -- Insert subset into destination table
 INSERT [SkyNode_WMAP_STAT].[dbo].[Obs] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [seqID], [RA], [DEC], [WMAP], [WMAP1], [S_K], [e_S_K], [S_Ka], [e_S_Ka], [S_Q], [e_S_Q], [S_V], [e_S_V], [S_W], [e_S_W], [alf], [e_alf], [fiveGHzID], [f_5GHzID])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[WMAP], sourcetablealias.[WMAP1], sourcetablealias.[S_K], sourcetablealias.[e_S_K], sourcetablealias.[S_Ka], sourcetablealias.[e_S_Ka], sourcetablealias.[S_Q], sourcetablealias.[e_S_Q], sourcetablealias.[S_V], sourcetablealias.[e_S_V], sourcetablealias.[S_W], sourcetablealias.[e_S_W], sourcetablealias.[alf], sourcetablealias.[e_alf], sourcetablealias.[fiveGHzID], sourcetablealias.[f_5GHzID]
 FROM   [SkyNode_WMAP].[dbo].[Obs] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'ObsCMBFree' ---

 -- Insert subset into destination table
 INSERT [SkyNode_WMAP_STAT].[dbo].[ObsCMBFree] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [seqID], [RA], [DEC], [WMAP], [WMAP1], [S_Q], [e_S_Q], [S_V], [e_S_V], [S_W], [e_S_W], [fiveGHzID], [f_5GHzID])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[seqID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[WMAP], sourcetablealias.[WMAP1], sourcetablealias.[S_Q], sourcetablealias.[e_S_Q], sourcetablealias.[S_V], sourcetablealias.[e_S_V], sourcetablealias.[S_W], sourcetablealias.[e_S_W], sourcetablealias.[fiveGHzID], sourcetablealias.[f_5GHzID]
 FROM   [SkyNode_WMAP].[dbo].[ObsCMBFree] sourcetablealias WITH (NOLOCK)
	;
 

GO

