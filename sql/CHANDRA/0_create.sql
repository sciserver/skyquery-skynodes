--/ <dataset>
--/ <summary> The Chandra Source Catalog, Release 1.1 </summary>
--/ <remarks>
--/ The first official release of the CSC includes information about sources detected in 
--/ public ACIS and HRC imaging observations from roughly the first eight years of the 
--/ Chandra mission. Only point sources, and compact sources, with observed spatial 
--/ extents &lt;~30 arcseconds, are included. Highly extended sources, and sources located 
--/ in selected fields containing bright, highly extended sources, are excluded from the first release.
--/ </remarks>
--/ <url>http://cxc.cfa.harvard.edu/csc/</url>
--/ <icon>chandra.png</icon>
--/ <docpage>chandra.html</docpage>
--/ </dataset>
 GO



-- CREATE PhotoObj TABLE
--/ <summary>he Chandra Source Catalog, Version 1.1</summary>
--/ <remarks></remarks>
--/ <icon>chandra.png</icon>
CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Numerical ID. </summary>	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Chandra source name (JHHMMSS.s+DDMMSS) </summary>	--/ <quantity>meta.id</quantity>
	[CXO] char(16) NOT NULL,

	--/ <summary> 	Right ascension (ICRS) of Chandra source. </summary>	--/ <quantity>pos.eq.ra; pos.frame=icrs</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (ICRS) of Chandra source. </summary>	--/ <quantity>pos.eq.dec; pos.frame=icrs</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>	--/ <quantity>pos.eq.x; pos.frame=icrs</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>	--/ <quantity>pos.eq.y; pos.frame=icrs</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>	--/ <quantity>pos.eq.z; pos.frame=icrs</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>	--/ <quantity>pos.eq.HTM; pos.frame=icrs</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.eq.zone; pos.frame=icrs</quantity>
	[zoneid] int NOT NULL,
	
	--/ <summary> [0.03/158] Position error radius at 95% confidence level. </summary>	--/ <quantity>stat.error;pos.errorEllipse</quantity>
	--/ <unit> arcsec </unit>
	[ePos]  real NOT NULL,

	--/ <summary> [3/] Source flux significance (highest). </summary>	--/ <quantity>stat.value; phot.flux</quantity>
	[SN] real NOT NULL,

	--/ <summary> Aperture-corrected ACIS net energy flux. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      --------------------------------</summary>	--/ <quantity>phot.flux;em.X-ray</quantity>
	--/ <unit> mW m-2 </unit>
	[Fb] float NOT NULL,

	--/ <summary> Lower limit of Fb. It may happen that the flux, determined from a maximum 
	--/ likelihood estimator, is outside the 1 sigma confidence interval of the flux probability 
	--/ density function; more details can be found from 
	--/ http://cxc.harvard.edu/csc/why/ap_vals_errs.html </summary>	--/ <quantity>phot.flux;em.X-ray;stat.min</quantity>
	--/ <unit> mW m-2 </unit>
	[lower_Fb] float NOT NULL,

	--/ <summary> Upper limit of Fb. It may happen that the flux, determined from a maximum 
	--/ likelihood estimator, is outside the 1 sigma confidence interval of the flux probability 
	--/ density function; more details can be found from 
	--/ http://cxc.harvard.edu/csc/why/ap_vals_errs.html </summary>	--/ <quantity>phot.flux;em.X-ray;stat.max</quantity>
	--/ <unit> mW m-2 </unit>
	[upper_Fb] float NOT NULL,

	--/ <summary> Aperture-corrected HRC net energy flux. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      --------------------------------</summary>	--/ <quantity>phot.flux;em.X-ray</quantity>
	--/ <unit> mW m-2 </unit>
	[Fw] float NOT NULL,

	--/ <summary> Lower limit of Fw. </summary>	--/ <quantity>phot.flux;em.X-ray;stat.min</quantity>
	--/ <unit> mW m-2 </unit>
	[lower_Fw] float NOT NULL,

	--/ <summary> Upper limit of Fw. </summary>	--/ <quantity>phot.flux;em.X-ray;stat.max</quantity>
	--/ <unit> mW m-2 </unit>
	[upper_Fw] float NOT NULL,

	--/ <summary> "hard" hardness ratio (Fh-Fm)/Fb
	--/ The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      -------------------------------- </summary>	--/ <quantity>phot.flux;arith.ratio</quantity>
	[hr2] real NOT NULL,

	--/ <summary> [-1/1] Lower limit of hr2 </summary>	--/ <quantity>phot.flux;arith.ratio;stat.min</quantity>
	[lower_hr2] real NOT NULL,

	--/ <summary>  [-1/1] Upper limit of hr2 </summary>	--/ <quantity>phot.flux;arith.ratio;stat.max</quantity>
	[upper_hr2] real NOT NULL,

	--/ <summary> [-1/1] "soft" hardness ratio (Fm-Fs)/Fb. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      -------------------------------- </summary>	--/ <quantity>phot.flux;arith.ratio</quantity>
	[hr1] real NOT NULL,

	--/ <summary>  [-1/1] Lower limit of hr1. </summary>	--/ <quantity>phot.flux;arith.ratio;stat.min</quantity>
	[lower_hr1] real NOT NULL,

	--/ <summary> [-1/1] Upper limit of hr1. </summary>	--/ <quantity>phot.flux;arith.ratio;stat.max</quantity>
	[upper_hr1] real NOT NULL,

	--/ <summary>  Confusion flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>	--/ <quantity>meta.code</quantity>
	[fc] tinyint NOT NULL,

	--/ <summary> Extension flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>	--/ <quantity>meta.code</quantity>
	[fe] tinyint NOT NULL,

	--/ <summary> Saturation flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>	--/ <quantity>meta.code</quantity>
	[fs] tinyint NOT NULL,

	--/ <summary> [0/10] ACIS intra-observation variability. 
	--/ Gregory-Loredo (1992ApJ...398...14G) variability indexes are computed within an observation 
	--/ ("intra-observation" variability) and between observations ("inter-observation" variability). 
	--/ The variability index in the range [0,10] (values 1, 2, 9 and 10 are not used for 
	--/ inter-observation variability), and the highest value across all observations was retained 
	--/ for the intra-observation variability. See section 3.12 for details. Values are: 
	--/ 0 =	Definitely not variable
	--/ 1 =	Not considered variable
	--/ 2 =	Probably not variable
	--/ 3 =	May be variable
	--/ 4 =	Likely to be variable
	--/ 5 =	Considered variable
	--/ 6-10 =	Definitely variable </summary>	--/ <quantity>src.var.index</quantity>
	[Vab] smallint NOT NULL,

	--/ <summary> [0/8] ACIS inter-observation variability.
	--/ Gregory-Loredo (1992ApJ...398...14G) variability indexes are computed within an observation 
	--/ ("intra-observation" variability) and between observations ("inter-observation" variability). 
	--/ The variability index in the range [0,10] (values 1, 2, 9 and 10 are not used for 
	--/ inter-observation variability), and the highest value across all observations was retained 
	--/ for the intra-observation variability. See section 3.12 for details. Values are: 
	--/ 0 =	Definitely not variable
	--/ 1 =	Not considered variable
	--/ 2 =	Probably not variable
	--/ 3 =	May be variable
	--/ 4 =	Likely to be variable
	--/ 5 =	Considered variable
	--/ 6-10 =	Definitely variable </summary>	--/ <quantity>src.var.index</quantity>
	[Vib] tinyint NOT NULL,

	--/ <summary> [0/10] HRC intra-observation variability.
	--/ Gregory-Loredo (1992ApJ...398...14G) variability indexes are computed within an observation 
	--/ ("intra-observation" variability) and between observations ("inter-observation" variability). 
	--/ The variability index in the range [0,10] (values 1, 2, 9 and 10 are not used for 
	--/ inter-observation variability), and the highest value across all observations was retained 
	--/ for the intra-observation variability. See section 3.12 for details. Values are: 
	--/ 0 =	Definitely not variable
	--/ 1 =	Not considered variable
	--/ 2 =	Probably not variable
	--/ 3 =	May be variable
	--/ 4 =	Likely to be variable
	--/ 5 =	Considered variable
	--/ 6-10 =	Definitely variable </summary>	--/ <quantity>src.var.index</quantity>
	[Vaw] smallint NOT NULL,

	--/ <summary> [0/8] HRC inter-observation variability.
	--/ Gregory-Loredo (1992ApJ...398...14G) variability indexes are computed within an observation 
	--/ ("intra-observation" variability) and between observations ("inter-observation" variability). 
	--/ The variability index in the range [0,10] (values 1, 2, 9 and 10 are not used for 
	--/ inter-observation variability), and the highest value across all observations was retained 
	--/ for the intra-observation variability. See section 3.12 for details. Values are: 
	--/ 0 =	Definitely not variable
	--/ 1 =	Not considered variable
	--/ 2 =	Probably not variable
	--/ 3 =	May be variable
	--/ 4 =	Likely to be variable
	--/ 5 =	Considered variable
	--/ 6-10 =	Definitely variable </summary>	--/ <quantity>src.var.index</quantity>
	[Viw] tinyint NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

