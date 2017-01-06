USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[Name] char(16) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Rmag] real NOT NULL,
	[G_R] real NOT NULL,
	[U_G] real NOT NULL,
	[u_z_em] char(1) NOT NULL,
	[z_em] real NOT NULL,
	[u_z_abs] char(1) NOT NULL,
	[z_abs] real NOT NULL,
	[Type] char(4) NOT NULL,
	[n_Name] char(23) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[Name] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\LBG3Z\lbg3z.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SpecObj', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObj;

GO
-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
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

	--/ <summary> Object name (Field-Identifier) </summary>
	[Name] char(16) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Degree of Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> The {R} band magnitude. Filters are designated by: 
	--/ Un = Identical to SDSS u' filter (both Un and SDSS u' cut at 4000 &Aring; on the red side, about 200 &Aring; blueward of the standard Johnson U passband) 
	--/ {R} = bandpass centered at 6830 &Aring; and half-power bandwidth of ~1250 &Aring;
	--/ G = Same effective wavelength as the SDSS g' filter but slightly narrower. </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> Filters are designated by: 
	--/ Un = Identical to SDSS u' filter (both Un and SDSS u' cut at 4000 &Aring; on the red side, about 200 &Aring; blueward of the standard Johnson U passband) 
	--/ {R} = bandpass centered at 6830 &Aring; and half-power bandwidth of ~1250 &Aring;
	--/ G = Same effective wavelength as the SDSS g' filter but slightly narrower. </summary>
	--/ <unit> mag </unit>
	[G_R] real NOT NULL,

	--/ <summary> Filters are designated by: 
	--/ Un = Identical to SDSS u' filter (both Un and SDSS u' cut at 4000 &Aring; on the red side, about 200 &Aring; blueward of the standard Johnson U passband) 
	--/ {R} = bandpass centered at 6830 &Aring; and half-power bandwidth of ~1250 &Aring;
	--/ G = Same effective wavelength as the SDSS g' filter but slightly narrower. </summary>
	--/ <unit> mag </unit>
	[U_G] real NOT NULL,

	--/ <summary> Uncertainty flag on z-em </summary>
	[u_z_em] char(1) NOT NULL,

	--/ <summary> Redshift derived from emission lines. Special values of the redshift are used: 
	--/ -1.000: Entries of -1.000 in the redshift column indicate that a candidate has never been attempted spectroscopically; 
	--/ -2.000: in both the z-em and z-abs columns indicates that the object has been observed spectroscopically but no reliable 
	--/ redshift resulted. Objects whose redshift measurement depended only on emission lines (usually Lyman &alpha; only, for all but the AGN) 
	--/ have a -2.000 in the z-abs column, and those objects without measurable emission lines have -2.000 in the z-em column. </summary>
	[z_em] real NOT NULL,

	--/ <summary> Uncertainty flag on z-abs </summary>
	[u_z_abs] char(1) NOT NULL,

	--/ <summary> Redshift derived from absorption lines. Special values of the redshift are used: 
	--/ -1.000: Entries of -1.000 in the redshift column indicate that a candidate has never been attempted spectroscopically; 
	--/ -2.000: in both the z-em and z-abs columns indicates that the object has been observed spectroscopically but no reliable 
	--/ redshift resulted. Objects whose redshift measurement depended only on emission lines (usually Lyman &alpha; only, for all but the AGN) 
	--/ have a -2.000 in the z-abs column, and those objects without measurable emission lines have -2.000 in the z-em column. </summary>
	[z_abs] real NOT NULL,

	--/ <summary> Object type </summary>
	[Type] char(4) NOT NULL,

	--/ <summary> Notes on Name. Notes are marked as follows:
	--/ a =	"S96-CNN" indicates object names appearing in Steidel et al. (1996ApJ...462L..17S, [SH92] QSO 0000-263 NN in Simbad)
	--/ b =	This object is discussed in Macchetto et al. (1993ApJ...404..511M) and Giavalisco et al. (1994A&amp;A...288..103G, 1995ApJ...441L..13G)
	--/ c =	Objects discussed in Ellison et al. (2001ApJ...549..770E)
	--/ d =	This galaxy was previously known as Q0201-C6 in Pettini et al. (2001ApJ...554..981P) and in Shapley et al. (2001ApJ...562...95S)
	--/ o =	Objects observed in the near-IR are indicated with their old designations as in Shapley et al. (2001ApJ...562...95S) (for cross-referencing, 
	--/ [PKS98] Q0256-000 ANN in Simbad).
	--/ e =	Object within central HDF region observed with HST; designation as published in Steidel et al. (1996AJ....112..352S);
	--/ f =	Object within central HDF WFPC-2 region; designation as published in Williams et al. (1996AJ....112.1335W);
	--/ g =	Redshift from Lowenthal et al. (1997ApJ...481..673L).
	--/ h =	For purely historical reasons, a number of objects in this field have been published under slightly different names. For such cases, 
	--/ the previous designation is given in this column.
	--/ i =	This object does not satisfy the LBG color selection criteria, but is of interest because it is near Q1422+2309 on the plan of the 
	--/ sky and is at close to the same redshift.
	--/ j =	Objects whose photometry satisfies our LBG selection criteria, but which have been discussed under alternative names, are indicated 
	--/ in this column. "S96" refers to Steidel et al. (1996ApJ...462L..17S [SGP96] SSA 22 CNN in Simbad), and "S98" refers to Steidel et al. 
	--/ (1998ApJ...492..428S, [SAD98] SSA 22a ANN&gt;, &lt;[SAD98] SSA 22a AANN in Simbad). Objects which at one time satisfied our selection criteria, 
	--/ and which were spectroscopically observed, are included at the end of the table (see appendix of the paper).
	--/ k =	This object appeared as a member of the z=3.09 "spike" in Steidel et al. (1998ApJ...492..428S), called "SSA22b-D27". </summary>
	[n_Name] char(23) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, Name, RA, DEC, Rmag, G_R, U_G, u_z_em, z_em, u_z_abs, z_abs, Type, n_Name)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
Name, RA, DEC, Rmag, G_R, U_G, u_z_em, z_em, u_z_abs, z_abs, Type, n_Name
FROM dbo.SpecObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE SpecObjRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_SpecObj_Zone] ON [dbo].[SpecObj] 
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

CREATE NONCLUSTERED INDEX [IX_SpecObj_ZoneID] ON [dbo].[SpecObj] 
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
CREATE NONCLUSTERED INDEX [IX_SpecObj_HtmID] ON [dbo].[SpecObj] 
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


IF OBJECT_ID ('dbo.DeepImagingObsRAW', 'U') IS NOT NULL
	DROP TABLE dbo.DeepImagingObsRAW;

GO

-- CREATE DeepImagingObsRAW TABLE
CREATE TABLE dbo.DeepImagingObsRAW
(	[objID] bigint NOT NULL,
	[Field] char(10) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Filt] char(4) NOT NULL,
	[Tel] char(28) NOT NULL,
	[Scale] real NOT NULL,
	[FWHM] real NOT NULL,
	[ExpTime] int NOT NULL,
	[Dim1] real NOT NULL,
	[Dim2] real NOT NULL,
	[Area] real NOT NULL,

	CONSTRAINT [PK_DeepImagingObsRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	DeepImagingObsRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\LBG3Z\lbg3z-deepIm.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.DeepImagingObs', 'U') IS NOT NULL
	DROP TABLE dbo.DeepImagingObs;

GO
-- CREATE DeepImagingObs TABLE
CREATE TABLE dbo.DeepImagingObs
(
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

	--/ <summary> sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Field name </summary>
	[Field] char(10) NOT NULL,

	--/ <summary> Field center right ascension (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Field center declination (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Filter. Filters are designated by: 
	--/ Un= Identical to SDSS u' filter (both Un and SDSS u' cut at 4000 &Aring; on the red side, about 200 &Aring; blueward of the standard Johnson 
	--/ passband) 
	--/ {R}= bandpass centered at 6830 &Aring; and half-power bandwidth of &lt;1250 &Aring; 
	--/ G= Same effective wavelength as the SDSS g' filter but slightly narrower </summary>
	[Filt] char(4) NOT NULL,

	--/ <summary> Telescope and date. Telescopes are designated as follows:
	--/ P200=	Palomar 5.08-m telescope
	--/ WHT=	William Herschel 4.2-m telescope
	--/ LCO=	Las Campanas Observatory du Pont 2.5-m telescope
	--/ NTT=	ESO 3.6-m New Technology Telescope
	--/ KPNO=	Kitt Peak 4-m Mayall telescope </summary>
	[Tel] char(28) NOT NULL,

	--/ <summary> Pixel scale </summary>
	--/ <unit> arcsec </unit>
	[Scale] real NOT NULL,

	--/ <summary> FWHM </summary>
	--/ <unit> arcsec </unit>
	[FWHM] real NOT NULL,

	--/ <summary> Exposition time </summary>
	--/ <unit> s </unit>
	[ExpTime] int NOT NULL,

	--/ <summary> Dimension </summary>
	--/ <unit> arcmin </unit>
	[Dim1] real NOT NULL,

	--/ <summary> Dimension </summary>
	--/ <unit> arcmin </unit>
	[Dim2] real NOT NULL,

	--/ <summary> Area </summary>
	--/ <unit> arcmin+2 </unit>
	[Area] real NOT NULL,

	CONSTRAINT [PK_DeepImagingObs] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.DeepImagingObs WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, Field, RA, DEC, Filt, Tel, Scale, FWHM, ExpTime, Dim1, Dim2, Area)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, Field, RA, DEC, Filt, Tel, Scale, FWHM, ExpTime, Dim1, Dim2, Area
FROM dbo.DeepImagingObsRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE DeepImagingObsRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_DeepImagingObs_Zone] ON [dbo].[DeepImagingObs] 
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

CREATE NONCLUSTERED INDEX [IX_DeepImagingObs_ZoneID] ON [dbo].[DeepImagingObs] 
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
CREATE NONCLUSTERED INDEX [IX_DeepImagingObs_HtmID] ON [dbo].[DeepImagingObs] 
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
