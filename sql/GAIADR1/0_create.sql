CREATE TABLE Source
(
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[record_id] [bigint] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[solution_id] [bigint] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[source_id] [bigint] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[random_index] [bigint] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ref_epoch] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra_error] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[dec] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[dec_error] [float] NOT NULL,
	
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[parallax] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[parallax_error] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[pmra] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[pmra_error] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[pmdec] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[pmdec_error] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra_dec_corr] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra_parallax_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra_pmra_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ra_pmdec_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[dec_parallax_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[dec_pmra_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[dec_pmdec_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[parallax_pmra_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[parallax_pmdec_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[pmra_pmdec_corr] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_obs_al] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_obs_ac] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_good_obs_al] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_good_obs_ac] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_bad_obs_al] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_n_bad_obs_ac] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_delta_q] [float] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_excess_noise] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_excess_noise_sig] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_primary_flag] [bit] NOT NULL,	-- ********
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_relegation_factor] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_weight_al] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_weight_ac] [real] NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[astrometric_priors_used] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[matched_observations] [smallint] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[duplicated_source] [bit] NOT NULL,	-- ********		
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_strength_k1] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_strength_k2] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_strength_k3] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_strength_k4] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_mean_k1] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_mean_k2] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_mean_k3] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[scan_direction_mean_k4] [real] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[phot_g_n_obs] [int] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[phot_g_mean_flux] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[phot_g_mean_flux_error] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[phot_g_mean_mag] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	phot_variable_flag varchar(50) NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[l] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[b] [float] NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity></quantity>
	[ecl_lon] [float] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[ecl_lat] [float NOT NULL
	CONSTRAINT [PKSource] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [SOURCES]