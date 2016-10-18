CREATE NONCLUSTERED INDEX [IX_sdssTileAll_htmID] ON [dbo].[sdssTileAll]
(
	[htmID] ASC
)
INCLUDE
(
	[raCen],
	[decCen],
	[cx],
	[cy],
	[cz],
	[zoneID]
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_sdssTileAll_zone] ON [dbo].[sdssTileAll]
(
	[decCen] ASC
)
INCLUDE
(
	[raCen],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_sdssTileAll_zoneID] ON [dbo].[sdssTileAll]
(
	[zoneID] ASC,
	[raCen] ASC
)
INCLUDE
(
	[decCen],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_sdssTiledTargetAll_htmID] ON [dbo].[sdssTiledTargetAll]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_sdssTiledTargetAll_zone] ON [dbo].[sdssTiledTargetAll]
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

CREATE NONCLUSTERED INDEX [IX_sdssTiledTargetAll_zoneID] ON [dbo].[sdssTiledTargetAll]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_htmID] ON [dbo].[PhotoObjAll]
(
	[htmID] ASC
)
INCLUDE
(
 	[type],
	[mode],
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

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_zone] ON [dbo].[PhotoObjAll]
(
	[dec] ASC
)
INCLUDE
(
 	[type],
	[mode],
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_zoneID] ON [dbo].[PhotoObjAll]
(
	[zoneID] ASC,
	[ra] ASC
)
INCLUDE
(
 	[type],
	[mode],
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_PhotoObjDR7_htmID] ON [dbo].[PhotoObjDR7]
(
	[htmID] ASC
)
INCLUDE
(
	[type],
	[modeDR7],
	[modeDR8],
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

CREATE NONCLUSTERED INDEX [IX_PhotoObjDR7_zone] ON [dbo].[PhotoObjDR7]
(
	[dec] ASC
)
INCLUDE
(
	[type],
	[modeDR7],
	[modeDR8],
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_PhotoObjDR7_zoneID] ON [dbo].[PhotoObjDR7]
(
	[zoneID] ASC,
	[ra] ASC
)
INCLUDE
(
	[type],
	[modeDR7],
	[modeDR8],
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

---------------------------------------------------------------


CREATE NONCLUSTERED INDEX [IX_PhotoPrimaryDR7_htmID] ON [dbo].[PhotoPrimaryDR7]
(
	[htmID] ASC
)
INCLUDE
(
	[type],
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

CREATE NONCLUSTERED INDEX [IX_PhotoPrimaryDR7_zone] ON [dbo].[PhotoPrimaryDR7]
(
	[dec] ASC
)
INCLUDE
(
	[type],
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_PhotoPrimaryDR7_zoneID] ON [dbo].[PhotoPrimaryDR7]
(
	[zoneID] ASC,
	[ra] ASC
)
INCLUDE
(
	[type],
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_Mask_htmID] ON [dbo].[Mask]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_Mask_zone] ON [dbo].[Mask]
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

CREATE NONCLUSTERED INDEX [IX_Mask_zoneID] ON [dbo].[Mask]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_SpecDR7_htmID] ON [dbo].[SpecDR7]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_SpecDR7_zone] ON [dbo].[SpecDR7]
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

CREATE NONCLUSTERED INDEX [IX_SpecDR7_zoneID] ON [dbo].[SpecDR7]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_SpecObjAll_htmID] ON [dbo].[SpecObjAll]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_SpecObjAll_zone] ON [dbo].[SpecObjAll]
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

CREATE NONCLUSTERED INDEX [IX_SpecObjAll_zoneID] ON [dbo].[SpecObjAll]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_SpecPhotoAll_htmID] ON [dbo].[SpecPhotoAll]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_SpecPhotoAll_zone] ON [dbo].[SpecPhotoAll]
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

CREATE NONCLUSTERED INDEX [IX_SpecPhotoAll_zoneID] ON [dbo].[SpecPhotoAll]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_Frame_htmID] ON [dbo].[Frame]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_Frame_zone] ON [dbo].[Frame]
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

CREATE NONCLUSTERED INDEX [IX_Frame_zoneID] ON [dbo].[Frame]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_PlateX_htmID] ON [dbo].[PlateX]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_PlateX_zone] ON [dbo].[PlateX]
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

CREATE NONCLUSTERED INDEX [IX_PlateX_zoneID] ON [dbo].[PlateX]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_apogeeStar_htmID] ON [dbo].[apogeeStar]
(
	[htmID] ASC
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

CREATE NONCLUSTERED INDEX [IX_apogeeStar_zone] ON [dbo].[apogeeStar]
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

CREATE NONCLUSTERED INDEX [IX_apogeeStar_zoneID] ON [dbo].[apogeeStar]
(
	[zoneID] ASC,
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

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_RegionPatch_htmID] ON [dbo].[RegionPatch]
(
	[htmID] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[x],
	[y],
	[z],
	[zoneID]
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_RegionPatch_zone] ON [dbo].[RegionPatch]
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[x],
	[y],
	[z]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_RegionPatch_zoneID] ON [dbo].[RegionPatch]
(
	[zoneID] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[x],
	[y],
	[z]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

---------------------------------------------------------------