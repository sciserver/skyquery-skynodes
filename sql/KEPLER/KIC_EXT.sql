USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.KICRAW', 'U') IS NOT NULL
	DROP TABLE dbo.KICRAW;

GO

-- CREATE KICRAW TABLE
CREATE TABLE dbo.KICRAW
(	[seqID] float NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[pmra] real NOT NULL,
	[pmdec] real NOT NULL,
	[umag] real NOT NULL,
	[gmag] real NOT NULL,
	[rmag] real NOT NULL,
	[imag] real NOT NULL,
	[zmag] real NOT NULL,
	[gredmag] real NOT NULL,
	[d51mag] real NOT NULL,
	[jmag] real NOT NULL,
	[hmag] real NOT NULL,
	[kmag] real NOT NULL,
	[kepmag] real NOT NULL,
	[kepler_id] bigint NOT NULL,
	[tmid] bigint NOT NULL,
	[scpid] bigint NOT NULL,
	[altid] bigint NOT NULL,
	[altsource] bigint NOT NULL,
	[galaxy] bigint NOT NULL,
	[blend] bigint NOT NULL,
	[variable] tinyint NOT NULL,
	[teff] real NOT NULL,
	[logg] real NOT NULL,
	[feh] real NOT NULL,
	[ebminusv] real NOT NULL,
	[av] real NOT NULL,
	[radius] real NOT NULL,
	[cq] char(5) NOT NULL,
	[pq] tinyint NOT NULL,
	[aq] tinyint NOT NULL,
	[catkey] bigint NOT NULL,
	[scpkey] bigint NOT NULL,
	[parallax] real NOT NULL,
	[glon] real NOT NULL,
	[glat] real NOT NULL,
	[pmtotal] real NOT NULL,
	[grcolor] real NOT NULL,
	[jkcolor] real NOT NULL,
	[gkcolor] real NOT NULL,
	[fov_flag] tinyint NOT NULL,
	[tm_designation] char(17) NOT NULL,

	CONSTRAINT [PK_KICRAW] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	KICRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\KIC\KIC.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.KIC', 'U') IS NOT NULL
	DROP TABLE dbo.KIC;

GO
-- CREATE KIC TABLE
CREATE TABLE dbo.KIC
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

	--/ <summary> sequential number </summary>
	[seqID] float NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> RA proper motion (KIC targets only) </summary>
	--/ <unit> arcsec/yr </unit>
	[pmra] real NOT NULL,

	--/ <summary> Dec proper motion (KIC targets only) </summary>
	--/ <unit> arcsec/yr </unit>
	[pmdec] real NOT NULL,

	--/ <summary> u-band Sloan magnitude from the Kepler Input Catalog accurate to 0.04 magnitude </summary>
	--/ <unit> mag </unit>
	[umag] real NOT NULL,

	--/ <summary> g-band Sloan magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[gmag] real NOT NULL,

	--/ <summary> r-band Sloan magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[rmag] real NOT NULL,

	--/ <summary> i-band Sloan magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> z-band Sloan magnitude accurate to 0.03 magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> GRed-band Sloan magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[gredmag] real NOT NULL,

	--/ <summary> D51 magnitude from the Kepler Input Catalog </summary>
	--/ <unit> mag </unit>
	[d51mag] real NOT NULL,

	--/ <summary> 2MASS J-band magnitude. . In some cases KIC values were replaced with values based on cross-correlations performed by 
	--/ (See 2mass_conflict_flag). </summary>
	--/ <unit> mag </unit>
	[jmag] real NOT NULL,

	--/ <summary> 2MASS H-band magnitude. In some cases KIC values were replaced with values based on cross-correlations performed by 
	--/  </summary>
	--/ <unit> mag </unit>
	[hmag] real NOT NULL,

	--/ <summary> 2MASS K-band magnitude. In some cases KIC values were replaced with values based on cross-correlations performed by </summary>
	--/ <unit> mag </unit>
	[kmag] real NOT NULL,

	--/ <summary> A magnitude computed according to a hierarchical scheme and depends on what pre-existing catalog source is 
	--/ SCP, Tycho 2, or photographic photometry, in order of preferred selection. For SCP stars the magnitude is synthesized 
	--/ the Sloan-like g and r magnitudes according to the following prescription: if one defines 'color' as g - r, then for 
	--/ less than or equal to 0.8 kepmag = 0.8r + 0.2g, while for color greater than 0.8 kepmag = 0.9r + 0.1g. Empirical 
	--/ for presumed constant stars suggest that the r.m.s. for this quantity is slightly larger 0.02 mags. except for very 
	--/ and bright stars. </summary>
	--/ <unit> mag </unit>
	[kepmag] real NOT NULL,

	--/ <summary> Unique Kepler ID. Also used in Kepler Target Catalog and in naming data files. Note there are 4,374,730 entries in the 
	--/ joined table </summary>
	[kepler_id] bigint NOT NULL,

	--/ <summary> A unique identification number which was defined during final processing to identify a 2Mass catalog entry. The 
	--/ identification number is referred to as pts_key/cntr. See the User's Guide to the 2Mass All Sky Data Release, at 
	--/ for information on the pts_key/cntr field. </summary>
	[tmid] bigint NOT NULL,

	--/ <summary> SCP processing ID (KIC targets only) </summary>
	[scpid] bigint NOT NULL,

	--/ <summary> ID from alternate source catalog (see Alt ID Source entry) (KIC targets only) </summary>
	[altid] bigint NOT NULL,

	--/ <summary> Source catalog that was used for deriving stellar parameters (KIC targets only) </summary>
	[altsource] bigint NOT NULL,

	--/ <summary> A flag where 0 = star and 1 = galaxy. The original USNO-B catalog codes these with 11 values, depending on the degree that 
	--/ image profile was consistent with a point source. The USNO-B codes were star = 6-11 and galaxy = 0-5. (KIC targets only) </summary>
	[galaxy] bigint NOT NULL,

	--/ <summary> Isolated/blended indicator (never used) </summary>
	[blend] bigint NOT NULL,

	--/ <summary> Constant/variable indicator based on data from the General Catalog of Variable Stars. (Additional catalogs will be 
	--/ in future versions.) (KIC targets only)	 </summary>
	[variable] tinyint NOT NULL,

	--/ <summary> Derived Effective Temperature accurate to 200 K (KIC targets only) </summary>
	--/ <unit> K </unit>
	[teff] real NOT NULL,

	--/ <summary> Derived Log10 surface gravity accurate to 0.5 dex (KIC targets only) </summary>
	[logg] real NOT NULL,

	--/ <summary> Derived Log10 Fe/H metallicity accurate to 0.5 dex. (KIC targets only) </summary>
	[feh] real NOT NULL,

	--/ <summary> Derived Excess B-V reddening accurate to 0.1 magnitude (KIC targets only) </summary>
	--/ <unit> mag </unit>
	[ebminusv] real NOT NULL,

	--/ <summary> Derived A-V extinction (KIC targets only) </summary>
	[av] real NOT NULL,

	--/ <summary> Estimated Stellar Radius (solar = 1.0) (KIC targets only) </summary>
	[radius] real NOT NULL,

	--/ <summary> Source of Kepler-band magnitude. (KIC targets only) </summary>
	[cq] char(5) NOT NULL,

	--/ <summary> Photometry quality indicator. (KIC targets only) </summary>
	[pq] tinyint NOT NULL,

	--/ <summary> Astrophysics quality indicator. Placeholder for SCP values not yet determined. (KIC targets only) </summary>
	[aq] tinyint NOT NULL,

	--/ <summary> Unique integer key to CATKEY database table (not currently available). (KIC targets only) </summary>
	[catkey] bigint NOT NULL,

	--/ <summary> Unique integer key to SCPKEY database table (not currently available). (KIC targets only) </summary>
	[scpkey] bigint NOT NULL,

	--/ <summary> Parallax in arcsec (KIC targets only) </summary>
	--/ <unit> arcsec </unit>
	[parallax] real NOT NULL,

	--/ <summary> Galactic Longitude (KIC targets only) </summary>
	--/ <unit> deg </unit>
	[glon] real NOT NULL,

	--/ <summary> Galactic Latitude (KIC targets only) </summary>
	--/ <unit> deg </unit>
	[glat] real NOT NULL,

	--/ <summary> Total proper motion accurate to 20 mas/yr (KIC targets only) </summary>
	--/ <unit> mas/yr </unit>
	[pmtotal] real NOT NULL,

	--/ <summary> gmag - rmag color </summary>
	--/ <unit> mag </unit>
	[grcolor] real NOT NULL,

	--/ <summary> gmag - imag color </summary>
	--/ <unit> mag </unit>
	[jkcolor] real NOT NULL,

	--/ <summary> gmag - Kmag color </summary>
	--/ <unit> mag </unit>
	[gkcolor] real NOT NULL,

	--/ <summary>  </summary>
	[fov_flag] tinyint NOT NULL,

	--/ <summary> 2MASS K-band magnitude. In some cases KIC values were replaced with values based on cross-correlations performed by 
	--/ (See 2mass_conflict_flag). </summary>
	[tm_designation] char(17) NOT NULL,

	CONSTRAINT [PK_KIC] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.KIC WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, seqID, RA, DEC, pmra, pmdec, umag, gmag, rmag, imag, zmag, gredmag, d51mag, jmag, hmag, kmag, kepmag, kepler_id, tmid, scpid, altid, altsource, galaxy, blend, variable, teff, logg, feh, ebminusv, av, radius, cq, pq, aq, catkey, scpkey, parallax, glon, glat, pmtotal, grcolor, jkcolor, gkcolor, fov_flag, tm_designation)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, 
seqID, RA, DEC, pmra, pmdec, umag, gmag, rmag, imag, zmag, gredmag, d51mag, jmag, hmag, kmag, kepmag, kepler_id, tmid, scpid, altid, altsource, galaxy, blend, variable, teff, logg, feh, ebminusv, av, radius, cq, pq, aq, catkey, scpkey, parallax, glon, glat, pmtotal, grcolor, jkcolor, gkcolor, fov_flag, tm_designation
FROM dbo.KICRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE KICRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_KIC_Zone] ON [dbo].[KIC] 
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

CREATE NONCLUSTERED INDEX [IX_KIC_ZoneID] ON [dbo].[KIC] 
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
CREATE NONCLUSTERED INDEX [IX_KIC_HtmID] ON [dbo].[KIC] 
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
