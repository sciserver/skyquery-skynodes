--/ <summary> The main PhotoObj table for the RC3 catalog </summary>
--/ <remarks> The main PhotoObj table for the RC3 catalog </remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary content="ID_AREA">Primary name</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[name] [varchar](20) NOT NULL, 

	--/ <summary>Other names</summary>
	--/ <quantity>meta.id.cross</quantity>
	[aliases] [varchar](20) NULL, 

	--/ <summary>PGC (Paturel et al. 1989a,b) designation</summary>
	--/ <quantity>meta.id.cross</quantity>
	[PGC_name] [varchar](10) NULL, 

	--/ <summary>Right Ascension (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian y coordinate</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian z coordinate</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>htmid for spatial search</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>zoneid for spatial search</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>The values of ra/dec are good to 0.1 sec time, 1 asec (otherwise, 0.1 min time, 1 amin)</summary>
	--/ <quantity>meta.code;pos.eq</quantity>
	[good_position] [int] NOT NULL, 

	--/ <summary>Galactic longitude in the IAU 1958 system (Blaauw et al. 1960); good to 0.01 degrees</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[galactic_l] [float] NULL, 

	--/ <summary>Galactic latitude in the IAU 1958 system (Blaauw et al. 1960); good to 0.01 degrees</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[galactic_b] [float] NULL, 

	--/ <summary>Supergalactic longitude in the RC2 system; good to 0.01 degrees</summary>
	--/ <quantity>pos.supergalactic.lon</quantity>
	--/ <unit>deg</unit>
	[superGalactic_l] [float] NULL, 

	--/ <summary>Supergalactic latitude in the RC2 system; good to 0.01 degrees</summary>
	--/ <quantity>pos.supergalactic.lat</quantity>
	--/ <unit>deg</unit>
	[superGalactic_b] [float] NULL, 

	--/ <summary>position angle, measured in degrees from north through east (all p.a. &lt; 180 degrees), taken when available from UGC, ESO, and ESGC (and in a few cases from HI data).</summary>
	--/ <quantity>pos.ang</quantity>
	--/ <unit>deg</unit>
	[PosAngle] [float] NULL, 

	--/ <summary>mean revised morphological type in the RC2 system, coded as in RC2</summary>
	--/ <quantity>src.morph</quantity>
	[rc2_type] [char](7) NULL, 

	--/ <summary>Sources of revised morphological type estimate</summary>
	--/ <quantity>meta.ref;src.morph</quantity>
	[rc2_typeSource] [char](6) NULL, 

	--/ <summary>Mean numerical index of stage along the Hubble sequence in the RC2 system</summary>
	--/ <quantity>src.class.struct</quantity>
	[T_type] [float] NULL, 

	--/ <summary>Error in T_type</summary>
	--/ <quantity>stat.error;src.class.struct</quantity>
	[T_typeErr] [float] NULL, 

	--/ <summary>Mean numerical luminosity class in the RC2 system</summary>
	--/ <quantity>src.class.luminosity</quantity>
	[LC_rc2] [float] NULL, 

	--/ <summary>Error in LC_rc2</summary>
	--/ <quantity>stat.error;src.class.luminosity</quantity>
	[LC_rc2Err] [float] NULL, 

	--/ <summary>Number of luminosity class estimates</summary>
	--/ <quantity>meta.number</quantity>
	[n_L] [float] NULL, 

	--/ <summary>Total (asymptotic) magnitude in the B system, derived by extrapolation from photoelectric aperture-magnitude data, B_T^A, and from surface photometry with photoelectric zero point, B_T^S</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[B_T] [float] NULL, 

	--/ <summary>Error in B_T</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[B_TErr] [float] NULL, 

	--/ <summary>M when B_T is the weighted mean of B_T^A and B_T^S; V when B_T is a V-band magnitude rather than a B-band magnitude; v when the nucleus of the galaxy is variable; * when deriving B_T^A would have required an extrapolation in excess of 0.75 mag.</summary>
	--/ <quantity>meta.code</quantity>
	[B_Tsource] [char](1) NULL, 

	--/ <summary>total ``face-on'' magnitude corrected for Galactic and internal extinction, and for redshift</summary>
	--/ <quantity>phot.mag.redFree</quantity>
	--/ <unit>mag</unit>
	[B_T0] [float] NULL, 

	--/ <summary>Photographic magnitude from Ames (1930), Shapley and Ames (1932), CGCG, Buta and Corwin (1986), and/or Lauberts and Valentijn (1989) reduced to the B_T system</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[M_B] [float] NULL, 

	--/ <summary>Error in M_B</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[M_BErr] [float] NULL, 

	--/ <summary>Far-infrared magnitude calculated from M_FIR = - 20.0 - 2.5 log_10(FIR), where FIR is the far infrared continuum flux measured at 60 and 100 microns as listed in the IRAS Point Source Catalog (1987). For galaxies larger than 8 arcmin in RC2 and for the Virgo cluster area, resolved by the IRAS beam, integrated fluxes are taken from Rice et al. (1988) or Helou et al. (1988)</summary>
	--/ <quantity>phot.mag;em.IR</quantity>
	--/ <unit>mag</unit>
	[M_FIR] [float] NULL, 

	--/ <summary>21-cm emission line magnitude, and its mean error, defined by m_21 = 21.6 - 2.5 log(S_H), where S_H is the measured neutral hydrogen flux density in units of 10^-24 W/m^2</summary>
	--/ <quantity>phot.mag;em.line.HI</quantity>
	--/ <unit>mag</unit>
	[M_21cm] [float] NULL, 

	--/ <summary>Error in M_21cm</summary>
	--/ <quantity>stat.error;em.line.HI</quantity>
	--/ <unit>mag</unit>
	[M_21cmErr] [float] NULL, 

	--/ <summary>Total (asymptotic) color index in the Johnson B-V system, derived by extrapolation from photoelectric color-aperture data, and/or from surface photometry with photoelectric zero point</summary>
	--/ <quantity>phot.color;em.opt.Johnson.B;em.opt.Johnson.V</quantity>
	--/ <unit>mag</unit>
	[BV_T] [float] NULL, 

	--/ <summary>Error in BV_T</summary>
	--/ <quantity>stat.erro;phot.color;em.opt.Johnson.B;em.opt.Johnson.V</quantity>
	--/ <unit>magnitudes</unit>
	[BV_TErr] [float] NULL, 

	--/ <summary>Total B-V color index corrected for Galactic and internal extinction, and for redshift</summary>
	--/ <quantity>phot.color.redFree;em.opt.Johnson.B;em.opt.Johnson.V</quantity>
	--/ <unit>magnitudes</unit>
	[BV_T0] [float] NULL, 

	--/ <summary>Mean B-V color index within the effective aperture A_e, derived by interpolation from photoelectric color-aperture data</summary>
	--/ <quantity>phot.color;em.opt.Johnson.B;em.opt.Johnson.V;stat.mean</quantity>
	--/ <unit>magnitudes</unit>
	[BV_e] [float] NULL, 

	--/ <summary>Error in BV_e</summary>
	--/ <quantity>stat.error;phot.color;em.opt.Johnson.B;em.opt.Johnson.V</quantity>
	--/ <unit>magnitudes</unit>
	[BV_eErr] [float] NULL, 

	--/ <summary>Total (asymptotic) color index in the Johnson U-B system, derived by extrapolation from photoelectric color-aperture data, and/or from surface photometry with photoelectric zero point</summary>
	--/ <quantity>stat.error;phot.color;em.opt.Johnson.U;em.opt.Johnson.B</quantity>
	--/ <unit>magnitudes</unit>
	[UB_T] [float] NULL, 

	--/ <summary>Error in UB_T</summary>
	--/ <quantity>stat.error;stat.error;phot.color;em.opt.Johnson.U;em.opt.Johnson.B</quantity>
	--/ <unit>magnitudes</unit>
	[UB_TErr] [float] NULL, 

	--/ <summary>Total U-B color index corrected for Galactic and internal extinction, and for redshift</summary>
	--/ <quantity>stat.error;phot.color.redFree;em.opt.Johnson.U;em.opt.Johnson.B</quantity>
	--/ <unit>magnitudes</unit>
	[UB_T0] [float] NULL, 

	--/ <summary>Mean U-B color index, and its mean error, within the effective aperture A_e, derived by interpolation from photoelectric color-aperture data</summary>
	--/ <quantity>stat.error;phot.color;em.opt.Johnson.U;em.opt.Johnson.B;stat.mean</quantity>
	--/ <unit>magnitudes</unit>
	[UB_e] [float] NULL, 

	--/ <summary>Error in UB_e</summary>
	--/ <quantity>stat.error;stat.error;phot.color;em.opt.Johnson.U;em.opt.Johnson.B</quantity>
	--/ <unit>magnitudes</unit>
	[UB_eErr] [float] NULL, 

	--/ <summary>mean decimal logarithm of the apparent major isophotal diameter measured at or reduced to surface brightness level mu_B = 25.0 B-mag/arcsec^2</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	--/ <unit>10e-1 log(arcmin)</unit>
	[lgD_25] [float] NULL, 

	--/ <summary>Error in lgD_25</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>10e-1 log(arcmin)</unit>
	[lgD_25Err] [float] NULL, 

	--/ <summary>decimal logarithm of the isophotal major diameter corrected to ``face-on'' (inclination = 0 degrees), and corrected for Galactic extinction to A_g = 0, but not for redshift</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>10e-1 log(arcmin)</unit>
	[lgD_0] [float] NULL, 

	--/ <summary>Mean decimal logarithm of the ratio of the major isophotal diameter, D_25, to the minor isophotal diameter, d_25, measured at or reduced to the surface brightness level mu_B = 25.0 B-mag/arcsec^2</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	[lgR_25] [float] NULL, 

	--/ <summary>Error in lgR_25</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	[lgR_25Err] [float] NULL, 

	--/ <summary>Decimal logarithm of the apparent diameter (in 0.1 arcmin) of the ``effective aperture,'' the circle centered on the nucleus within which one-half of the total B-band flux is emitted</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>10e-1 log(arcmin)</unit>
	[logA_e] [float] NULL, 

	--/ <summary>Error in logA_e</summary>
	--/ <quantity>stat.error;phys.angSize</quantity>
	--/ <unit>10e-1 log(arcmin)</unit>
	[logA_eErr] [float] NULL, 

	--/ <summary>mean B-band surface brightness in magnitudes per square arcmin (B-mag/arcmin^2) within the effective aperture A_e, as given by the relation m'_e = B_T + 0.75 + 5logA_e - 5.26.  m'_e is statistically related to the effective mean surface brightness, mu'_e (RC2, p. 31; Olson and de Vaucouleurs 1981), with which it coincides when log R = 0 (i = 0 degrees)</summary>
	--/ <quantity>phot.mag.sb;em.opt.B;stat.mean</quantity>
	--/ <unit>mag arcmin-2</unit>
	[m_e] [float] NULL, 

	--/ <summary>Error in m_e</summary>
	--/ <quantity>stat.error;phot.mag.sb;em.opt.B;stat.mean</quantity>
	--/ <unit>mag arcmin-2</unit>
	[m_eErr] [float] NULL, 

	--/ <summary>m'_25 = the mean surface brightness in B-mag/arcmin^2 within the mu_B = 25.0 B-mag/arcsec^2 elliptical isophote of major axis D_25 and axis ratio R_25, defined as in RC2 (Equation 21) by:  m'_25 = B_T + Delta m_25 + 5 logD_25 - 2.5 logR_25 - - 5.26, where Delta m_25 = 2.5 log(L_T/L_D_25) = B_25 - B_T is the magnitude increment contributed by the outer regions of a galaxy fainter than mu_B = 25.0 B-mag/arcsec^2</summary>
	--/ <quantity>phot.mag.sb;em.opt.B;stat.mean</quantity>
	--/ <unit>mag arcmin-2</unit>
	[m_25] [float] NULL, 

	--/ <summary>Error in m_25</summary>
	--/ <quantity>stat.error;phot.mag.sb;em.opt.B;stat.mean</quantity>
	--/ <unit>mag arcmin-2</unit>
	[m_25Err] [float] NULL, 

	--/ <summary>Galactic extinction in B-band magnitudes, calculated following Burstein and Heiles (1978a,b, 1982, 1984)</summary>
	--/ <quantity> phys.absorption.gal;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[A_B] [float] NULL, 

	--/ <summary>HI line self-absorption in magnitudes (for correction to face-on), calculated from logR and T >= 1</summary>
	--/ <quantity>phys.absorption;em.line.HI</quantity>
	--/ <unit>mag</unit>
	[A_HI_self] [float] NULL, 

	--/ <summary>internal extinction in B-band magnitudes (for correction to face-on), calculated from logR and T</summary>
	--/ <quantity>phys.absorption;em.opt.B;em.line.HI</quantity>
	--/ <unit>mag</unit>
	[A_B_int] [float] NULL, 

	--/ <summary>Neutral hydrogen line full width measured at the 20% level (I_20/I_max)</summary>
	--/ <quantity>spect.line.width;</quantity>
	--/ <unit>km s-1</unit>
	[W_20] [float] NULL, 

	--/ <summary>Error in W_20</summary>
	--/ <quantity>stat.error;spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[W_20Err] [float] NULL, 

	--/ <summary>Neutral hydrogen line full width measured at the 50% level (I_50/I_max)</summary>
	--/ <quantity>spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[W_50] [float] NULL, 

	--/ <summary>Error in W_50</summary>
	--/ <quantity>stat.error;spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[W_50Err] [float] NULL, 

	--/ <summary>corrected neutral hydrogen index, which is the difference m_21^0 - B_T^0 between the corrected (face-on) 21-cm emission line magnitude and the similarly corrected magnitude in the B_T system. N.n. Since m_21 and B_T are provided in this table, there is no need to list the uncorrected index.</summary>
	--/ <quantity>phot.color;em.opt.B;em.line.HI</quantity>
	[HI] [float] NULL, 

	--/ <summary>Mean heliocentric radial velocity, and its mean error, in km/s derived from neutral hydrogen observations</summary>
	--/ <quantity>spect.dopplerVeloc;em.line.HI;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_21cm] [float] NULL, 

	--/ <summary>Error in V_21cm</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc;em.line.HI;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_21cmErr] [float] NULL, 

	--/ <summary>mean heliocentric radial velocity, and its mean error, in km/s derived from optical observations</summary>
	--/ <quantity>spect.dopplerVeloc;em.opt;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_opt] [float] NULL, 

	--/ <summary>Error in V_opt</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc;em.opt;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_optErr] [float] NULL, 

	--/ <summary>weighted mean of the neutral hydrogen and optical velocities, corrected to the ``Galactic standard of rest</summary>
	--/ <quantity>spect.depplerVeloc;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_GSR] [float] NULL, 

	--/ <summary>weighted mean velocity corrected to the reference frame defined by the 3 K microwave background radiation</summary>
	--/ <quantity>spect.depplerVeloc;stat.mean</quantity>
	--/ <unit>km s-1</unit>
	[V_3K] [float] NULL, 

	--/ <summary content="ID_MAIN">the main primary key</summary>
	--/ <quantity>meta.record</quantity>
	[objId] [bigint] NOT NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objId] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO
