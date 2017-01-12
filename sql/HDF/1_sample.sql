-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_HDF_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [x], [y], [ra], [dec], [mt], [mt_limit], [mi], [mi_limit], [U_B], [U_B_limit], [B_V], [B_V_limit], [V_I], [V_I_limit], [SN], [area], [r1], [bpa], [PA], [Flags])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[x], sourcetablealias.[y], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[mt], sourcetablealias.[mt_limit], sourcetablealias.[mi], sourcetablealias.[mi_limit], sourcetablealias.[U_B], sourcetablealias.[U_B_limit], sourcetablealias.[B_V], sourcetablealias.[B_V_limit], sourcetablealias.[V_I], sourcetablealias.[V_I_limit], sourcetablealias.[SN], sourcetablealias.[area], sourcetablealias.[r1], sourcetablealias.[bpa], sourcetablealias.[PA], sourcetablealias.[Flags]
 FROM   [SkyNode_HDF].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

