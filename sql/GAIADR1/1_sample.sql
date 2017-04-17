-- SUBSAMPLING TABLE 'Source' ---

 -- Insert subset into destination table
 TRUNCATE TABLE [SkyNode_GAIADR1_STAT].[dbo].[Source];

 GO
 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[source_id] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[source_id], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_GAIADR1].[dbo].[Source] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [source_id]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_GAIADR1_STAT].[dbo].[Source] WITH (TABLOCKX)
	([solution_id], [source_id], [random_index], [ref_epoch], [ra], [ra_error], [dec], [dec_error], [cx], [cy], [cz], [htmid], [zoneid], [parallax], [parallax_error], [pmra], [pmra_error], [pmdec], [pmdec_error], [ra_dec_corr], [ra_parallax_corr], [ra_pmra_corr], [ra_pmdec_corr], [dec_parallax_corr], [dec_pmra_corr], [dec_pmdec_corr], [parallax_pmra_corr], [parallax_pmdec_corr], [pmra_pmdec_corr], [astrometric_n_obs_al], [astrometric_n_obs_ac], [astrometric_n_good_obs_al], [astrometric_n_good_obs_ac], [astrometric_n_bad_obs_al], [astrometric_n_bad_obs_ac], [astrometric_delta_q], [astrometric_excess_noise], [astrometric_excess_noise_sig], [astrometric_primary_flag], [astrometric_relegation_factor], [astrometric_weight_al], [astrometric_weight_ac], [astrometric_priors_used], [matched_observations], [duplicated_source], [scan_direction_strength_k1], [scan_direction_strength_k2], [scan_direction_strength_k3], [scan_direction_strength_k4], [scan_direction_mean_k1], [scan_direction_mean_k2], [scan_direction_mean_k3], [scan_direction_mean_k4], [phot_g_n_obs], [phot_g_mean_flux], [phot_g_mean_flux_error], [phot_g_mean_mag], [phot_variable_flag], [l], [b], [ecl_lon], [ecl_lat])
 SELECT sourcetablealias.[solution_id], sourcetablealias.[source_id], sourcetablealias.[random_index], sourcetablealias.[ref_epoch], sourcetablealias.[ra], sourcetablealias.[ra_error], sourcetablealias.[dec], sourcetablealias.[dec_error], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[parallax], sourcetablealias.[parallax_error], sourcetablealias.[pmra], sourcetablealias.[pmra_error], sourcetablealias.[pmdec], sourcetablealias.[pmdec_error], sourcetablealias.[ra_dec_corr], sourcetablealias.[ra_parallax_corr], sourcetablealias.[ra_pmra_corr], sourcetablealias.[ra_pmdec_corr], sourcetablealias.[dec_parallax_corr], sourcetablealias.[dec_pmra_corr], sourcetablealias.[dec_pmdec_corr], sourcetablealias.[parallax_pmra_corr], sourcetablealias.[parallax_pmdec_corr], sourcetablealias.[pmra_pmdec_corr], sourcetablealias.[astrometric_n_obs_al], sourcetablealias.[astrometric_n_obs_ac], sourcetablealias.[astrometric_n_good_obs_al], sourcetablealias.[astrometric_n_good_obs_ac], sourcetablealias.[astrometric_n_bad_obs_al], sourcetablealias.[astrometric_n_bad_obs_ac], sourcetablealias.[astrometric_delta_q], sourcetablealias.[astrometric_excess_noise], sourcetablealias.[astrometric_excess_noise_sig], sourcetablealias.[astrometric_primary_flag], sourcetablealias.[astrometric_relegation_factor], sourcetablealias.[astrometric_weight_al], sourcetablealias.[astrometric_weight_ac], sourcetablealias.[astrometric_priors_used], sourcetablealias.[matched_observations], sourcetablealias.[duplicated_source], sourcetablealias.[scan_direction_strength_k1], sourcetablealias.[scan_direction_strength_k2], sourcetablealias.[scan_direction_strength_k3], sourcetablealias.[scan_direction_strength_k4], sourcetablealias.[scan_direction_mean_k1], sourcetablealias.[scan_direction_mean_k2], sourcetablealias.[scan_direction_mean_k3], sourcetablealias.[scan_direction_mean_k4], sourcetablealias.[phot_g_n_obs], sourcetablealias.[phot_g_mean_flux], sourcetablealias.[phot_g_mean_flux_error], sourcetablealias.[phot_g_mean_mag], sourcetablealias.[phot_variable_flag], sourcetablealias.[l], sourcetablealias.[b], sourcetablealias.[ecl_lon], sourcetablealias.[ecl_lat]
 FROM   [SkyNode_GAIADR1].[dbo].[Source] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[source_id] = sourcetablealias.[source_id]
	;


GO

