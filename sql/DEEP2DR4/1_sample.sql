-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objID] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_DEEP2DR4].[dbo].[SpecObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_DEEP2DR4_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [objID], [RA], [DEC], [MAGB], [MAGR], [MAGI], [MAGBERR], [MAGRERR], [MAGIERR], [RG], [E2], [PA], [PGAL], [SFD_EBV], [M_B], [U_B], [OBJNAME], [MASK], [SLIT], [DATE], [MJD], [SLITRA], [SLITDEC], [SLITLEN], [SLITPA], [Z], [ZBEST], [ZERR], [ZQUALITY], [CLASS], [SUBCLASS], [RCHI2], [DOF], [VDISP], [VDISPERR], [COMMENT])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[objID], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[MAGB], sourcetablealias.[MAGR], sourcetablealias.[MAGI], sourcetablealias.[MAGBERR], sourcetablealias.[MAGRERR], sourcetablealias.[MAGIERR], sourcetablealias.[RG], sourcetablealias.[E2], sourcetablealias.[PA], sourcetablealias.[PGAL], sourcetablealias.[SFD_EBV], sourcetablealias.[M_B], sourcetablealias.[U_B], sourcetablealias.[OBJNAME], sourcetablealias.[MASK], sourcetablealias.[SLIT], sourcetablealias.[DATE], sourcetablealias.[MJD], sourcetablealias.[SLITRA], sourcetablealias.[SLITDEC], sourcetablealias.[SLITLEN], sourcetablealias.[SLITPA], sourcetablealias.[Z], sourcetablealias.[ZBEST], sourcetablealias.[ZERR], sourcetablealias.[ZQUALITY], sourcetablealias.[CLASS], sourcetablealias.[SUBCLASS], sourcetablealias.[RCHI2], sourcetablealias.[DOF], sourcetablealias.[VDISP], sourcetablealias.[VDISPERR], sourcetablealias.[COMMENT]
 FROM   [SkyNode_DEEP2DR4].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[objID] = sourcetablealias.[objID]
	;


GO

