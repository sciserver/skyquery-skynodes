USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[objID] bigint NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[MAGB] real NOT NULL,
	[MAGR] real NOT NULL,
	[MAGI] real NOT NULL,
	[MAGBERR] real NOT NULL,
	[MAGRERR] real NOT NULL,
	[MAGIERR] real NOT NULL,
	[RG] real NOT NULL,
	[E2] real NOT NULL,
	[PA] real NOT NULL,
	[PGAL] real NOT NULL,
	[SFD_EBV] real NOT NULL,
	[M_B] real NOT NULL,
	[U_B] real NOT NULL,
	[OBJNAME] bigint NOT NULL,
	[MASK] bigint NOT NULL,
	[SLIT] bigint NOT NULL,
	[DATE] char(10) NOT NULL,
	[MJD] real NOT NULL,
	[SLITRA] real NOT NULL,
	[SLITDEC] real NOT NULL,
	[SLITLEN] real NOT NULL,
	[SLITPA] real NOT NULL,
	[Z] real NOT NULL,
	[ZBEST] real NOT NULL,
	[ZERR] real NOT NULL,
	[ZQUALITY] int NOT NULL,
	[CLASS] char(6) NOT NULL,
	[SUBCLASS] char(6) NOT NULL,
	[RCHI2] real NOT NULL,
	[DOF] bigint NOT NULL,
	[VDISP] real NOT NULL,
	[VDISPERR] real NOT NULL,
	[COMMENT] char(43) NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\DEEP2\deep2.bin'
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
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> DEEP2 object number </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Right Ascension (in decimal degrees, J2000) </summary>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (in decimal degrees, J2000) </summary>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> CFHT B-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <unit> mag </unit>
	[MAGB] real NOT NULL,

	--/ <summary> CFHT R-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <unit> mag </unit>
	[MAGR] real NOT NULL,

	--/ <summary> CFHT I-band magnitude (AB) from Coil et al. 2004 (2004ApJ...617..765C) </summary>
	--/ <unit> mag </unit>
	[MAGI] real NOT NULL,

	--/ <summary> B-band magnitude error </summary>
	--/ <unit> mag </unit>
	[MAGBERR] real NOT NULL,

	--/ <summary> R-band magnitude error </summary>
	--/ <unit> mag </unit>
	[MAGRERR] real NOT NULL,

	--/ <summary> I-band magnitude error </summary>
	--/ <unit> mag </unit>
	[MAGIERR] real NOT NULL,

	--/ <summary> estimated R-band radius of object 
	--/ (sigma of Guassian fit in units of pixels --- 0.207”/pix) </summary>
	--/ <unit> pix </unit>
	[RG] real NOT NULL,

	--/ <summary> ellipticity defined as E2 = (1 - b/a) </summary>
	[E2] real NOT NULL,

	--/ <summary> object PA (degrees E of N)  </summary>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> the probability (0 - 1) that the sources is a galaxy for unresolved galaxies, 3 if resolved </summary>
	[PGAL] real NOT NULL,

	--/ <summary> E(B-V) from Schlegel, Finkbeiner, and Davis dust map </summary>
	[SFD_EBV] real NOT NULL,

	--/ <summary> absolute B-band magnitude (AB, h = 1) from Willmer et al. (2006ApJ...647..853W) </summary>
	[M_B] real NOT NULL,

	--/ <summary> rest-frame U-B color (AB) from Willmer et al. 2006 (2006ApJ...647..853W) </summary>
	[U_B] real NOT NULL,

	--/ <summary> the 8-digit DEEP2 object id (not always the same as OBJNO). 
	--/ The CFHT 12K BRI catalogs are created on a pointing-by-pointing bases 
	--/ and not at a field-by-field level (for more info regarding the DEEP2 
	--/ fields and pointings, refer to the description of the photometric 
	--/ catalogs: http://deep.ps.uci.edu/DR4/photo.html and 
	--/ here: http://deep.ps.uci.edu/DR4/completeness.html). For objects that 
	--/ fall in the regions of overlap between the various photometric pointings 
	--/ within a given field, the objects can appear in multiple photometric 
	--/ catalogs (e.g., in pcat.41.fits and pcat.42.fits), being assigned different 
	--/ 8-digit DEEP2 identification numbers in each catalog. These duplications 
	--/ have been resolved such that a unique identifier is assigned. This is 
	--/ the 8-digit ID given in the “OBJNO” field. However, the slitmasks are 
	--/ designed on a pointing-by-pointing basis, so objects are actually targeted 
	--/ based on their id numbers in a particular pointing. Most importantly, since 
	--/ the spec2d data reduction pipeline draws the object id information from the 
	--/ slitmask design files, the object id in the “spec1d” files is this 
	--/ pointing-specific number. In order to facilitate matching of entries in the 
	--/ redshift catalog to 1-d spectral files, the “OBJNAME” field is included, 
	--/ which gives the pointing-specific id number. Thus, for a given entry in the 
	--/ redshift catalog, the spec1d file will be named “spec1d.MASK.SLIT.OBJNAME.fits”, 
	--/ following the formatting detailed here: http://deep.ps.uci.edu/DR4/spectra.html. </summary>
	[OBJNAME] bigint NOT NULL,

	--/ <summary> the DEEP2/DEEP3 slitmask number on which the object was observed </summary>
	--/ <unit>  </unit>
	[MASK] bigint NOT NULL,

	--/ <summary> the slitlet number (on mask MASKNAME) in which the object was placed </summary>
	--/ <unit>  </unit>
	[SLIT] bigint NOT NULL,

	--/ <summary> Date on which the mask was observed (YYYY-MM-DD) </summary>
	[DATE] char(10) NOT NULL,

	--/ <summary> Modified Julian date of observation </summary>
	[MJD] real NOT NULL,

	--/ <summary> RA of slit center </summary>
	--/ <unit> deg </unit>
	[SLITRA] real NOT NULL,

	--/ <summary> Dec of slit center </summary>
	--/ <unit> deg </unit>
	[SLITDEC] real NOT NULL,

	--/ <summary> PA (degrees E of N) of slit </summary>
	--/ <unit> deg </unit>
	[SLITLEN] real NOT NULL,

	--/ <summary> length of slit (arcsec) </summary>
	--/ <unit> arcsec </unit>
	[SLITPA] real NOT NULL,

	--/ <summary> observed best-fitting redshift </summary>
	[Z] real NOT NULL,

	--/ <summary> best redshift (corrected for heliocentric motion) </summary>
	[ZBEST] real NOT NULL,

	--/ <summary> redshift error (zerr &lt; 0 indicates problematic z fit) </summary>
	[ZERR] real NOT NULL,

	--/ <summary> redshift quality code, Q </summary>
	[ZQUALITY] int NOT NULL,

	--/ <summary> type of best-fitting template (e.g., GALAXY or STAR). 
	--/ 	It should be noted that the CLASS tag only indicates the best-fitting 
	--/ 	template; many AGN (both broad- and narrow-line) in the DEEP2 sample 
	--/ 	will have 'GALAXY' as their class.</summary>
	[CLASS] char(6) NOT NULL,

	--/ <summary> coarse classification for stellar templates </summary>
	[SUBCLASS] char(6) NOT NULL,

	--/ <summary> reduced chi-squared value for the redshift fit </summary>
	[RCHI2] real NOT NULL,

	--/ <summary> degrees of freedom for redshift fit </summary>
	[DOF] bigint NOT NULL,

	--/ <summary> velocity dispersion in km/s </summary>
	--/ <unit> km/s </unit>
	[VDISP] real NOT NULL,

	--/ <summary> error in velocity dispersion </summary>
	[VDISPERR] real NOT NULL,

	--/ <summary> comment field </summary>
	[COMMENT] char(43) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, RA, DEC, MAGB, MAGR, MAGI, MAGBERR, MAGRERR, MAGIERR, RG, E2, PA, PGAL, SFD_EBV, M_B, U_B, OBJNAME, MASK, SLIT, DATE, MJD, SLITRA, SLITDEC, SLITLEN, SLITPA, SpecObjRAW.Z, ZBEST, ZERR, ZQUALITY, CLASS, SUBCLASS, RCHI2, DOF, VDISP, VDISPERR, COMMENT)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, RA, DEC, MAGB, MAGR, MAGI, MAGBERR, MAGRERR, MAGIERR, RG, E2, PA, PGAL, SFD_EBV, M_B, U_B, OBJNAME, MASK, SLIT, DATE, MJD, SLITRA, SLITDEC, SLITLEN, SLITPA, SpecObjRAW.Z, ZBEST, ZERR, ZQUALITY, CLASS, SUBCLASS, RCHI2, DOF, VDISP, VDISPERR, COMMENT
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
