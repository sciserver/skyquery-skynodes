--/ <dataset>
--/ <summary> GAIA DATA RELEASE 1 </summary>
--/ <remarks>
--/ 
--/ </remarks>
--/ <url>https://www.cosmos.esa.int/web/gaia/dr1</url>
--/ <icon>gaiadr1.png</icon>
--/ <docpage>gaiadr1.html</docpage>
--/ </dataset>
 GO

--/ <summary>This table has an entry for every Gaia observed source as listed in the Main Database accumulating catalogue version from which the catalogue release has been generated.</summary>
--/ <remarks>It contains the basic source parameters, that is only final data (no epoch data) and no spectra (neither final nor epoch). </remarks>
CREATE TABLE Source
(
	--/ <summary>Solution Identifier (long)
	--/ The data in the MDB will be described by means of a ”Solution identifier” parameter. This will be a numeric field 
	--/ attached to each table row that can be used to unequivocally identify the version of all the subsystems that where 
	--/ used in the generation of the data as well as the input data used. Each DPC generating the data will have the freedom 
	--/ to choose the Solution identifier number, but they must ensure that given the Solution identifier they can provide 
	--/ detailed information about the ”conditions” used to generate the data: versions of the software, version of the 
	--/ data used… </summary>
	--/ <quantity>meta.id</quantity>
	[solution_id] [bigint] NOT NULL,
	
	--/ <summary>Unique source identifier (long). A unique single numerical identifier of the source. For the contents of 
	--/ Gaia DR1, which does not include Solar System objects, the source ID consists consists of a 64-bit integer, least 
	--/ significant bit = 1 and most significant bit = 64, comprising:
	--/ • a HEALPix index number (sky pixel) in bits 36 – 63; by definition the smallest HEALPix index number is zero.
	--/ • a 2-bit Data Processing Centre code in bits 34 – 35; for example MOD(source_id / 4294967296, 8) can be used to 
	--/ distinguish between sources initialised via the Initial Gaia Source List by the Torino DPC (code = 0) and sources 
	--/ otherwise detected and assigned by Gaia observations (code >0)
	--/ • a 25-bit plus 7 bit sequence number within the HEALPix pixel in bits 1 – 32 split into:
	--/ –  a 25 bit running number in bits 8 – 32; the running numbers are defined to be positive, i.e. never zero (except 
	--/ in the case of forced empty windows)
	--/ –  a 7-bit component number in bits 1 – 7
	--/ • one spare bit in bit 33
	--/ This means that the HEALpix index level 12 of a given source is contained in the most significant bits. HEALpix 
	--/ index of 12 and lower levels can thus be retrieved as follows:
	--/ • HEALpix level 12 = source_id / 34359738368
	--/ • HEALpix level 11 = source_id / 137438953472
	--/ • HEALpix level 10 = source_id / 549755813888
	--/ • HEALpix level n = source_id / 2 ^ 35 * 4 ^ (12 – level).
	--/ Additional details can be found in the Gaia DPAC public document Source Identifiers — Assignment and Usage throughout 
	--/ DPAC (document code GAIA–C3–TN–ARI–BAS–020) available from http://www.cosmos.esa.int/web/gaia/public-dpac-documents </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[source_id] [bigint] NOT NULL,
	
	--/ <summary>Random index used to select subsets (long)
	--/ Random index which can be used to select smaller subsets of the data that are still representative. The column 
	--/ contains a random permutation of the numbers from 0 to N-1, where N is the number of rows.
	--/ The random index can be useful for validation (testing on 10 different random subsets), visualization 
	--/ (displaying 1% of the data), and statistical exploration of the data, without the need to download all the data. </summary>
	--/ <quantity>meta.dataset</quantity>
	[random_index] [bigint] NOT NULL,
	
	--/ <summary>Reference epoch (double, Time[Julian Years]). Reference epoch to which the astrometic source parameters are 
	--/ referred, expressed as a Julian Year in TCB. </summary>
	--/ <quantity>time.epoch</quantity>
	[ref_epoch] [float] NOT NULL,
	
	--/ <summary>Right ascension (double, Angle[deg]) Barycentric right ascension α of the source in ICRS at the reference 
	--/ epoch ref_epoch</summary>
	--/ <quantity>pos.eq.ra;pos.frame=icrs</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,
	
	--/ <summary>Standard error of right ascension (double, Angle[mas]). Standard error σα*≡σα⁢cosδ of the right 
	--/ ascension of the source in ICRS at the reference epoch ref_epoch. </summary>
	--/ <quantity>stat.error;pos.eq.ra;pos.frame=icrs</quantity>
	--/ <unit>mas</unit>
	[ra_error] [float] NOT NULL,
	
	--/ <summary>Declination (double, Angle[deg]). Barycentric declination δ of the source in ICRS at the reference epoch 
	--/ ref_epoch</summary>
	--/ <quantity>pos.eq.dec;pos.frame=dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,
	
	--/ <summary>Standard error of declination (double, Angle[mas]). Standard error σδ of the declination of the source 
	--/ in ICRS at the reference epoch ref_epoch</summary>
	--/ <quantity>stat.error;pos.eq.dec;pos.frame=icrs</quantity>
	--/ <unit>mas</unit>
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
	
	--/ <summary>Parallax (double, Angle[mas] ). Absolute barycentric stellar parallax ϖ of the soure at the reference 
	--/ epoch ref_epoch</summary>
	--/ <quantity>pos.parallax</quantity>
	--/ <unit>mas</unit>
	[parallax] [float] NULL,
	
	--/ <summary>Standard error of parallax (double, Angle[mas] ). Standard error σϖ of the stellar parallax at the 
	--/ reference epoch ref_epoch</summary>
	--/ <quantity>stat.error;pos.parallax</quantity>
	--/ <unit>mas</unit>
	[parallax_error] [float] NULL,
	
	--/ <summary>Proper motion in right ascension direction (double, Angular Velocity[mas/year] ). Proper motion in right 
	--/ ascension μα* of the source in ICRS at the reference epoch ref_epoch. This is the projection of the proper 
	--/ motion vector in the direction of increasing right ascension. </summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmra] [float] NULL,
	
	--/ <summary>Standard error of proper motion in right ascension direction (double, Angular Velocity[mas/year] ). 
	--/ Standard error σμα* of the proper motion vector in right ascension at the reference epoch ref_epoch</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmra_error] [real] NULL,
	
	--/ <summary> Proper motion in declination direction (double, Angular Velocity[mas/year] ). Proper motion in 
	--/ declination μδ of the source at the reference epoch ref_epoch. This is the projection of the proper motion 
	--/ vector in the direction of increasing declination. </summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmdec] [float] NULL,
	
	--/ <summary>Standard error of proper motion in declination direction (double, Angular Velocity[mas/year] ). 
	--/ Standard error σμ⁢δ of the proper motion in declination at the reference epoch ref_epoch</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmdec_error] [float] NULL,
	
	--/ <summary>Correlation between right ascension and declination (float, Dimensionless[see description]). 
	--/ Correlation between right ascension and declination, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[ra_dec_corr] [real] NOT NULL,
	
	--/ <summary>Correlation between right ascension and parallax (float, Dimensionless[see description]). 
	--/ Correlation between right ascension and parallax, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[ra_parallax_corr] [real] NULL,
	
	--/ <summary>Correlation between right ascension and proper motion in right ascension (float, Dimensionless[see description]). 
	--/ Correlation between right ascension and proper motion in right ascension, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[ra_pmra_corr] [real] NULL,
	
	--/ <summary>Correlation between right ascension and proper motion in declination (float, Dimensionless[see description]). 
	--/ Correlation between right ascension and proper motion in declination, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[ra_pmdec_corr] [real] NULL,
	
	--/ <summary>Correlation between declination and parallax (float, Dimensionless[see description]). Correlation 
	--/ between declination and parallax, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[dec_parallax_corr] [real] NULL,
	
	--/ <summary>Correlation between declination and proper motion in right ascension (float, Dimensionless[see description]). 
	--/ Correlation between declination and proper motion in right ascension, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[dec_pmra_corr] [real] NULL,
	
	--/ <summary>Correlation between declination and proper motion in declination (float, Dimensionless[see description]). 
	--/ Correlation between declination and proper motion in declination, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[dec_pmdec_corr] [real] NULL,
	
	--/ <summary> Correlation between parallax and proper motion in right ascension (float, Dimensionless[see description]). 
	--/ Correlation between parallax and proper motion in right ascension, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[parallax_pmra_corr] [real] NULL,
	
	--/ <summary> Correlation between parallax and proper motion in declination (float, Dimensionless[see description]). 
	--/ Correlation between parallax and proper motion in declination, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[parallax_pmdec_corr] [real] NULL,
	
	--/ <summary> Correlation between proper motion in right ascension and proper motion in declination 
	--/ (float, Dimensionless[see description]). Correlation between proper motion in right ascension and 
	--/ proper motion in declination, in dimensionless units [-1:+1] </summary>
	--/ <quantity>stat.correlation</quantity>
	[pmra_pmdec_corr] [real] NULL,
	
	--/ <summary> Total number of observations AL (int). Total number of AL observations (= CCD transits) used in the
	--/  astrometric solution of the source, independent of their weight. Note that some observations may be strongly
	--/  downweighted (see astrometric_n_bad_obs_al). </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_obs_al] [int] NOT NULL,
	
	--/ <summary> Total number of observations AC (int). Total number of AC observations (= CCD transits) used in the
	--/  astrometric solution of the source, independent of their weight. Note that some observations may be strongly
	--/  downweighted (see astrometric_n_bad_obs_ac). Nearly all sources having G &lt;13 will have AC observations
	--/  from 2d windows, while fainter than that limit only ~1% of stars (the so–called ‘calibration faint stars’)
	--/  are assigned 2d windows resulting in AC observations. </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_obs_ac] [int] NOT NULL,
	
	--/ <summary>Number of good observations AL (int). Number of AL observations (= CCD transits) that were not strongly
	--/  downweighted in the astrometric solution of the source. Strongly downweighted observations (with downweighting
	--/  factor w&lt;0.2) are instead counted in astrometric_n_bad_obs_al. The sum of astrometric_n_good_obs_al and
	--/  astrometric_n_bad_obs_al equals astrometric_n_obs_al, the total number of AL observations used in the astrometric
	--/  solution of the source. </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_good_obs_al] [int] NOT NULL,
	
	--/ <summary>Number of good observations AC (int). Number of AC observations (= CCD transits) that were not strongly
	--/  downweighted in the astrometric solution of the source. Strongly downweighted observations (with downweighting
	--/  factor w&lt;0.2) are instead counted in astrometric_n_bad_obs_ac. The sum of astrometric_n_good_obs_ac and
	--/  astrometric_n_bad_obs_ac equals astrometric_n_obs_ac, the total number of AC observations used in the astrometric
	--/  solution of the source. </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_good_obs_ac] [int] NOT NULL,
	
	--/ <summary> Number of bad observations AL (int). Number of AL observations (= CCD transits) that were strongly
	--/  downweighted in the astrometric solution of the source, and therefore contributed little to the determination
	--/  of the astrometric parameters. An observation is considered to be strongly downweighted if its downweighting
	--/  factor w&lt;0.2, which means that the absolute value of the astrometric residual exceeds 4.83 times the
	--/  total uncertainty of the observation, calculated as the quadratic sum of the centroiding uncertainty, excess
	--/  source noise, and excess attitude noise. </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_bad_obs_al] [int] NOT NULL,
	
	--/ <summary>Number of bad observations AC (int). Number of AC observations (= CCD transits) that were strongly
	--/  downweighted in the astrometric solution of the source, and therefore contributed little to the determination
	--/  of the astrometric parameters. An observation is considered to be strongly downweighted if its downweighting
	--/  factor w&lt;0.2, which means that the absolute value of the astrometric residual exceeds 4.83 times the
	--/  total uncertainty of the observation, calculated as the quadratic sum of the centroiding uncertainty, excess
	--/  source noise, and excess attitude noise. </summary>
	--/ <quantity>meta.number;obs</quantity>
	[astrometric_n_bad_obs_ac] [int] NOT NULL,
	
	--/ <summary>: Hipparcos/Gaia proper motion difference (Hipparcos subset of TGAS only) (float). In the TGAS solution
	--/  astrometric_delta_q (ΔQ) indicates the difference between the Hipparcos proper motion and the TGAS proper
	--/  motion. A large value of ΔQ could indicate non-linear motion (e.g. in a binary).
	--/ The precise definition is
	--/ ΔQ=[Δ⁢μα*Δ⁢μδ]⁢(C→pm, T+C→pm, H)-1⁢[Δ⁢μα*Δ⁢μδ]
	--/ where Δμα*=μα*,T-μα*,H, Δμδ=μδ,T-μδ,H, with T and H indicating values from the Gaia
	--/  DR1 (TGAS) solution and Hipparcos catalogue. C→pm, T and C→pm, H are the corresponding 2×2
	--/  covariance matrices.
	--/ In order to compute ΔQΔ the two sets of proper motions must use the same reference frame and the same reference
	--/  epoch. Thus, the proper motion components as given in the Hipparcos catalogue were rotated to the Gaia DR1
	--/  reference frame, and then propagated to the Gaia reference epoch. </summary>
	--/ <quantity>pos.pm;arith.diff</quantity>
	[astrometric_delta_q] [float] NULL,
	
	--/ <summary> Excess noise of the source (double, Angle[mas]). This is the excess noise ϵi of the source. It
	--/  measures the disagreement, expressed as an angle, between the observations of a source and the best-fitting
	--/  standard astrometric model (using five astrometric parameters). The assumed observational noise in each
	--/  observation is quadratically increased by ϵi in order to statistically match the residuals in the
	--/  astrometric solution. A value of 0 signifies that the source is astrometrically well-behaved, i.e. that
	--/  the residuals of the fit statistically agree with the assumed observational noise. A positive value
	--/  signifies that the residuals are statistically larger than expected.
	--/ The significance of ϵi is given by astrometric_excess_noise_sig (DD). If D≤2 then ϵi is probably not 
	--/ significant, and the source may be astrometrically well-behaved even if ϵi is large.
	--/ The excess noise ϵi may absorb all kinds of modelling errors that are not accounted for by the observational
	--/  noise (image centroiding error) or the excess attitude noise. Such modelling errors include LSF and PSF
	--/  calibration errors, geometric instrument calibration errors, and part of the high-frequency attitude noise.
	--/  These modelling errors are particularly important in the early data releases, but should decrease as the
	--/  astrometric modelling of the instrument and attitude improves over the years.
	--/ Additionally, sources that deviate from the standard five-parameter astrometric model (e.g. unresolved binaries,
	--/  exoplanet systems, etc.) may have positive ϵi. Given the many other possible contributions to the excess
	--/  noise, the user must study the empirical distributions of ϵi and DD to make sensible cutoffs before
	--/  filtering out sources for their particular application.
	--/ In Gaia DR1, the excess source noise has the same interpretation as described above for both the primary (TGAS)
	--/  and secondary data sets. It measures the disagreement between the five-parameter model and the observations,
	--/  augmented by the different priors used. Thus, in TGAS the excess noise may be increased if the proper motion
	--/  seen during the 14 months of Gaia observations are not in agreement with the proper motion inferred from the
	--/  Tycho-2/Gaia comparison. In the secondary solution the excess noise may be increased if the Gaia observations
	--/  indicate a proper motion or parallax several times larger than the prior uncertainty.
	--/ The excess source noise is further explained in Sects. 3.6 and 5.1.2 of (1). </summary>
	--/ <quantity></quantity>
	--/ <unit>mas</unit>
	[astrometric_excess_noise] [float] NOT NULL,
	
	--/ <summary>Significance of excess noise (double). A dimensionless measure (DD) of the significance of the
	--/  calculated astrometric_excess_noise (ϵi). A value D>2indicates that the given ϵi is probably significant.
	--/ For good fits in the limit of a large number of observations, DD should be zero in half of the cases and
	--/  approximately follow the positive half of a normal distribution with zero mean and unit standard 
	--/ deviation for the other half. Consequently, DD is expected to be greater than 2 for only a few percent of the 
	--/ sources with well-behaved astrometric solutions.
	--/ In the early data releases ϵi will however include instrument and attitude modelling errors that are 
	--/ statistically significant and could result in large values of ϵi and DD. The user must study the empirical 
	--/ distributions of these statistics and make sensible cutoffs before filtering out sources for their particular 
	--/ application.
	--/ The excess noise significance is further explained in Sect. 5.1.2 of (1). </summary>
	--/ <quantity></quantity>
	[astrometric_excess_noise_sig] [float] NOT NULL,
	
	--/ <summary>Primary or seconday (boolean). Flag indicating if this source was used as a primary source (true) or
	--/  secondary source (false). Only primary sources contribute to the estimation of attitude, calibration, 
	--/ and global parameters. The estimation of source parameters is otherwise done in exactly the same way for
	--/  primary and secondary sources. </summary>
	--/ <quantity>meta.code</quantity>
	[astrometric_primary_flag] [bit] NOT NULL,
	
	--/ <summary>Relegation factor (float). Relegation factor of the source calculated as per Eq. (118) in (1) used 
	--/ for the primary selection process. </summary>
	--/ <quantity></quantity>
	[astrometric_relegation_factor] [real] NOT NULL,
	
	--/ <summary>Mean astrometric weight of the source (float, Angle[mas−2]). Mean astrometric weight of the 
	--/ source in the AL direction.
	--/ The mean astrometric weight of the source is calculated as per Eq. (119) in (1). </summary>
	--/ <quantity>stat.weight;stat.mean</quantity>
	--/ <unit>mas-2</unit>
	[astrometric_weight_al] [real] NULL,
	
	--/ <summary> Mean astrometric weight of the source (float, Angle[mas−2]). Mean astrometric weight of the 
	--/ source in the AC direction.
	--/ The mean astrometric weight of the source is calculated as per Eq. (119) in (1). </summary>
	--/ <quantity>stat.weight;stat.mean</quantity>
	--/ <unit>mas-2</unit>
	[astrometric_weight_ac] [real] NULL,
	
	--/ <summary>Type of prior used in the astrometric solution (int).
	--/ Type of prior used in the astrometric solution:
	--/ • 0: No prior used
	--/ • 1: Galaxy Bayesian Prior for parallax and proper motion
	--/ • 2: Galaxy Bayesian Prior for parallax and proper motion relaxed by factor 10
	--/ • 3: Hipparcos prior for position
	--/ • 4: Hipparcos prior for position and proper motion
	--/ • 5: Tycho2 prior for position
	--/ • 6: Quasar prior for proper motion
	--/ The Galaxy Bayesian Prior is defined in (2), where it is denoted σϖ,F90σϖ,F⁢90 (for the parallax) and 
	--/ σμ,F90=Rσϖ,F90 with R=10 yr−1-1 (for proper motion). The Galaxy Bayesian Prior relaxed 
	--/ by a factor 10 is 10σϖ,F90 and 10σμ,F90, respectively.
	--/ For Gaia DR1 the only types of priors used are 2 (for the secondary data set), 3 (for the Hipparcos subset
	--/  of the primary data set), or 5 (for the non-Hipparcos subset of the primary data set). Type 6 was used 
	--/ for internal calibration purposes and alignment of the reference frame, but the corresponding astrometric 
	--/ results are in general not published. </summary>
	--/ <quantity>meta.code</quantity>
	[astrometric_priors_used] [int] NOT NULL,
	
	--/ <summary>Amount of observations matched to this source (short). This field indicates the number of observations
	--/ (detection transits) that have been matched to a given source during the last internal crossmatch revision. </summary>
	--/ <quantity>meta.number</quantity>
	[matched_observations] [smallint] NOT NULL,
	
	--/ <summary>Source with duplicate sources (boolean). During data processing, this source happened to been 
	--/ duplicated and one source only has been kept. This may indicate observational, cross-matching or processing
	--/  problems, or stellar multiplicity, and probable astrometric or photometric problems in all cases. In DR1,
	--/  for close doubles with separations below some 2 arcsec, truncated windows have not been processed, neither
	--/  in astrometry and photometry. The transmitted window is centred on the brighter part of the acquired window, 
	--/ so the brighter component has a better chance to be selected, even when processing the fainter transit. If more 
	--/ than two images are contained in a window, the result of the image parameter determination is un-predictable
	--/  in the sense that it might refer to either (or neither) image, and no consistency is assured. </summary>
	--/ <quantity>meta.code</quantity>
	[duplicated_source] [bit] NOT NULL,	
	
	--/ <summary>Degree of concentration of scan directions across the source (float). The scanDirectionStrength and 
	--/ scanDirectionMean quantify the distribution of AL scan directions across the source. scanDirectionStrength[k−1] 
	--/ (k=1,2,3,4) is the absolute value of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θ is the 
	--/ position angle of the scan and the mean value is taken over the nObs[0] AL observations contributing to the 
	--/ astrometric parameters of the source. θ is defined in the usual astronomical sense: θ=0 when the FoV is moving 
	--/ towards local North, and θ=90° towards local East.
	--/ The scanDirectionStrength is a number between 0 and 1, where 0 means that the scan directions are well spread out 
	--/ in different directions, while 1 means that they are concentrated in a single direction (given by scanAngleMean).
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, at first order 
	--/ (k=1), θ=10° and θ=190° count as different directions, but at second order (k=2) they are the 
	--/ same. Thus, scanDirectionStrength[0] is the degree of concentration when the sense of direction is taken into 
	--/ account, while scanDirectionStrength[1] is the degree of concentration without regard to the sense of direction. 
	--/ A large value of scanDirectionStrength[3] indicates that the scans are concentrated in two nearly orthogonal 
	--/ directions. </summary>
	--/ <quantity>obs.param</quantity>
	[scan_direction_strength_k1] [real] NOT NULL,
	
	--/ <summary>Degree of concentration of scan directions across the source (float). The scanDirectionStrength and 
	--/ scanDirectionMean quantify the distribution of AL scan directions across the source. scanDirectionStrength[k−1] 
	--/ (k=1,2,3,4) is the absolute value of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θθ is the 
	--/ position angle of the scan and the mean value is taken over the nObs[0] AL observations contributing to the 
	--/ astrometric parameters of the source. θ is defined in the usual astronomical sense: θ=0θ=0 when the FoV is 
	--/ moving towards local North, and θ=90° towards local East.
	--/ The scanDirectionStrength is a number between 0 and 1, where 0 means that the scan directions are well spread out 
	--/ in different directions, while 1 means that they are concentrated in a single direction (given by scanAngleMean).
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, at first order 
	--/ (k=1), θ=10° and θ=190° count as different directions, but at second order (k=2) they are the 
	--/ same. Thus, scanDirectionStrength[0] is the degree of concentration when the sense of direction is taken into 
	--/ account, while scanDirectionStrength[1] is the degree of concentration without regard to the sense of direction. 
	--/ A large value of scanDirectionStrength[3] indicates that the scans are concentrated in two nearly orthogonal 
	--/ directions. </summary>
	--/ <quantity>obs.param</quantity>
	[scan_direction_strength_k2] [real] NOT NULL,
	
	--/ <summary>Degree of concentration of scan directions across the source (float). The scanDirectionStrength 
	--/ and scanDirectionMean quantify the distribution of AL scan directions across the source. 
	--/ scanDirectionStrength[k-1] (k=1,2,3,4) is the absolute value of the trigonometric moments 
	--/ mk=⟨exp(i⁢k⁢θ)⟩, where θθ is the position angle of the scan and the mean value is taken over 
	--/ the nObs[0] AL observations contributing to the astrometric parameters of the source. θ is defined in 
	--/ the usual astronomical sense: θ=0 when the FoV is moving towards local North, and θ=90° towards 
	--/ local East.
	--/ he scanDirectionStrength is a number between 0 and 1, where 0 means that the scan directions are well 
	--/ spread out in different directions, while 1 means that they are concentrated in a single direction 
	--/ (given by scanAngleMean).
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, at 
	--/ first order (k=1), θ=10° and θ=190° count as different directions, but at second order 
	--/ (k=2) they are the same. Thus, scanDirectionStrength[0] is the degree of concentration when the 
	--/ sense of direction is taken into account, while scanDirectionStrength[1] is the degree of concentration 
	--/ without regard to the sense of direction. A large value of scanDirectionStrength[3] indicates that the 
	--/ scans are concentrated in two nearly orthogonal directions. </summary>
	--/ <quantity>obs.param</quantity>
	[scan_direction_strength_k3] [real] NOT NULL,
	
	--/ <summary>Degree of concentration of scan directions across the source (float). The scanDirectionStrength 
	--/ and scanDirectionMean quantify the distribution of AL scan directions across the source. 
	--/ scanDirectionStrength[k-1] (k=1,2,3,4) is the absolute value of the trigonometric moments 
	--/ mk=⟨exp(i⁢k⁢θ)⟩, where θ is the position angle of the scan and the mean value is taken over 
	--/ the nObs[0] AL observations contributing to the astrometric parameters of the source. θ is defined 
	--/ in the usual astronomical sense: θ=0 when the FoV is moving towards local North, and θ=90° 
	--/ towards local East.
	--/ The scanDirectionStrength is a number between 0 and 1, where 0 means that the scan directions are well 
	--/ spread out in different directions, while 1 means that they are concentrated in a single direction 
	--/ (given by scanAngleMean).
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, at first 
	--/ order (k=1), θ=10° and θ=190° count as different directions, but at second order (k=2) 
	--/ they are the same. Thus, scanDirectionStrength[0] is the degree of concentration when the sense of 
	--/ direction is taken into account, while scanDirectionStrength[1] is the degree of concentration without 
	--/ regard to the sense of direction. A large value of scanDirectionStrength[3] indicates that the scans are 
	--/ concentrated in two nearly orthogonal directions. </summary>
	--/ <quantity>obs.param</quantity>
	[scan_direction_strength_k4] [real] NOT NULL,
	
	--/ <summary>Mean position angle of scan directions across the source (float, Angle[deg]). The 
	--/ scanDirectionStrength and scanDirectionMean quantify the distribution of AL scan directions 
	--/ across the source. scanDirectionMean[k-1] (k=1,2,3,4) is 1/k times the argument 
	--/ of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θθ is the position angle of the 
	--/ scan and the mean value is taken over the nObs[0] AL observations contributing to the astrometric 
	--/ parameters of the source. θθ is defined in the usual astronomical sense: θ=0 when the FoV is 
	--/ moving towards local North, and θ=90° towards local East.
	--/ scanDirectionMean[k-1] is an angle between −180°/k and +180°/k, giving the mean 
	--/ position angle of the scans at order k.
	--/ The different orders kk are statistics of the scan directions modulo 3605°/k. For example, 
	--/ at first order (k=1), θ=10° and θ=190° count as different directions, but at second 
	--/ order (k=2) they are the same. Thus, scanDirectionMean[0] is the mean direction when the sense 
	--/ of direction is taken into account, while scanDirectionMean[1] is the mean direction without 
	--/ regard to the sense of the direction. For example, scanDirectionMean[0] = 0 means that the scans 
	--/ preferentially go towards North, while scanDirectionMean[1] = 0 means that they preferentially 
	--/ go in the North-South direction, and scanDirectionMean[4] = 0 that they preferentially go either 
	--/ in the North-South or in the East-West direction. </summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	--/ <unit>deg</unit>
	[scan_direction_mean_k1] [real] NOT NULL,
	
	--/ <summary>Mean position angle of scan directions across the source (float, Angle[deg]). The 
	--/ scanDirectionStrength and scanDirectionMean quantify the distribution of AL scan directions 
	--/ across the source. scanDirectionMean[k-1] (k=1,2,3,4) is 1/k times the argument 
	--/ of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θθ is the position angle of the 
	--/ scan and the mean value is taken over the nObs[0] AL observations contributing to the astrometric 
	--/ parameters of the source. θθ is defined in the usual astronomical sense: θ=0 when the FoV is 
	--/ moving towards local North, and θ=90° towards local East.
	--/ scanDirectionMean[k-1] is an angle between 180°/k and +180°/k, giving the mean 
	--/ position angle of the scans at order k.
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, 
	--/ at first order (k=1), θ=10° and θ=190° count as different directions, but at second 
	--/ order (k=2) they are the same. Thus, scanDirectionMean[0] is the mean direction when the sense 
	--/ of direction is taken into account, while scanDirectionMean[1] is the mean direction without regard 
	--/ to the sense of the direction. For example, scanDirectionMean[0] = 0 means that the scans 
	--/ preferentially go towards North, while scanDirectionMean[1] = 0 means that they preferentially go 
	--/ in the North-South direction, and scanDirectionMean[4] = 0 that they preferentially go either in 
	--/ the North-South or in the East-West direction. </summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	--/ <unit>deg</unit>
	[scan_direction_mean_k2] [real] NOT NULL,
	
	--/ <summary>Mean position angle of scan directions across the source (float, Angle[deg]). The 
	--/ scanDirectionStrength and scanDirectionMean quantify the distribution of AL scan directions 
	--/ across the source. scanDirectionMean[k-1] (k=1,2,3,4) is 1/k times the argument 
	--/ of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θ is the position angle of the 
	--/ scan and the mean value is taken over the nObs[0] AL observations contributing to the astrometric 
	--/ parameters of the source. θ is defined in the usual astronomical sense: θ=0 when the FoV is 
	--/ moving towards local North, and θ=90° towards local East.
	--/ scanDirectionMean[k-1] is an angle between -180°/k and +180°/k, giving the mean 
	--/ position angle of the scans at order k.
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, 
	--/ at first order (k=1), θ=10° and θ=190° count as different directions, but at second 
	--/ order (k=2) they are the same. Thus, scanDirectionMean[0] is the mean direction when the sense 
	--/ of direction is taken into account, while scanDirectionMean[1] is the mean direction without regard 
	--/ to the sense of the direction. For example, scanDirectionMean[0] = 0 means that the scans 
	--/ preferentially go towards North, while scanDirectionMean[1] = 0 means that they preferentially go 
	--/ in the North-South direction, and scanDirectionMean[4] = 0 that they preferentially go either in 
	--/ the North-South or in the East-West direction. </summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	--/ <unit>deg</unit>
	[scan_direction_mean_k3] [real] NOT NULL,
	
	--/ <summary>Mean position angle of scan directions across the source (float, Angle[deg]). The 
	--/ scanDirectionStrength and scanDirectionMean quantify the distribution of AL scan directions 
	--/ across the source. scanDirectionMean[k-1] (k=1,2,3,4) is 1/k times the argument 
	--/ of the trigonometric moments mk=⟨exp(i⁢k⁢θ)⟩, where θθ is the position angle of the scan 
	--/ and the mean value is taken over the nObs[0] AL observations contributing to the astrometric 
	--/ parameters of the source. θθ is defined in the usual astronomical sense: θ=0θ=0 when the FoV is 
	--/ moving towards local North, and θ=90∘θ=90∘ towards local East.
	--/ scanDirectionMean[k-1] is an angle between -180°/k and +180°/k, giving the mean 
	--/ position angle of the scans at order k.
	--/ The different orders k are statistics of the scan directions modulo 360°/k. For example, 
	--/ at first order (k=1), θ=10° and θ=190° count as different directions, but at
	--/ second order (k=2) they are the same. Thus, scanDirectionMean[0] is the mean direction when 
	--/ the sense of direction is taken into account, while scanDirectionMean[1] is the mean direction 
	--/ without regard to the sense of the direction. For example, scanDirectionMean[0] = 0 means that 
	--/ the scans preferentially go towards North, while scanDirectionMean[1] = 0 means that they 
	--/ preferentially go in the North-South direction, and scanDirectionMean[4] = 0 that they 
	--/ preferentially go either in the North-South or in the East-West direction. </summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	--/ <unit>deg</unit>
	[scan_direction_mean_k4] [real] NOT NULL,
	
	--/ <summary>Number of observations contributing to G photometry (int). Number of observations (CCD transits) 
	--/ that contributed to the G mean flux and mean flux error. </summary>
	--/ <quantity>meta.number</quantity>
	[phot_g_n_obs] [int] NOT NULL,
	
	--/ <summary>G-band mean flux (double, Flux[e-/s]). Mean flux in the G-band. </summary>
	--/ <quantity>phot.flux;em.opt.G</quantity>
	--/ <unit>ct s-1</unit>
	[phot_g_mean_flux] [float] NOT NULL,
	
	--/ <summary> Error on G-band mean flux (double, Flux[e-/s]). Error on the mean flux in the G-band. </summary>
	--/ <quantity>stat.error;phot.flux;em.opt.G</quantity>
	--/ <unit>ct s-1</unit>
	[phot_g_mean_flux_error] [float] NOT NULL,
	
	--/ <summary> G-band mean magnitude (double, Magnitude[mag]). Mean magnitude in the G band. This is computed 
	--/ from the G-band mean flux applying the magnitude zero-point in the Vega scale. </summary>
	--/ <quantity>phot.mag;meta.number;stat.mean</quantity>
	--/ <unit>mag</unit>
	[phot_g_mean_mag] [float] NOT NULL,
	
	--/ <summary> Photometric variability flag (string, Dimensionless[see description]). 
	--/ Flag indicating if variability was identified in the photometric G band:
	--/ ”NOT_AVAILABLE” = source not processed and/or exported to catalogue
	--/ ”CONSTANT” = Source not identified as variable
	--/ ”VARIABLE” = source identified and processed as variable, see tables: 
	--/ phot_variable_summary, 
	--/ phot_variable_time_series_gfov, 
	--/ phot_variable_time_series_gfov_statistical_parameters, 
	--/ and cepheid or rrlyrae for more details.
	--/ Note that for this data release only a small subset of (variable) sources was processed and/or exported, 
	--/ so for many (known) variable sources this flag is set to ”NOT AVAILABLE”. No ”CONSTANT” sources were 
	--/ exported either. </summary>
	--/ <quantity>meta.note</quantity>
	phot_variable_flag varchar(50) NULL,
	
	--/ <summary>Galactic longitude (double, Angle[deg]). Galactic Longitude of the object at reference 
	--/ epoch ref_epoch, see ESA, 1997, ’The Hipparcos and Tycho Catalogues’, ESA SP-1200, Volume 1, 
	--/ Section 1.5.3, for the conversion details. </summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[l] [float] NOT NULL,
	
	--/ <summary>Galactic latitude (double, Angle[deg]). Galactic Latitude of the object at reference epoch 
	--/ ref_epoch, see ESA, 1997, ’The Hipparcos and Tycho Catalogues’, ESA SP-1200, Volume 1, Section 
	--/ 1.5.3, for the conversion details. </summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[b] [float] NOT NULL,
	
	--/ <summary>Ecliptic longitude (double, Angle[deg]). Ecliptic Longitude of the object at reference epoch 
	--/ ref_epoch, see ESA, 1997, ’The Hipparcos and Tycho Catalogues’, ESA SP-1200, Volume 1, Section 1.5.3, 
	--/ for the conversion details. </summary>
	--/ <quantity>pos.ecliptic.lon</quantity>
	--/ <unit>deg</unit>
	[ecl_lon] [float] NOT NULL,

	--/ <summary>Ecliptic latitude (double, Angle[deg]). Ecliptic Latitude of the object at reference epoch 
	--/ ref_epoch, see ESA, 1997, ’The Hipparcos and Tycho Catalogues’, ESA SP-1200, Volume 1, Section 1.5.3, 
	--/ for the conversion details. </summary>
	--/ <quantity>ecliptic.lat</quantity>
	--/ <unit>deg</unit>
	[ecl_lat] [float] NOT NULL
	CONSTRAINT [PKSource] PRIMARY KEY CLUSTERED 
(
	[source_id] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SOURCE]
) ON [SOURCE]