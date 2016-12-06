USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[objID] bigint NOT NULL,
	[GDDS] char(7) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[z] float NOT NULL,
	[Conf] smallint NOT NULL,
	[Ovlap] char(3) NOT NULL,
	[Weight] float NOT NULL,
	[Bmag] real NOT NULL,
	[n_Bmag] char(1) NOT NULL,
	[e_Bmag] real NOT NULL,
	[Vmag] real NOT NULL,
	[n_Vmag] char(1) NOT NULL,
	[e_Vmag] real NOT NULL,
	[Rmag] real NOT NULL,
	[n_Rmag] char(1) NOT NULL,
	[e_Rmag] real NOT NULL,
	[Icmag] real NOT NULL,
	[n_Icmag] char(1) NOT NULL,
	[e_Icmag] real NOT NULL,
	[z_mag] real NOT NULL,
	[n_z_mag] char(1) NOT NULL,
	[e_z_mag] real NOT NULL,
	[Hmag] real NOT NULL,
	[n_Hmag] char(1) NOT NULL,
	[e_Hmag] real NOT NULL,
	[Ksmag] real NOT NULL,
	[n_Ksmag] char(1) NOT NULL,
	[e_Ksmag] real NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\GDDS\gdds.bin'
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

	--/ <summary> Sequential Number </summary>
	[objID] bigint NOT NULL,

	--/ <summary> GDDS object identification (HH-NNNN) </summary>
	[GDDS] char(7) NOT NULL,

	--/ <summary> right ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Degree of declination </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Redshift </summary>
	[z] float NOT NULL,

	--/ <summary> Redshift confidence. Redshift confidence classes as follows:
	--/ 0 =	Failures. No redshift determined. If a redshift is given in table4.dat it should be taken as an educated guess.
	--/ 1 =	Failures. Confidence &lt;50%. Very insecure
	--/ 2 =	Redshift Inferred from Multiple Features. Confidence &gt;75%. Reasonably secure. Two or more matching lines/features.
	--/ 3 =	Redshift Inferred from Multiple Features. Confidence = 95%. Secure. Two or more matching lines/features + supporting continuum.
	--/ 4 =	Redshift Inferred from Multiple Features. Confidence: Certain. Unquestionably correct.
	--/ 8 =	Single-Line Redshift. Single emission line. Continuum suggests line is [O II] lambda3727.
	--/ 9 =	Single-Line Redshift. Single emission line.
	--/ 14 =	AGN Redshift. Class 4 as above, but with AGN characteristics. </summary>
	[Conf] smallint NOT NULL,

	--/ <summary> Slit geometry/collision class. Classification of spectrum overlaps take the following numbers:
	--/ 0 =	Both A and B channels uncontaminated (at most very minor masking needed).
	--/ 1 =	Single channel overlap. Offending channel not used (at most very minor masking needed).
	--/ 2 =	A contaminating zeroth-order line has been masked. Remaining continuum is trustworthy.
	--/ 3 =	Two channel collision. Major masking used in extraction. Continuum in blue should not be trusted.
	--/ 4 =	Two channel collision. Major masking used in extraction. Continuum in red should not be trusted.
	--/ 5 =	Extreme measures needed to try to recover a spectrum. Continuum should not be trusted.</summary>
	[Ovlap] char(3) NOT NULL,

	--/ <summary> Sampling weight. The practical upshot of our general mask design strategy is graphically
	--/ summarized in the bottom left panel of Figure 6. This panel is a two-dimensional histogram showing the 
	--/ number of independent slits assigned each cell of color-magnitude space. For the reasons just described 
	--/ heavy emphasis is given to the (22 &lt; I&lt; 24.5, 3&lt; I-Ks &lt;5) region of color-magnitude space. The relative number 
	--/ of slits as a function of the average population in each cell expected in a wide-area survey can be computed 
	--/ by dividing the bottom left panel of the figure by the top left panel. The values computed using this 
	--/ procedure are shown in the bottom right panel and correspond to sampling weights. These weights will 
	--/ prove important in the computation of the luminosity and mass functions in future papers in this series. </summary>
	[Weight] float NOT NULL,

	--/ <summary> B-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Bmag. </summary>
	[n_Bmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Bmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Bmag] real NOT NULL,

	--/ <summary> V-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Vmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Vmag. </summary>
	[n_Vmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Vmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Vmag] real NOT NULL,

	--/ <summary> Cousins R-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary>  s for 2-sigma detection limit in Rmag. </summary>
	[n_Rmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Rmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Rmag] real NOT NULL,

	--/ <summary> Cousins I-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Icmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Icmag </summary>
	[n_Icmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Icmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Icmag] real NOT NULL,

	--/ <summary> z'-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[z_mag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in z'mag </summary>
	[n_z_mag] char(1) NOT NULL,

	--/ <summary> Uncertainty in z'mag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_z_mag] real NOT NULL,

	--/ <summary> H-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Hmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Hmag </summary>
	[n_Hmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Hmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Hmag] real NOT NULL,

	--/ <summary> Ks-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[Ksmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Ksmag </summary>
	[n_Ksmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Ksmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <unit> mag </unit>
	[e_Ksmag] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, GDDS, RA, DEC, z, Conf, Ovlap, Weight, Bmag, n_Bmag, e_Bmag, Vmag, n_Vmag, e_Vmag, Rmag, n_Rmag, e_Rmag, Icmag, n_Icmag, e_Icmag, z_mag, n_z_mag, e_z_mag, Hmag, n_Hmag, e_Hmag, Ksmag, n_Ksmag, e_Ksmag)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, GDDS, RA, DEC, SpecObjRAW.z, Conf, Ovlap, Weight, Bmag, n_Bmag, e_Bmag, Vmag, n_Vmag, e_Vmag, Rmag, n_Rmag, e_Rmag, Icmag, n_Icmag, e_Icmag, z_mag, n_z_mag, e_z_mag, Hmag, n_Hmag, e_Hmag, Ksmag, n_Ksmag, e_Ksmag
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

CREATE NONCLUSTERED INDEX [IX_Specbj_ZoneID] ON [dbo].[SpecObj] 
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


IF OBJECT_ID ('dbo.SpectralFeaturesRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpectralFeaturesRAW;

GO

-- CREATE SpectralFeaturesRAW TABLE
CREATE TABLE dbo.SpectralFeaturesRAW
(	[GDDS] char(7) NOT NULL,
	[AGN] tinyint NOT NULL,
	[OII] tinyint NOT NULL,
	[OIII] tinyint NOT NULL,
	[HiBal] tinyint NOT NULL,
	[LoBal] tinyint NOT NULL,
	[Fe2375] tinyint NOT NULL,
	[Fe2600] tinyint NOT NULL,
	[Mg2800] tinyint NOT NULL,
	[Mg2852] tinyint NOT NULL,
	[HandK] tinyint NOT NULL,
	[Balmer] tinyint NOT NULL,
	[D4000] tinyint NOT NULL,
	[Temp] tinyint NOT NULL,
	[Class] int NOT NULL,
	[Conf] smallint NOT NULL,
	[z] real NOT NULL,

	CONSTRAINT [PK_SpectralFeaturesRAW] PRIMARY KEY CLUSTERED
(
	[GDDS] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpectralFeaturesRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\GDDS\gdds_specFeatures.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SpectralFeatures', 'U') IS NOT NULL
	DROP TABLE dbo.SpectralFeatures;

GO
-- CREATE SpectralFeatures TABLE
CREATE TABLE dbo.SpectralFeatures
(
	--/ <summary> GDDS object identification (HH-NNNN). 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[GDDS] char(7) NOT NULL,

	--/ <summary> Indicative of AGN activity. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[AGN] tinyint NOT NULL,

	--/ <summary> Is [O II] (3727 Angstrom) present?
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[OII] tinyint NOT NULL,

	--/ <summary> Is [O III] (5007 Angstrom) present?
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[OIII] tinyint NOT NULL,

	--/ <summary> Are Balmer lines bluer than Hbeta present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[HiBal] tinyint NOT NULL,

	--/ <summary> Is Halpha and/or Hbeta present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[LoBal] tinyint NOT NULL,

	--/ <summary> Is Fe II (2375 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[Fe2375] tinyint NOT NULL,

	--/ <summary> Is Fe II (2600 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra.  </summary>
	[Fe2600] tinyint NOT NULL,

	--/ <summary> Is Mg II (2800 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[Mg2800] tinyint NOT NULL,

	--/ <summary>  Is Mg II (2852 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[Mg2852] tinyint NOT NULL,

	--/ <summary> Are Ca II H and K lines present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[HandK] tinyint NOT NULL,

	--/ <summary> Is the Balmer decrement present?. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <unit>  </unit>
	[Balmer] tinyint NOT NULL,

	--/ <summary>  Is the D4000 feature present?. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	[D4000] tinyint NOT NULL,

	--/ <summary> Redshift template code. Redshift template code as follows:
	--/ 1 =	Comparison against a reference template was used to obtain the redshift
	--/ 2 =	No template needed to obtain the redshift </summary>
	[Temp] tinyint NOT NULL,

	--/ <summary> Spectral class. Classes use the following numbers:
	--/ 001 =	Objects showing pure, or nearly pure, signatures of an evolved stellar population (e.g., D4000, H	K, or template matches)
	--/ 100 =	Objects that are dominated by the flat-UV continuum and strong emission-lines characteristic of star- forming systems
	--/ 010 =	those showing signatures of intermediate ages (e.g., strong Balmer absorption). 
	--/ Many objects show characteristics of more than one type and so are assigned classes that are the sum of old (001), intermediates (010), 
	--/ and young (100) populations. Example: Objects listed as "101" may show strong H	K absorption and 4000 Angstrom breaks and yet have a flat-UV 
	--/ continuum tail indicative of a low level of ongoing star formation. </summary>
	[Class] int NOT NULL,

	--/ <summary> Confidence code. Redshift confidence classes as follows:
	--/ 0 =	Failures. No redshift determined. If a redshift is given in table4.dat it should be taken as an educated guess.
	--/ 1 =	Failures. Confidence &lt;50%. Very insecure
	--/ 2 =	Redshift Inferred from Multiple Features. Confidence &gt;75%. Reasonably secure. Two or more matching lines/features.
	--/ 3 =	Redshift Inferred from Multiple Features. Confidence = 95%. Secure. Two or more matching lines/features + supporting continuum.
	--/ 4 =	Redshift Inferred from Multiple Features. Confidence: Certain. Unquestionably correct.
	--/ 8 =	Single-Line Redshift. Single emission line. Continuum suggests line is [O II] lambda3727.
	--/ 9 =	Single-Line Redshift. Single emission line.
	--/ 14 =	AGN Redshift. Class 4 as above, but with AGN characteristics. </summary>
	[Conf] smallint NOT NULL,

	--/ <summary> Redshift </summary>
	[z] real NOT NULL,

	CONSTRAINT [PK_SpectralFeatures] PRIMARY KEY CLUSTERED
(
	[GDDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA
INSERT dbo.SpectralFeatures WITH (TABLOCKX)
(  GDDS, AGN, OII, OIII, HiBal, LoBal, Fe2375, Fe2600, Mg2800, Mg2852, HandK, Balmer, D4000, Temp, Class, Conf, z)
SELECT GDDS, AGN, OII, OIII, HiBal, LoBal, Fe2375, Fe2600, Mg2800, Mg2852, HandK, Balmer, D4000, Temp, Class, Conf, z
FROM dbo.SpectralFeaturesRAW

GO

-- DROP RAW TABLE
DROP TABLE SpectralFeaturesRAW
GO
