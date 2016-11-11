USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[ID] char(16) NOT NULL,
	[A] char(1) NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[GLON] float NOT NULL,
	[GLAT] float NOT NULL,
	[Kcmag] real NOT NULL,
	[e_Kcmag] real NOT NULL,
	[Hcmag] real NOT NULL,
	[e_Hcmag] real NOT NULL,
	[Jcmag] real NOT NULL,
	[e_Jcmag] real NOT NULL,
	[Ktmag] real NOT NULL,
	[e_Ktmag] real NOT NULL,
	[Htmag] real NOT NULL,
	[e_Htmag] real NOT NULL,
	[Jtmag] real NOT NULL,
	[e_Jtmag] real NOT NULL,
	[E_B_V] real NOT NULL,
	[Riso] real NOT NULL,
	[Rext] real NOT NULL,
	[bpa] real NOT NULL,
	[flags] char(4) NOT NULL,
	[type] char(5) NOT NULL,
	[r_type] char(2) NOT NULL,
	[bz] int NOT NULL,
	[e_bz] int NOT NULL,
	[n_bz] char(1) NOT NULL,
	[r_bz] char(19) NOT NULL,
	[CAT] char(28) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\TwoMRS\TwoMRS_SpecObj.bin'
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

	--/ <summary> 2MASS ID from XSC (Cat. VII/233) or 2MASS Large Galaxy Atlas (LGA) databases (Jarrett et al. 2003AJ....125..525J)  </summary>
	[ID] char(16) NOT NULL,

	--/ <summary> s indicate suspect photometry, flagged for reprocessing at a later date; z links to alternative redshifts </summary>
	[A] char(1) NOT NULL,

	--/ <summary> Right Ascension in decimal degrees (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Galactic longitude </summary>
	--/ <unit> deg (J2000) </unit>
	[GLON] float NOT NULL,

	--/ <summary> Galactic latitude </summary>
	--/ <unit> deg (J2000) </unit>
	[GLAT] float NOT NULL,

	--/ <summary> Extinction-corrected 2MASS Ks magnitude measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <unit> mag </unit>
	[Kcmag] real NOT NULL,

	--/ <summary> Uncertainty in Kcmag </summary>
	--/ <unit> mag </unit>
	[e_Kcmag] real NOT NULL,

	--/ <summary> Extinction-corrected 2MASS H magnitude measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <unit> mag </unit>
	[Hcmag] real NOT NULL,

	--/ <summary> Uncertainty in Hcmag </summary>
	--/ <unit> mag </unit>
	[e_Hcmag] real NOT NULL,

	--/ <summary> Extinction-corrected 2MASS J mag measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <unit> mag </unit>
	[Jcmag] real NOT NULL,

	--/ <summary> Uncertainty in Jcmag </summary>
	--/ <unit> mag </unit>
	[e_Jcmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated Ks mag </summary>
	--/ <unit> mag </unit>
	[Ktmag] real NOT NULL,

	--/ <summary> Uncertainty in Ktmag </summary>
	--/ <unit> mag </unit>
	[e_Ktmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated H mag </summary>
	--/ <unit> mag </unit>
	[Htmag] real NOT NULL,

	--/ <summary> Uncertainty in Htmag </summary>
	--/ <unit> mag </unit>
	[e_Htmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated J mag </summary>
	--/ <unit> mag </unit>
	[Jtmag] real NOT NULL,

	--/ <summary> Uncertainty in Jtmag </summary>
	--/ <unit> mag </unit>
	[e_Jtmag] real NOT NULL,

	--/ <summary> Foreground galactic extinction. From Schlegel, Finkbeiner &amp; Davis (1998ApJ...500..525S). </summary>
	--/ <unit> mag </unit>
	[E_B_V] real NOT NULL,

	--/ <summary> Log of K=20 mag/sq arcsec elliptical isophote semimajor axis </summary>
	--/ <unit> arcsec </unit>
	[Riso] real NOT NULL,

	--/ <summary> Log of total elliptical aperture semimajor axis </summary>
	--/ <unit> arcsec </unit>
	[Rext] real NOT NULL,

	--/ <summary> Axis ratio of the J+H+Ks co-added image at the 3σ isophote </summary>
	[bpa] real NOT NULL,

	--/ <summary> [Z0-6n] 2MASS XSC pipeline photometric confusion flags. concatenation of 2MASS XSC pipeline photometry flags 
	--/ (kflgk20fe, hflgk20fe, jflgk20fe). A "Z" in the first character indicates galaxy photometry comes from the 2MASS 
	--/ Galaxy Atlas. The figures are, from the 2MASX (Cat. VII/233): 
	--/ 0=	no other sources within aperture used
	--/ 1=	aperture contained pixels masked off in coadd
	--/ 2=	aperture contained pixels masked off due to neighboring sources
	--/ 3=	aperture contained pixels that had a point source flux subtracted off
	--/ 4=	aperture contained pixels within bright star mask
	--/ 5=	aperture contained pixels masked off due to persistence
	--/ 6=	aperture ran into coadd boundary
	--/ n=	not found in the filter </summary>
	[flags] char(4) NOT NULL,

	--/ <summary> Morphological type, expressed using the ZCAT convention.  the morphological information is encoded following the 
	--/ ZCAT convention (I2, A1, I1, A1) (T-type, bar, luminosity class, pecularities)
	--/   -------------------------------------------------------------
	--/   (1) T-type
	--/   -------------------------------------------------------------
	--/   -9 = QSO/AGN
	--/   -7 = Unclassified Elliptical
	--/   -6 = Compact Elliptical
	--/   -5 = E, and dwarf E
	--/   -4 = E/S0
	--/   -3 = L-, S0-
	--/   -2 = L, S0
	--/   -1 = L+, S0+
	--/    0 = S0/a, S0-a
	--/    1 = Sa
	--/    2 = Sab
	--/    3 = Sb
	--/    4 = Sbc
	--/    5 = Sc
	--/    6 = Scd
	--/    7 = Sd
	--/    8 = Sdm
	--/    9 = Sm
	--/   10 = Im, Irr I, Magellanic Irregular, Dwarf Irregular
	--/   11 = Compact Irregular, Extragalactic HII Region
	--/   12 = Extragalactic HI cloud (no galaxy visible)
	--/   15 = Peculiar, Unclassifiable
	--/   16 = Irr II
	--/   19 = Unclassified galaxy (visually confirmed to be a galaxy, but not typed)
	--/   20 = S..., Sc-Irr, Unclassified Spiral
	--/   98 = Galaxy that has never been visually examined.
	--/   -------------------------------------------------------------
	--/   (2) Bar type
	--/   -------------------------------------------------------------
	--/    A = unbarred (A)
	--/    X = mixed type (AB)
	--/    B = barred (B)
	--/   -------------------------------------------------------------
	--/   (3) Luminosity classes (for spirals and irregulars)
	--/   -------------------------------------------------------------
	--/    1 = I
	--/    2 = I-II
	--/    3 = II
	--/    4 = II-II
	--/    5 = III
	--/    6 = III-IV
	--/    7 = IV
	--/    8 = IV-V
	--/    9 = V
	--/   -------------------------------------------------------------
	--/   (4) Peculiarities
	--/   -------------------------------------------------------------
	--/    D = Double or Multiple
	--/    P = Peculiar
	--/    R = Outer Ring
	--/    r = Inner Ring
	--/    s = S-shaped
	--/    t = Mixed (Inner ring/S-shaped)
	--/    T = Pseudo outer ring
	--/    / = Spindle
	--/   ------------------------------------------------------------- </summary>
	[type] char(5) NOT NULL,

	--/ <summary> Source of morphological type. Morphological type source as follows:
	--/ JH=	newly typed galaxy by John Huchra
	--/ ZC=	previously listed in J. Huchra's personal compilation of redshifts (ZCAT) (from multiple sources including RC3 
	--/ NED) </summary>
	[r_type] char(2) NOT NULL,

	--/ <summary> Redshift, corrected to solar system barycenter reference frame </summary>
	--/ <unit> km/s </unit>
	[bz] int NOT NULL,

	--/ <summary> Uncertainty in bz </summary>
	--/ <unit> km/s </unit>
	[e_bz] int NOT NULL,

	--/ <summary> Code for source of bz. Provenance of redshift as follows:
	--/ C=	CTIO (Cerro-Tololo)
	--/ D=	McDonald Obs. (Texas)
	--/ F=	FLWO (Fred Lawrence Whipple Observatory, Arizona)
	--/ M=	alternative NED redshift
	--/ N=	default NED redshift
	--/ O=	alternative redshift from ZCAT (Previous observations by Huchra and collaborators)
	--/ S=	SDSS-DR8 (see Cat. II/306)
	--/ 6=	6dFGS-DR3 (see Cat. VII/259) </summary>
	[n_bz] char(1) NOT NULL,

	--/ <summary> Reference for bz; see table4.dat file </summary>
	[r_bz] char(19) NOT NULL,

	--/ <summary> Galaxy identification in input redshift catalog </summary>
	[CAT] char(28) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, ID, A, RA, DEC, GLON, GLAT, Kcmag, e_Kcmag, Hcmag, e_Hcmag, Jcmag, e_Jcmag, Ktmag, e_Ktmag, Htmag, e_Htmag, Jtmag, e_Jtmag, E_B_V, Riso, Rext, bpa, flags, type, r_type, bz, e_bz, n_bz, r_bz, CAT)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
ID, A, RA, DEC, GLON, GLAT, Kcmag, e_Kcmag, Hcmag, e_Hcmag, Jcmag, e_Jcmag, Ktmag, e_Ktmag, Htmag, e_Htmag, Jtmag, e_Jtmag, E_B_V, Riso, Rext, bpa, flags, type, r_type, bz, e_bz, n_bz, r_bz, CAT
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