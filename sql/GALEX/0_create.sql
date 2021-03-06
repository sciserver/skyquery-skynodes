CREATE TABLE [dbo].[PhotoObjAll]
(
	[objid] [bigint] NOT NULL,
	[photoExtractID] [bigint] NOT NULL,
	[vsn] [int] NULL,
	[tilenum] [int] NULL,
	[type] [int] NULL,
	[ow] [int] NULL,
	[prod] [int] NULL,
	[img] [int] NULL,
	[try] [int] NULL,
	[band] [int] NULL,
	[id] [int] NULL,
	[subvisit] [smallint] NULL,
	[leg] [smallint] NULL,
	[ra] [float] NULL,
	[dec] [float] NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmID] [bigint] NOT NULL,
	[zoneID] [bigint] NOT NULL,
	[alpha_j2000_merged] [float] NULL,
	[delta_j2000_merged] [float] NULL,
	[prob] [real] NULL,
	[sep] [real] NULL,
	[e_bv] [real] NULL,
	[glon] [real] NULL,
	[glat] [real] NULL,
	[primary_flag] [int] NULL,
	[fov_radius] [real] NULL,
	[nuv_det_x] [real] NULL,
	[nuv_det_y] [real] NULL,
	[fuv_det_x] [real] NULL,
	[fuv_det_y] [real] NULL,
	[chkobj_type] [int] NULL,
	[chkobj_id] [int] NULL,
	[chkobj_r] [real] NULL,
	[chkobj_pa] [real] NULL,
	[misc_flags] [int] NULL,
	[nuv_flux] [real] NULL,
	[nuv_fluxerr] [real] NULL,
	[nuv_mag] [real] NULL,
	[nuv_magerr] [real] NULL,
	[fuv_flux] [real] NULL,
	[fuv_fluxerr] [real] NULL,
	[fuv_mag] [real] NULL,
	[fuv_magerr] [real] NULL,
	[nuv_s2n] [real] NULL,
	[fuv_s2n] [real] NULL,
	[nuv_fcat_flux] [real] NULL,
	[nuv_fcat_fluxerr] [real] NULL,
	[fuv_ncat_flux] [real] NULL,
	[fuv_ncat_fluxerr] [real] NULL,
	[nuv_nc_r1] [smallint] NULL,
	[nuv_nc_r2] [smallint] NULL,
	[nuv_nc_r3] [smallint] NULL,
	[fuv_nc_r1] [smallint] NULL,
	[fuv_nc_r2] [smallint] NULL,
	[fuv_nc_r3] [smallint] NULL,
	[nuv_nf_r1] [real] NULL,
	[nuv_nf_r2] [real] NULL,
	[nuv_nf_r3] [real] NULL,
	[fuv_nf_r1] [real] NULL,
	[fuv_nf_r2] [real] NULL,
	[fuv_nf_r3] [real] NULL,
	[cn_radius] [real] NULL,
	[cn_pa] [real] NULL,
	[cn_mag_nuv] [real] NULL,
	[cn_mag_fuv] [real] NULL,
	[nuv_skybg] [real] NULL,
	[fuv_skybg] [real] NULL,
	[nuv_weight] [real] NULL,
	[fuv_weight] [real] NULL,
	[nuv_int] [real] NULL,
	[fuv_int] [real] NULL,
	[nuv_thres] [real] NULL,
	[fuv_thres] [real] NULL,
	[nuv_contrast] [real] NULL,
	[fuv_contrast] [real] NULL,
	[nuv_maskpix] [int] NULL,
	[fuv_maskpix] [int] NULL,
	[nuv_artifact] [int] NULL,
	[fuv_artifact] [int] NULL,
	[nuv_scx] [real] NULL,
	[nuv_scy] [real] NULL,
	[fuv_scx] [real] NULL,
	[fuv_scy] [real] NULL,
	[nuv_Q] [real] NULL,
	[fuv_Q] [real] NULL,
	[nuv_ambg] [int] NULL,
	[fuv_ambg] [int] NULL,
	[nuv_nc] [int] NULL,
	[fuv_nc] [int] NULL,
	[nuv_cid1] [int] NULL,
	[fuv_cid1] [int] NULL,
	[nuv_cid2] [int] NULL,
	[fuv_cid2] [int] NULL,
	[nuv_cid3] [int] NULL,
	[fuv_cid3] [int] NULL,
	[nuv_poserr] [real] NULL,
	[fuv_poserr] [real] NULL,
	[nuv_pperr] [real] NULL,
	[fuv_pperr] [real] NULL,
	[match_density] [real] NULL,
	[nuv_unmatched_density] [real] NULL,
	[fuv_unmatched_density] [real] NULL,
	[reliability] [real] NULL,
	[sourcepa] [real] NULL,
	[objtype] [int] NULL,
	[quality] [int] NULL,
	[adj_sep] [real] NULL,
	[adj_fuv_det_y] [real] NULL,
	[nuv_number] [int] NULL,
	[nuv_flux_iso] [real] NULL,
	[nuv_fluxerr_iso] [real] NULL,
	[nuv_mag_iso] [real] NULL,
	[nuv_magerr_iso] [real] NULL,
	[nuv_flux_isocor] [real] NULL,
	[nuv_fluxerr_isocor] [real] NULL,
	[nuv_mag_isocor] [real] NULL,
	[nuv_magerr_isocor] [real] NULL,
	[nuv_flux_aper_1] [real] NULL,
	[nuv_flux_aper_2] [real] NULL,
	[nuv_flux_aper_3] [real] NULL,
	[nuv_flux_aper_4] [real] NULL,
	[nuv_flux_aper_5] [real] NULL,
	[nuv_flux_aper_6] [real] NULL,
	[nuv_flux_aper_7] [real] NULL,
	[nuv_fluxerr_aper_1] [real] NULL,
	[nuv_fluxerr_aper_2] [real] NULL,
	[nuv_fluxerr_aper_3] [real] NULL,
	[nuv_fluxerr_aper_4] [real] NULL,
	[nuv_fluxerr_aper_5] [real] NULL,
	[nuv_fluxerr_aper_6] [real] NULL,
	[nuv_fluxerr_aper_7] [real] NULL,
	[nuv_mag_aper_1] [real] NULL,
	[nuv_mag_aper_2] [real] NULL,
	[nuv_mag_aper_3] [real] NULL,
	[nuv_mag_aper_4] [real] NULL,
	[nuv_mag_aper_5] [real] NULL,
	[nuv_mag_aper_6] [real] NULL,
	[nuv_mag_aper_7] [real] NULL,
	[nuv_magerr_aper_1] [real] NULL,
	[nuv_magerr_aper_2] [real] NULL,
	[nuv_magerr_aper_3] [real] NULL,
	[nuv_magerr_aper_4] [real] NULL,
	[nuv_magerr_aper_5] [real] NULL,
	[nuv_magerr_aper_6] [real] NULL,
	[nuv_magerr_aper_7] [real] NULL,
	[nuv_flux_auto] [real] NULL,
	[nuv_fluxerr_auto] [real] NULL,
	[nuv_mag_auto] [real] NULL,
	[nuv_magerr_auto] [real] NULL,
	[nuv_flux_best] [real] NULL,
	[nuv_fluxerr_best] [real] NULL,
	[nuv_mag_best] [real] NULL,
	[nuv_magerr_best] [real] NULL,
	[nuv_flux_radius_1] [real] NULL,
	[nuv_flux_radius_2] [real] NULL,
	[nuv_flux_radius_3] [real] NULL,
	[nuv_flux_radius_4] [real] NULL,
	[nuv_flux_radius_5] [real] NULL,
	[nuv_zpmag] [real] NULL,
	[nuv_kron_radius] [real] NULL,
	[nuv_background] [real] NULL,
	[nuv_threshold] [real] NULL,
	[nuv_mu_threshold] [real] NULL,
	[nuv_flux_max] [real] NULL,
	[nuv_mu_max] [real] NULL,
	[nuv_isoarea_image] [real] NULL,
	[nuv_isoarea_world] [real] NULL,
	[nuv_isoareaf_image] [real] NULL,
	[nuv_isoareaf_world] [real] NULL,
	[nuv_xmin_image] [int] NULL,
	[nuv_ymin_image] [int] NULL,
	[nuv_xmax_image] [int] NULL,
	[nuv_ymax_image] [int] NULL,
	[nuv_x_image] [real] NULL,
	[nuv_y_image] [real] NULL,
	[nuv_xpeak_image] [int] NULL,
	[nuv_ypeak_image] [int] NULL,
	[nuv_ra] [float] NULL,
	[nuv_dec] [float] NULL,
	[nuv_x2_image] [real] NULL,
	[nuv_y2_image] [real] NULL,
	[nuv_xy_image] [real] NULL,
	[nuv_x2_world] [real] NULL,
	[nuv_y2_world] [real] NULL,
	[nuv_xy_world] [real] NULL,
	[nuv_cxx_image] [real] NULL,
	[nuv_cyy_image] [real] NULL,
	[nuv_cxy_image] [real] NULL,
	[nuv_cxx_world] [real] NULL,
	[nuv_cyy_world] [real] NULL,
	[nuv_cxy_world] [real] NULL,
	[nuv_a_image] [real] NULL,
	[nuv_b_image] [real] NULL,
	[nuv_a_world] [real] NULL,
	[nuv_b_world] [real] NULL,
	[nuv_theta_image] [real] NULL,
	[nuv_theta_world] [real] NULL,
	[nuv_theta_j2000] [real] NULL,
	[nuv_elongation] [real] NULL,
	[nuv_ellipticity] [real] NULL,
	[nuv_errx2_image] [float] NULL,
	[nuv_erry2_image] [float] NULL,
	[nuv_errxy_image] [real] NULL,
	[nuv_errx2_world] [float] NULL,
	[nuv_erry2_world] [float] NULL,
	[nuv_errxy_world] [real] NULL,
	[nuv_errcxx_image] [real] NULL,
	[nuv_errcyy_image] [real] NULL,
	[nuv_errcxy_image] [real] NULL,
	[nuv_errcxx_world] [real] NULL,
	[nuv_errcyy_world] [real] NULL,
	[nuv_errcxy_world] [real] NULL,
	[nuv_erra_image] [real] NULL,
	[nuv_errb_image] [real] NULL,
	[nuv_erra_world] [real] NULL,
	[nuv_errb_world] [real] NULL,
	[nuv_errtheta_image] [real] NULL,
	[nuv_errtheta_world] [real] NULL,
	[nuv_errtheta_j2000] [real] NULL,
	[nuv_fwhm_image] [real] NULL,
	[nuv_fwhm_world] [real] NULL,
	[nuv_flags] [smallint] NULL,
	[nuv_class_star] [real] NULL,
	[fuv_number] [int] NULL,
	[fuv_flux_iso] [real] NULL,
	[fuv_fluxerr_iso] [real] NULL,
	[fuv_mag_iso] [real] NULL,
	[fuv_magerr_iso] [real] NULL,
	[fuv_flux_isocor] [real] NULL,
	[fuv_fluxerr_isocor] [real] NULL,
	[fuv_mag_isocor] [real] NULL,
	[fuv_magerr_isocor] [real] NULL,
	[fuv_flux_aper_1] [real] NULL,
	[fuv_flux_aper_2] [real] NULL,
	[fuv_flux_aper_3] [real] NULL,
	[fuv_flux_aper_4] [real] NULL,
	[fuv_flux_aper_5] [real] NULL,
	[fuv_flux_aper_6] [real] NULL,
	[fuv_flux_aper_7] [real] NULL,
	[fuv_fluxerr_aper_1] [real] NULL,
	[fuv_fluxerr_aper_2] [real] NULL,
	[fuv_fluxerr_aper_3] [real] NULL,
	[fuv_fluxerr_aper_4] [real] NULL,
	[fuv_fluxerr_aper_5] [real] NULL,
	[fuv_fluxerr_aper_6] [real] NULL,
	[fuv_fluxerr_aper_7] [real] NULL,
	[fuv_mag_aper_1] [real] NULL,
	[fuv_mag_aper_2] [real] NULL,
	[fuv_mag_aper_3] [real] NULL,
	[fuv_mag_aper_4] [real] NULL,
	[fuv_mag_aper_5] [real] NULL,
	[fuv_mag_aper_6] [real] NULL,
	[fuv_mag_aper_7] [real] NULL,
	[fuv_magerr_aper_1] [real] NULL,
	[fuv_magerr_aper_2] [real] NULL,
	[fuv_magerr_aper_3] [real] NULL,
	[fuv_magerr_aper_4] [real] NULL,
	[fuv_magerr_aper_5] [real] NULL,
	[fuv_magerr_aper_6] [real] NULL,
	[fuv_magerr_aper_7] [real] NULL,
	[fuv_flux_auto] [real] NULL,
	[fuv_fluxerr_auto] [real] NULL,
	[fuv_mag_auto] [real] NULL,
	[fuv_magerr_auto] [real] NULL,
	[fuv_flux_best] [real] NULL,
	[fuv_fluxerr_best] [real] NULL,
	[fuv_mag_best] [real] NULL,
	[fuv_magerr_best] [real] NULL,
	[fuv_flux_radius_1] [real] NULL,
	[fuv_flux_radius_2] [real] NULL,
	[fuv_flux_radius_3] [real] NULL,
	[fuv_flux_radius_4] [real] NULL,
	[fuv_flux_radius_5] [real] NULL,
	[fuv_zpmag] [real] NULL,
	[fuv_kron_radius] [real] NULL,
	[fuv_background] [real] NULL,
	[fuv_threshold] [real] NULL,
	[fuv_mu_threshold] [real] NULL,
	[fuv_flux_max] [real] NULL,
	[fuv_mu_max] [real] NULL,
	[fuv_isoarea_image] [real] NULL,
	[fuv_isoarea_world] [real] NULL,
	[fuv_isoareaf_image] [real] NULL,
	[fuv_isoareaf_world] [real] NULL,
	[fuv_xmin_image] [int] NULL,
	[fuv_ymin_image] [int] NULL,
	[fuv_xmax_image] [int] NULL,
	[fuv_ymax_image] [int] NULL,
	[fuv_x_image] [real] NULL,
	[fuv_y_image] [real] NULL,
	[fuv_xpeak_image] [int] NULL,
	[fuv_ypeak_image] [int] NULL,
	[fuv_ra] [float] NULL,
	[fuv_dec] [float] NULL,
	[fuv_x2_image] [real] NULL,
	[fuv_y2_image] [real] NULL,
	[fuv_xy_image] [real] NULL,
	[fuv_x2_world] [real] NULL,
	[fuv_y2_world] [real] NULL,
	[fuv_xy_world] [real] NULL,
	[fuv_cxx_image] [real] NULL,
	[fuv_cyy_image] [real] NULL,
	[fuv_cxy_image] [real] NULL,
	[fuv_cxx_world] [real] NULL,
	[fuv_cyy_world] [real] NULL,
	[fuv_cxy_world] [real] NULL,
	[fuv_a_image] [real] NULL,
	[fuv_b_image] [real] NULL,
	[fuv_a_world] [real] NULL,
	[fuv_b_world] [real] NULL,
	[fuv_theta_image] [real] NULL,
	[fuv_theta_world] [real] NULL,
	[fuv_theta_j2000] [real] NULL,
	[fuv_elongation] [real] NULL,
	[fuv_ellipticity] [real] NULL,
	[fuv_errx2_image] [float] NULL,
	[fuv_erry2_image] [float] NULL,
	[fuv_errxy_image] [real] NULL,
	[fuv_errx2_world] [float] NULL,
	[fuv_erry2_world] [float] NULL,
	[fuv_errxy_world] [real] NULL,
	[fuv_errcxx_image] [real] NULL,
	[fuv_errcyy_image] [real] NULL,
	[fuv_errcxy_image] [real] NULL,
	[fuv_errcxx_world] [real] NULL,
	[fuv_errcyy_world] [real] NULL,
	[fuv_errcxy_world] [real] NULL,
	[fuv_erra_image] [real] NULL,
	[fuv_errb_image] [real] NULL,
	[fuv_erra_world] [real] NULL,
	[fuv_errb_world] [real] NULL,
	[fuv_errtheta_image] [real] NULL,
	[fuv_errtheta_world] [real] NULL,
	[fuv_errtheta_j2000] [real] NULL,
	[fuv_fwhm_image] [real] NULL,
	[fuv_fwhm_world] [real] NULL,
	[fuv_flags] [smallint] NULL,
	[fuv_class_star] [real] NULL,
	[isThereSpectrum] [bit] NOT NULL,
	[mode] [tinyint] NOT NULL
) ON [PHOTODATA]

GO

ALTER TABLE [dbo].[PhotoObjAll]
ADD CONSTRAINT [PK_PhotoObjAll] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
) WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PHOTODATA]

GO

---------------------------------------------------------------

CREATE TABLE [dbo].[PhotoExtract]
(
	[photoExtractID] [bigint] NOT NULL,
	[imgID] [bigint] NOT NULL,
	[sourceFileNPath] [varchar](256) NULL,
	[simple] [varchar](32) NULL,
	[bitpix] [int] NULL,
	[naxis] [int] NULL,
	[extend] [varchar](32) NULL,
	[origin] [varchar](32) NULL,
	[nuvfile] [varchar](256) NULL,
	[fuvfile] [varchar](256) NULL,
	[nuvwtfil] [varchar](256) NULL,
	[fuvwtfil] [varchar](256) NULL,
	[nuvcntfi] [varchar](256) NULL,
	[fuvcntfi] [varchar](256) NULL,
	[nuvintfi] [varchar](256) NULL,
	[fuvintfi] [varchar](256) NULL,
	[nuvlwtfi] [varchar](256) NULL,
	[fuvlwtfi] [varchar](256) NULL,
	[nuvskyfi] [varchar](256) NULL,
	[fuvskyfi] [varchar](256) NULL,
	[nuvflgfi] [varchar](256) NULL,
	[fuvflgfi] [varchar](256) NULL,
	[mchfile] [varchar](256) NULL,
	[starcat] [varchar](256) NULL,
	[nstar] [int] NULL,
	[nmch] [int] NULL,
	[rmean] [float] NULL,
	[rmeansd] [float] NULL,
	[rstddev] [float] NULL,
	[rmin] [float] NULL,
	[rmax] [float] NULL,
	[acnmch] [int] NULL,
	[acrave] [float] NULL,
	[acravsd] [float] NULL,
	[acrsd] [float] NULL,
	[acrmin] [float] NULL,
	[acrmax] [float] NULL,
	[nuvs2n] [float] NULL,
	[fuvs2n] [float] NULL,
	[nuvs2ncu] [float] NULL,
	[fuvs2ncu] [float] NULL,
	[nuvnum] [int] NULL,
	[fuvnum] [int] NULL,
	[seplim] [float] NULL,
	[autosep] [float] NULL,
	[problim] [varchar](32) NULL,
	[rposerr] [float] NULL,
	[ra_cent] [float] NULL,
	[dec_cent] [float] NULL,
	[rao] [float] NULL,
	[deco] [float] NULL,
	[cx] [float] NULL,
	[cy] [float] NULL,
	[cz] [float] NULL,
	[htmID] [bigint] NULL,
	[zoneID] [bigint] NULL,
	[totnum] [int] NULL,
	[totfill] [int] NULL,
	[totufn] [int] NULL,
	[totuff] [int] NULL,
	[lrgnuvid] [int] NULL,
	[glono] [float] NULL,
	[glato] [float] NULL,
	[n_zpmag] [float] NULL,
	[f_zpmag] [float] NULL,
	[n_zpscal] [float] NULL,
	[f_zpscal] [float] NULL,
	[calmag] [varchar](32) NULL,
	[n_cuj] [float] NULL,
	[f_cuj] [float] NULL,
	[r1] [float] NULL,
	[r2] [float] NULL,
	[r3] [float] NULL,
	[n_flderr] [float] NULL,
	[f_flderr] [float] NULL,
	[ibf_err] [float] NULL,
	[n_back] [float] NULL,
	[f_back] [float] NULL,
	[medsepa] [float] NULL,
	[medsep] [float] NULL,
	[medsepsg] [float] NULL,
	[matden] [float] NULL,
	[nufden] [float] NULL,
	[fufden] [float] NULL,
	[dyfcor] [float] NULL,
	[fuvtemp] [float] NULL,
	[dyf0] [float] NULL,
	[dyf1] [float] NULL,
	[n_ambg0] [int] NULL,
	[n_ambg1] [int] NULL,
	[n_ambg2] [int] NULL,
	[n_ambg3] [int] NULL,
	[n_ambg4] [int] NULL,
	[n_ambg5] [int] NULL,
	[n_ambg6] [int] NULL,
	[n_ambgm6] [int] NULL,
	[n_ambgm1] [int] NULL,
	[f_ambg0] [int] NULL,
	[f_ambg1] [int] NULL,
	[f_ambg2] [int] NULL,
	[f_ambg3] [int] NULL,
	[f_ambg4] [int] NULL,
	[f_ambg5] [int] NULL,
	[f_ambg6] [int] NULL,
	[f_ambgm6] [int] NULL,
	[f_ambgm1] [int] NULL,
	[filename] [varchar](256) NULL,
	[directry] [varchar](192) NULL,
	[vsn] [int] NULL,
	[tilenum] [int] NULL,
	[type] [int] NULL,
	[ow] [int] NULL,
	[prod] [int] NULL,
	[img] [int] NULL,
	[try] [int] NULL,
	[epoch] [float] NULL,
	[object] [varchar](128) NULL,
	[crval1] [float] NULL,
	[crval2] [float] NULL,
	[crpix1] [float] NULL,
	[crpix2] [float] NULL,
	[cdelt1] [float] NULL,
	[cdelt2] [float] NULL,
	[crota1] [float] NULL,
	[crota2] [float] NULL,
	[grelease] [varchar](32) NULL,
	[equinox] [float] NULL,
	[eclipse] [int] NULL,
	[leg] [int] NULL,
	[mpsnpos] [int] NULL,
	[visit] [int] NULL,
	[subvis] [int] NULL,
	[roll] [float] NULL,
	[obs_date] [varchar](32) NULL,
	[obsdatim] [varchar](32) NULL,
	[tilename] [varchar](64) NULL,
	[planid] [int] NULL,
	[mpsphase] [varchar](32) NULL,
	[mpsplan] [varchar](32) NULL,
	[mpstype] [varchar](32) NULL,
	[avaspra] [float] NULL,
	[avaspdec] [float] NULL,
	[avasprol] [float] NULL,
	[avaspok] [float] NULL,
	[num_aper] [int] NULL,
	[sxaper1] [float] NULL,
	[sxaper2] [float] NULL,
	[sxaper3] [float] NULL,
	[sxaper4] [float] NULL,
	[sxaper5] [float] NULL,
	[sxaper6] [float] NULL,
	[sxaper7] [float] NULL,
	[num_fol] [int] NULL,
	[sxfrac1] [float] NULL,
	[sxfrac2] [float] NULL,
	[sxfrac3] [float] NULL,
	[sxfrac4] [float] NULL,
	[sxfrac5] [float] NULL,
	[abscal] [varchar](32) NULL,
	[calinfo] [varchar](32) NULL,
	[statfile] [varchar](32) NULL,
	[abspipe] [varchar](32) NULL,
	[prundat0] [varchar](32) NULL,
	[prundat1] [varchar](32) NULL,
	[nlegs] [int] NULL,
	[nhvnom] [float] NULL,
	[nhvnomn] [float] NULL,
	[nhvnomf] [float] NULL,
	[mpscow] [varchar](32) NULL,
	[longstrn] [varchar](32) NULL,
	[pipestat] [int] NULL,
	[nepoch] [float] NULL,
	[nobject] [varchar](128) NULL,
	[norigin] [varchar](32) NULL,
	[ncrval1] [float] NULL,
	[ncrval2] [float] NULL,
	[ncrpix1] [float] NULL,
	[ncrpix2] [float] NULL,
	[ncdelt1] [float] NULL,
	[ncdelt2] [float] NULL,
	[ncrota1] [float] NULL,
	[ncrota2] [float] NULL,
	[nsximasx] [int] NULL,
	[nsximasy] [int] NULL,
	[nsxstrsy] [int] NULL,
	[nsximabp] [int] NULL,
	[nsxpixs] [float] NULL,
	[nsxsfwhm] [float] NULL,
	[nsxnnwf] [varchar](128) NULL,
	[nsxgain] [float] NULL,
	[nsxbkgnd] [float] NULL,
	[nsxbkdev] [float] NULL,
	[nsxbkthd] [float] NULL,
	[nsxconff] [varchar](128) NULL,
	[nsxdett] [varchar](32) NULL,
	[nsxthldt] [varchar](32) NULL,
	[nsxthld] [float] NULL,
	[nsxminar] [int] NULL,
	[nsxconv] [varchar](32) NULL,
	[nsxconvn] [varchar](32) NULL,
	[nsxconvf] [varchar](128) NULL,
	[nsxdbldn] [int] NULL,
	[nsxdbldc] [float] NULL,
	[nsxcln] [varchar](32) NULL,
	[nsxclnpa] [float] NULL,
	[nsxclnst] [int] NULL,
	[nsxaperd] [int] NULL,
	[nsxapek1] [float] NULL,
	[nsxapek2] [float] NULL,
	[nsxapek3] [float] NULL,
	[nsxsatlv] [float] NULL,
	[nsxmgzpt] [float] NULL,
	[nsxmggam] [float] NULL,
	[nsxbkgsx] [int] NULL,
	[nsxbkgsy] [int] NULL,
	[nsxbkgfx] [int] NULL,
	[nsxbkgfy] [int] NULL,
	[nsxpbkgt] [varchar](32) NULL,
	[nsxpbkgs] [int] NULL,
	[nsxpixsk] [int] NULL,
	[nsxfbufs] [int] NULL,
	[nsxisapr] [float] NULL,
	[nsxndet] [int] NULL,
	[nsxnfin] [int] NULL,
	[nsxnpara] [int] NULL,
	[ngreleas] [varchar](32) NULL,
	[nctype1] [varchar](32) NULL,
	[nctype2] [varchar](32) NULL,
	[nequinox] [float] NULL,
	[nra_cent] [float] NULL,
	[ndec_cen] [float] NULL,
	[ntwist] [float] NULL,
	[neclipse] [int] NULL,
	[ngrspa] [float] NULL,
	[nleg] [int] NULL,
	[nmpsnpos] [int] NULL,
	[nvisit] [int] NULL,
	[nsubvis] [int] NULL,
	[nminivis] [int] NULL,
	[now] [int] NULL,
	[nband] [int] NULL,
	[nroll] [float] NULL,
	[nexptime] [float] NULL,
	[nexpstar] [float] NULL,
	[nexpend] [float] NULL,
	[nobs_dat] [varchar](32) NULL,
	[ntime_ob] [varchar](32) NULL,
	[nobssecs] [float] NULL,
	[nobsdati] [varchar](32) NULL,
	[ntilenam] [varchar](64) NULL,
	[ntilenum] [int] NULL,
	[nplanid] [int] NULL,
	[nmpsphas] [varchar](32) NULL,
	[nmpsplan] [varchar](32) NULL,
	[nmpstype] [varchar](32) NULL,
	[nimagszx] [int] NULL,
	[nimagszy] [int] NULL,
	[navaspra] [float] NULL,
	[navaspde] [float] NULL,
	[navaspx] [float] NULL,
	[navaspy] [float] NULL,
	[navaspro] [float] NULL,
	[navaspok] [float] NULL,
	[ncalpath] [varchar](32) NULL,
	[nflatfl] [varchar](32) NULL,
	[nintimag] [varchar](256) NULL,
	[nphofile] [varchar](32) NULL,
	[nnvalidp] [int] NULL,
	[nfiltere] [int] NULL,
	[npsffwhm] [float] NULL,
	[ncnvfwhm] [float] NULL,
	[npoisbg] [float] NULL,
	[nsigthre] [int] NULL,
	[nabsthre] [int] NULL,
	[nsxdbgrm] [float] NULL,
	[nareadet] [float] NULL,
	[npsigdet] [float] NULL,
	[npmedbg] [float] NULL,
	[npmedrr] [float] NULL,
	[npthrbg] [float] NULL,
	[npthresh] [float] NULL,
	[navepefi] [float] NULL,
	[nminpefi] [float] NULL,
	[nmaxpefi] [float] NULL,
	[navepea] [float] NULL,
	[nminpea] [float] NULL,
	[nmaxpea] [float] NULL,
	[nsxwd] [varchar](192) NULL,
	[nacoxyav] [float] NULL,
	[nacoxyme] [float] NULL,
	[nacoxysd] [float] NULL,
	[nacoxymn] [float] NULL,
	[nacoxymx] [float] NULL,
	[nabscal] [varchar](32) NULL,
	[ncalinfo] [varchar](32) NULL,
	[nstatfil] [varchar](32) NULL,
	[nabspipe] [varchar](32) NULL,
	[nprunda0] [varchar](32) NULL,
	[nprunda1] [varchar](32) NULL,
	[npipecmn] [varchar](32) NULL,
	[nnlegs] [int] NULL,
	[nmpscow] [varchar](32) NULL,
	[nnhvnom] [float] NULL,
	[nnhvnomn] [float] NULL,
	[nnhvnomf] [float] NULL,
	[npipesta] [int] NULL,
	[nlongstr] [varchar](32) NULL,
	[fepoch] [float] NULL,
	[fobject] [varchar](128) NULL,
	[forigin] [varchar](32) NULL,
	[fcrval1] [float] NULL,
	[fcrval2] [float] NULL,
	[fcrpix1] [float] NULL,
	[fcrpix2] [float] NULL,
	[fcdelt1] [float] NULL,
	[fcdelt2] [float] NULL,
	[fcrota1] [float] NULL,
	[fcrota2] [float] NULL,
	[fsximasx] [int] NULL,
	[fsximasy] [int] NULL,
	[fsxstrsy] [int] NULL,
	[fsximabp] [int] NULL,
	[fsxpixs] [float] NULL,
	[fsxsfwhm] [float] NULL,
	[fsxnnwf] [varchar](128) NULL,
	[fsxgain] [float] NULL,
	[fsxbkgnd] [float] NULL,
	[fsxbkdev] [float] NULL,
	[fsxbkthd] [float] NULL,
	[fsxconff] [varchar](128) NULL,
	[fsxdett] [varchar](32) NULL,
	[fsxthldt] [varchar](32) NULL,
	[fsxthld] [float] NULL,
	[fsxminar] [int] NULL,
	[fsxconv] [varchar](32) NULL,
	[fsxconvn] [varchar](32) NULL,
	[fsxconvf] [varchar](128) NULL,
	[fsxdbldn] [int] NULL,
	[fsxdbldc] [float] NULL,
	[fsxcln] [varchar](32) NULL,
	[fsxclnpa] [float] NULL,
	[fsxclnst] [int] NULL,
	[fsxaperd] [int] NULL,
	[fsxapek1] [float] NULL,
	[fsxapek2] [float] NULL,
	[fsxapek3] [float] NULL,
	[fsxsatlv] [float] NULL,
	[fsxmgzpt] [float] NULL,
	[fsxmggam] [float] NULL,
	[fsxbkgsx] [int] NULL,
	[fsxbkgsy] [int] NULL,
	[fsxbkgfx] [int] NULL,
	[fsxbkgfy] [int] NULL,
	[fsxpbkgt] [varchar](32) NULL,
	[fsxpbkgs] [int] NULL,
	[fsxpixsk] [int] NULL,
	[fsxfbufs] [int] NULL,
	[fsxisapr] [float] NULL,
	[fsxndet] [int] NULL,
	[fsxnfin] [int] NULL,
	[fsxnpara] [int] NULL,
	[fgreleas] [varchar](32) NULL,
	[fctype1] [varchar](32) NULL,
	[fctype2] [varchar](32) NULL,
	[fequinox] [float] NULL,
	[fra_cent] [float] NULL,
	[fdec_cen] [float] NULL,
	[ftwist] [float] NULL,
	[feclipse] [int] NULL,
	[fgrspa] [float] NULL,
	[fleg] [int] NULL,
	[fmpsnpos] [int] NULL,
	[fvisit] [int] NULL,
	[fsubvis] [int] NULL,
	[fminivis] [int] NULL,
	[fow] [int] NULL,
	[fband] [int] NULL,
	[froll] [float] NULL,
	[fexptime] [float] NULL,
	[fexpstar] [float] NULL,
	[fexpend] [float] NULL,
	[fobs_dat] [varchar](32) NULL,
	[ftime_ob] [varchar](32) NULL,
	[fobssecs] [float] NULL,
	[fobsdati] [varchar](32) NULL,
	[ftilenam] [varchar](64) NULL,
	[ftilenum] [int] NULL,
	[fplanid] [int] NULL,
	[fmpsphas] [varchar](32) NULL,
	[fmpsplan] [varchar](32) NULL,
	[fmpstype] [varchar](32) NULL,
	[fimagszx] [int] NULL,
	[fimagszy] [int] NULL,
	[favaspra] [float] NULL,
	[favaspde] [float] NULL,
	[favaspx] [float] NULL,
	[favaspy] [float] NULL,
	[favaspro] [float] NULL,
	[favaspok] [float] NULL,
	[fcalpath] [varchar](32) NULL,
	[fflatfl] [varchar](32) NULL,
	[fintimag] [varchar](256) NULL,
	[fphofile] [varchar](32) NULL,
	[fnvalidp] [int] NULL,
	[ffiltere] [int] NULL,
	[fpsffwhm] [float] NULL,
	[fcnvfwhm] [float] NULL,
	[fpoisbg] [float] NULL,
	[fsigthre] [int] NULL,
	[fabsthre] [int] NULL,
	[fsxdbgrm] [float] NULL,
	[fareadet] [float] NULL,
	[fpsigdet] [float] NULL,
	[fpmedbg] [float] NULL,
	[fpmedrr] [float] NULL,
	[fpthrbg] [float] NULL,
	[fpthresh] [float] NULL,
	[favepefi] [float] NULL,
	[fminpefi] [float] NULL,
	[fmaxpefi] [float] NULL,
	[favepea] [float] NULL,
	[fminpea] [float] NULL,
	[fmaxpea] [float] NULL,
	[fsxwd] [varchar](192) NULL,
	[facoxyav] [float] NULL,
	[facoxyme] [float] NULL,
	[facoxysd] [float] NULL,
	[facoxymn] [float] NULL,
	[facoxymx] [float] NULL,
	[fabscal] [varchar](32) NULL,
	[fcalinfo] [varchar](32) NULL,
	[fstatfil] [varchar](32) NULL,
	[fabspipe] [varchar](32) NULL,
	[fprunda0] [varchar](32) NULL,
	[fprunda1] [varchar](32) NULL,
	[fpipecmn] [varchar](32) NULL,
	[fnlegs] [int] NULL,
	[fmpscow] [varchar](32) NULL,
	[fnhvnom] [float] NULL,
	[fnhvnomn] [float] NULL,
	[fnhvnomf] [float] NULL,
	[fpipesta] [int] NULL,
	[flongstr] [varchar](32) NULL,
	[artflagb] [int] NULL,
	[nnadded] [int] NULL,
	[fnadded] [int] NULL,
	[date] [varchar](64) NULL,
	[ndtdet] [int] NULL,
	[ndttdc] [int] NULL,
	[ndtampa] [int] NULL,
	[ndtampb] [int] NULL,
	[ndtcon] [int] NULL,
	[itnuvoba] [int] NULL,
	[ndthvps] [int] NULL,
	[ndtlvps] [int] NULL,
	[ndtdib] [int] NULL,
	[ndhvmon] [int] NULL,
	[ndhimon] [int] NULL,
	[ndsfhv] [int] NULL,
	[ndctec] [int] NULL,
	[ndcfec] [int] NULL,
	[ndcdec] [int] NULL,
	[fdtdet] [int] NULL,
	[fdttdc] [int] NULL,
	[fdtampa] [int] NULL,
	[fdtampb] [int] NULL,
	[fdtcon] [int] NULL,
	[itfuvoba] [int] NULL,
	[fdthvps] [int] NULL,
	[fdtlvps] [int] NULL,
	[fdtdib] [int] NULL,
	[fdhvmon] [int] NULL,
	[fdhimon] [int] NULL,
	[fdsfhv] [int] NULL,
	[fdctec] [int] NULL,
	[fdcfec] [int] NULL,
	[fdcdec] [int] NULL,
	[itm1hshl] [int] NULL,
	[itm2hub] [int] NULL,
	[itcylbaf] [int] NULL,
	[bqn_nc0] [int] NULL,
	[bqn_nc1] [int] NULL,
	[bqn_nc2] [int] NULL,
	[bqn_nc3] [int] NULL,
	[bqf_nc0] [int] NULL,
	[bqf_nc1] [int] NULL,
	[bqf_nc2] [int] NULL,
	[bqf_nc3] [int] NULL,
	[bqnum] [int] NULL,
	[bqddxmed] [float] NULL,
	[bqddymed] [float] NULL,
	[bqddxrms] [float] NULL,
	[bqddyrms] [float] NULL,
	[bqddxmrm] [float] NULL,
	[bqddymrm] [float] NULL,
	[bqddxinn] [float] NULL,
	[bqddyinn] [float] NULL,
	[bqddxout] [float] NULL,
	[bqddyout] [float] NULL,
	[bqsdxmed] [float] NULL,
	[bqsdymed] [float] NULL,
	[bqsdxrms] [float] NULL,
	[bqsdyrms] [float] NULL,
	[bqsdxmrm] [float] NULL,
	[bqsdymrm] [float] NULL,
	[bqangmed] [float] NULL,
	[bqprobmd] [float] NULL,
	[bqsepmed] [float] NULL,
	[bqnfxmed] [float] NULL,
	[bqffxmed] [float] NULL,
	[bqnaxmed] [float] NULL,
	[bqfaxmed] [float] NULL,
	[bqnelmed] [float] NULL,
	[bqnaamed] [float] NULL,
	[bqfaamed] [float] NULL,
	[bqnbckmd] [float] NULL,
	[bqfbckmd] [float] NULL,
	[aexptime] [float] NULL,
	[exptime] [float] NULL,
	[subGridId] [int] NULL,
	[gridId] [int] NULL,
	[GRReleaseNumber] [real] NULL
) ON [PHOTODATA]

GO

CREATE UNIQUE CLUSTERED INDEX [PK_PhotoExtract]
ON [dbo].[PhotoExtract]
(
	[photoExtractID] ASC
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTODATA]

---------------------------------------------------------------

CREATE TABLE [dbo].[PhotoExtractPrimary](
	[PhotoExtractID] [bigint] NOT NULL,
	[MpsType] [varchar](32) NOT NULL,
	[SkyGridID] [bigint] NOT NULL,
	[Radius] [float] NOT NULL,
	[Area] [float] NOT NULL,
	[RegionBinary] [varbinary](max) NULL
) ON [PHOTODATA] TEXTIMAGE_ON [PHOTODATA]

GO

CREATE UNIQUE CLUSTERED INDEX [PK_PhotoExtractPrimary]
ON [dbo].[PhotoExtractPrimary]
(
	[photoExtractID] ASC,
	[Radius] ASC
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTODATA]