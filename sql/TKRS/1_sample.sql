-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TKRS_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [TKRS], [RA], [DEC], [Rmag], [Mask], [Slit], [z], [q_z], [zOther], [r_zOther], [XpixD], [YpixD], [ACS], [XpixG], [YpixG], [MajAxis], [e2], [PA], [GOODS])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[TKRS], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Rmag], sourcetablealias.[Mask], sourcetablealias.[Slit], sourcetablealias.[z], sourcetablealias.[q_z], sourcetablealias.[zOther], sourcetablealias.[r_zOther], sourcetablealias.[XpixD], sourcetablealias.[YpixD], sourcetablealias.[ACS], sourcetablealias.[XpixG], sourcetablealias.[YpixG], sourcetablealias.[MajAxis], sourcetablealias.[e2], sourcetablealias.[PA], sourcetablealias.[GOODS]
 FROM   [SkyNode_TKRS].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

