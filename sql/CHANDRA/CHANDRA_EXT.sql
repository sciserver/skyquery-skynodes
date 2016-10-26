USE [Graywulf_Temp]
GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO

-- CREATE PhotoObjRAW TABLE

CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[CXO] char(16) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[ePos]  real NOT NULL,
	[SN] real NOT NULL,
	[Fb] float NOT NULL,
	[lower_Fb] float NOT NULL,
	[upper_Fb] float NOT NULL,
	[Fw] float NOT NULL,
	[lower_Fw] float NOT NULL,
	[upper_Fw] float NOT NULL,
	[hr2] real NOT NULL,
	[lower_hr2] real NOT NULL,
	[upper_hr2] real NOT NULL,
	[hr1] real NOT NULL,
	[lower_hr1] real NOT NULL,
	[upper_hr1] real NOT NULL,
	[fc] tinyint NOT NULL,
	[fe] tinyint NOT NULL,
	[fs] tinyint NOT NULL,
	[Vab] smallint NOT NULL,
	[Vib] tinyint NOT NULL,
	[Vaw] smallint NOT NULL,
	[Viw] tinyint NOT NULL,

	
 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\CHANDRA\chandra_src.bin' 
     WITH 
    ( 
   DATAFILETYPE = 'native',
   TABLOCK 
    )
GO

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObj;
GO

-- CREATE PhotoObj TABLE

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Numerical ID. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Chandra source name (JHHMMSS.s+DDMMSS) </summary>
	[CXO] char(16) NOT NULL,

	--/ <summary> 	Right ascension (ICRS) of Chandra source. </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (ICRS) of Chandra source. </summary>
	--/ <unit>deg J2000</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,
	
	--/ <summary> [0.03/158] Position error radius at 95% confidence level. </summary>
	--/ <unit> arcsec </unit>
	[ePos]  real NOT NULL,

	--/ <summary> [3/] Source flux significance (highest). </summary>
	[SN] real NOT NULL,

	--/ <summary> Aperture-corrected ACIS net energy flux. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      --------------------------------</summary>
	--/ <unit> mW/m2 </unit>
	[Fb] float NOT NULL,

	--/ <summary> Lower limit of Fb. It may happen that the flux, determined from a maximum 
	--/ likelihood estimator, is outside the 1 sigma confidence interval of the flux probability 
	--/ density function; more details can be found from 
	--/ http://cxc.harvard.edu/csc/why/ap_vals_errs.html </summary>
	--/ <unit> mW/m2 </unit>
	[lower_Fb] float NOT NULL,

	--/ <summary> Upper limit of Fb. It may happen that the flux, determined from a maximum 
	--/ likelihood estimator, is outside the 1 sigma confidence interval of the flux probability 
	--/ density function; more details can be found from 
	--/ http://cxc.harvard.edu/csc/why/ap_vals_errs.html </summary>
	--/ <unit> mW/m2 </unit>
	[upper_Fb] float NOT NULL,

	--/ <summary> Aperture-corrected HRC net energy flux. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      --------------------------------</summary>
	--/ <unit> mW/m2 </unit>
	[Fw] float NOT NULL,

	--/ <summary> Lower limit of Fw. </summary>
	--/ <unit> mW/m2 </unit>
	[lower_Fw] float NOT NULL,

	--/ <summary> Upper limit of Fw. </summary>
	--/ <unit> mW/m2 </unit>
	[upper_Fw] float NOT NULL,

	--/ <summary> The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      -------------------------------- </summary>
	[hr2] real NOT NULL,

	--/ <summary>  </summary>
	[lower_hr2] real NOT NULL,

	--/ <summary>  </summary>
	[upper_hr2] real NOT NULL,

	--/ <summary> [-1/1] "soft" hardness ratio (Fm-Fs)/Fb. The bands are designated as:
	--/      --------------------------------
	--/      u = 0.2-0.5keV (ACIS ultra-soft)
	--/      s = 0.5-1.2keV (ACIS soft)
	--/      m = 1.2-2.0keV (ACIS medium)
	--/      h = 2.0-7.0keV (ACIS hard)
	--/      b = 0.5-7.0keV (ACIS broad-band)
	--/      w = 0.1-10.keV (HRC wide)
	--/      -------------------------------- </summary>
	[hr1] real NOT NULL,

	--/ <summary>  [-1/1] Lower limit of hr1. </summary>
	[lower_hr1] real NOT NULL,

	--/ <summary> [-1/1] Upper limit of hr1 . </summary>
	[upper_hr1] real NOT NULL,

	--/ <summary>  Confusion flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>
	[fc] tinyint NOT NULL,

	--/ <summary> Extension flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>
	[fe] tinyint NOT NULL,

	--/ <summary> Saturation flag. The flags mean 0=false, 1=true:
	--/ fc =	1 when source regions overlap
	--/ fe =	1 when deconvolved source extent is inconsistent with a point source at the 90% confidence leve
	--/ fs =	1 when in the source is saturated in all observations; source properties are unreliable. </summary>
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
	--/ 6-10 =	Definitely variable </summary>
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
	--/ 6-10 =	Definitely variable </summary>
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
	--/ 6-10 =	Definitely variable </summary>
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
	--/ 6-10 =	Definitely variable </summary>
	[Viw] tinyint NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.PhotoObj WITH (TABLOCKX)
(objID, CXO, ra, dec, cx,cy,cz,htmid, zoneid, ePos, SN, Fb, lower_Fb, upper_Fb, Fw, lower_Fw, upper_Fw,
hr2, lower_hr2, upper_hr2, hr1, lower_hr1, upper_hr1, fc, fe, fs, Vab, Vib, Vaw, Viw)
SELECT objID, CXO, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000),
ePos, SN, Fb, lower_Fb, upper_Fb, Fw, lower_Fw, upper_Fw, hr2, lower_hr2, upper_hr2, hr1, lower_hr1, 
upper_hr1, fc, fe, fs, Vab, Vib, Vaw, Viw
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE
DROP TABLE dbo.PhotoObjRAW;
GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID] ON [dbo].[PhotoObj] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO