-- acsData
CREATE NONCLUSTERED INDEX [IX_acsData_Zone] ON [dbo].[acsData] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_acsData_ZoneID] ON [dbo].[acsData] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_acsData_HtmID] ON [dbo].[acsData] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

----------------------------------------------
-- img

CREATE NONCLUSTERED INDEX [IX_img_Zone] ON [dbo].[img] 
(
	[dec_cent] ASC
)
INCLUDE
(
	[ra_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_img_ZoneID] ON [dbo].[img] 
(
	[zoneid] ASC,
	[ra_cent] ASC
)
INCLUDE
(
	[dec_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_img_HtmID] ON [dbo].[img] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra_cent],
	[dec_cent],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-----------------------------------------------------------------------------
-- photoExtract
CREATE NONCLUSTERED INDEX [IX_photoExtract_Zone] ON [dbo].[photoExtract] 
(
	[dec_cent] ASC
)
INCLUDE
(
	[ra_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_photoExtract_ZoneID] ON [dbo].[photoExtract] 
(
	[zoneid] ASC,
	[ra_cent] ASC
)
INCLUDE
(
	[dec_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_photoExtract_HtmID] ON [dbo].[photoExtract] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra_cent],
	[dec_cent],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO


-----------------------------------------------------------------------------
-- photoObjAll

CREATE NONCLUSTERED INDEX [IX_photoObjAll_Zone] ON [dbo].[photoObjAll] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]
GO

CREATE NONCLUSTERED INDEX [IX_photoObjAll_ZoneID] ON [dbo].[photoObjAll] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_photoObjAll_HtmID] ON [dbo].[photoObjAll] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]
GO


----------------------------------------------------------------------------
-- target

CREATE NONCLUSTERED INDEX [IX_target_Zone] ON [dbo].[target] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_target_ZoneID] ON [dbo].[target] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_target_HtmID] ON [dbo].[target] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO
----------------------------------------------
-- visitImg
CREATE NONCLUSTERED INDEX [IX_visitImg_Zone] ON [dbo].[visitImg] 
(
	[dec_cent] ASC
)
INCLUDE
(
	[ra_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_visitImg_ZoneID] ON [dbo].[visitImg] 
(
	[zoneid] ASC,
	[ra_cent] ASC
)
INCLUDE
(
	[dec_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_visitImg_HtmID] ON [dbo].[visitImg] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra_cent],
	[dec_cent],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-----------------------------------------------------------------------------
-- vistPhotoExtract


CREATE NONCLUSTERED INDEX [IX_VisitPhotoExtract_Zone] ON [dbo].[VisitPhotoExtract] 
(
	[dec_cent] ASC
)
INCLUDE
(
	[ra_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_VisitPhotoExtract_ZoneID] ON [dbo].[VisitPhotoExtract] 
(
	[zoneid] ASC,
	[ra_cent] ASC
)
INCLUDE
(
	[dec_cent],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_VisitPhotoExtract_HtmID] ON [dbo].[VisitPhotoExtract] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra_cent],
	[dec_cent],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

---------------------------------------------------------------------------------
-- visitPhotoObjAll

CREATE NONCLUSTERED INDEX [IX_visitPhotoObjAll_Zone] ON [dbo].[visitPhotoObjAll] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [VPHOTOIDX]
GO

CREATE NONCLUSTERED INDEX [IX_visitPhotoObjAll_ZoneID] ON [dbo].[visitPhotoObjAll] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [VPHOTOIDX]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_visitPhotoObjAll_HtmID] ON [dbo].[visitPhotoObjAll] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [VPHOTOIDX]
GO

