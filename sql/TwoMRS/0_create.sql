-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> 2MASS ID from XSC (Cat. VII/233) or 2MASS Large Galaxy Atlas (LGA) databases (Jarrett et al. 2003AJ....125..525J)  </summary>
	--/ <quantity>meta.id</quantity>
	[ID] char(16) NOT NULL,

	--/ <summary> s indicate suspect photometry, flagged for reprocessing at a later date; z links to alternative redshifts </summary>
	--/ <quantity>meta.code</quantity>
	[A] char(1) NOT NULL,

	--/ <summary> Right Ascension in decimal degrees (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Galactic longitude </summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit> deg </unit>
	[GLON] float NOT NULL,

	--/ <summary> Galactic latitude </summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit> deg </unit>
	[GLAT] float NOT NULL,

	--/ <summary> Extinction-corrected 2MASS Ks magnitude measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Kcmag] real NOT NULL,

	--/ <summary> Uncertainty in Kcmag </summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[e_Kcmag] real NOT NULL,

	--/ <summary> Extinction-corrected 2MASS H magnitude measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <quantity>phot.mag.redFree;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[Hcmag] real NOT NULL,

	--/ <summary> Uncertainty in Hcmag </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[e_Hcmag] real NOT NULL,

	--/ <summary> Extinction-corrected 2MASS J mag measured at the K=20mag/sq.arcsec isophote. </summary>
	--/ <quantity>phot.mag.redFree;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[Jcmag] real NOT NULL,

	--/ <summary> Uncertainty in Jcmag </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[e_Jcmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated Ks mag </summary>
	--/ <quantity>phot.mag.redFree;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Ktmag] real NOT NULL,

	--/ <summary> Uncertainty in Ktmag </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[e_Ktmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated H mag </summary>
	--/ <quantity>phot.mag.redFree;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[Htmag] real NOT NULL,

	--/ <summary> Uncertainty in Htmag </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[e_Htmag] real NOT NULL,

	--/ <summary> Extinction-corrected total extrapolated J mag </summary>
	--/ <quantity>phot.mag.redFree;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[Jtmag] real NOT NULL,

	--/ <summary> Uncertainty in Jtmag </summary>
	--/ <quantity>stat.error;phot.mag.redFree;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[e_Jtmag] real NOT NULL,

	--/ <summary> Foreground galactic extinction. From Schlegel, Finkbeiner &amp; Davis (1998ApJ...500..525S). </summary>
	--/ <quantity>phys.absorption.gal</quantity>
	--/ <unit> mag </unit>
	[E_B_V] real NOT NULL,

	--/ <summary> Log of K=20 mag/sq arcsec elliptical isophote semimajor axis </summary>
	--/ <quantity>phys.angSize.smajAxis;src</quantity>
	--/ <unit> arcsec </unit>
	[Riso] real NOT NULL,

	--/ <summary> Log of total elliptical aperture semimajor axis </summary>
	--/ <quantity>phys.angSize.smajAxis;src</quantity>
	--/ <unit> arcsec </unit>
	[Rext] real NOT NULL,

	--/ <summary> Axis ratio of the J+H+Ks co-added image at the 3σ isophote </summary>
	--/ <quantity>phys.angSize;arith.ratio</quantity>
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
	--/ <quantity>meta.code.error</quantity>
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
	--/ <quantity>src.morph.type</quantity>
	[type] char(5) NOT NULL,

	--/ <summary> Source of morphological type. Morphological type source as follows:
	--/ JH=	newly typed galaxy by John Huchra
	--/ ZC=	previously listed in J. Huchra's personal compilation of redshifts (ZCAT) (from multiple sources including RC3 
	--/ NED) </summary>
	--/ <quantity>meta.ref;src.morph.type</quantity>
	[r_type] char(2) NOT NULL,

	--/ <summary> Redshift, corrected to solar system barycenter reference frame </summary>
	--/ <quantity>src.redshift;pos.heliocentric</quantity>
	--/ <unit> km s-1 </unit>
	[bz] int NOT NULL,

	--/ <summary> Uncertainty in bz </summary>
	--/ <quantity></quantity>
	--/ <unit> km s-1 </unit>
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
	--/ <quantity>meta.ref;src.redshift</quantity>
	[n_bz] char(1) NOT NULL,

	--/ <summary> Reference for bz; see table4.dat file </summary>
	--/ <quantity>meta.ref</quantity>
	[r_bz] char(19) NOT NULL,

	--/ <summary> Galaxy identification in input redshift catalog </summary>
	--/ <quantity>meta.id</quantity>
	[CAT] char(28) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

