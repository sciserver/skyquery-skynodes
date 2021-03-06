
CREATE NONCLUSTERED INDEX [i_apogeeObject_apogee_id_j_h_k_j] ON [dbo].[apogeeObject]
(
	[apogee_id] ASC,
	[j] ASC,
	[h] ASC,
	[k] ASC,
	[j_err] ASC,
	[h_err] ASC,
	[k_err] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_apogeeStar_apogee_id] ON [dbo].[apogeeStar]
(
	[apogee_id] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_apogeeVisit_apogee_id] ON [dbo].[apogeeVisit]
(
	[apogee_id] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_apogeeVisit_plate_mjd_fiberid] ON [dbo].[apogeeVisit]
(
	[plate] ASC,
	[mjd] ASC,
	[fiberid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_aspcapStar_apstar_id] ON [dbo].[aspcapStar]
(
	[apstar_id] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_DataConstants_value] ON [dbo].[DataConstants]
(
	[value] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_Field_field_camcol_run_rerun] ON [dbo].[Field]
(
	[field] ASC,
	[camcol] ASC,
	[run] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_Field_run_camcol_field_rerun] ON [dbo].[Field]
(
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_Frame_field_camcol_run_zoom_re] ON [dbo].[Frame]
(
	[field] ASC,
	[camcol] ASC,
	[run] ASC,
	[zoom] ASC,
	[rerun] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

/*CREATE NONCLUSTERED INDEX [i_Frame_htmID_zoom_cx_cy_cz_a_b_] ON [dbo].[Frame]
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
ON [PRIMARY]

GO*/

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
ON [PRIMARY]

GO

/*
CREATE NONCLUSTERED INDEX [i_Mask_htmID_ra_dec_cx_cy_cz] ON [dbo].[Mask]
(
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

/*CREATE NONCLUSTERED INDEX [i_PlateX_htmID_ra_dec_cx_cy_cz] ON [dbo].[PlateX]
(
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

/*CREATE NONCLUSTERED INDEX [i_RegionPatch_htmID_ra_dec_x_y_z] ON [dbo].[RegionPatch]
(
	[htmid] ASC,
	[ra] ASC,
	[dec] ASC,
	[x] ASC,
	[y] ASC,
	[z] ASC,
	[type] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

/*CREATE NONCLUSTERED INDEX [i_sdssTileAll_htmID_racen_deccen] ON [dbo].[sdssTileAll]
(
	[htmID] ASC,
	[raCen] ASC,
	[decCen] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTileAll_tileRun_tile] ON [dbo].[sdssTileAll]
(
	[tileRun] ASC,
	[tile] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

/*CREATE NONCLUSTERED INDEX [i_sdssTiledTargetAll_htmID_ra_de] ON [dbo].[sdssTiledTargetAll]
(
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_targetID_tileRu] ON [dbo].[sdssTilingInfo]
(
	[targetID] ASC,
	[tileRun] ASC,
	[collisionGroup] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_sdssTilingInfo_tile_collisionG] ON [dbo].[sdssTilingInfo]
(
	[tile] ASC,
	[collisionGroup] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE UNIQUE NONCLUSTERED INDEX [i_sdssTilingInfo_tileRun_tid_col] ON [dbo].[sdssTilingInfo]
(
	[tileRun] ASC,
	[tid] ASC,
	[collisionGroup] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_segueTargetAll_segue1_target1_] ON [dbo].[segueTargetAll]
(
	[segue1_target1] ASC,
	[segue2_target1] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_SpecObjAll_BestObjID_sourceTyp] ON [dbo].[SpecObjAll]
(
	[bestObjID] ASC,
	[sourceType] ASC,
	[sciencePrimary] ASC,
	[class] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[plate] ASC,
	[mjd] ASC,
	[fiberID] ASC,
	[z] ASC,
	[zErr] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_SpecObjAll_class_zWarning_z_sc] ON [dbo].[SpecObjAll]
(
	[class] ASC,
	[zWarning] ASC,
	[z] ASC,
	[sciencePrimary] ASC,
	[plateID] ASC,
	[bestObjID] ASC,
	[targetObjID] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_SpecObjAll_fluxObjID] ON [dbo].[SpecObjAll]
(
	[fluxObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

/*CREATE NONCLUSTERED INDEX [i_SpecObjAll_htmID_ra_dec_cx_cy_] ON [dbo].[SpecObjAll]
(
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[sciencePrimary] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

/*CREATE NONCLUSTERED INDEX [i_SpecObjAll_ra_dec_class_plat] ON [dbo].[SpecObjAll]
(
	[ra] ASC,
	[dec] ASC,
	[class] ASC,
	[plate] ASC,
	[tile] ASC,
	[z] ASC,
	[zErr] ASC,
	[sciencePrimary] ASC,
	[plateID] ASC,
	[bestObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO*/

CREATE NONCLUSTERED INDEX [i_SpecObjAll_targetObjID_sourceT] ON [dbo].[SpecObjAll]
(
	[targetObjID] ASC,
	[sourceType] ASC,
	[sciencePrimary] ASC,
	[class] ASC,
	[htmID] ASC,
	[ra] ASC,
	[dec] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_objID_sciencePrim] ON [dbo].[SpecPhotoAll]
(
	[objID] ASC,
	[sciencePrimary] ASC,
	[class] ASC,
	[z] ASC,
	[targetObjID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_targetObjID_scien] ON [dbo].[SpecPhotoAll]
(
	[targetObjID] ASC,
	[sciencePrimary] ASC,
	[class] ASC,
	[z] ASC,
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_thingIndex_objID] ON [dbo].[thingIndex]
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooConfidence_objID] ON [dbo].[zooConfidence]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooMirrorBias_objID] ON [dbo].[zooMirrorBias]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooMonochromeBias_objID] ON [dbo].[zooMonochromeBias]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooNoSpec_objID] ON [dbo].[zooNoSpec]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooSpec_objID] ON [dbo].[zooSpec]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [i_zooVotes_objID] ON [dbo].[zooVotes]
(
	[objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO
