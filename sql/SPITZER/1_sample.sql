-- SUBSAMPLING TABLE 'goodsnIRS16micron' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SPITZER_STAT].[dbo].[goodsnIRS16micron] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [id], [ra], [dec], [cov], [s3_6], [e_s3_6], [s4_5], [e_s4_5], [s5_8], [e_s5_8], [s8], [e_s8], [s16], [e_s16], [s24], [e_s24], [zspec], [r_zspec], [xdet], [sbf], [hbf], [star], [ratio], [ncf], [ncf16], [q], [e], [bmag], [vmag], [imag], [zmag], [ebmag], [evmag], [eimag], [ezmag], [icls])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[id], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cov], sourcetablealias.[s3_6], sourcetablealias.[e_s3_6], sourcetablealias.[s4_5], sourcetablealias.[e_s4_5], sourcetablealias.[s5_8], sourcetablealias.[e_s5_8], sourcetablealias.[s8], sourcetablealias.[e_s8], sourcetablealias.[s16], sourcetablealias.[e_s16], sourcetablealias.[s24], sourcetablealias.[e_s24], sourcetablealias.[zspec], sourcetablealias.[r_zspec], sourcetablealias.[xdet], sourcetablealias.[sbf], sourcetablealias.[hbf], sourcetablealias.[star], sourcetablealias.[ratio], sourcetablealias.[ncf], sourcetablealias.[ncf16], sourcetablealias.[q], sourcetablealias.[e], sourcetablealias.[bmag], sourcetablealias.[vmag], sourcetablealias.[imag], sourcetablealias.[zmag], sourcetablealias.[ebmag], sourcetablealias.[evmag], sourcetablealias.[eimag], sourcetablealias.[ezmag], sourcetablealias.[icls]
 FROM   [SkyNode_SPITZER].[dbo].[goodsnIRS16micron] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'goodsnMIPS24micron' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SPITZER_STAT].[dbo].[goodsnMIPS24micron] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [srcid], [ra], [dec], [ra_irac], [dec_irac], [s_24], [s_24_err], [irac_tag], [extended_tag])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[srcid], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[ra_irac], sourcetablealias.[dec_irac], sourcetablealias.[s_24], sourcetablealias.[s_24_err], sourcetablealias.[irac_tag], sourcetablealias.[extended_tag]
 FROM   [SkyNode_SPITZER].[dbo].[goodsnMIPS24micron] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'goodssIRS16micron' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SPITZER_STAT].[dbo].[goodssIRS16micron] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [id], [ra], [dec], [cov], [s3_6], [e_s3_6], [s4_5], [e_s4_5], [s5_8], [e_s5_8], [s8], [e_s8], [s16], [e_s16], [s24], [e_s24], [zspec], [r_zspec], [xdet], [sbf], [hbf], [star], [ratio], [ncf], [ncf16], [q], [e], [bmag], [vmag], [imag], [zmag], [ebmag], [evmag], [eimag], [ezmag], [icls])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[id], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cov], sourcetablealias.[s3_6], sourcetablealias.[e_s3_6], sourcetablealias.[s4_5], sourcetablealias.[e_s4_5], sourcetablealias.[s5_8], sourcetablealias.[e_s5_8], sourcetablealias.[s8], sourcetablealias.[e_s8], sourcetablealias.[s16], sourcetablealias.[e_s16], sourcetablealias.[s24], sourcetablealias.[e_s24], sourcetablealias.[zspec], sourcetablealias.[r_zspec], sourcetablealias.[xdet], sourcetablealias.[sbf], sourcetablealias.[hbf], sourcetablealias.[star], sourcetablealias.[ratio], sourcetablealias.[ncf], sourcetablealias.[ncf16], sourcetablealias.[q], sourcetablealias.[e], sourcetablealias.[bmag], sourcetablealias.[vmag], sourcetablealias.[imag], sourcetablealias.[zmag], sourcetablealias.[ebmag], sourcetablealias.[evmag], sourcetablealias.[eimag], sourcetablealias.[ezmag], sourcetablealias.[icls]
 FROM   [SkyNode_SPITZER].[dbo].[goodssIRS16micron] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'goodssMIPS24micron' ---

 -- Insert subset into destination table
 INSERT [SkyNode_SPITZER_STAT].[dbo].[goodssMIPS24micron] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [srcid], [ra], [dec], [ra_irac], [dec_irac], [s_24], [s_24_err], [irac_tag], [extended_tag])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[srcid], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[ra_irac], sourcetablealias.[dec_irac], sourcetablealias.[s_24], sourcetablealias.[s_24_err], sourcetablealias.[irac_tag], sourcetablealias.[extended_tag]
 FROM   [SkyNode_SPITZER].[dbo].[goodssMIPS24micron] sourcetablealias WITH (NOLOCK)
	;
 

GO

