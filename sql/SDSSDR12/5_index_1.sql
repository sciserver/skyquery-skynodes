CREATE NONCLUSTERED INDEX [i_PhotoObjAll_field_run_rerun_ca] ON [dbo].[PhotoObjAll]
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
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_fieldID_objID_ra_d] ON [dbo].[PhotoObjAll]
(
	[fieldID] ASC,
	[objID] ASC,
	[ra] ASC,
	[dec] ASC,
	[r] ASC,
	[type] ASC,
	[flags] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_htmID_cx_cy_cz_typ] ON [dbo].[PhotoObjAll]
(
	[htmID] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[ra] ASC,
	[dec] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_htmID_run_camcol_f] ON [dbo].[PhotoObjAll]
(
	[htmID] ASC,
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[rerun] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[g] ASC,
	[r] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_mode_cy_cx_cz_htmI] ON [dbo].[PhotoObjAll]
(
	[mode] ASC,
	[cy] ASC,
	[cx] ASC,
	[cz] ASC,
	[htmID] ASC,
	[type] ASC,
	[flags] ASC,
	[ra] ASC,
	[dec] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_parentid_mode_type] ON [dbo].[PhotoObjAll]
(
	[parentID] ASC,
	[mode] ASC,
	[type] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_PhotoTag] ON [dbo].[PhotoObjAll]
(
	[objID] ASC,
	[htmID] ASC,
	[fieldID] ASC,
	[specObjID] ASC,
	[run] ASC,
	[camcol] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC,
	[flags] ASC,
	[mode] ASC,
	[type] ASC
)
INCLUDE ( 	[field],
	[obj],
	[resolveStatus],
	[nChild],
	[probPSF],
	[psfMag_u],
	[psfMag_g],
	[psfMag_r],
	[psfMag_i],
	[psfMag_z],
	[psfMagErr_u],
	[psfMagErr_g],
	[psfMagErr_r],
	[psfMagErr_i],
	[psfMagErr_z],
	[petroMag_u],
	[petroMag_g],
	[petroMag_r],
	[petroMag_i],
	[petroMag_z],
	[petroMagErr_u],
	[petroMagErr_g],
	[petroMagErr_r],
	[petroMagErr_i],
	[petroMagErr_z],
	[petroR50_r],
	[petroR90_r],
	[fracDeV_u],
	[fracDeV_g],
	[fracDeV_r],
	[fracDeV_i],
	[fracDeV_z],
	[thingId],
	[balkanId],
	[nObserve],
	[nDetect],
	[calibStatus_u],
	[calibStatus_g],
	[calibStatus_r],
	[calibStatus_i],
	[calibStatus_z],
	[extinction_u],
	[extinction_g],
	[extinction_r],
	[extinction_i],
	[extinction_z])
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_camcol_field_m] ON [dbo].[PhotoObjAll]
(
	[run] ASC,
	[camcol] ASC,
	[field] ASC,
	[mode] ASC,
	[parentID] ASC,
	[fiberMag_u] ASC,
	[fiberMag_g] ASC,
	[fiberMag_r] ASC,
	[fiberMag_i] ASC,
	[fiberMag_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_camcol_rerun_t] ON [dbo].[PhotoObjAll]
(
	[run] ASC,
	[camcol] ASC,
	[rerun] ASC,
	[type] ASC,
	[mode] ASC,
	[flags] ASC,
	[ra] ASC,
	[dec] ASC,
	[fieldID] ASC,
	[field] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [i_PhotoObjAll_run_mode_type_flag] ON [dbo].[PhotoObjAll]
(
	[run] ASC,
	[mode] ASC,
	[type] ASC,
	[flags] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC,
	[err_u] ASC,
	[err_g] ASC,
	[err_r] ASC,
	[err_i] ASC,
	[err_z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

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
	[ra] ASC,
	[dec] ASC,
	[u] ASC,
	[g] ASC,
	[r] ASC,
	[i] ASC,
	[z] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO


CREATE NONCLUSTERED INDEX [i_PhotoObjDR7_dr7objID] ON [dbo].[PhotoObjDR7]
(
	[dr7objid] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO