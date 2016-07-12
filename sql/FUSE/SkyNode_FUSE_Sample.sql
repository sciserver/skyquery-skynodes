-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_FUSE_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
    ([objID], [TELESCOP], [ROOTNAME], [PRGRM_ID], [TARG_ID], [PR_INV_L], [PR_INV_R], [TARGNAME], [RA], [DEC], [cx], [cy], [cz], [htmid], [zoneid], [APER_PA], [ELAT], [ELONG], [GLAT], [GLONG], [OBJCLASS], [SP_TYPE], [SRC_TYPE], [VMAG], [EBV], [Z], [HIGH_PM], [MOV_TARG], [DATEOBS], [OBSSTART], [OBSEND], [OBSTIME], [RAWTIME], [OBSNIGHT], [INSTMODE], [APERTURE], [CF_VERS], [BANDWID], [CENTRWV], [WAVEMIN], [WAVEMAX])
 SELECT sourcetablealias.[objID], sourcetablealias.[TELESCOP], sourcetablealias.[ROOTNAME], sourcetablealias.[PRGRM_ID], sourcetablealias.[TARG_ID], sourcetablealias.[PR_INV_L], sourcetablealias.[PR_INV_R], sourcetablealias.[TARGNAME], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[APER_PA], sourcetablealias.[ELAT], sourcetablealias.[ELONG], sourcetablealias.[GLAT], sourcetablealias.[GLONG], sourcetablealias.[OBJCLASS], sourcetablealias.[SP_TYPE], sourcetablealias.[SRC_TYPE], sourcetablealias.[VMAG], sourcetablealias.[EBV], sourcetablealias.[Z], sourcetablealias.[HIGH_PM], sourcetablealias.[MOV_TARG], sourcetablealias.[DATEOBS], sourcetablealias.[OBSSTART], sourcetablealias.[OBSEND], sourcetablealias.[OBSTIME], sourcetablealias.[RAWTIME], sourcetablealias.[OBSNIGHT], sourcetablealias.[INSTMODE], sourcetablealias.[APERTURE], sourcetablealias.[CF_VERS], sourcetablealias.[BANDWID], sourcetablealias.[CENTRWV], sourcetablealias.[WAVEMIN], sourcetablealias.[WAVEMAX]
 FROM   [SkyNode_FUSE].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SpecLine' ---

 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_FUSE_STAT].[dbo].[SpecLine] ON;
  -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 --GO

 CREATE TABLE ##temporaryidlist
 (
	[ObjID] bigint, [LineID] int
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[ObjID], sourcetablealias.[LineID], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_FUSE].[dbo].[SpecLine] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [ObjID], [LineID]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_FUSE_STAT].[dbo].[SpecLine] WITH (TABLOCKX)
	([ObjID], [LineID], [WAVE], [FLUX], [ERROR])
 SELECT sourcetablealias.[ObjID], sourcetablealias.[LineID], sourcetablealias.[WAVE], sourcetablealias.[FLUX], sourcetablealias.[ERROR]
 FROM   [SkyNode_FUSE].[dbo].[SpecLine] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.ObjID = sourcetablealias.ObjID AND ##temporaryidlist.LineID = sourcetablealias.LineID
	;
 --Setting Identity Column
 SET IDENTITY_INSERT [SkyNode_FUSE_STAT].[dbo].[SpecLine] OFF;
 

GO

-- SUBSAMPLING TABLE 'SpecObj' ---

 -- Insert subset into destination table
 INSERT [SkyNode_FUSE_STAT].[dbo].[SpecObj] WITH (TABLOCKX)
    ([objID], [TELESCOP], [ROOTNAME], [PRGRM_ID], [TARG_ID], [PR_INV_L], [PR_INV_R], [TARGNAME], [RA], [DEC], [cx], [cy], [cz], [htmid], [zoneid], [APER_PA], [ELAT], [ELONG], [GLAT], [GLONG], [OBJCLASS], [SP_TYPE], [SRC_TYPE], [VMAG], [EBV], [Z], [HIGH_PM], [MOV_TARG], [DATEOBS], [OBSSTART], [OBSEND], [OBSTIME], [RAWTIME], [OBSNIGHT], [INSTMODE], [APERTURE], [CF_VERS], [BANDWID], [CENTRWV], [WAVEMIN], [WAVEMAX])
 SELECT sourcetablealias.[objID], sourcetablealias.[TELESCOP], sourcetablealias.[ROOTNAME], sourcetablealias.[PRGRM_ID], sourcetablealias.[TARG_ID], sourcetablealias.[PR_INV_L], sourcetablealias.[PR_INV_R], sourcetablealias.[TARGNAME], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[APER_PA], sourcetablealias.[ELAT], sourcetablealias.[ELONG], sourcetablealias.[GLAT], sourcetablealias.[GLONG], sourcetablealias.[OBJCLASS], sourcetablealias.[SP_TYPE], sourcetablealias.[SRC_TYPE], sourcetablealias.[VMAG], sourcetablealias.[EBV], sourcetablealias.[Z], sourcetablealias.[HIGH_PM], sourcetablealias.[MOV_TARG], sourcetablealias.[DATEOBS], sourcetablealias.[OBSSTART], sourcetablealias.[OBSEND], sourcetablealias.[OBSTIME], sourcetablealias.[RAWTIME], sourcetablealias.[OBSNIGHT], sourcetablealias.[INSTMODE], sourcetablealias.[APERTURE], sourcetablealias.[CF_VERS], sourcetablealias.[BANDWID], sourcetablealias.[CENTRWV], sourcetablealias.[WAVEMIN], sourcetablealias.[WAVEMAX]
 FROM   [SkyNode_FUSE].[dbo].[SpecObj] sourcetablealias WITH (NOLOCK)
	;
 

GO

