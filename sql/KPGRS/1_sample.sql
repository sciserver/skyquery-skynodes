-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_KPGRS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [MKK97], [RA], [DEC], [RFmag], [U_BJ], [BJ_RF], [RF_IN], [z], [q_z], [r_z], [Ns], [Nb], [Note], [RA1950], [DE1950])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[MKK97], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[RFmag], sourcetablealias.[U_BJ], sourcetablealias.[BJ_RF], sourcetablealias.[RF_IN], sourcetablealias.[z], sourcetablealias.[q_z], sourcetablealias.[r_z], sourcetablealias.[Ns], sourcetablealias.[Nb], sourcetablealias.[Note], sourcetablealias.[RA1950], sourcetablealias.[DE1950]
 FROM   [SkyNode_KPGRS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

