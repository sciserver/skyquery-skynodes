-- SUBSAMPLING TABLE 'goodsNorth' ---

 -- Insert subset into destination table
 INSERT [SkyNode_HERSCHEL_STAT].[dbo].[goodsNorth] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [objID], [zoneid], [IAU_name], [ra], [dec], [f3p6], [err3p6], [flag3p6], [f4p5], [err4p5], [flag4p5], [f5p8], [err5p8], [flag5p8], [f8p0], [err8p0], [flag8p0], [f24], [err24_ima], [err24_sim], [cov24], [f70], [err70_ima], [err70_sim], [cov70], [f100], [err100_ima], [err100_sim], [cov100], [f160], [err160_ima], [err160_sim], [cov160], [f250], [err250_ima], [err250_sim], [cov250], [f350], [err350_ima], [err350_sim], [cov350], [f500], [err500_ima], [err500_sim], [cov500], [clean_index])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[objID], sourcetablealias.[zoneid], sourcetablealias.[IAU_name], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[f3p6], sourcetablealias.[err3p6], sourcetablealias.[flag3p6], sourcetablealias.[f4p5], sourcetablealias.[err4p5], sourcetablealias.[flag4p5], sourcetablealias.[f5p8], sourcetablealias.[err5p8], sourcetablealias.[flag5p8], sourcetablealias.[f8p0], sourcetablealias.[err8p0], sourcetablealias.[flag8p0], sourcetablealias.[f24], sourcetablealias.[err24_ima], sourcetablealias.[err24_sim], sourcetablealias.[cov24], sourcetablealias.[f70], sourcetablealias.[err70_ima], sourcetablealias.[err70_sim], sourcetablealias.[cov70], sourcetablealias.[f100], sourcetablealias.[err100_ima], sourcetablealias.[err100_sim], sourcetablealias.[cov100], sourcetablealias.[f160], sourcetablealias.[err160_ima], sourcetablealias.[err160_sim], sourcetablealias.[cov160], sourcetablealias.[f250], sourcetablealias.[err250_ima], sourcetablealias.[err250_sim], sourcetablealias.[cov250], sourcetablealias.[f350], sourcetablealias.[err350_ima], sourcetablealias.[err350_sim], sourcetablealias.[cov350], sourcetablealias.[f500], sourcetablealias.[err500_ima], sourcetablealias.[err500_sim], sourcetablealias.[cov500], sourcetablealias.[clean_index]
 FROM   [SkyNode_HERSCHEL].[dbo].[goodsNorth] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'goodsSouth' ---

 -- Insert subset into destination table
 INSERT [SkyNode_HERSCHEL_STAT].[dbo].[goodsSouth] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [objID], [zoneid], [IAU_name], [ra], [dec], [f3p6], [err3p6], [flag3p6], [f4p5], [err4p5], [flag4p5], [f5p8], [err5p8], [flag5p8], [f8p0], [err8p0], [flag8p0], [f24], [err24_ima], [err24_sim], [cov24], [f70], [err70_ima], [err70_sim], [cov70], [f100], [err100_ima], [err100_sim], [cov100], [f160], [err160_ima], [err160_sim], [cov160], [clean_index])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[objID], sourcetablealias.[zoneid], sourcetablealias.[IAU_name], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[f3p6], sourcetablealias.[err3p6], sourcetablealias.[flag3p6], sourcetablealias.[f4p5], sourcetablealias.[err4p5], sourcetablealias.[flag4p5], sourcetablealias.[f5p8], sourcetablealias.[err5p8], sourcetablealias.[flag5p8], sourcetablealias.[f8p0], sourcetablealias.[err8p0], sourcetablealias.[flag8p0], sourcetablealias.[f24], sourcetablealias.[err24_ima], sourcetablealias.[err24_sim], sourcetablealias.[cov24], sourcetablealias.[f70], sourcetablealias.[err70_ima], sourcetablealias.[err70_sim], sourcetablealias.[cov70], sourcetablealias.[f100], sourcetablealias.[err100_ima], sourcetablealias.[err100_sim], sourcetablealias.[cov100], sourcetablealias.[f160], sourcetablealias.[err160_ima], sourcetablealias.[err160_sim], sourcetablealias.[cov160], sourcetablealias.[clean_index]
 FROM   [SkyNode_HERSCHEL].[dbo].[goodsSouth] sourcetablealias WITH (NOLOCK)
	;
 

GO

