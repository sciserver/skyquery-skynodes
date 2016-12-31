CREATE UNIQUE NONCLUSTERED INDEX [i_BestTarget2Sector_regionID_obj] ON [dbo].[BestTarget2Sector]
(
	[regionID] ASC,
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------


CREATE NONCLUSTERED INDEX [i_DataConstants_value] ON [dbo].[DataConstants]
(
	[value] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

---------------------------------------------------------------

CREATE INDEX IX_DR3QuasarCatalog_htmID ON [dbo].[DR3QuasarCatalog]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_DR3QuasarCatalog_zone ON [dbo].[DR3QuasarCatalog]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_DR3QuasarCatalog_zoneID ON [dbo].[DR3QuasarCatalog]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

---------------------------------------------------------------

CREATE INDEX IX_DR5QuasarCatalog_htmID ON [dbo].[DR5QuasarCatalog]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_DR5QuasarCatalog_zone ON [dbo].[DR5QuasarCatalog]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_DR5QuasarCatalog_zoneID ON [dbo].[DR5QuasarCatalog]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_ELRedShift_specObjID_elRedShif] ON [dbo].[ELRedShift]
(
	[specObjID] ASC,
	[elRedShiftID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_Field_field_camcol_run_rerun] ON [dbo].[Field]
(
	[field] ASC,
	[camcol] ASC,
	[run] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE NONCLUSTERED INDEX [i_Field_run_camcol_field_rerun] ON [dbo].[Field]
(
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_Frame_field_camcol_run_zoom_re] ON [dbo].[Frame]
(
	[field] ASC,
	[camcol] ASC,
	[run] ASC,
	[zoom] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [FRAME]

GO

CREATE NONCLUSTERED INDEX [i_Frame_htmID_zoom_cx_cy_cz_a_b_] ON [dbo].[Frame]
(
	[htmID] ASC,
	[zoom] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[a] ASC,
	[b] ASC,
	[c] ASC,
	[d] ASC,
	[e] ASC,
	[f] ASC,
	[node] ASC,
	[incl] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [FRAME]

GO


---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_HalfSpace_regionID_convexID_x_] ON [dbo].[HalfSpace]
(
	[regionid] ASC,
	[convexid] ASC,
	[x] ASC,
	[y] ASC,
	[z] ASC,
	[c] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [REGION]

GO

---------------------------------------------------------------

CREATE INDEX IX_HoleObj_htmID ON [dbo].[HoleObj]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_HoleObj_zone ON [dbo].[HoleObj]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_HoleObj_zoneID ON [dbo].[HoleObj]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

------------------

CREATE INDEX IX_Mask_htmID ON [dbo].[Mask]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_Mask_zone ON [dbo].[Mask]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_Mask_zoneID ON [dbo].[Mask]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_Match_matchHead] ON [dbo].[Match]
(
	[matchHead] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [NEIGHBORS]

GO

---------------------------------------------------------------

CREATE INDEX IX_OrigPhotoObjAll_htmID ON [dbo].[OrigPhotoObjAll]
(
	[htmID]
)
INCLUDE
(
	[mode], [ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [ORIGPHOTO]

GO

CREATE INDEX IX_OrigPhotoObjAll_zone ON [dbo].[OrigPhotoObjAll]
(
	[dec]
)
INCLUDE
(
	[mode], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [ORIGPHOTO]

GO

CREATE INDEX IX_OrigPhotoObjAll_zoneID ON [dbo].[OrigPhotoObjAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[mode], [dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [ORIGPHOTO]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_field_run_rerun_ca] ON [dbo].[PhotoObjAll]
(
	[field] ASC,
	[run] ASC,
	[rerun] ASC,
	[camcol] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[rowc] ASC,
	[colc] ASC,
	[ra] ASC,
	[dec] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_fieldID_objID_ra_d] ON [dbo].[PhotoObjAll]
(
	[fieldID] ASC,
	[objID] ASC,
	[ra] ASC,
	[dec] ASC,
	[r] ASC,
	[type] ASC,
	[status] ASC,
	[flags] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_SpecObjID_cx_cy_cz] ON [dbo].[PhotoObjAll]
(
	[specObjID] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[mode] ASC,
	[type] ASC,
	[flags] ASC,
	[status] ASC,
	[ra] ASC,
	[dec] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC,
	[rho] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE INDEX IX_PhotoObjAll_htmID ON [dbo].[PhotoObjAll]
(
	[htmID]
)
INCLUDE
(
	[type], [mode], [ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE INDEX IX_PhotoObjAll_zone ON [dbo].[PhotoObjAll]
(
	[dec]
)
INCLUDE
(
	[type], [mode], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

CREATE INDEX IX_PhotoObjAll_zoneID ON [dbo].[PhotoObjAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[type], [mode], [dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOINDEX]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_PhotoTag_field_run_rerun_camco] ON [dbo].[PhotoTag]
(
	[field] ASC,
	[run] ASC,
	[rerun] ASC,
	[camcol] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[ra] ASC,
	[dec] ASC,
	[modelMag_u] ASC,
	[modelMag_g] ASC,
	[modelMag_r] ASC,
	[modelMag_i] ASC,
	[modelMag_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE NONCLUSTERED INDEX [i_PhotoTag_fieldID_objID_ra_dec] ON [dbo].[PhotoTag]
(
	[fieldID] ASC,
	[objID] ASC,
	[ra] ASC,
	[dec] ASC,
	[modelMag_r] ASC,
	[type] ASC,
	[status] ASC,
	[flags] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE NONCLUSTERED INDEX [i_PhotoTag_htmID_run_camcol_fiel] ON [dbo].[PhotoTag]
(
	[htmID] ASC,
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[rerun] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[status] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[modelMag_g] ASC,
	[modelMag_r] ASC,
	[probPSF] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE NONCLUSTERED INDEX [i_PhotoTag_run_camcol_field_reru] ON [dbo].[PhotoTag]
(
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[rerun] ASC,
	[type] ASC,
	[mode] ASC,
	[status] ASC,
	[flags] ASC,
	[ra] ASC,
	[dec] ASC,
	[fieldID] ASC,
	[modelMag_u] ASC,
	[modelMag_g] ASC,
	[modelMag_r] ASC,
	[modelMag_i] ASC,
	[modelMag_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE NONCLUSTERED INDEX [i_PhotoTag_run_mode_type_status_] ON [dbo].[PhotoTag]
(
	[run] ASC,
	[mode] ASC,
	[type] ASC,
	[status] ASC,
	[flags] ASC,
	[modelMag_u] ASC,
	[modelMag_g] ASC,
	[modelMag_r] ASC,
	[modelMag_i] ASC,
	[modelMag_z] ASC,
	[modelMagErr_u] ASC,
	[modelMagErr_g] ASC,
	[modelMagErr_r] ASC,
	[modelMagErr_i] ASC,
	[modelMagErr_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE NONCLUSTERED INDEX [i_PhotoTag_SpecObjID_cx_cy_cz_mo] ON [dbo].[PhotoTag]
(
	[specObjID] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[mode] ASC,
	[type] ASC,
	[flags] ASC,
	[status] ASC,
	[ra] ASC,
	[dec] ASC,
	[modelMag_u] ASC,
	[modelMag_g] ASC,
	[modelMag_r] ASC,
	[modelMag_i] ASC,
	[modelMag_z] ASC,
	[size] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE INDEX IX_PhotoTag_htmID ON [dbo].[PhotoTag]
(
	[htmID]
)
INCLUDE
(
	[mode], [ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE INDEX IX_PhotoTag_zone ON [dbo].[PhotoTag]
(
	[dec]
)
INCLUDE
(
	[mode], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

CREATE INDEX IX_PhotoTag_zoneID ON [dbo].[PhotoTag]
(
	[zoneID], [ra]
)
INCLUDE
(
	[mode], [dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOTAG]

GO

---------------------------------------------------------------

CREATE INDEX IX_PsObjAll_htmID ON [dbo].[PsObjAll]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_PsObjAll_zone ON [dbo].[PsObjAll]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

CREATE INDEX IX_PsObjAll_zoneID ON [dbo].[PsObjAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [OTHER]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_QsoBest_headObjID] ON [dbo].[QsoBest]
(
	[headObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_QsoBunch_headObjID] ON [dbo].[QsoBunch]
(
	[HeadObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO


CREATE INDEX IX_QsoBunch_htmID ON [dbo].[QsoBunch]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_QsoBunch_zone ON [dbo].[QsoBunch]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_QsoBunch_zoneID ON [dbo].[QsoBunch]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_QsoSpec_headObjID] ON [dbo].[QsoSpec]
(
	[HeadObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_QsoTarget_headObjID] ON [dbo].[QsoTarget]
(
	[headObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_Sector2Tile_tile] ON [dbo].[Sector2Tile]
(
	[tile] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_SpecLineAll_specobjID_specLine] ON [dbo].[SpecLineAll]
(
	[specobjID] ASC,
	[specLineID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) 
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_SpecLineIndex_specobjID_specli] ON [dbo].[SpecLineIndex]
(
	[specobjID] ASC,
	[specLineIndexID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_SpecObjAll_BestObjID_objType_o] ON [dbo].[SpecObjAll]
(
	[bestObjID] ASC,
	[objType] ASC,
	[objTypeName] ASC,
	[sciencePrimary] ASC,
	[specClass] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[fiberMag_u] ASC,
	[fiberMag_g] ASC,
	[fiberMag_r] ASC,
	[fiberMag_i] ASC,
	[fiberMag_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]
GO

CREATE NONCLUSTERED INDEX [i_SpecObjAll_specClass_zStatus_z] ON [dbo].[SpecObjAll]
(
	[specClass] ASC,
	[zStatus] ASC,
	[zWarning] ASC,
	[z] ASC,
	[sciencePrimary] ASC,
	[primTarget] ASC,
	[secTarget] ASC,
	[plateID] ASC,
	[bestObjID] ASC,
	[targetObjID] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE NONCLUSTERED INDEX [i_SpecObjAll_targetObjID_objType] ON [dbo].[SpecObjAll]
(
	[targetObjID] ASC,
	[objType] ASC,
	[objTypeName] ASC,
	[sciencePrimary] ASC,
	[specClass] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[fiberMag_u] ASC,
	[fiberMag_g] ASC,
	[fiberMag_r] ASC,
	[fiberMag_i] ASC,
	[fiberMag_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]
GO

CREATE INDEX IX_SpecObjAll_htmID ON [dbo].[SpecObjAll]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_SpecObjAll_zone ON [dbo].[SpecObjAll]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_SpecObjAll_zoneID ON [dbo].[SpecObjAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_objID_sciencePrim] ON [dbo].[SpecPhotoAll]
(
	[objID] ASC,
	[sciencePrimary] ASC,
	[specClass] ASC,
	[z] ASC,
	[targetObjID] ASC,
	[targetID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_targetID_scienceP] ON [dbo].[SpecPhotoAll]
(
	[targetID] ASC,
	[sciencePrimary] ASC,
	[specClass] ASC,
	[z] ASC,
	[objID] ASC,
	[targetObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_targetObjID_scien] ON [dbo].[SpecPhotoAll]
(
	[targetObjID] ASC,
	[sciencePrimary] ASC,
	[specClass] ASC,
	[z] ASC,
	[objID] ASC,
	[targetID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_SpecPhotoAll_htmID ON [dbo].[SpecPhotoAll]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_SpecPhotoAll_zone ON [dbo].[SpecPhotoAll]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_SpecPhotoAll_zoneID ON [dbo].[SpecPhotoAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE INDEX IX_sppParams_htmID ON [dbo].[sppParams]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_sppParams_zone ON [dbo].[sppParams]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_sppParams_zoneID ON [dbo].[sppParams]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [i_Target_bestobjID_regionID_spec] ON [dbo].[Target]
(
	[bestObjID] ASC,
	[regionID] ASC,
	[specObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE NONCLUSTERED INDEX [i_Target_regionID_bestobjid_spec] ON [dbo].[Target]
(
	[regionID] ASC,
	[bestObjID] ASC,
	[specObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE NONCLUSTERED INDEX [i_Target_specobjID_regionID_best] ON [dbo].[Target]
(
	[specObjID] ASC,
	[regionID] ASC,
	[bestObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_Target_htmID ON [dbo].[Target]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_Target_zone ON [dbo].[Target]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_Target_zoneID ON [dbo].[Target]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_TargetInfo_targetID_skyversion] ON [dbo].[TargetInfo]
(
	[targetID] ASC,
	[skyVersion] ASC,
	[targetObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE NONCLUSTERED INDEX [i_TargetInfo_targetobjID_primTar] ON [dbo].[TargetInfo]
(
	[targetObjID] ASC,
	[primTarget] ASC,
	[secTarget] ASC,
	[priority] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE INDEX IX_TargPhotoObjAll_htmID ON [dbo].[TargPhotoObjAll]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_TargPhotoObjAll_zone ON [dbo].[TargPhotoObjAll]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_TargPhotoObjAll_zoneID ON [dbo].[TargPhotoObjAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

---------------------------------------------------------------

CREATE INDEX IX_TargPhotoTag_htmID ON [dbo].[TargPhotoTag]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_TargPhotoTag_zone ON [dbo].[TargPhotoTag]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

CREATE INDEX IX_TargPhotoTag_zoneID ON [dbo].[TargPhotoTag]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOOTHER]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_TileAll_tileRun_tile] ON [dbo].[TileAll]
(
	[tileRun] ASC,
	[tile] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_TiledTargetAll_objType_targetI] ON [dbo].[TiledTargetAll]
(
	[objType] ASC,
	[targetID] ASC,
	[tile] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE UNIQUE NONCLUSTERED INDEX [i_TiledTargetAll_tile_targetID] ON [dbo].[TiledTargetAll]
(
	[tile] ASC,
	[targetID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_TiledTargetAll_htmID ON [dbo].[TiledTargetAll]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_TiledTargetAll_zone ON [dbo].[TiledTargetAll]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE INDEX IX_TiledTargetAll_zoneID ON [dbo].[TiledTargetAll]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_TilingInfo_targetID_tileRun_co] ON [dbo].[TilingInfo]
(
	[targetID] ASC,
	[tileRun] ASC,
	[collisionGroupID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE NONCLUSTERED INDEX [i_TilingInfo_tile_collisionGroup] ON [dbo].[TilingInfo]
(
	[tile] ASC,
	[collisionGroupID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

CREATE UNIQUE NONCLUSTERED INDEX [i_TilingInfo_tileRun_collisionGr] ON [dbo].[TilingInfo]
(
	[tileRun] ASC,
	[collisionGroupID] ASC,
	[targetID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO

---------------------------------------------------------------

CREATE INDEX IX_UberAstro_htmID ON [dbo].[UberAstro]
(
	[htmID]
)
INCLUDE
(
	[ra], [dec], [cx], [cy], [cz], [zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [UBERCALIB]

GO

CREATE INDEX IX_UberAstro_zone ON [dbo].[UberAstro]
(
	[dec]
)
INCLUDE
(
	[ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [UBERCALIB]

GO

CREATE INDEX IX_UberAstro_zoneID ON [dbo].[UberAstro]
(
	[zoneID], [ra]
)
INCLUDE
(
	[dec], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [UBERCALIB]

GO

---------------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX [i_XCRedshift_specObjID_xcRedShif] ON [dbo].[XCRedshift]
(
	[specObjID] ASC,
	[xcRedShiftID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SPECOBJ]

GO