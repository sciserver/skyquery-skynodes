--/ <dataset>
--/ <summary> 	The WISE All-Sky data Release </summary>
--/ <remarks>
--/ NASA's Wide-field Infrared Survey Explorer (WISE; Wright et al. 2010) mapped the sky at 3.4, 4.6, 
--/ 12, and 22 μm (W1, W2, W3, W4) in 2010 with an angular resolution of 6.1", 6.4", 6.5", and 12.0" in 
--/ the four bands. WISE achieved 5σ point source sensitivities better than 0.08, 0.11, 1 and 6 mJy in 
--/ unconfused regions on the ecliptic in the four bands. Sensitivity improves toward the ecliptic poles 
--/ due to denser coverage and lower zodiacal background.
--/ </remarks>
--/ <url>http://wise2.ipac.caltech.edu/docs/release/allsky/</url>
--/ <icon>wise.png</icon>
--/ <docpage>wise.html</docpage>
--/ </dataset>
 GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotoObj]
(
	--/ <summary>WISE primary key ('counter')</summary>
	--/ <quantity>meta.id</quantity>
	[cntr] bigint NOT NULL,

	--/ <summary>RA (right ascension, J2000)</summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary>Dec (declination, J2000)</summary>
	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary>Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] [bigint] NOT NULL,

	--/ <summary>ZoneID ID (J2000)</summary>
	--/ <quantity>pos.eq.zone; pos.frame=J2000</quantity>
	[zoneid] [bigint] NOT NULL,

	--/ <summary>uncertainty in RA</summary>
	--/ <quantity>stat.error; pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[sigra] real NOT NULL,

	--/ <summary>uncertainty in DEC</summary>
	--/ <quantity>stat.error; pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[sigdec] real NOT NULL,

	--/ <summary>uncertainty cross-term</summary>
	--/ <quantity>stat.error; pos.eq</quantity>
	--/ <unit>arcsec</unit>
	[sigradec] real NOT NULL,

	--/ <summary>The x-pixel coordinate of this source on the Atlas Image.</summary>
	--/ <quantity>pos.cartesian.x; obs.image</quantity>
	--/ <unit>pix</unit>
	[wx] real NOT NULL,

	--/ <summary>The y-pixel coordinate of this source on the Atlas Image.</summary>
	--/ <quantity>pos.cartesian.y; obs.image</quantity>
	--/ <unit>pix</unit>
	[wy] real NOT NULL,

	--/ <summary>Atlas Tile identifier from which source was extracted.</summary>
	--/ <quantity>meta.id; obs.image</quantity>
	[coadd_id] varchar(13) NOT NULL,

	--/ <summary>Sequential number of this source extraction in the Atlas Tile 
	--/ from which this source was extracted, in approximate descending order of W1 source brightness.</summary>
	--/ <quantity>meta.record</quantity>
	[src] int NOT NULL,

	--/ <summary>Combine reduced chi-squared of the profile-fit photometry measurement in all bands</summary>
	--/ <quantity>stat.fit.chi2; phot</quantity>
	[rchi2] real NOT NULL,

	--/ <summary>2MASS Extended Source Catalog (XSC) proximity. This column gives the distance between
	--/ the WISE source position and the position of a nearby 2MASS XSC source, if the separation
	--/ is less than 1.1 times the Ks isophotal radius size of the XSC source.</summary>
	--/ <quantity>pos.angDistance; src</quantity>
	--/ <unit>arcsec</unit>
	[xsc_prox] real NOT NULL,

	--/ <summary>2MASS PSC association. Unique identifier of the closest source in the 2MASS Point
	--/ Source Catalog (PSC) that falls within 3" of the position of this WISE source.</summary>
	--/ <quantity>meta.id.assoc</quantity>
	[tmass_key] int NOT NULL,

	--/ <summary>Distance separating the positions of the WISE source and associated 2MASS PSC source within 3"</summary>
	--/ <quantity>pos.angDistance; src</quantity>
	--/ <unit>arcsec</unit>
	[r_2mass] real NOT NULL,

	--/ <summary>Position angle (degrees E of N) of the vector from the WISE source to the associated 2MASS PSC source</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[pa_2mass] real NOT NULL,

	--/ <summary>The number of 2MASS PSC entries found within a 3" radius of the WISE source position</summary>
	--/ <quantity>meta.number</quantity>
	[n_2mass] tinyint NOT NULL,

	--/ <summary>2MASS J-band magnitude or magnitude upper limit of the associated 2MASS PSC source</summary>
	--/ <quantity>phot.mag; em.IR.J; stat.max</quantity>
	--/ <unit>mag</unit>
	[j_m_2mass] real NOT NULL,

	--/ <summary>2MASS J-band corrected photometric uncertainty of the associated 2MASS PSC source</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_2mass] real NOT NULL,

	--/ <summary>2MASS H-band magnitude or magnitude upper limit of the associated 2MASS PSC source</summary>
	--/ <quantity>phot.mag; em.IR.H; stat.max</quantity>
	--/ <unit>mag</unit>
	[h_m_2mass] real NOT NULL,

	--/ <summary>2MASS H-band corrected photometric uncertainty of the associated 2MASS PSC source</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_2mass] real NOT NULL,

	--/ <summary>2MASS Ks-band magnitude or magnitude upper limit of the associated 2MASS PSC source</summary>
	--/ <quantity>phot.mag; em.IR.K; stat.max</quantity>
	--/ <unit>mag</unit>
	[k_m_2mass] real NOT NULL,

	--/ <summary>2MASS Ks-band corrected photometric uncertainty of the associated 2MASS PSC source</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_2mass] real NOT NULL,

	--/ <summary>The correlation coefficient between the W1 and W2 single-exposure flux measurements.  
	--/ Negative values indicate anticorrelation.</summary>
	--/ <quantity>stat.correlation; phot.flux</quantity>
	--/ <unit>%</unit>
	[rho12] smallint NOT NULL,

	--/ <summary>The correlation coefficient between the W2 and W3 single-exposure flux measurements.  
	--/ Negative values indicate anticorrelation.</summary>
	--/ <quantity>stat.correlation; phot.flux</quantity>
	--/ <unit>%</unit>
	[rho23] smallint NOT NULL,

	--/ <summary>The correlation coefficient between the W3 and W4 single-exposure flux measurements.  
	--/ Negative values indicate anticorrelation.</summary>
	--/ <quantity>stat.correlation; phot.flux</quantity>
	--/ <unit>%</unit>
	[rho34] smallint NOT NULL,

	--/ <summary>Correlation significance between W1 and W2. The value is -log10(Q2(rho12)), 
	--/ where Q2 is the two-tailed fraction of all cases expected to show at least this much 
	--/ apparent positive or negative correlation when in fact there is no correlation. 
	--/ The value is clipped at 9.</summary>
	--/ <quantity>stat.value</quantity>
	[q12] tinyint NOT NULL,

	--/ <summary>Correlation significance between W2 and W3. The value is -log10(Q2(rho12)), 
	--/ where Q2 is the two-tailed fraction of all cases expected to show at least this much 
	--/ apparent positive or negative correlation when in fact there is no correlation. 
	--/ The value is clipped at 9.</summary>
	--/ <quantity>stat.value</quantity>
	[q23] tinyint NOT NULL,

	--/ <summary>Correlation significance between W3 and W4. The value is -log10(Q2(rho12)), 
	--/ where Q2 is the two-tailed fraction of all cases expected to show at least this much 
	--/ apparent positive or negative correlation when in fact there is no correlation. 
	--/ The value is clipped at 9.</summary>
	--/ <quantity>stat.value</quantity>
	[q34] tinyint NOT NULL,

	--/ <summary>Combination of WISE "ext_flg", "na", and "nb" columns.  Bit 5 (32 / 0x20): 
	--/ The profile-fit photometry goodness-of-fit, w?rchi2, is  &gt; 3.0 in one or more bands.  
	--/ Bit 6 (64 / 0x40): The source falls within the extrapolated isophotal footprint of a 
	--/ 2MASS XSC source.  Bit 7 (128 / 0x80): The source position falls within 5" of a 2MASS XSC source.  
	--/ Bit 4 (16 / 0x10): WISE "na" column: Active deblending flag. Indicates if a single detection was 
	--/ split into multiple sources in the process of profile-fitting.  Bottom four bits (mask 0xf): 
	--/ WISE "nb" column: Number of PSF components used simultaneously in the profile-fitting for this source. 
	--/ This number includes the source itself, so the minimum value of nb is "1". Nb is greater than "1" 
	--/ when the source is fit concurrently with other nearby detections (passive deblending), 
	--/ or when a single source is split into two components during the fitting process (active deblending).</summary>
	--/ <quantity>meta.code</quantity>
	[blend_ext_flags] tinyint NOT NULL,

	--/ <summary>W1 magnitude measured with profile-fitting photometry, 
	--/ or the magnitude of the 95% confidence brightness upper limit if the W1 flux measurement 
	--/ has SNR &lt; 2. This column is null if the source is nominally detected in W1, 
	--/ but no useful brightness estimate could be made.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mpro] real NOT NULL,

	--/ <summary>W1 profile-fit photometric measurement uncertainty in mag units. 
	--/ This column is null if the W1 profile-fit magnitude is a 95% confidence 
	--/ upper limit or if the source is not measurable.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmpro] real NOT NULL,

	--/ <summary>W1 profile-fit measurement signal-to-noise ratio. 
	--/ This value is the ratio of the flux (w1flux) to flux uncertainty 
	--/ (w1sigflux)in the W1 profile-fit photometry measurement. 
	--/ This column is null if w1flux is negative, or if w1flux or w1sigflux are null.</summary>
	--/ <quantity>stat.snr; stat.fit; em.IR.WISE.w1</quantity>
	[w1snr] real NOT NULL,

	--/ <summary>Reduced chi-squared of the W1 profile-fit photometry measurement. 
	--/ This column is null if the W1 magnitude is a 95% confidence upper limit (i.e. the source is not detected).</summary>
	--/ <quantity>stat.fit.chi2; em.IR.WISE.w1</quantity>
	[w1rchi2] real NOT NULL,

	--/ <summary>Saturated pixel fraction, W1. The fraction of all pixels within 
	--/ the profile-fitting area in the stack of single-exposure images used to 
	--/ characterize this source that are flagged as saturated. A value larger than 0.0 indicates
	--/ one or more pixels of saturation. Saturation begins to occur for point sources brighter 
	--/ than [W1]~8 mag. Saturation may occur in fainter sources because of a charged particle strike.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w1</quantity>
	[w1sat] real NOT NULL,

	--/ <summary>Integer frame detection count. This column gives the number of individual 7.7s 
	--/ exposures on which this source was detected with SNR &gt; 3 in the W1 profile-fit measurement. 
	--/ This number can be zero for sources that are well-detected on the coadded Atlas Image, 
	--/ but too faint for detection on the single exposures.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w1</quantity>
	[w1nm] tinyint NOT NULL,

	--/ <summary>Integer frame coverage. This column gives the number of individual 7.7s W1 
	--/ exposures on which a profile-fit measurement of this source was possible.  
	--/ This number can differ between the four bands because band-dependent criteria are used 
	--/ to select individual frames for inclusion in the coadded Atlas Images.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w1</quantity>
	[w1m] tinyint NOT NULL,

	--/ <summary>Mean pixel coverage in W1. This column gives the mean pixel value from the 
	--/ W1 Atlas Tile Coverage Map within the "standard" aperture, a circular area with a radius 
	--/ of 8.25" centered on the position of this source.  W1cov may differ from the integer frame 
	--/ coverage value given in w1m for two reasons. First, individual pixels in the measurement area 
	--/ may be masked or otherwise unusable, reducing the effective pixel count and thus the mean 
	--/ coverage value. Second, the effective sky area sampled by a pixels in single-exposure image 
	--/ varies across the focal plane because of field distortion. Distortion is corrected when 
	--/ coadding to generate the Atlas Images. Therefore, the effective number of pixels contributing 
	--/ to a pixel in the Atlas Coverage Map may be slightly smaller or larger than expected if there was no distortion.</summary>
	--/ <quantity>instr.pixel; stat.mean; em.IR.WISE.w1</quantity>
	[w1cov] real NOT NULL,

	--/ <summary>Fraction of pixels affected by transients. This column gives the fraction of all W1 
	--/ pixels in the stack of individual W1 exposures used to characterize this source that may be 
	--/ affected by transient events. This number is computed by counting the number of pixels in the 
	--/ single exposure Bit Mask images with value "21" that are present within the profile-fitting area, 
	--/ a circular region with radius of 7.25", centered on the position of this source, and dividing by 
	--/ the total number of pixels in the same area that are available for measurement.</summary>
	--/ <quantity>stat.value; em.IR.WISE.w1</quantity>
	[w1frtr] real NOT NULL,

	--/ <summary>The "raw" W1 source flux measured in profile-fit photometry in units of digital numbers. 
	--/ This value may be negative. This column is null if no useful profile-fit measurement of the source 
	--/ is possible because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>phot.flux; em.IR.WISE.w1</quantity>
	--/ <unit>DN</unit>
	[w1flux] real NOT NULL,

	--/ <summary>Uncertainty in the "raw" W1 source flux measurement in profile-fit photometry in units 
	--/ of digital numbers. This column is null if no useful profile-fit measurement of the source is possible 
	--/ because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>stat.error; phot.flux;  em.IR.WISE.w1</quantity>
	--/ <unit>DN</unit>
	[w1sigflux] real NOT NULL,

	--/ <summary>The trimmed average of the W1 sky background value in digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70". Both profile-fit and aperture photometry source 
	--/ brightness measurements are made relative to this sky background value.  For profile-fit photometry, 
	--/ the sky background is measured on the individual single-exposure images that are used for source 
	--/ characterization. For aperture photometry, the sky background is measured on the Atlas Image.</summary>
	--/ <quantity>phot.flux;  em.IR.WISE.w1; obs.background</quantity>
	--/ <unit>DN</unit>
	[w1sky] real NOT NULL,

	--/ <summary>The uncertainty in the W1 sky background value in units of digital numbers measured in an 
	--/ annulus with an inner radius of 50" and outer radius of 70".</summary>
	--/ <quantity>stat.error; phot.flux; obs.background; em.IR.WISE.w1; </quantity>
	--/ <unit>DN</unit>
	[w1sigsky] real NOT NULL,

	--/ <summary>Estimated confusion noise in the W1 sky background annulus, in digital numbers. 
	--/ This number is the difference between the measured noise in the sky background w1sigsk and the 
	--/ noise measured in the same region on the Atlas Uncertainty Maps.</summary>
	--/ <quantity>stat.value; phot.flux; em.IR.WISE.w1; obs.background</quantity>
	--/ <unit>DN</unit>
	[w1conf] real NOT NULL,

	--/ <summary>W1 "standard" aperture magnitude. This is the curve-of-growth corrected source 
	--/ brightness measured in an 8.25" radius circular aperture centered on the source position 
	--/ on the Atlas Image. If the source is not detected in the aperture measurement, 
	--/ this is the 95% confidence upper limit to the brightness. The background sky reference level 
	--/ is measured in an annular region with inner radius of 50" and outer radius of 70". 
	--/ The curve-of-growth correction is given in w1mcor.  This column is null if an aperture 
	--/ measurement was not possible in W1.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag] real NOT NULL,

	--/ <summary>Uncertainty in the W1 "standard" aperture magnitude.  
	--/ This column is null if the W1 "standard" aperture magnitude is an upper limit, 
	--/ or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag] real NOT NULL,

	--/ <summary>W1 aperture curve-of-growth correction, in magnitudes. 
	--/ This correction is subtracted from the nominal 8.25" aperture photometry brightness, 
	--/ w1mag_2, to give the "standard-aperture" magnitude.</summary>
	--/ <quantity>phot.correction; phot.mag;  em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mcor] real NOT NULL,

	--/ <summary>Inverse-variance-weighted mean W1 magnitude computed from profile-fit measurements 
	--/ on the w1m individual frames covering this source. This differs from w1mpro in that it is 
	--/ computed by combining the profile-fit measurements from individual frames, whereas w1mpro is 
	--/ computed by fitting all W1 frames simultaneously and incorporating a robust error model.  
	--/ This column is "null" if w1m=0, the mean flux is negative or if no individual frame measurements 
	--/ are possible.  CAUTION: This is not a robust measurement of source brightness. It is provided as an 
	--/ internal repeatability diagnostic only. Users should always defer to w1mpro for the optimal flux 
	--/ measurement for point sources.</summary>
	--/ <quantity>phot.mag; stat.mean; em.IR.WISE.w1 </quantity>
	--/ <unit>mag</unit>
	[w1magp] real NOT NULL,

	--/ <summary>Standard deviation of the population of W1 fluxes measured on the w1m individual frames 
	--/ covering this source, in magnitudes. This provides a measure of the characteristic uncertainty of 
	--/ the measurement of this source on individual frames.  This column is "null" if w1m &lt; 2 or if no 
	--/ individual frame measurements are possible.</summary>
	--/ <quantity>stat,stdev; phot.flux; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigp1] real NOT NULL,

	--/ <summary>Standard deviation of the mean of the distribution of W1 fluxes (w1magp) computed from 
	--/ profile-fit measurements on the w1m individual frames covering this source, in magnitudes. This is 
	--/ equivalent to w1sigp1/sqrt(w1m).  This column is "null" if w1m &lt; 2 or if no individual 
	--/ frame measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigp2] real NOT NULL,

	--/ <summary>Difference between maximum and minimum magnitude of the source from all usable 
	--/ single-exposure frames, W1. Single-exposure measurements with w1rchi2 values greater than 
	--/ 3.0 times the median are rejected from this computation.</summary>
	--/ <quantity>arith.diff; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1dmag] real NOT NULL,

	--/ <summary>The earliest modified Julian Date (mJD) of the W1 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w1</quantity>
	--/ <unit>d</unit>
	[w1mjdmin] float NOT NULL,

	--/ <summary>The latest modified Julian Date (mJD) of the W1 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w1</quantity>
	--/ <unit>d</unit>
	[w1mjdmax] float NOT NULL,

	--/ <summary>The average modified Julian Date (mJD) of the W1 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; stat.mean; em.IR.WISE.w1</quantity>
	--/ <unit>d</unit>
	[w1mjdmean] float NOT NULL,

	--/ <summary>Semi-major axis of the elliptical aperture used to measure source in W1.</summary>
	--/ <quantity>phys.angSize.smajAxis;  phot.aperture; em.IR.WISE.w1</quantity>
	--/ <unit>arcsec</unit>
	[w1rsemi] real NOT NULL,

	--/ <summary>Axis ratio (b/a) of the elliptical aperture used to measure source in W1.</summary>
	--/ <quantity>phys.angSize.axisRatio;  phot.aperture; em.IR.WISE.w1</quantity>
	[w1ba] real NOT NULL,

	--/ <summary>Position angle (degrees E of N) of the elliptical aperture major axis used to measure source in W1.</summary>
	--/ <quantity>phot.aperture.smajAxis; pos.posAng; em.IR.WISE.w1</quantity>
	--/ <unit>deg</unit>
	[w1pa] real NOT NULL,

	--/ <summary>W1 magnitude of source measured in the elliptical aperture described by w1rsemi, w1ba, and w1pa.</summary>
	--/ <quantity>phot.mag;  em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1gmag] real NOT NULL,

	--/ <summary>Uncertainty in the W1 magnitude of source measured in elliptical aperture.  ("w1gerr" in WISE catalog)</summary>
	--/ <quantity>stat.error; phot.mag;  em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1siggmag] real NOT NULL,

	--/ <summary>W1 "standard" aperture measurement quality flag. This flag indicates if one or more 
	--/ image pixels in the measurement aperture for this band is confused with nearby objects, 
	--/ is contaminated by saturated or otherwise unusable pixels, or is an upper limit. 
	--/ The flag value is an integer that is the combination of one or more of the following values 
	--/ that signify different conditions: 0 - No contamination; 1 - Source confusion - another 
	--/ source falls within the measurement aperture; 2 - Presence of bad pixels in the measurement aperture; 
	--/ 4 - Non-zero bit flag tripped (other than 2 or 18); 8 - All pixels are flagged as unusable, 
	--/ or the aperture flux is negative. In the former case, the aperture magnitude is "null". 
	--/ In the latter case, the aperture magnitude is a 95% confidence upper limit; 16 - Saturation - 
	--/ there are one or more saturated pixels in the measurement aperture; 32 - The magnitude is a 95% confidence upper limit.</summary>
	--/ <quantity>meta.code.qual; phot.mag;  em.IR.WISE.w1</quantity>
	[w1flg] tinyint NOT NULL,

	--/ <summary>W1 elliptical aperture measurement quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated 
	--/ by saturated or otherwise unusable pixels, or is an upper limit. The flag values are as described 
	--/ for the "standard" aperture photometry quality flag, w1flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag;  em.IR.WISE.w1</quantity>
	[w1gflg] tinyint NOT NULL,

	--/ <summary>Combination of WISE "PH_QUAL" and "DET_BIT" columns.  Bit 0 (1, 0x1): (ph_qual = A) - 
	--/ Source is detected in this band with a flux signal-to-noise ratio w1snr &gt; 10; Bit 1 (2, 0x2): 
	--/ (ph_qual = B) - Source is detected in this band with a flux signal-to-noise ratio 3 &lt; w1snr &lt; 10; 
	--/ Bit 2 (4, 0x4): (ph_qual = C): Source is detected in this band with a flux signal-to-noise ratio 2 &lt; 
	--/ w1snr &lt; 3; Bit 3 (8, 0x8): (ph_qual = D): ??; Bit 4 (16, 0x10): (ph_qual = U): Upper limit on magnitude. 
	--/ Source measurement has w1snr &lt; 2. The profile-fit magnitude w1mpro is a 95% confidence upper limit; 
	--/ Bit 5 (32, 0x20): (ph_qual = X): A profile-fit measurement was not possible at this location in this band. 
	--/ The value of w1mpro and w1sigmpro will be "null" in this band; Bit 6 (64, 0x40): (ph_qual = Z) A profile-fit 
	--/ source flux measurement was made at this location, but the flux uncertainty could not be measured. 
	--/ The value of w1sigmpro will be "null" in this band. The value of w1mpro will be "null" if the measured 
	--/ flux is negative, but will not be "null" if the flux is positive. If a non-null magnitude is presented, 
	--/ it should be treated as a brightness upper limit. This occurs in rare circumstances for very bright, 
	--/ heavily saturated sources; Bit 7 (128, 0x80): "DET_BIT" column: Was the source detected at w1snr  &gt;  2?</summary>
	--/ <quantity>meta.code; em.IR.WISE.w1</quantity>
	[ph_qual_det1] tinyint NOT NULL,

	--/ <summary>Number of degrees of freedom in the flux variability chi-square, W1.</summary>
	--/ <quantity>stat.fit.dof; em.IR.WISE.w1</quantity>
	[w1ndf] tinyint NOT NULL,

	--/ <summary>Probability measure that the source is variable in W1 flux. The value is -log10(Q), 
	--/ where Q = 1 - P(chi-suared). P is the cumulative chi-square distribution probability for the flux 
	--/ sample measured on the individual single-exposure images. The value is clipped at 9.  
	--/ The Q value is the fraction of all cases to be expected to be at least as large as that observed 
	--/ if the null hypothesis is true. The null hypothesis is that the flux is emitted by a non-variable 
	--/ astrophysical object. It may be false because the object is a true variable. It may also be false 
	--/ because the flux measurement is corrupted by artifacts such as cosmic rays, scattered light, etc. 
	--/ The smaller the Q value, the more implausible the null hypothesis, i.e., the more likely it is that 
	--/ the flux is either variable or corrupted or both.</summary>
	--/ <quantity>stat.probability; src.var; em.IR.WISE.w1</quantity>
	[w1mlq] tinyint NOT NULL,

	--/ <summary>Contamination and confusion map for this source in W1. This column contains the integer 
	--/ equivalent of the 9-bit binary number that specifies if the W1 measurement is believed to be contaminated 
	--/ by or a spurious detection of an image artifact. The elements of the binary array are:  
	--/ [S  0  0  0  G  H  0  P  D].  The leftmost bit, S, differentiates whether the band-detection is believed
	--/ to be a real detection contaminated by an artifact ("0") or a spurious detection of an artifact ("1"). 
	--/ The remaining bits are set to "1" to denote contamination by different types of artifacts according to 
	--/ the letters: D - Diffraction spike. Source may be a spurious detection of or contaminated by a diffraction 
	--/ spike a nearby bright star on the same image.  P - Persistence. Source may be a spurious detection of or 
	--/ contaminated by a short-term latent (persistence) image left by a bright source.  H - Halo. 
	--/ Source may be a spurious detection of or contaminated by the scattered light halo associated with a bright star.
	--/ G - Optical ghost. Source may be a spurious detection of or contaminated by an optical ghost image caused by
	--/ a nearby bright source on the same image.</summary>
	--/ <quantity>meta.code; em.IR.WISE.w1</quantity>
	[w1cc_map] tinyint NOT NULL,

	--/ <summary>Variability flag for W1.  Related to the probability that the source flux measured on
	--/ the individual WISE exposures was not constant with time. The probability calculation uses the 
	--/ standard deviation of the single exposure flux measurements, w?sigp1, as well as the band-to-band 
	--/ flux correlation significance, q12,q23,q34.  The probability is computed for a band only when there 
	--/ are at least six single-exposure measurements available that satisfy minimum quality criteria. 
	--/ A value of 16 indicates insufficient or inadequate data to make a determination of possible 
	--/ variability. Values of 0 through 9 indicate increasing probabilities of variation. Values of 0 
	--/ through 5 are most likely not variables. Sources with values of 6 and 7 are likely flux variables, 
	--/ but are the most susceptible to false-positive variability. Var_flg values greater than 7 have the 
	--/ highest probability of being true flux variables in a band.  CAUTION: Estimation of flux variability 
	--/ is unreliable for sources that are extended (ext_flg &gt; 0), and sources whose measurements are 
	--/ contaminated by image artifacts in a band (cc_flags[b] != '0').</summary>
	--/ <quantity>meta.code; src.var; em.IR.WISE.w1</quantity>
	[var_flg1] tinyint NOT NULL,

	--/ <summary>Scattered moonlight contamination flag; the fraction of single-exposure frames on which the 
	--/ source was measured that were possibly contaminated by scattered moonlight.  The value is given by 
	--/ [ceiling(#frmmoon/#frames*10)], with a maximum value of 9, where #frmmoon is the number of affected 
	--/ frames and #frames is the total number of frames on which the source was measured.</summary>
	--/ <quantity>meta.code.qual; em.IR.WISE.w1</quantity>
	[moon_lev1] tinyint NOT NULL,

	--/ <summary>Minimum sample at which saturation occurs; indicates the minimum SUTR sample in which any 
	--/ pixel in the profile-fitting area in all of the single-exposure images used to characterize this 
	--/ source was flagged as having reached the saturation level in the on-board WISE payload processing. 
	--/ If no pixels are flagged as saturated, the value is 0.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w1</quantity>
	[satnum1] tinyint NOT NULL,

	--/ <summary>W2 magnitude measured with profile-fitting photometry, or the magnitude of the 95% confidence 
	--/ brightness upper limit if the W2 flux measurement has SNR &lt; 2. This column is null if the source 
	--/ is nominally detected in W2, but no useful brightness estimate could be made.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mpro] real NOT NULL,

	--/ <summary>W2 profile-fit photometric measurement uncertainty in mag units. This column is null if the 
	--/ W2 profile-fit magnitude is a 95% confidence upper limit or if the source is not measurable.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmpro] real NOT NULL,

	--/ <summary>W2 profile-fit measurement signal-to-noise ratio. This value is the ratio of the flux (w2flux) 
	--/ to flux uncertainty (w2sigflux)in the W2 profile-fit photometry measurement. This column is null if 
	--/ w2flux is negative, or if w2flux or w2sigflux are null.</summary>
	--/ <quantity>stat.snr; em.IR.WISE.w2</quantity>
	[w2snr] real NOT NULL,

	--/ <summary>Reduced chi-squared of the W2 profile-fit photometry measurement. This column is null if the 
	--/ W2 magnitude is a 95% confidence upper limit (i.e. the source is not detected).</summary>
	--/ <quantity>stat.fit.chi2; em.IR.WISE.w2</quantity>
	[w2rchi2] real NOT NULL,

	--/ <summary>Saturated pixel fraction, W2. The fraction of all pixels within the profile-fitting area in 
	--/ the stack of single-exposure images used to characterize this source that are flagged as saturated. 
	--/ A value larger than 0.0 indicates one or more pixels of saturation. Saturation begins to occur for 
	--/ point sources brighter than [W2]~8 mag. Saturation may occur in fainter sources because of a charged 
	--/ particle strike.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w2</quantity>
	[w2sat] real NOT NULL,

	--/ <summary>Integer frame detection count. This column gives the number of individual 7.7s exposures on 
	--/ which this source was detected with SNR &gt; 3 in the W2 profile-fit measurement. This number can be 
	--/ zero for sources that are well-detected on the coadded Atlas Image, but too faint for detection on the 
	--/ single exposures.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w2</quantity>
	[w2nm] tinyint NOT NULL,

	--/ <summary>Integer frame coverage. This column gives the number of individual 7.7s W2 exposures on which 
	--/ a profile-fit measurement of this source was possible.  This number can differ between the four bands
	--/ because band-dependent criteria are used to select individual frames for inclusion in the coadded Atlas Images.</summary>
	--/ <quantity>meat.number; em.IR.WISE.w2</quantity>
	[w2m] tinyint NOT NULL,

	--/ <summary>Mean pixel coverage in W2. This column gives the mean pixel value from the W2 Atlas Tile Coverage Map 
	--/ within the "standard" aperture, a circular area with a radius of 8.25" centered on the position of this source.  
	--/ W2cov may differ from the integer frame coverage value given in w2m for two reasons. First, individual pixels 
	--/ in the measurement area may be masked or otherwise unusable, reducing the effective pixel count and thus 
	--/ the mean coverage value. Second, the effective sky area sampled by a pixels in single-exposure image varies 
	--/ across the focal plane because of field distortion. Distortion is corrected when coadding to generate the Atlas 
	--/ Images. Therefore, the effective number of pixels contributing to a pixel in the Atlas Coverage Map may be 
	--/ slightly smaller or larger than expected if there was no distortion.</summary>
	--/ <quantity>instr.pixel; stat.mean; em.IR.WISE.w2</quantity>
	[w2cov] real NOT NULL,

	--/ <summary>Fraction of pixels affected by transients. This column gives the fraction of all W2 pixels in the 
	--/ stack of individual W2 exposures used to characterize this source that may be affected by transient events. 
	--/ This number is computed by counting the number of pixels in the single exposure Bit Mask images with value 
	--/ "21" that are present within the profile-fitting area, a circular region with radius of 7.25", centered on 
	--/ the position of this source, and dividing by the total number of pixels in the same area that are available 
	--/ for measurement.</summary>
	--/ <quantity>stat.value; em.IR.WISE.w2</quantity>
	[w2frtr] real NOT NULL,

	--/ <summary>The "raw" W2 source flux measured in profile-fit photometry in units of digital numbers. 
	--/ This value may be negative. This column is null if no useful profile-fit measurement of the source is possible 
	--/ because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>phot.flux; em.IR.WISE.w2</quantity>
	--/ <unit>DN</unit>
	[w2flux] real NOT NULL,

	--/ <summary>Uncertainty in the "raw" W2 source flux measurement in profile-fit photometry in units of 
	--/ digital numbers. This column is null if no useful profile-fit measurement of the source is possible 
	--/ because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>stat.error; phot.flux; em.IR.WISE.w2</quantity>
	--/ <unit>DN</unit>
	[w2sigflux] real NOT NULL,

	--/ <summary>The trimmed average of the W2 sky background value in digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70". Both profile-fit and aperture photometry source 
	--/ brightness measurements are made relative to this sky background value.  For profile-fit photometry, 
	--/ the sky background is measured on the individual single-exposure images that are used for source 
	--/ characterization. For aperture photometry, the sky background is measured on the Atlas Image.</summary>
	--/ <quantity>obs.background; em.IR.WISE.w2</quantity>
	--/ <unit>DN</unit>
	[w2sky] real NOT NULL,

	--/ <summary>The uncertainty in the W2 sky background value in units of digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70".</summary>
	--/ <quantity>stat.error; obs.background; em.IR.WISE.w2</quantity>
	--/ <unit>DN</unit>
	[w2sigsky] real NOT NULL,

	--/ <summary>Estimated confusion noise in the W2 sky background annulus, in digital numbers. This number is the 
	--/ difference between the measured noise in the sky background w2sigsk and the noise measured in the same 
	--/ region on the Atlas Uncertainty Maps.</summary>
	--/ <quantity>stat.value; obs.background; em.IR.WISE.w2</quantity>
	--/ <unit>DN</unit>
	[w2conf] real NOT NULL,

	--/ <summary>W2 "standard" aperture magnitude. This is the curve-of-growth corrected source brightness 
	--/ measured in an 8.25" radius circular aperture centered on the source position on the Atlas Image. 
	--/ If the source is not detected in the aperture measurement, this is the 95% confidence upper limit 
	--/ to the brightness. The background sky reference level is measured in an annular region with inner 
	--/ radius of 50" and outer radius of 70". The curve-of-growth correction is given in w2mcor.  
	--/ This column is null if an aperture measurement was not possible in W2.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag] real NOT NULL,

	--/ <summary>Uncertainty in the W2 "standard" aperture magnitude.  This column is null if the W2 "standard" 
	--/ aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag;  em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag] real NOT NULL,

	--/ <summary>W2 aperture curve-of-growth correction, in magnitudes. This correction is subtracted from 
	--/ the nominal 8.25" aperture photometry brightness, w2mag_2, to give the "standard-aperture" magnitude.</summary>
	--/ <quantity>phot.correction; phot.mag;  em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mcor] real NOT NULL,

	--/ <summary>Inverse-variance-weighted mean W2 magnitude computed from profile-fit measurements on the w2m 
	--/ individual frames covering this source. This differs from w2mpro in that it is computed by combining 
	--/ the profile-fit measurements from individual frames, whereas w2mpro is computed by fitting all W2 frames 
	--/ simultaneously and incorporating a robust error model.  This column is "null" if w2m=0, the mean flux 
	--/ is negative or if no individual frame measurements are possible.  CAUTION: This is not a robust 
	--/ measurement of source brightness. It is provided as an internal repeatability diagnostic only. Users 
	--/ should always defer to w2mpro for the optimal flux measurement for point sources.</summary>
	--/ <quantity>phot.mag; stat.mean; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2magp] real NOT NULL,

	--/ <summary>Standard deviation of the population of W2 fluxes measured on the w2m individual frames covering 
	--/ this source, in magnitudes. This provides a measure of the characteristic uncertainty of the measurement 
	--/ of this source on individual frames.  This column is "null" if w2m &lt; 2 or if no individual frame 
	--/ measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux;  em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigp1] real NOT NULL,

	--/ <summary>Standard deviation of the mean of the distribution of W2 fluxes (w2magp) computed from profile-fit 
	--/ measurements on the w2m individual frames covering this source, in magnitudes. This is equivalent to 
	--/ w2sigp1/sqrt(w2m).  This column is "null" if w2m &lt; 2 or if no individual frame measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigp2] real NOT NULL,

	--/ <summary>Difference between maximum and minimum magnitude of the source from all usable single-exposure 
	--/ frames, W2. Single-exposure measurements with w2rchi2 values greater than 3.0 times the median are 
	--/ rejected from this computation.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2; arith.diff</quantity>
	--/ <unit>mag</unit>
	[w2dmag] real NOT NULL,

	--/ <summary>The earliest modified Julian Date (mJD) of the W2 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w2</quantity>
	--/ <unit>d</unit>
	[w2mjdmin] float NOT NULL,

	--/ <summary>The latest modified Julian Date (mJD) of the W2 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w2</quantity>
	--/ <unit>d</unit>
	[w2mjdmax] float NOT NULL,

	--/ <summary>The average modified Julian Date (mJD) of the W2 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; stat.mean; em.IR.WISE.w2</quantity>
	--/ <unit>d</unit>
	[w2mjdmean] float NOT NULL,

	--/ <summary>Semi-major axis of the elliptical aperture used to measure source in W2.</summary>
	--/ <quantity>phys.angSize.smajAxis; phot.aperture;  em.IR.WISE.w2</quantity>
	--/ <unit>arcsec</unit>
	[w2rsemi] real NOT NULL,

	--/ <summary>Axis ratio (b/a) of the elliptical aperture used to measure source in W2.</summary>
	--/ <quantity>phys.angSize.axisRatio; phot.aperture;  em.IR.WISE.w2</quantity>
	[w2ba] real NOT NULL,

	--/ <summary>Position angle (degrees E of N) of the elliptical aperture major axis used to measure source in W2.</summary>
	--/ <quantity>pos.posAng; phot.aperture;  em.IR.WISE.w2</quantity>
	--/ <unit>deg</unit>
	[w2pa] real NOT NULL,

	--/ <summary>W2 magnitude of source measured in the elliptical aperture described by w2rsemi, w2ba, and w2pa.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2gmag] real NOT NULL,

	--/ <summary>Uncertainty in the W2 magnitude of source measured in elliptical aperture.  
	--/ ("w2gerr" in WISE catalog)</summary>
	--/ <quantity>stat.error. phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2siggmag] real NOT NULL,

	--/ <summary>W2 "standard" aperture measurement quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated by 
	--/ saturated or otherwise unusable pixels, or is an upper limit. The flag value is an integer that is the 
	--/ combination of one or more of the following values that signify different conditions: 0 - No contamination; 
	--/ 1 - Source confusion - another source falls within the measurement aperture; 2 - Presence of bad pixels in 
	--/ the measurement aperture; 4 - Non-zero bit flag tripped (other than 2 or 18); 8 - All pixels are flagged 
	--/ as unusable, or the aperture flux is negative. In the former case, the aperture magnitude is "null". 
	--/ In the latter case, the aperture magnitude is a 95% confidence upper limit; 16 - Saturation - 
	--/ there are one or more saturated pixels in the measurement aperture; 32 - The magnitude is a 95% 
	--/ confidence upper limit.</summary>
	--/ <quantity>meta.code.qual;phot.mag; em.IR.WISE.w2</quantity>
	[w2flg] tinyint NOT NULL,

	--/ <summary>W2 elliptical aperture measurement quality flag. This flag indicates if one or more image pixels 
	--/ in the measurement aperture for this band is confused with nearby objects, is contaminated by saturated 
	--/ or otherwise unusable pixels, or is an upper limit. The flag values are as described for the "standard" 
	--/ aperture photometry quality flag, w2flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag;  em.IR.WISE.w2</quantity>
	[w2gflg] tinyint NOT NULL,

	--/ <summary>Combination of WISE "PH_QUAL" and "DET_BIT" columns.  Bit 0 (1, 0x1): (ph_qual = A) - Source is 
	--/ detected in this band with a flux signal-to-noise ratio w2snr &gt; 10; Bit 1 (2, 0x2): (ph_qual = B) - 
	--/ Source is detected in this band with a flux signal-to-noise ratio 3 &lt; w2snr &lt; 10; Bit 2 (4, 0x4): 
	--/ (ph_qual = C): Source is detected in this band with a flux signal-to-noise ratio 2 &lt; w2snr &lt; 3; 
	--/ Bit 3 (8, 0x8): (ph_qual = D): ??; Bit 4 (16, 0x10): (ph_qual = U): Upper limit on magnitude. 
	--/ Source measurement has w2snr &lt; 2. The profile-fit magnitude w2mpro is a 95% confidence upper limit; 
	--/ Bit 5 (32, 0x20): (ph_qual = X): A profile-fit measurement was not possible at this location in this band. 
	--/ The value of w2mpro and w2sigmpro will be "null" in this band; Bit 6 (64, 0x40): (ph_qual = Z) 
	--/ A profile-fit source flux measurement was made at this location, but the flux uncertainty could not be measured. 
	--/ The value of w2sigmpro will be "null" in this band. The value of w2mpro will be "null" if the measured flux 
	--/ is negative, but will not be "null" if the flux is positive. If a non-null magnitude is presented, it should 
	--/ be treated as a brightness upper limit. This occurs in rare circumstances for very bright, heavily saturated 
	--/ sources; Bit 7 (128, 0x80): "DET_BIT" column: Was the source detected at w2snr  &gt;  2?</summary>
	--/ <quantity>meta.code; em.IR.WISE.w2</quantity>
	[ph_qual_det2] tinyint NOT NULL,

	--/ <summary>Number of degrees of freedom in the flux variability chi-square, W2.</summary>
	--/ <quantity>stat.fit.dof; em.IR.WISE.w2</quantity>
	[w2ndf] tinyint NOT NULL,

	--/ <summary>Probability measure that the source is variable in W2 flux. The value is -log10(Q),
	--/ where Q = 1 - P(chi-suared). P is the cumulative chi-square distribution probability for the flux sample 
	--/ measured on the individual single-exposure images. The value is clipped at 9.  The Q value is the fraction 
	--/ of all cases to be expected to be at least as large as that observed if the null hypothesis is true. 
	--/ The null hypothesis is that the flux is emitted by a non-variable astrophysical object. It may be false 
	--/ because the object is a true variable. It may also be false because the flux measurement is corrupted by 
	--/ artifacts such as cosmic rays, scattered light, etc. The smaller the Q value, the more implausible the 
	--/ null hypothesis, i.e., the more likely it is that the flux is either variable or corrupted or both.</summary>
	--/ <quantity>stat.probability; em.IR.WISE.w2</quantity>
	[w2mlq] tinyint NOT NULL,

	--/ <summary>Contamination and confusion map for this source in W2. This column contains the integer equivalent 
	--/ of the 9-bit binary number that specifies if the W2 measurement is believed to be contaminated by or a 
	--/ spurious detection of an image artifact. The elements of the binary array are:  [S  0  0  0  G  H  0  P  D].  
	--/ The leftmost bit, S, differentiates whether the band-detection is believed to be a real detection contaminated 
	--/ by an artifact ("0") or a spurious detection of an artifact ("1"). The remaining bits are set to "1" to 
	--/ denote contamination by different types of artifacts according to the letters: D - Diffraction spike. 
	--/ Source may be a spurious detection of or contaminated by a diffraction spike a nearby bright star on the same image.  
	--/ P - Persistence. Source may be a spurious detection of or contaminated by a short-term latent (persistence) 
	--/ image left by a bright source.  H - Halo. Source may be a spurious detection of or contaminated by the scattered 
	--/ light halo associated with a bright star.  G - Optical ghost. Source may be a spurious detection of or 
	--/ contaminated by an optical ghost image caused by a nearby bright source on the same image.</summary>
	--/ <quantity>meta.code.qual; em.IR.WISE.w2</quantity>
	[w2cc_map] tinyint NOT NULL,

	--/ <summary>Variability flag for W2.  Related to the probability that the source flux measured on the individual 
	--/ WISE exposures was not constant with time. The probability calculation uses the standard deviation of the single 
	--/ exposure flux measurements, w?sigp1, as well as the band-to-band flux correlation significance, q12,q23,q34. 
	--/ The probability is computed for a band only when there are at least six single-exposure measurements available 
	--/ that satisfy minimum quality criteria. A value of 16 indicates insufficient or inadequate data to make a 
	--/ determination of possible variability. Values of 0 through 9 indicate increasing probabilities of variation. 
	--/ Values of 0 through 5 are most likely not variables. Sources with values of 6 and 7 are likely flux variables, 
	--/ but are the most susceptible to false-positive variability. Var_flg values greater than 7 have the highest 
	--/ probability of being true flux variables in a band.  CAUTION: Estimation of flux variability is unreliable 
	--/ for sources that are extended (ext_flg &gt; 0), and sources whose measurements are contaminated by image artifacts 
	--/ in a band (cc_flags[b] != '0').</summary>
	--/ <quantity>meta.code; src.var; em.IR.WISE.w2</quantity>
	[var_flg2] tinyint NOT NULL,

	--/ <summary>Scattered moonlight contamination flag; the fraction of single-exposure frames on which the source was 
	--/ measured that were possibly contaminated by scattered moonlight.  The value is given by [ceiling(#frmmoon/#frames*10)], 
	--/ with a maximum value of 9, where #frmmoon is the number of affected frames and #frames is the total number of frames 
	--/ on which the source was measured.</summary>
	--/ <quantity>meta.code.qual; em.IR.WISE.w2</quantity>
	[moon_lev2] tinyint NOT NULL,

	--/ <summary>Minimum sample at which saturation occurs; indicates the minimum SUTR sample in which any pixel in the 
	--/ profile-fitting area in all of the single-exposure images used to characterize this source was flagged as having 
	--/ reached the saturation level in the on-board WISE payload processing. If no pixels are flagged as saturated, the value is 0.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w2</quantity>
	[satnum2] tinyint NOT NULL,

	--/ <summary>W3 magnitude measured with profile-fitting photometry, or the magnitude of the 95% confidence 
	--/ brightness upper limit if the W3 flux measurement has SNR &lt; 2. This column is null if the source is 
	--/ nominally detected in W3, but no useful brightness estimate could be made.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mpro] real NOT NULL,

	--/ <summary>W3 profile-fit photometric measurement uncertainty in mag units. This column is null if the W3 
	--/ profile-fit magnitude is a 95% confidence upper limit or if the source is not measurable.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmpro] real NOT NULL,

	--/ <summary>W3 profile-fit measurement signal-to-noise ratio. This value is the ratio of the flux (w3flux) 
	--/ to flux uncertainty (w3sigflux)in the W3 profile-fit photometry measurement. This column is null if w3flux 
	--/ is negative, or if w3flux or w3sigflux are null.</summary>
	--/ <quantity>stat.snr; phot.mag; em.IR.WISE.w3</quantity>
	[w3snr] real NOT NULL,

	--/ <summary>Reduced chi-squared of the W3 profile-fit photometry measurement. This column is null if the W3 
	--/ magnitude is a 95% confidence upper limit (i.e. the source is not detected).</summary>
	--/ <quantity>stat.fit.chi2; em.IR.WISE.w3</quantity>
	[w3rchi2] real NOT NULL,

	--/ <summary>Saturated pixel fraction, W3. The fraction of all pixels within the profile-fitting area in 
	--/ the stack of single-exposure images used to characterize this source that are flagged as saturated. 
	--/ A value larger than 0.0 indicates one or more pixels of saturation. Saturation begins to occur 
	--/ for point sources brighter than [W3]~8 mag. Saturation may occur in fainter sources because of a charged 
	--/ particle strike.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w3</quantity>
	[w3sat] real NOT NULL,

	--/ <summary>Integer frame detection count. This column gives the number of individual 7.7s exposures on which 
	--/ this source was detected with SNR &gt; 3 in the W3 profile-fit measurement. This number can be zero for 
	--/ sources that are well-detected on the coadded Atlas Image, but too faint for detection on the single exposures.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w3</quantity>
	[w3nm] tinyint NOT NULL,

	--/ <summary>Integer frame coverage. This column gives the number of individual 7.7s W3 exposures on which 
	--/ a profile-fit measurement of this source was possible.  This number can differ between the four bands 
	--/ because band-dependent criteria are used to select individual frames for inclusion in the coadded Atlas Images.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w3</quantity>
	[w3m] tinyint NOT NULL,

	--/ <summary>Mean pixel coverage in W3. This column gives the mean pixel value from the W3 Atlas Tile Coverage 
	--/ Map within the "standard" aperture, a circular area with a radius of 8.25" centered on the position of 
	--/ this source.  W3cov may differ from the integer frame coverage value given in w3m for two reasons. First, 
	--/ individual pixels in the measurement area may be masked or otherwise unusable, reducing the effective pixel 
	--/ count and thus the mean coverage value. Second, the effective sky area sampled by a pixels in single-exposure 
	--/ image varies across the focal plane because of field distortion. Distortion is corrected when coadding to 
	--/ generate the Atlas Images. Therefore, the effective number of pixels contributing to a pixel in the Atlas Coverage 
	--/ Map may be slightly smaller or larger than expected if there was no distortion.</summary>
	--/ <quantity>instr.pixel; em.IR.WISE.w3</quantity>
	[w3cov] real NOT NULL,

	--/ <summary>Fraction of pixels affected by transients. This column gives the fraction of all W3 pixels in the stack 
	--/ of individual W3 exposures used to characterize this source that may be affected by transient events. This number 
	--/ is computed by counting the number of pixels in the single exposure Bit Mask images with value "21" that are 
	--/ present within the profile-fitting area, a circular region with radius of 7.25", centered on the position of 
	--/ this source, and dividing by the total number of pixels in the same area that are available for measurement.</summary>
	--/ <quantity>stat.value; em.IR.WISE.w3 </quantity>
	[w3frtr] real NOT NULL,

	--/ <summary>The "raw" W3 source flux measured in profile-fit photometry in units of digital numbers. 
	--/ This value may be negative. This column is null if no useful profile-fit measurement of the source is 
	--/ possible because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>phot.flux; em.IR.WISE.w3</quantity>
	--/ <unit>DN</unit>
	[w3flux] real NOT NULL,

	--/ <summary>Uncertainty in the "raw" W3 source flux measurement in profile-fit photometry in units of 
	--/ digital numbers. This column is null if no useful profile-fit measurement of the source is possible 
	--/ because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>stat.error; phot.flux; em.IR.WISE.w3</quantity>
	--/ <unit>DN</unit>
	[w3sigflux] real NOT NULL,

	--/ <summary>The trimmed average of the W3 sky background value in digital numbers measured in an annulus with 
	--/ an inner radius of 50" and outer radius of 70". Both profile-fit and aperture photometry source brightness 
	--/ measurements are made relative to this sky background value.  For profile-fit photometry, the sky background 
	--/ is measured on the individual single-exposure images that are used for source characterization. For aperture 
	--/ photometry, the sky background is measured on the Atlas Image.</summary>
	--/ <quantity>phot.flux; obs.background; em.IR.WISE.w3</quantity>
	--/ <unit>DN</unit>
	[w3sky] real NOT NULL,

	--/ <summary>The uncertainty in the W3 sky background value in units of digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70".</summary>
	--/ <quantity>stat.error; phot.flux; obs.background; em.IR.WISE.w3</quantity>
	--/ <unit>DN</unit>
	[w3sigsky] real NOT NULL,

	--/ <summary>Estimated confusion noise in the W3 sky background annulus, in digital numbers. This number is 
	--/ the difference between the measured noise in the sky background w3sigsk and the noise measured in the same 
	--/ region on the Atlas Uncertainty Maps.</summary>
	--/ <quantity>stat.value; phot.flux; obs.background; em.IR.WISE.w3</quantity>
	--/ <unit>DN</unit>
	[w3conf] real NOT NULL,

	--/ <summary>W3 "standard" aperture magnitude. This is the curve-of-growth corrected source brightness measured 
	--/ in an 8.25" radius circular aperture centered on the source position on the Atlas Image. If the source is 
	--/ not detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. 
	--/ The background sky reference level is measured in an annular region with inner radius of 50" and outer 
	--/ radius of 70". The curve-of-growth correction is given in w3mcor.  This column is null if an aperture 
	--/ measurement was not possible in W3.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag] real NOT NULL,

	--/ <summary>Uncertainty in the W3 "standard" aperture magnitude.  This column is null if the W3 "standard" 
	--/ aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag] real NOT NULL,

	--/ <summary>W3 aperture curve-of-growth correction, in magnitudes. This correction is subtracted from the 
	--/ nominal 8.25" aperture photometry brightness, w3mag_2, to give the "standard-aperture" magnitude.</summary>
	--/ <quantity>phot.correction; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mcor] real NOT NULL,

	--/ <summary>Inverse-variance-weighted mean W3 magnitude computed from profile-fit measurements on the w3m 
	--/ individual frames covering this source. This differs from w3mpro in that it is computed by combining the profile-fit measurements from individual frames, whereas w3mpro is computed by fitting all W3 frames simultaneously and incorporating a robust error model.  This column is "null" if w3m=0, the mean flux is negative or if no individual frame measurements are possible.  CAUTION: This is not a robust measurement of source brightness. It is provided as an internal repeatability diagnostic only. Users should always defer to w3mpro for the optimal flux measurement for point sources.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3; stat.mean</quantity>
	--/ <unit>mag</unit>
	[w3magp] real NOT NULL,

	--/ <summary>Standard deviation of the population of W3 fluxes measured on the w3m individual frames covering 
	--/ this source, in magnitudes. This provides a measure of the characteristic uncertainty of the measurement 
	--/ of this source on individual frames.  This column is "null" if w3m &lt; 2 or if no individual frame measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigp1] real NOT NULL,

	--/ <summary>Standard deviation of the mean of the distribution of W3 fluxes (w3magp) computed from 
	--/ profile-fit measurements on the w3m individual frames covering this source, in magnitudes. 
	--/ This is equivalent to w3sigp1/sqrt(w3m).  This column is "null" if w3m &lt; 2 or if no individual 
	--/ frame measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigp2] real NOT NULL,

	--/ <summary>Difference between maximum and minimum magnitude of the source from all usable single-exposure 
	--/ frames, W3. Single-exposure measurements with w3rchi2 values greater than 3.0 times the median are 
	--/ rejected from this computation.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3; arith.diff</quantity>
	--/ <unit>mag</unit>
	[w3dmag] real NOT NULL,

	--/ <summary>The earliest modified Julian Date (mJD) of the W3 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w3</quantity>
	--/ <unit>d</unit>
	[w3mjdmin] float NOT NULL,

	--/ <summary>The latest modified Julian Date (mJD) of the W3 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w3</quantity>
	--/ <unit>d</unit>
	[w3mjdmax] float NOT NULL,

	--/ <summary>The average modified Julian Date (mJD) of the W3 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w3</quantity>
	--/ <unit>d</unit>
	[w3mjdmean] float NOT NULL,

	--/ <summary>Semi-major axis of the elliptical aperture used to measure source in W3.</summary>
	--/ <quantity>phys.angSize.smajAxis; phot.aperture;em.IR.WISE.w3</quantity>
	--/ <unit>arcsec</unit>
	[w3rsemi] real NOT NULL,

	--/ <summary>Axis ratio (b/a) of the elliptical aperture used to measure source in W3.</summary>
	--/ <quantity>phys.angSize.axisRatio; phot.aperture; em.IR.WISE.w3</quantity>
	[w3ba] real NOT NULL,

	--/ <summary>Position angle (degrees E of N) of the elliptical aperture major axis used to measure source in W3.</summary>
	--/ <quantity>pos.posAng; phot.aperture; em.IR.WISE.w3</quantity>
	--/ <unit>deg</unit>
	[w3pa] real NOT NULL,

	--/ <summary>W3 magnitude of source measured in the elliptical aperture described by w3rsemi, w3ba, and w3pa.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3gmag] real NOT NULL,

	--/ <summary>Uncertainty in the W3 magnitude of source measured in elliptical aperture.  ("w3gerr" in WISE catalog)</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3siggmag] real NOT NULL,

	--/ <summary>W3 "standard" aperture measurement quality flag. This flag indicates if one or more image pixels 
	--/ in the measurement aperture for this band is confused with nearby objects, is contaminated by saturated or 
	--/ otherwise unusable pixels, or is an upper limit. The flag value is an integer that is the combination of 
	--/ one or more of the following values that signify different conditions: 0 - No contamination; 1 - 
	--/ Source confusion - another source falls within the measurement aperture; 2 - Presence of bad pixels in the 
	--/ measurement aperture; 4 - Non-zero bit flag tripped (other than 2 or 18); 8 - All pixels are flagged as unusable, 
	--/ or the aperture flux is negative. In the former case, the aperture magnitude is "null". In the latter case, the 
	--/ aperture magnitude is a 95% confidence upper limit; 16 - Saturation - there are one or more saturated pixels in
	--/  the measurement aperture; 32 - The magnitude is a 95% confidence upper limit.</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg] tinyint NOT NULL,

	--/ <summary>W3 elliptical aperture measurement quality flag. This flag indicates if one or more image pixels 
	--/ in the measurement aperture for this band is confused with nearby objects, is contaminated by saturated 
	--/ or otherwise unusable pixels, or is an upper limit. The flag values are as described for the "standard" 
	--/ aperture photometry quality flag, w3flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3gflg] tinyint NOT NULL,

	--/ <summary>Combination of WISE "PH_QUAL" and "DET_BIT" columns.  Bit 0 (1, 0x1): (ph_qual = A) - 
	--/ Source is detected in this band with a flux signal-to-noise ratio w3snr &gt; 10; Bit 1 (2, 0x2): 
	--/ (ph_qual = B) - Source is detected in this band with a flux signal-to-noise ratio 3 &lt; w3snr &lt; 
	--/ 10; Bit 2 (4, 0x4): (ph_qual = C): Source is detected in this band with a flux signal-to-noise ratio 2 &lt; 
	--/ w3snr &lt; 3; Bit 3 (8, 0x8): (ph_qual = D): ??; Bit 4 (16, 0x10): (ph_qual = U): Upper limit on magnitude. 
	--/ Source measurement has w3snr &lt; 2. The profile-fit magnitude w3mpro is a 95% confidence upper limit; 
	--/ Bit 5 (32, 0x20): (ph_qual = X): A profile-fit measurement was not possible at this location in this band.
	--/ The value of w3mpro and w3sigmpro will be "null" in this band; Bit 6 (64, 0x40): (ph_qual = Z) 
	--/ A profile-fit source flux measurement was made at this location, but the flux uncertainty could not be measured. 
	--/ The value of w3sigmpro will be "null" in this band. The value of w3mpro will be "null" if the measured flux is negative, 
	--/ but will not be "null" if the flux is positive. If a non-null magnitude is presented, it should be treated as a 
	--/ brightness upper limit. This occurs in rare circumstances for very bright, heavily saturated sources; Bit 7 (128, 0x80): 
	--/ "DET_BIT" column: Was the source detected at w3snr  &gt;  2?</summary>
	--/ <quantity>meta.code; em.IR.WISE.w3</quantity>
	[ph_qual_det3] tinyint NOT NULL,

	--/ <summary>Number of degrees of freedom in the flux variability chi-square, W3.</summary>
	--/ <quantity>stat.fit.dof; em.IR.WISE.w3</quantity>
	[w3ndf] tinyint NOT NULL,

	--/ <summary>Probability measure that the source is variable in W3 flux. The value is -log10(Q), 
	--/ where Q = 1 - P(chi-suared). P is the cumulative chi-square distribution probability for the flux sample 
	--/ measured on the individual single-exposure images. The value is clipped at 9.  The Q value is the fraction 
	--/ of all cases to be expected to be at least as large as that observed if the null hypothesis is true. 
	--/ The null hypothesis is that the flux is emitted by a non-variable astrophysical object. It may be false 
	--/ because the object is a true variable. It may also be false because the flux measurement is corrupted by 
	--/ artifacts such as cosmic rays, scattered light, etc. The smaller the Q value, the more implausible the 
	--/ null hypothesis, i.e., the more likely it is that the flux is either variable or corrupted or both.</summary>
	--/ <quantity>stat.probability; src.var; em.IR.WISE.w3</quantity>
	[w3mlq] tinyint NOT NULL,

	--/ <summary>Contamination and confusion map for this source in W3. This column contains the integer equivalent 
	--/ of the 9-bit binary number that specifies if the W3 measurement is believed to be contaminated by or 
	--/ a spurious detection of an image artifact. The elements of the binary array are:  [S  0  0  0  G  H  0  P  D].  
	--/ The leftmost bit, S, differentiates whether the band-detection is believed to be a real detection contaminated 
	--/ by an artifact ("0") or a spurious detection of an artifact ("1"). The remaining bits are set to "1" to 
	--/ denote contamination by different types of artifacts according to the letters: D - Diffraction spike. 
	--/ Source may be a spurious detection of or contaminated by a diffraction spike a nearby bright star on the 
	--/ same image.  P - Persistence. Source may be a spurious detection of or contaminated by a short-term latent 
	--/ (persistence) image left by a bright source.  H - Halo. Source may be a spurious detection of or contaminated 
	--/ by the scattered light halo associated with a bright star.  G - Optical ghost. Source may be a spurious 
	--/ detection of or contaminated by an optical ghost image caused by a nearby bright source on the same image.</summary>
	--/ <quantity>meta.code; em.IR.WISE.w3</quantity>
	[w3cc_map] tinyint NOT NULL,

	--/ <summary>Variability flag for W3.  Related to the probability that the source flux measured on the individual 
	--/ WISE exposures was not constant with time. The probability calculation uses the standard deviation of the 
	--/ single exposure flux measurements, w?sigp1, as well as the band-to-band flux correlation significance, 
	--/ q12,q23,q34.  The probability is computed for a band only when there are at least six single-exposure 
	--/ measurements available that satisfy minimum quality criteria. A value of 16 indicates insufficient or 
	--/ inadequate data to make a determination of possible variability. Values of 0 through 9 indicate increasing 
	--/ probabilities of variation. Values of 0 through 5 are most likely not variables. Sources with values of 
	--/ 6 and 7 are likely flux variables, but are the most susceptible to false-positive variability. 
	--/ Var_flg values greater than 7 have the highest probability of being true flux variables in a band.  
	--/ CAUTION: Estimation of flux variability is unreliable for sources that are extended (ext_flg &gt; 0), 
	--/ and sources whose measurements are contaminated by image artifacts in a band (cc_flags[b] != '0').</summary>
	--/ <quantity>meta.code; src.var; em.IR.WISE.w3</quantity>
	[var_flg3] tinyint NOT NULL,

	--/ <summary>Scattered moonlight contamination flag; the fraction of single-exposure frames on which the source 
	--/ was measured that were possibly contaminated by scattered moonlight.  The value is given by [ceiling(#frmmoon/#frames*10)], 
	--/ with a maximum value of 9, where #frmmoon is the number of affected frames and #frames is the total number of 
	--/ frames on which the source was measured.</summary>
	--/ <quantity>meta.code; em.IR.WISE.w3</quantity>
	[moon_lev3] tinyint NOT NULL,

	--/ <summary>Minimum sample at which saturation occurs; indicates the minimum SUTR sample in which any pixel in 
	--/ the profile-fitting area in all of the single-exposure images used to characterize this source was flagged 
	--/ as having reached the saturation level in the on-board WISE payload processing. If no pixels are flagged 
	--/ as saturated, the value is 0.</summary>
	--/ <quantity>isntr.saturation; em.IR.WISE.w3</quantity>
	[satnum3] tinyint NOT NULL,

	--/ <summary>W4 magnitude measured with profile-fitting photometry, or the magnitude of the 95% confidence 
	--/ brightness upper limit if the W4 flux measurement has SNR &lt; 2. This column is null if the source is 
	--/ nominally detected in W4, but no useful brightness estimate could be made.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mpro] real NOT NULL,

	--/ <summary>W4 profile-fit photometric measurement uncertainty in mag units. This column is null if the 
	--/ W4 profile-fit magnitude is a 95% confidence upper limit or if the source is not measurable.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmpro] real NOT NULL,

	--/ <summary>W4 profile-fit measurement signal-to-noise ratio. This value is the ratio of the flux (w4flux) 
	--/ to flux uncertainty (w4sigflux)in the W4 profile-fit photometry measurement. This column is null if w4flux 
	--/ is negative, or if w4flux or w4sigflux are null.</summary>
	--/ <quantity>stat.snr; stat.fit; em.IR.WISE.w4</quantity>
	[w4snr] real NOT NULL,

	--/ <summary>Reduced chi-squared of the W4 profile-fit photometry measurement. This column is null if 
	--/ the W4 magnitude is a 95% confidence upper limit (i.e. the source is not detected).</summary>
	--/ <quantity>stat.fit.chi2; phot.mag; em.IR.WISE.w4</quantity>
	[w4rchi2] real NOT NULL,

	--/ <summary>Saturated pixel fraction, W4. The fraction of all pixels within the profile-fitting area 
	--/ in the stack of single-exposure images used to characterize this source that are flagged as saturated. 
	--/ A value larger than 0.0 indicates one or more pixels of saturation. Saturation begins to occur for 
	--/ point sources brighter than [W4]~8 mag. Saturation may occur in fainter sources because of a 
	--/ charged particle strike.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w4</quantity>
	[w4sat] real NOT NULL,

	--/ <summary>Integer frame detection count. This column gives the number of individual 7.7s exposures on 
	--/ which this source was detected with SNR &gt; 3 in the W4 profile-fit measurement. This number can be 
	--/ zero for sources that are well-detected on the coadded Atlas Image, but too faint for detection on 
	--/ the single exposures.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w4</quantity>
	[w4nm] tinyint NOT NULL,

	--/ <summary>Integer frame coverage. This column gives the number of individual 7.7s W4 exposures on 
	--/ which a profile-fit measurement of this source was possible.  This number can differ between the four 
	--/ bands because band-dependent criteria are used to select individual frames for inclusion in the coadded 
	--/ Atlas Images.</summary>
	--/ <quantity>meta.number; em.IR.WISE.w4</quantity>
	[w4m] tinyint NOT NULL,

	--/ <summary>Mean pixel coverage in W4. This column gives the mean pixel value from the W4 Atlas Tile Coverage 
	--/ Map within the "standard" aperture, a circular area with a radius of 8.25" centered on the position of 
	--/ this source.  W4cov may differ from the integer frame coverage value given in w4m for two reasons. First, 
	--/ individual pixels in the measurement area may be masked or otherwise unusable, reducing the effective pixel 
	--/ count and thus the mean coverage value. Second, the effective sky area sampled by a pixels in single-exposure 
	--/ image varies across the focal plane because of field distortion. Distortion is corrected when coadding 
	--/ to generate the Atlas Images. Therefore, the effective number of pixels contributing to a pixel in the 
	--/ Atlas Coverage Map may be slightly smaller or larger than expected if there was no distortion.</summary>
	--/ <quantity>instr.pixel; stat.mean; em.IR.WISE.w4</quantity>
	[w4cov] real NOT NULL,

	--/ <summary>Fraction of pixels affected by transients. This column gives the fraction of all W4 pixels in the 
	--/ stack of individual W4 exposures used to characterize this source that may be affected by transient events. 
	--/ This number is computed by counting the number of pixels in the single exposure Bit Mask images with value 
	--/ "21" that are present within the profile-fitting area, a circular region with radius of 7.25", centered on 
	--/ the position of this source, and dividing by the total number of pixels in the same area that are 
	--/ available for measurement.</summary>
	--/ <quantity>stat.value; em.IR.WISE.w4</quantity>
	[w4frtr] real NOT NULL,

	--/ <summary>The "raw" W4 source flux measured in profile-fit photometry in units of digital numbers. 
	--/ This value may be negative. This column is null if no useful profile-fit measurement of the source is 
	--/ possible because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>phot.flux; em.IR.WISE.w4</quantity>
	--/ <unit>DN</unit>
	[w4flux] real NOT NULL,

	--/ <summary>Uncertainty in the "raw" W4 source flux measurement in profile-fit photometry in units of 
	--/ digital numbers. This column is null if no useful profile-fit measurement of the source is possible 
	--/ because of masked or otherwise unusable pixels.</summary>
	--/ <quantity>stat.error; phot.flux; em.IR.WISE.w4</quantity>
	--/ <unit>DN</unit>
	[w4sigflux] real NOT NULL,

	--/ <summary>The trimmed average of the W4 sky background value in digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70". Both profile-fit and aperture photometry source 
	--/ brightness measurements are made relative to this sky background value.  For profile-fit photometry, 
	--/ the sky background is measured on the individual single-exposure images that are used for source 
	--/ characterization. For aperture photometry, the sky background is measured on the Atlas Image.</summary>
	--/ <quantity>phot.flux; obs.background; em.IR.WISE.w4</quantity>
	--/ <unit>DN</unit>
	[w4sky] real NOT NULL,

	--/ <summary>The uncertainty in the W4 sky background value in units of digital numbers measured in an annulus 
	--/ with an inner radius of 50" and outer radius of 70".</summary>
	--/ <quantity>stat.error; phot.flux; obs.background; em.IR.WISE.w4</quantity>
	--/ <unit>DN</unit>
	[w4sigsky] real NOT NULL,

	--/ <summary>Estimated confusion noise in the W4 sky background annulus, in digital numbers. This number is the 
	--/ difference between the measured noise in the sky background w4sigsk and the noise measured in the same 
	--/ region on the Atlas Uncertainty Maps.</summary>
	--/ <quantity>stat.value; em.IR.WISE.w4</quantity>
	--/ <unit>DN</unit>
	[w4conf] real NOT NULL,

	--/ <summary>W4 "standard" aperture magnitude. This is the curve-of-growth corrected source brightness measured 
	--/ in an 8.25" radius circular aperture centered on the source position on the Atlas Image. If the source is 
	--/ not detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. The 
	--/ background sky reference level is measured in an annular region with inner radius of 50" and outer radius of 70". 
	--/ The curve-of-growth correction is given in w4mcor.  This column is null if an aperture measurement was not possible in W4.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag] real NOT NULL,

	--/ <summary>Uncertainty in the W4 "standard" aperture magnitude.  This column is null if the W4 "standard" 
	--/ aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag] real NOT NULL,

	--/ <summary>W4 aperture curve-of-growth correction, in magnitudes. This correction is subtracted from the 
	--/ nominal 8.25" aperture photometry brightness, w4mag_2, to give the "standard-aperture" magnitude.</summary>
	--/ <quantity>phot.correction; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mcor] real NOT NULL,

	--/ <summary>Inverse-variance-weighted mean W4 magnitude computed from profile-fit measurements on the w4m 
	--/ individual frames covering this source. This differs from w4mpro in that it is computed by combining the 
	--/ profile-fit measurements from individual frames, whereas w4mpro is computed by fitting all W4 frames 
	--/ simultaneously and incorporating a robust error model.  This column is "null" if w4m=0, the mean flux is 
	--/ negative or if no individual frame measurements are possible.  CAUTION: This is not a robust measurement 
	--/ of source brightness. It is provided as an internal repeatability diagnostic only. Users should always 
	--/ defer to w4mpro for the optimal flux measurement for point sources.</summary>
	--/ <quantity>phot.mag; stat.mean; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4magp] real NOT NULL,

	--/ <summary>Standard deviation of the population of W4 fluxes measured on the w4m individual frames covering 
	--/ this source, in magnitudes. This provides a measure of the characteristic uncertainty of the measurement 
	--/ of this source on individual frames.  This column is "null" if w4m &lt; 2 or if no individual frame 
	--/ measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigp1] real NOT NULL,

	--/ <summary>Standard deviation of the mean of the distribution of W4 fluxes (w4magp) computed from profile-fit 
	--/ measurements on the w4m individual frames covering this source, in magnitudes. This is equivalent to 
	--/ w4sigp1/sqrt(w4m).  This column is "null" if w4m &lt; 2 or if no individual frame measurements are possible.</summary>
	--/ <quantity>stat.stdev; phot.flux; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigp2] real NOT NULL,

	--/ <summary>Difference between maximum and minimum magnitude of the source from all usable single-exposure 
	--/ frames, W4. Single-exposure measurements with w4rchi2 values greater than 3.0 times the median are 
	--/ rejected from this computation.</summary>
	--/ <quantity>phot.mag; arith.diff; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4dmag] real NOT NULL,

	--/ <summary>The earliest modified Julian Date (mJD) of the W4 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w4</quantity>
	--/ <unit>d</unit>
	[w4mjdmin] float NOT NULL,

	--/ <summary>The latest modified Julian Date (mJD) of the W4 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; em.IR.WISE.w4</quantity>
	--/ <unit>d</unit>
	[w4mjdmax] float NOT NULL,

	--/ <summary>The average modified Julian Date (mJD) of the W4 single-exposures covering the source.</summary>
	--/ <quantity>time.epoch; stat.mean; em.IR.WISE.w4</quantity>
	--/ <unit>d</unit>
	[w4mjdmean] float NOT NULL,

	--/ <summary>Semi-major axis of the elliptical aperture used to measure source in W4.</summary>
	--/ <quantity>phys.angSize.smajAxis; phot.aperture; em.IR.WISE.w4</quantity>
	--/ <unit>arcsec</unit>
	[w4rsemi] real NOT NULL,

	--/ <summary>Axis ratio (b/a) of the elliptical aperture used to measure source in W4.</summary>
	--/ <quantity>phys.angSize.axisRatio; phot.aperture; em.IR.WISE.w4</quantity>
	[w4ba] real NOT NULL,

	--/ <summary>Position angle (degrees E of N) of the elliptical aperture major axis used to measure source in W4.</summary>
	--/ <quantity>pos.posAng; phot.aperture; em.IR.WISE.w4</quantity>
	--/ <unit>deg</unit>
	[w4pa] real NOT NULL,

	--/ <summary>W4 magnitude of source measured in the elliptical aperture described by w4rsemi, w4ba, and w4pa.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4gmag] real NOT NULL,

	--/ <summary>Uncertainty in the W4 magnitude of source measured in elliptical aperture.  ("w4gerr" in WISE catalog)</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4siggmag] real NOT NULL,

	--/ <summary>W4 "standard" aperture measurement quality flag. This flag indicates if one or more image pixels 
	--/ in the measurement aperture for this band is confused with nearby objects, is contaminated by saturated 
	--/ or otherwise unusable pixels, or is an upper limit. The flag value is an integer that is the combination 
	--/ of one or more of the following values that signify different conditions: 0 - No contamination; 
	--/ 1 - Source confusion - another source falls within the measurement aperture; 2 - Presence of bad pixels 
	--/ in the measurement aperture; 4 - Non-zero bit flag tripped (other than 2 or 18); 8 - All pixels are flagged 
	--/ as unusable, or the aperture flux is negative. In the former case, the aperture magnitude is "null". 
	--/ In the latter case, the aperture magnitude is a 95% confidence upper limit; 16 - Saturation - there are one 
	--/ or more saturated pixels in the measurement aperture; 32 - The magnitude is a 95% confidence upper limit.</summary>
	--/ <quantity>stat.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg] tinyint NOT NULL,

	--/ <summary>W4 elliptical aperture measurement quality flag. This flag indicates if one or more image pixels 
	--/ in the measurement aperture for this band is confused with nearby objects, is contaminated by saturated or 
	--/ otherwise unusable pixels, or is an upper limit. The flag values are as described for the "standard" 
	--/ aperture photometry quality flag, w4flg.</summary>
	--/ <quantity>stat.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4gflg] tinyint NOT NULL,

	--/ <summary>Combination of WISE "PH_QUAL" and "DET_BIT" columns.  Bit 0 (1, 0x1): (ph_qual = A) - Source is 
	--/ detected in this band with a flux signal-to-noise ratio w4snr &gt; 10; Bit 1 (2, 0x2): (ph_qual = B) - 
	--/ Source is detected in this band with a flux signal-to-noise ratio 3 &lt; w4snr &lt; 10; Bit 2 (4, 0x4): 
	--/ (ph_qual = C): Source is detected in this band with a flux signal-to-noise ratio 2 &lt; w4snr &lt; 3; 
	--/ Bit 3 (8, 0x8): (ph_qual = D): ??; Bit 4 (16, 0x10): (ph_qual = U): Upper limit on magnitude. Source 
	--/ measurement has w4snr &lt; 2. The profile-fit magnitude w4mpro is a 95% confidence upper limit; Bit 5 
	--/ (32, 0x20): (ph_qual = X): A profile-fit measurement was not possible at this location in this band. 
	--/ The value of w4mpro and w4sigmpro will be "null" in this band; Bit 6 (64, 0x40): (ph_qual = Z) 
	--/ A profile-fit source flux measurement was made at this location, but the flux uncertainty could not be measured. 
	--/ The value of w4sigmpro will be "null" in this band. The value of w4mpro will be "null" if the measured flux 
	--/ is negative, but will not be "null" if the flux is positive. If a non-null magnitude is presented, it should 
	--/ be treated as a brightness upper limit. This occurs in rare circumstances for very bright, heavily saturated 
	--/ sources; Bit 7 (128, 0x80): "DET_BIT" column: Was the source detected at w4snr  &gt;  2?</summary>
	--/ <quantity>stat.code; em.IR.WISE.w4</quantity>
	[ph_qual_det4] tinyint NOT NULL,

	--/ <summary>Number of degrees of freedom in the flux variability chi-square, W4.</summary>
	--/ <quantity>stat.fit.dof; em.IR.WISE.w4</quantity>
	[w4ndf] tinyint NOT NULL,

	--/ <summary>Probability measure that the source is variable in W4 flux. The value is -log10(Q), 
	--/ where Q = 1 - P(chi-suared). P is the cumulative chi-square distribution probability for the 
	--/ flux sample measured on the individual single-exposure images. The value is clipped at 9.  
	--/ The Q value is the fraction of all cases to be expected to be at least as large as that observed if 
	--/ the null hypothesis is true. The null hypothesis is that the flux is emitted by a non-variable 
	--/ astrophysical object. It may be false because the object is a true variable. It may also be false 
	--/ because the flux measurement is corrupted by artifacts such as cosmic rays, scattered light, etc. 
	--/ The smaller the Q value, the more implausible the null hypothesis, i.e., the more likely it is that 
	--/ the flux is either variable or corrupted or both.</summary>
	--/ <quantity>stat.probability; src.var; em.IR.WISE.w4</quantity>
	[w4mlq] tinyint NOT NULL,

	--/ <summary>Contamination and confusion map for this source in W4. This column contains the integer 
	--/ equivalent of the 9-bit binary number that specifies if the W4 measurement is believed to be 
	--/ contaminated by or a spurious detection of an image artifact. The elements of the binary array are:  
	--/ [S  0  0  0  G  H  0  P  D].  The leftmost bit, S, differentiates whether the band-detection is 
	--/ believed to be a real detection contaminated by an artifact ("0") or a spurious detection of an 
	--/ artifact ("1"). The remaining bits are set to "1" to denote contamination by different types of 
	--/ artifacts according to the letters: D - Diffraction spike. Source may be a spurious detection of or 
	--/ contaminated by a diffraction spike a nearby bright star on the same image.  P - Persistence. 
	--/ Source may be a spurious detection of or contaminated by a short-term latent (persistence) image left 
	--/ by a bright source.  H - Halo. Source may be a spurious detection of or contaminated by the scattered 
	--/ light halo associated with a bright star.  G - Optical ghost. Source may be a spurious detection of
	--/ or contaminated by an optical ghost image caused by a nearby bright source on the same image.</summary>
	--/ <quantity>meta.code; em.IR.WISE.w4</quantity>
	[w4cc_map] tinyint NOT NULL,

	--/ <summary>Variability flag for W4.  Related to the probability that the source flux measured on the 
	--/ individual WISE exposures was not constant with time. The probability calculation uses the standard 
	--/ deviation of the single exposure flux measurements, w?sigp1, as well as the band-to-band flux 
	--/ correlation significance, q12,q23,q34.  The probability is computed for a band only when there are 
	--/ at least six single-exposure measurements available that satisfy minimum quality criteria. A value 
	--/ of 16 indicates insufficient or inadequate data to make a determination of possible variability. 
	--/ Values of 0 through 9 indicate increasing probabilities of variation. Values of 0 through 5 are most 
	--/ likely not variables. Sources with values of 6 and 7 are likely flux variables, but are the most 
	--/ susceptible to false-positive variability. Var_flg values greater than 7 have the highest probability 
	--/ of being true flux variables in a band.  CAUTION: Estimation of flux variability is unreliable for 
	--/ sources that are extended (ext_flg &gt; 0), and sources whose measurements are contaminated by image 
	--/ artifacts in a band (cc_flags[b] != '0').</summary>
	--/ <quantity>stat.code; src.var; em.IR.WISE.w4</quantity>
	[var_flg4] tinyint NOT NULL,

	--/ <summary>Scattered moonlight contamination flag; the fraction of single-exposure frames on which the 
	--/ source was measured that were possibly contaminated by scattered moonlight.  The value is given by 
	--/ [ceiling(#frmmoon/#frames*10)], with a maximum value of 9, where #frmmoon is the number of affected 
	--/ frames and #frames is the total number of frames on which the source was measured.</summary>
	--/ <quantity>stat.code.qual; em.IR.WISE.w4</quantity>
	[moon_lev4] tinyint NOT NULL,

	--/ <summary>Minimum sample at which saturation occurs; indicates the minimum SUTR sample in which any 
	--/ pixel in the profile-fitting area in all of the single-exposure images used to characterize this 
	--/ source was flagged as having reached the saturation level in the on-board WISE payload processing. 
	--/ If no pixels are flagged as saturated, the value is 0.</summary>
	--/ <quantity>instr.saturation; em.IR.WISE.w4</quantity>
	[satnum4] tinyint NOT NULL,

	--/ <summary>W1 5.5" radius aperture magnitude. This is the calibrated source brightness measured in a 
	--/ 5.5" radius circular aperture centered on the source position on the Atlas Image. If the source is 
	--/ not detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. 
	--/ The background sky reference level is measured in an annular region with inner radius of 50" and 
	--/ outer radius of 70". No curve-of-growth correction has been applied.  This column is null if an 
	--/ aperture measurement was not possible in W1.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_1] real NOT NULL,

	--/ <summary>Uncertainty in the W1 5.5" radius aperture magnitude.  This column is null if the the 5.5" 
	--/ radius aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_1] real NOT NULL,

	--/ <summary>W1 5.5" radius aperture magnitude quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated by 
	--/ saturated or otherwise unusable pixels, or is an upper limit. The flag values are as described for 
	--/ the standard aperture photometry quality flag, w1flg.</summary>
	--/ <quantity>code.meta.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_1] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 8.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_2] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_2] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_2] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 11" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_3] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_3] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_3] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 13.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_4] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_4] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_4] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 16.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_5] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_5] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_5] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 19.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_6] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_6] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_6] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 22" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_7] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_7] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_7] tinyint NOT NULL,

	--/ <summary>Like w1mag_1 but with 24.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1mag_8] real NOT NULL,

	--/ <summary>Like w1sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w1</quantity>
	--/ <unit>mag</unit>
	[w1sigmag_8] real NOT NULL,

	--/ <summary>Like w1flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w1</quantity>
	[w1flg_8] tinyint NOT NULL,

	--/ <summary>W2 5.5" radius aperture magnitude. This is the calibrated source brightness measured in a 
	--/ 5.5" radius circular aperture centered on the source position on the Atlas Image. If the source 
	--/ is not detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. 
	--/ The background sky reference level is measured in an annular region with inner radius of 50" and outer 
	--/ radius of 70". No curve-of-growth correction has been applied.  This column is null if an aperture 
	--/ measurement was not possible in W2.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_1] real NOT NULL,

	--/ <summary>Uncertainty in the W2 5.5" radius aperture magnitude.  This column is null if the the 5.5" 
	--/ radius aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_1] real NOT NULL,

	--/ <summary>W2 5.5" radius aperture magnitude quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated 
	--/ by saturated or otherwise unusable pixels, or is an upper limit. The flag values are as described 
	--/ for the standard aperture photometry quality flag, w2flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_1] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 8.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_2] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_2] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_2] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 11" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_3] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_3] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_3] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 13.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_4] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_4] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_4] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 16.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_5] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_5] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_5] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 19.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_6] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_6] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; em.IR.WISE.w2</quantity>
	[w2flg_6] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 22" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_7] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_7] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.error; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_7] tinyint NOT NULL,

	--/ <summary>Like w2mag_1 but with 24.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2mag_8] real NOT NULL,

	--/ <summary>Like w2sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[w2sigmag_8] real NOT NULL,

	--/ <summary>Like w2flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w2</quantity>
	[w2flg_8] tinyint NOT NULL,

	--/ <summary>W3 5.5" radius aperture magnitude. This is the calibrated source brightness measured in a 
	--/ 5.5" radius circular aperture centered on the source position on the Atlas Image. If the source 
	--/ is not detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. 
	--/ The background sky reference level is measured in an annular region with inner radius of 50" and 
	--/ outer radius of 70". No curve-of-growth correction has been applied.  This column is null if an 
	--/ aperture measurement was not possible in W3.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_1] real NOT NULL,

	--/ <summary>Uncertainty in the W3 5.5" radius aperture magnitude.  This column is null if the the 5.5" 
	--/ radius aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_1] real NOT NULL,

	--/ <summary>W3 5.5" radius aperture magnitude quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated by 
	--/ saturated or otherwise unusable pixels, or is an upper limit. The flag values are as described for 
	--/ the standard aperture photometry quality flag, w3flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_1] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 8.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_2] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_2] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_2] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 11" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_3] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_3] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_3] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 13.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_4] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_4] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_4] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 16.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[w3mag_5] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_5] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_5] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 19.25" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_6] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_6] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_6] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 22" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_7] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_7] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_7] tinyint NOT NULL,

	--/ <summary>Like w3mag_1 but with 24.75" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3mag_8] real NOT NULL,

	--/ <summary>Like w3sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w3</quantity>
	--/ <unit>mag</unit>
	[w3sigmag_8] real NOT NULL,

	--/ <summary>Like w3flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w3</quantity>
	[w3flg_8] tinyint NOT NULL,

	--/ <summary>W4 11" radius aperture magnitude. This is the calibrated source brightness measured in a 5.5" 
	--/ radius circular aperture centered on the source position on the Atlas Image. If the source is not 
	--/ detected in the aperture measurement, this is the 95% confidence upper limit to the brightness. 
	--/ The background sky reference level is measured in an annular region with inner radius of 50" and outer 
	--/ radius of 70". No curve-of-growth correction has been applied.  This column is null if an aperture 
	--/ measurement was not possible in W4.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_1] real NOT NULL,

	--/ <summary>Uncertainty in the W4 5.5" radius aperture magnitude.  This column is null if the the 5.5" 
	--/ radius aperture magnitude is an upper limit, or if an aperture measurement was not possible.</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_1] real NOT NULL,

	--/ <summary>W4 5.5" radius aperture magnitude quality flag. This flag indicates if one or more image 
	--/ pixels in the measurement aperture for this band is confused with nearby objects, is contaminated by 
	--/ saturated or otherwise unusable pixels, or is an upper limit. The flag values are as described for 
	--/ the standard aperture photometry quality flag, w4flg.</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_1] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 16.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_2] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_2] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_2] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 22" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_3] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_3] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_3] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 27.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_4] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_4] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_4] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 33" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_5] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_5] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_5] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 38.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_6] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_6] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_6] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 44" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_7] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_7] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.qual; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_7] tinyint NOT NULL,

	--/ <summary>Like w4mag_1 but with 49.5" aperture.</summary>
	--/ <quantity>phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4mag_8] real NOT NULL,

	--/ <summary>Like w4sigmag_1</summary>
	--/ <quantity>stat.error; phot.mag; em.IR.WISE.w4</quantity>
	--/ <unit>mag</unit>
	[w4sigmag_8] real NOT NULL,

	--/ <summary>Like w4flg_1</summary>
	--/ <quantity>meta.code.flag; phot.mag; em.IR.WISE.w4</quantity>
	[w4flg_8] tinyint NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galacitc.lat</quantity>
	--/ <unit>deg</unit>
	[glat] float NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] float NOT NULL,

	--/ <summary>Dereddening index - computed column used in APOGEE target selection</summary>
	--/ <quantity>obs.param</quantity>
	[rjce] real NOT NULL,
) ON [PHOTO]

GO

ALTER TABLE PhotoObj
ADD CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[cntr] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTO]

GO

