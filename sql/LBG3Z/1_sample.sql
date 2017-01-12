-- SUBSAMPLING TABLE 'DeepImagingObs' ---

 -- Insert subset into destination table
 INSERT [SkyNode_LBG3Z_STAT].[dbo].[DeepImagingObs] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [objID], [Field], [RA], [DEC], [Filt], [Tel], [Scale], [FWHM], [ExpTime], [Dim1], [Dim2], [Area])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[Field], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Filt], sourcetablealias.[Tel], sourcetablealias.[Scale], sourcetablealias.[FWHM], sourcetablealias.[ExpTime], sourcetablealias.[Dim1], sourcetablealias.[Dim2], sourcetablealias.[Area]
 FROM   [SkyNode_LBG3Z].[dbo].[DeepImagingObs] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_LBG3Z_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([cx], [cy], [cz], [htmid], [zoneid], [Name], [RA], [DEC], [Rmag], [G_R], [U_G], [u_z_em], [z_em], [u_z_abs], [z_abs], [Type], [n_Name])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[Name], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[Rmag], sourcetablealias.[G_R], sourcetablealias.[U_G], sourcetablealias.[u_z_em], sourcetablealias.[z_em], sourcetablealias.[u_z_abs], sourcetablealias.[z_abs], sourcetablealias.[Type], sourcetablealias.[n_Name]
 FROM   [SkyNode_LBG3Z].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

