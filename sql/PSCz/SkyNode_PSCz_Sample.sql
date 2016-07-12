-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_PSCz_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
    ([objID], [cname], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [flux_12], [flux_25], [flux_60], [flux_100], [iq_12], [iq_25], [iq_60], [iq_100], [ises_12], [ises_25], [ises_60], [ises_100], [iu_12], [iu_25], [iu_60], [iu_100], [mine], [maje], [ipose], [ic1], [ic2], [ic3], [cc_12], [cc_25], [cc_60], [cc_100], [conf], [cdisc], [chsd], [ipnearh], [ipnearw], [ises1_12], [ises1_25], [ises1_60], [ises1_100], [isnr3], [nhcon], [mhcon], [ifcor3], [cplate], [cnom], [num], [iarh], [iarm], [iars], [ars], [cadsn], [iadd], [iadm], [iads], [ads], [iadx], [iady], [alk], [irel], [cand], [iopt], [amag], [iad1], [iad2], [iapa], [amu], [idtype], [coname], [amzw], [d1x], [iar], [ivhel], [iverr], [ivref], [ivhelp], [iverrp], [ivrefp], [it], [cpgc], [rad], [decd], [glon], [glat], [ivgal], [dist], [iclus], [ali4], [ali4b], [nlbin], [class], [csec], [platex], [platey], [cstat], [carea], [czstat], [c12class], [f3psc], [f4psc], [abb], [cpscz], [mhconb], [cqdot], [iw20], [iw20e], [iw50], [iw50e], [ihiref], [fp_12], [fp_25], [fp_60], [fp_100], [iep_12], [iep_25], [iep_60], [iep_100], [ibp_12], [ibp_25], [ibp_60], [ibp_100], [fe_12], [fe_25], [fe_60], [fe_100], [iee_12], [iee_25], [iee_60], [iee_100], [ibe_12], [ibe_25], [ibe_60], [ibe_100], [width2], [ewidth])
 SELECT sourcetablealias.[objID], sourcetablealias.[cname], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[flux_12], sourcetablealias.[flux_25], sourcetablealias.[flux_60], sourcetablealias.[flux_100], sourcetablealias.[iq_12], sourcetablealias.[iq_25], sourcetablealias.[iq_60], sourcetablealias.[iq_100], sourcetablealias.[ises_12], sourcetablealias.[ises_25], sourcetablealias.[ises_60], sourcetablealias.[ises_100], sourcetablealias.[iu_12], sourcetablealias.[iu_25], sourcetablealias.[iu_60], sourcetablealias.[iu_100], sourcetablealias.[mine], sourcetablealias.[maje], sourcetablealias.[ipose], sourcetablealias.[ic1], sourcetablealias.[ic2], sourcetablealias.[ic3], sourcetablealias.[cc_12], sourcetablealias.[cc_25], sourcetablealias.[cc_60], sourcetablealias.[cc_100], sourcetablealias.[conf], sourcetablealias.[cdisc], sourcetablealias.[chsd], sourcetablealias.[ipnearh], sourcetablealias.[ipnearw], sourcetablealias.[ises1_12], sourcetablealias.[ises1_25], sourcetablealias.[ises1_60], sourcetablealias.[ises1_100], sourcetablealias.[isnr3], sourcetablealias.[nhcon], sourcetablealias.[mhcon], sourcetablealias.[ifcor3], sourcetablealias.[cplate], sourcetablealias.[cnom], sourcetablealias.[num], sourcetablealias.[iarh], sourcetablealias.[iarm], sourcetablealias.[iars], sourcetablealias.[ars], sourcetablealias.[cadsn], sourcetablealias.[iadd], sourcetablealias.[iadm], sourcetablealias.[iads], sourcetablealias.[ads], sourcetablealias.[iadx], sourcetablealias.[iady], sourcetablealias.[alk], sourcetablealias.[irel], sourcetablealias.[cand], sourcetablealias.[iopt], sourcetablealias.[amag], sourcetablealias.[iad1], sourcetablealias.[iad2], sourcetablealias.[iapa], sourcetablealias.[amu], sourcetablealias.[idtype], sourcetablealias.[coname], sourcetablealias.[amzw], sourcetablealias.[d1x], sourcetablealias.[iar], sourcetablealias.[ivhel], sourcetablealias.[iverr], sourcetablealias.[ivref], sourcetablealias.[ivhelp], sourcetablealias.[iverrp], sourcetablealias.[ivrefp], sourcetablealias.[it], sourcetablealias.[cpgc], sourcetablealias.[rad], sourcetablealias.[decd], sourcetablealias.[glon], sourcetablealias.[glat], sourcetablealias.[ivgal], sourcetablealias.[dist], sourcetablealias.[iclus], sourcetablealias.[ali4], sourcetablealias.[ali4b], sourcetablealias.[nlbin], sourcetablealias.[class], sourcetablealias.[csec], sourcetablealias.[platex], sourcetablealias.[platey], sourcetablealias.[cstat], sourcetablealias.[carea], sourcetablealias.[czstat], sourcetablealias.[c12class], sourcetablealias.[f3psc], sourcetablealias.[f4psc], sourcetablealias.[abb], sourcetablealias.[cpscz], sourcetablealias.[mhconb], sourcetablealias.[cqdot], sourcetablealias.[iw20], sourcetablealias.[iw20e], sourcetablealias.[iw50], sourcetablealias.[iw50e], sourcetablealias.[ihiref], sourcetablealias.[fp_12], sourcetablealias.[fp_25], sourcetablealias.[fp_60], sourcetablealias.[fp_100], sourcetablealias.[iep_12], sourcetablealias.[iep_25], sourcetablealias.[iep_60], sourcetablealias.[iep_100], sourcetablealias.[ibp_12], sourcetablealias.[ibp_25], sourcetablealias.[ibp_60], sourcetablealias.[ibp_100], sourcetablealias.[fe_12], sourcetablealias.[fe_25], sourcetablealias.[fe_60], sourcetablealias.[fe_100], sourcetablealias.[iee_12], sourcetablealias.[iee_25], sourcetablealias.[iee_60], sourcetablealias.[iee_100], sourcetablealias.[ibe_12], sourcetablealias.[ibe_25], sourcetablealias.[ibe_60], sourcetablealias.[ibe_100], sourcetablealias.[width2], sourcetablealias.[ewidth]
 FROM   [SkyNode_PSCz].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

