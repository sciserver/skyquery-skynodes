USE [SkyNode_SDSSDR13]
GO
/****** Object:  View [dbo].[PhotoPrimary]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoPrimary] 
----------------------------------------------------------------------
--/H These objects are the primary survey objects. 
--
--/T Each physical object 
--/T on the sky has only one primary object associated with it. Upon 
--/T subsequent observations secondary objects are generated. Since the 
--/T survey stripes overlap, there will be secondary objects for over 10% 
--/T of all primary objects, and in the southern stripes there will be a 
--/T multitude of secondary objects for each primary (i.e. reobservations). 
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=1

GO
/****** Object:  View [dbo].[Star]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Star]
--------------------------------------------------------------
--/H The objects classified as stars from PhotoPrimary
--
--/T The Star view essentially contains the photometric parameters
--/T (no redshifts or spectroscopic parameters) for all primary
--/T point-like objects, including quasars.
--------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 6

GO
/****** Object:  View [dbo].[Galaxy]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Galaxy]
---------------------------------------------------------------
--/H The objects classified as galaxies from PhotoPrimary.
--
--/T The Galaxy view contains the photometric parameters (no
--/T redshifts or spectroscopic parameters) measured for
--/T resolved primary objects.
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 3

GO
/****** Object:  View [dbo].[PhotoTag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoTag]
--------------------------------------------------------------
--/H The most popular columns from PhotoObjAll.
--
--/T This view contains the most popular columns from the
--/T PhotoObjAll table, and is intended to enable faster
--/T queries if they only request these columns by making 
--/T use of the cache.  Performance is also enhanced by
--/T an index covering the columns in this view in the base
--/T table (PhotoObjAll).
--------------------------------------------------------------
AS
SELECT [objID]
      ,[skyVersion]
      ,[run]
      ,[rerun]
      ,[camcol]
      ,[field]
      ,[obj]
      ,[mode]
      ,[nChild]
      ,[type]
      ,[clean]
      ,[probPSF]
      ,[insideMask]
      ,[flags]
      ,[psfMag_u]
      ,[psfMag_g]
      ,[psfMag_r]
      ,[psfMag_i]
      ,[psfMag_z]
      ,[psfMagErr_u]
      ,[psfMagErr_g]
      ,[psfMagErr_r]
      ,[psfMagErr_i]
      ,[psfMagErr_z]
      ,[petroMag_u]
      ,[petroMag_g]
      ,[petroMag_r]
      ,[petroMag_i]
      ,[petroMag_z]
      ,[petroMagErr_u]
      ,[petroMagErr_g]
      ,[petroMagErr_r]
      ,[petroMagErr_i]
      ,[petroMagErr_z]
      ,[petroR50_r]
      ,[petroR90_r]
      ,u as [modelMag_u]
      ,g as [modelMag_g]
      ,r as [modelMag_r]
      ,i as [modelMag_i]
      ,z as [modelMag_z]
      ,err_u  as [modelMagErr_u] 
      ,err_g  as [modelMagErr_g]
      ,err_r  as [modelMagErr_r]
      ,err_i  as [modelMagErr_i]
      ,err_z  as [modelMagErr_z]
      ,[fracDeV_u]
      ,[fracDeV_g]
      ,[fracDeV_r]
      ,[fracDeV_i]
      ,[fracDeV_z]
      ,[resolveStatus]
      ,[thingId]
      ,[balkanId]
      ,[nObserve]
      ,[nDetect]
      ,[calibStatus_u]
      ,[calibStatus_g]
      ,[calibStatus_r]
      ,[calibStatus_i]
      ,[calibStatus_z]
      ,[ra]
      ,[dec]
      ,[cx]
      ,[cy]
      ,[cz]
      ,[extinction_u]
      ,[extinction_g]
      ,[extinction_r]
      ,[extinction_i]
      ,[extinction_z]
      ,[htmID]
      ,[fieldID]
      ,[specObjID]
  FROM PhotoObjAll

GO
/****** Object:  View [dbo].[StarTag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[StarTag]
--------------------------------------------------------------
--/H The objects classified as stars from primary PhotoTag objects.
--
--/T The StarTag view essentially contains the abbreviated photometric 
--/T parameters from the PhotoTag table (no redshifts or spectroscopic
--/T parameters) for all primary point-like objects, including quasars.
--------------------------------------------------------------
AS
SELECT * 
    FROM PhotoTag WITH(NOLOCK)
    WHERE type = 6 and mode=1

GO
/****** Object:  View [dbo].[GalaxyTag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[GalaxyTag]
---------------------------------------------------------------
--/H The objects classified as galaxies from primary PhotoTag objects.
--
--/T The GalaxyTag view essentially contains the abbreviated photometric 
--/T parameters from the PhotoTag table (no redshifts or spectroscopic
--/T parameters) for all primary point-like objects, including quasars.
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoTag WITH(NOLOCK)
    WHERE type = 3 and mode=1

GO
/****** Object:  View [dbo].[Sky]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Sky]
---------------------------------------------------------------
--/H The objects selected as sky samples in PhotoPrimary
---------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type = 8

GO
/****** Object:  View [dbo].[Unknown]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Unknown]
---------------------------------------------------------------------
--/H Everything in PhotoPrimary, which is not a galaxy, star or sky
--------------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type not in (3,6,8)

GO
/****** Object:  View [dbo].[AncillaryTarget1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[AncillaryTarget1]
------------------------------------------
--/H Contains the AncillaryTarget1 flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the ANCILLARY_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='AncillaryTarget1' AND name != ''

GO
/****** Object:  View [dbo].[AncillaryTarget2]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[AncillaryTarget2]
------------------------------------------
--/H Contains the AncillaryTarget2 flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the ANCILLARY_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
        value,
	description
    FROM DataConstants
    WHERE field='AncillaryTarget2' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeAspcapFlag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeAspcapFlag]
------------------------------------------
--/H Contains the ApogeeAspcapFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_ASPCAPFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeAspcapFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeExtraTarg]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeExtraTarg]
------------------------------------------
--/H Contains the ApogeeExtraTarg flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_EXTRATARG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeExtraTarg' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeParamFlag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeParamFlag]
------------------------------------------
--/H Contains the ApogeeParamFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_PARAMFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeParamFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeStarFlag]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeStarFlag]
------------------------------------------
--/H Contains the ApogeeStarFlag flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_STARFLAG entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeStarFlag' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeTarget1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeTarget1]
------------------------------------------
--/H Contains the ApogeeTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeTarget1' AND name != ''

GO
/****** Object:  View [dbo].[ApogeeTarget2]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ApogeeTarget2]
------------------------------------------
--/H Contains the ApogeeTarget2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the APOGEE_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ApogeeTarget2' AND name != ''

GO
/****** Object:  View [dbo].[BossTarget1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[BossTarget1]
------------------------------------------
--/H Contains the BossTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the BOSS_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='BossTarget1' AND name != ''

GO
/****** Object:  View [dbo].[CalibStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[CalibStatus]
------------------------------------------
--/H Contains the CalibStatus flag values from DataConstants as binary(2).
------------------------------------------
--/T Please see the CALIB_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast(value as binary(2)) as value, 
	description
    FROM DataConstants
    WHERE field='CalibStatus' AND name != ''

GO

/****** Object:  View [dbo].[CoordType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[CoordType]
------------------------------------------
--/H Contains the CoordType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='CoordType' AND name != ''

GO
/****** Object:  View [dbo].[eBossTarget0]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[eBossTarget0]
------------------------------------------
--/H Contains the eBossTarget0 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the EBOSS_TARGET0 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='eBossTarget0' AND name != ''

GO
/****** Object:  View [dbo].[FieldQuality]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[FieldQuality]
------------------------------------------
--/H Contains the FieldQuality enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='FieldQuality' AND name != ''

GO
/****** Object:  View [dbo].[FramesStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[FramesStatus]
------------------------------------------
--/H Contains the FramesStatus enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='FramesStatus' AND name != ''

GO
/****** Object:  View [dbo].[HoleType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[HoleType]
------------------------------------------
--/H Contains the HoleType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='HoleType' AND name != ''

GO
/****** Object:  View [dbo].[ImageStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ImageStatus]
------------------------------------------
--/H Contains the ImageStatus flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the IMAGE_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ImageStatus' AND name != ''

GO
/****** Object:  View [dbo].[InsideMask]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[InsideMask]
------------------------------------------
--/H Contains the InsideMask flag values from DataConstants as binary(1)
------------------------------------------
AS
SELECT name, 
       convert(char(4),cast(value/power((cast(2 as bigint)),56) as binary(1)),1) as value,
       --	cast(value as binary(1)) as value, 
       description
    FROM DataConstants
    WHERE field='InsideMask' AND name != ''

GO
/****** Object:  View [dbo].[MaskType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[MaskType]
------------------------------------------
--/H Contains the MaskType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='MaskType' AND name != ''

GO
/****** Object:  View [dbo].[PhotoFamily]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoFamily]
----------------------------------------------------------------------
--/H These are in PhotoObj, but neither PhotoPrimary or Photosecondary.
--
--/T These objects are generated if they are neither primary nor 
--/T secondary survey objects but a composite object that has been 
--/T deblended or the part of an object that has been deblended 
--/T wrongfully (like the spiral arms of a galaxy). These objects 
--/T are kept to track how the deblender is working. It inherits 
--/T all members of the PhotoObj class. 
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=3

--(status & 0x00001000 = 0)  -- not a secondary
--	and NOT ( (status & 0x00002000>0) and (status & 0x0010 >0)) -- not a primary either

GO
/****** Object:  View [dbo].[PhotoFlags]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoFlags]
------------------------------------------
--/H Contains the PhotoFlags flag values from DataConstants as binary(8).
------------------------------------------
--/T Please see the FLAGS1 and FLAGS2 entries in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT 
	name, 
	value, 
	description
    FROM DataConstants
    WHERE field='PhotoFlags' AND name != ''

GO
/****** Object:  View [dbo].[PhotoMode]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoMode]
------------------------------------------
--/H Contains the PhotoMode enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field = 'PhotoMode' AND name != ''

GO
/****** Object:  View [dbo].[PhotoObj]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoObj]
----------------------------------------------------------------------
--/H All primary and secondary objects in the PhotoObjAll table, which contains all the attributes of each photometric (image) object. 
--
--/T It selects PhotoObj with mode=1 or 2.
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
	WHERE mode in (1,2)

GO
/****** Object:  View [dbo].[PhotoSecondary]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoSecondary]
----------------------------------------------------------------------
--/H Secondary objects are reobservations of the same primary object.
----------------------------------------------------------------------
AS
SELECT * FROM PhotoObjAll WITH(NOLOCK)
    WHERE mode=2
--status & 0x00001000 > 0 

GO
/****** Object:  View [dbo].[PhotoStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoStatus]
------------------------------------------
--/H Contains the PhotoStatus flag values from DataConstants as binary(4).
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PhotoStatus' AND name != ''

GO
/****** Object:  View [dbo].[PhotoType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PhotoType]
------------------------------------------
--/H Contains the PhotoType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='PhotoType' AND name != ''

GO
/****** Object:  View [dbo].[PrimTarget]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PrimTarget]
------------------------------------------
--/H Contains the PrimTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PrimTarget' AND name != ''

GO
/****** Object:  View [dbo].[ProgramType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ProgramType]
------------------------------------------
--/H Contains the ProgramType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='ProgramType' AND name != ''

GO
/****** Object:  View [dbo].[PspStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[PspStatus]
------------------------------------------
--/H Contains the PspStatus enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='PspStatus' AND name != ''

GO
/****** Object:  View [dbo].[RegionConvex]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[RegionConvex]
---------------------------------------------------------------
--/H Emulates the old RegionConvex table for compatibility
--/U ----------------------------------------------------------
--/T Implemented as a view, translates patchid to patch
---------------------------------------------------------------
AS
	SELECT	regionid, convexid, patchid as patch, type, 
			radius, ra,dec,x,y,z,c, htmid, convexString
	FROM RegionPatch

GO
/****** Object:  View [dbo].[ResolveStatus]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[ResolveStatus]
------------------------------------------
--/H Contains the ResolveStatus flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the RESOLVE_STATUS entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ResolveStatus' AND name != ''

GO
/****** Object:  View [dbo].[sdssTile]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTile]
---------------------------------------------------------------
--/H A view of sdssTileAll that have untiled=0
--
--/T The view excludes those sdssTiles that have been untiled.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTileAll WITH(NOLOCK)
    WHERE untiled = 0

GO
/****** Object:  View [dbo].[sdssTilingBoundary]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTilingBoundary]
---------------------------------------------------------------
--/H A view of sdssTilingGeometry objects that have isMask = 0
--
--/T The view excludes those sdssTilingGeometry objects that have 
--/T isMask = 1.  See also sdssTilingMask.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTilingGeometry WITH(NOLOCK)
    WHERE isMask = 0

GO
/****** Object:  View [dbo].[sdssTilingMask]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[sdssTilingMask]
---------------------------------------------------------------
--/H A view of sdssTilingGeometry objects that have isMask = 1
--
--/T The view excludes those sdssTilingGeometry objects that have 
--/T isMask = 0.  See also sdssTilingBoundary.
---------------------------------------------------------------
AS
SELECT * 
    FROM sdssTilingGeometry WITH(NOLOCK)
    WHERE isMask = 1

GO
/****** Object:  View [dbo].[SecTarget]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SecTarget]
------------------------------------------
--/H Contains the SecTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SecTarget' AND name != ''

GO
/****** Object:  View [dbo].[segue1SpecObjAll]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[segue1SpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE1 spectra
--
--/T The view excludes spectra that are not part of the SEGUE1 program.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'seg%' and p.programName not like 'segue2%'

GO
/****** Object:  View [dbo].[Segue1Target1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue1Target1]
------------------------------------------
--/H Contains the Segue1Target1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE1_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue1Target1' AND name != ''

GO
/****** Object:  View [dbo].[Segue1Target2]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue1Target2]
------------------------------------------
--/H Contains the Segue1Target2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE1_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue1Target2' AND name != ''

GO
/****** Object:  View [dbo].[segue2SpecObjAll]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[segue2SpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE2 spectra
--
--/T The view excludes spectra that are not part of the SEGUE2 program.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'segue2%'

GO
/****** Object:  View [dbo].[Segue2Target1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue2Target1]
------------------------------------------
--/H Contains the Segue2Target1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE2_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue2Target1' AND name != ''

GO
/****** Object:  View [dbo].[Segue2Target2]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[Segue2Target2]
------------------------------------------
--/H Contains the Segue2Target2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SEGUE2_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='Segue2Target2' AND name != ''

GO
/****** Object:  View [dbo].[segueSpecObjAll]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[segueSpecObjAll]
---------------------------------------------------------------
--/H A view of specObjAll that includes only SEGUE1+SEGUE2 spectra
--
--/T The view excludes spectra that are not part of the SEGUE1
--/T or SEGUE2 programs.
---------------------------------------------------------------
AS
SELECT s.* 
	FROM specObjAll 
	   AS s JOIN plateX AS p ON s.plateId = p.plateId
	WHERE p.programName like 'seg%'

GO
/****** Object:  View [dbo].[SourceType]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SourceType]
------------------------------------------
--/H Contains the SourceType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='SourceType' AND name != ''

GO
/****** Object:  View [dbo].[SpecialTarget1]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecialTarget1]
------------------------------------------
--/H Contains the SpecialTarget1 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPECIAL_TARGET1 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
       value,
       description
    FROM DataConstants
    WHERE field='SpecialTarget1' AND name != ''

GO
/****** Object:  View [dbo].[SpecialTarget2]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecialTarget2]
------------------------------------------
--/H Contains the SpecialTarget2 flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPECIAL_TARGET2 entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecialTarget2' AND name != ''

GO
/****** Object:  View [dbo].[SpecObj]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecObj] 
---------------------------------------------------------------
--/H A view of Spectro objects that just has the clean spectra.
--
--/T The view excludes QA and Sky and duplicates. Use this as the main
--/T way to access the spectro objects.
---------------------------------------------------------------
AS
SELECT * 
    FROM specObjAll WITH(NOLOCK)
    WHERE sciencePrimary = 1 

GO
/****** Object:  View [dbo].[SpecPhoto]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecPhoto] 
---------------------------------------------------------------
--/H A view of joined Spectro and Photo objects that have the clean spectra.
--
--/T The view includes only those pairs where the SpecObj is a
--/T sciencePrimary, and the BEST PhotoObj is a PRIMARY (mode=1).
---------------------------------------------------------------
AS
SELECT * 
    FROM SpecPhotoAll WITH(NOLOCK)
    WHERE sciencePrimary = 1 and mode=1

GO
/****** Object:  View [dbo].[SpecPixMask]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecPixMask]
------------------------------------------
--/H Contains the SpecPixMask flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the SPPIXMASK entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecPixMask' AND name != ''

GO
/****** Object:  View [dbo].[SpecZWarning]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[SpecZWarning]
------------------------------------------
--/H Contains the SpecZWarning flag values from DataConstants as binary(4).
------------------------------------------
--/T Please see the ZWARNING entry in Algorithms under Bitmasks
--/T for further information.
------------------------------------------
AS
SELECT name, 
	cast((value^power(cast(2 as bigint),32)) as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecZWarning' AND name != ''

GO
/****** Object:  View [dbo].[TableDesc]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  View [dbo].[TiMask]    Script Date: 2/2/2016 4:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
CREATE VIEW [dbo].[TiMask]
------------------------------------------
--/H Contains the TiMask flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name,
        cast((value^power(cast(2 as bigint),32)) as binary(4)) as value,
        description
    FROM DataConstants
    WHERE field='TiMask' AND name != ''

GO
