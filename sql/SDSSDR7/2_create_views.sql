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

----------------------------------------------------------------------

CREATE VIEW [dbo].[Unknown]
---------------------------------------------------------------------
--/H Everything in PhotoPrimary, which is not a galaxy, star or sky
--------------------------------------------------------------------
AS
SELECT * 
    FROM PhotoPrimary
    WHERE type not in (3,6,8)

GO
/****** Object:  View [dbo].[Star]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[Sky]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[Galaxy]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[PhotoAuxAll]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[PhotoAuxAll]
----------------------------------------------------------------------
--/H View for PhotoAuxAll for backward compatibility with DR5.
--
--/T It selects the required columns from PhotoObjAll.
----------------------------------------------------------------------
AS
SELECT objid,mode,b,l,raErr,decErr,raDecCorr FROM PhotoObjAll WITH(NOLOCK)

GO
/****** Object:  View [dbo].[PhotoAux]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[PhotoAux]
----------------------------------------------------------------------
--/H The PhotoAuxAll parameters for the PhotoObj view.
--
--/T It selects PhotoAuxAll with mode=1 or 2.
----------------------------------------------------------------------
AS
SELECT * FROM PhotoAuxAll
	WHERE mode in (1,2)

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
    WHERE field='CoordType'

GO
/****** Object:  View [dbo].[FieldMask]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[FieldMask]
------------------------------------------
--/H Contains the FieldMask flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT 
	name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='FieldMask'

GO
/****** Object:  View [dbo].[FieldQuality]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='FieldQuality'

GO
/****** Object:  View [dbo].[FramesStatus]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='FramesStatus'

GO
/****** Object:  View [dbo].[GalaxyTag]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[HoleType]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='HoleType'

GO
/****** Object:  View [dbo].[ImageMask]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[ImageMask]
------------------------------------------
--/H Contains the ImageMask flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='ImageMask'

GO
/****** Object:  View [dbo].[InsideMask]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[InsideMask]
------------------------------------------
--/H Contains the InsideMask flag values from DataConstants as binary(1)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(1)) as value, 
	description
    FROM DataConstants
    WHERE field='InsideMask'

GO
/****** Object:  View [dbo].[MaskType]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='MaskType'

GO
/****** Object:  View [dbo].[ObjType]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[ObjType]
------------------------------------------
--/H Contains the ObjType enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name,
        cast(value as int) as value,
        description
    FROM DataConstants
    WHERE field='ObjType'

GO
/****** Object:  View [dbo].[PhotoFamily]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[PhotoFlags]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[PhotoFlags]
------------------------------------------
--/H Contains the PhotoFlags flag values from DataConstants as binary(8)
------------------------------------------
AS
SELECT 
	name, 
	value, 
	description
    FROM DataConstants
    WHERE field='PhotoFlags'

GO
/****** Object:  View [dbo].[PhotoMode]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field = 'PhotoMode'

GO
/****** Object:  View [dbo].[PhotoObj]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[PhotoSecondary]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[PhotoStatus]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[PhotoStatus]
------------------------------------------
--/H Contains the PhotoStatus flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PhotoStatus'

GO
/****** Object:  View [dbo].[PhotoType]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='PhotoType'

GO
/****** Object:  View [dbo].[PrimTarget]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[PrimTarget]
------------------------------------------
--/H Contains the PrimTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='PrimTarget'

GO
/****** Object:  View [dbo].[ProgramType]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='ProgramType'

GO
/****** Object:  View [dbo].[PspStatus]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    WHERE field='PspStatus'

GO
/****** Object:  View [dbo].[QsoCatalog]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[QsoCatalog]
---------------------------------------------------------------
--/H The primary objects in the QsoCatalogAll table.
---------------------------------------------------------------
AS
     SELECT * FROM QsoCatalogAll WITH(NOLOCK) 
     WHERE QsoPrimary = 1

GO
/****** Object:  View [dbo].[QsoConcordance]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[QsoConcordance]
---------------------------------------------------------------
--/H The primary objects in the QsoConcordanceAll table.
---------------------------------------------------------------
AS
     SELECT * FROM QsoConcordanceAll WITH(NOLOCK)
     WHERE QsoPrimary = 1

GO
/****** Object:  View [dbo].[RegionConvex]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[Run]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[Run]
---------------------------------------------------------------------
--/H Distinct Run from Segment table, mainly for RUNS DB.
--------------------------------------------------------------------
AS
SELECT segmentID, run, rerun, field0, nFields
    FROM Segment WITH(NOLOCK)
    WHERE camcol=1

GO
/****** Object:  View [dbo].[SecTarget]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SecTarget]
------------------------------------------
--/H Contains the SecTarget flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SecTarget'

GO
/****** Object:  View [dbo].[SpecClass]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecClass]
------------------------------------------
--/H Contains the SpecClass enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='SpecClass'

GO
/****** Object:  View [dbo].[SpecLine]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecLine] 
---------------------------------------------------------------
--/H A view of SpecLines objects that have been measured
--
--/T The view excludes those SpecLine objects which have category=1,
--/T thus they have not been measured. This is the view you should
--/T use to access the SpecLine data.
---------------------------------------------------------------
AS
SELECT * 
    FROM specLineAll WITH(NOLOCK)
    WHERE category=2

GO
/****** Object:  View [dbo].[SpecLineNames]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecLineNames]
------------------------------------------
--/H Contains the SpecLineNames enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='SpecLineNames'

GO
/****** Object:  View [dbo].[SpecObj]    Script Date: 1/28/2016 11:17:29 AM ******/
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
/****** Object:  View [dbo].[SpecPhoto]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[SpecZStatus]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecZStatus]
------------------------------------------
--/H Contains the SpecZStatus enumerated values from DataConstants as int
------------------------------------------
AS
SELECT name, 
	cast(value as int) as value, 
	description
    FROM DataConstants
    WHERE field='SpecZStatus'

GO
/****** Object:  View [dbo].[SpecZWarning]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[SpecZWarning]
------------------------------------------
--/H Contains the SpecZWarning flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(4)) as value, 
	description
    FROM DataConstants
    WHERE field='SpecZWarning'

GO
/****** Object:  View [dbo].[StarTag]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[TargPhotoObj]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TargPhotoObj]
----------------------------------------------------------------------
--/H All primary and secondary objects in the TargPhotoObjAll table.
--
--/T It selects objects with mode=1 or 2.
----------------------------------------------------------------------
AS
SELECT * FROM TargPhotoObjAll WITH(NOLOCK)
	WHERE mode in (1,2)

GO
/****** Object:  View [dbo].[TargPhotoPrimary]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TargPhotoPrimary] 
----------------------------------------------------------------------
--/H These objects are the primary survey objects from the TargPhotoObjAll
--/H table. 
--
--/T Each physical object on the sky has only one primary object 
--/T associated with it. Upon subsequent observations secondary objects
--/T are generated. Since the survey stripes overlap, there will be
--/T secondary objects for over 10% of all primary objects, and in the
--/T southern stripes there will be a multitude of secondary objects 
--/T for each primary (i.e. reobservations). 
----------------------------------------------------------------------
AS
SELECT * FROM TargPhotoObjAll WITH(NOLOCK)
    WHERE mode=1

GO
/****** Object:  View [dbo].[TargPhotoSecondary]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TargPhotoSecondary]
----------------------------------------------------------------------
--/H Secondary objects are reobservations of the same primary object.
----------------------------------------------------------------------
AS
SELECT * FROM TargPhotoObjAll WITH(NOLOCK)
    WHERE mode=2
--status & 0x00001000 > 0

GO
/****** Object:  View [dbo].[Tile]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[Tile]
---------------------------------------------------------------
--/H A view of TileAll that have untiled=0
--
--/T The view excludes those Tiles that have been untiled.
---------------------------------------------------------------
AS
SELECT * 
    FROM TileAll WITH(NOLOCK)
    WHERE untiled = 0

GO
/****** Object:  View [dbo].[TiledTarget]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TiledTarget]
---------------------------------------------------------------
--/H A view of TiledTargetAll objects that have untiled = 0
--
--/T The view excludes those TiledTarget objects that have 
--/T been untiled.
---------------------------------------------------------------
AS
SELECT * 
    FROM TiledTargetAll WITH(NOLOCK)
    WHERE untiled = 0

GO
/****** Object:  View [dbo].[TilingBoundary]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TilingBoundary]
---------------------------------------------------------------
--/H A view of TilingGeometry objects that have isMask = 0
--
--/T The view excludes those TilingGeometry objects that have 
--/T isMask = 1.  See also TilingMask.
---------------------------------------------------------------
AS
SELECT * 
    FROM TilingGeometry WITH(NOLOCK)
    WHERE isMask = 0

GO
/****** Object:  View [dbo].[TilingMask]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TilingMask]
---------------------------------------------------------------
--/H A view of TilingGeometry objects that have isMask = 1
--
--/T The view excludes those TilingGeometry objects that have 
--/T isMask = 0.  See also TilingBoundary.
---------------------------------------------------------------
AS
SELECT * 
    FROM TilingGeometry WITH(NOLOCK)
    WHERE isMask = 1

GO
/****** Object:  View [dbo].[TiMask]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[TiMask]
------------------------------------------
--/H Contains the TiMask flag values from DataConstants as binary(4)
------------------------------------------
AS
SELECT name,
        cast(value as binary(4)) as value,
        description
    FROM DataConstants
    WHERE field='TiMask'

GO
/****** Object:  View [dbo].[UberCalibStatus]    Script Date: 1/28/2016 11:17:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE VIEW [dbo].[UberCalibStatus]
------------------------------------------
--/H Contains the UberCalibStatus flag values from DataConstants as binary(2)
------------------------------------------
AS
SELECT name, 
	cast(value as binary(2)) as value, 
	description
    FROM DataConstants
    WHERE field='UberCalibStatus'

GO
