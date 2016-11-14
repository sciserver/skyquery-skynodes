USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
(	[id_IAU] char(16) NOT NULL,
	[num] bigint NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[selmag] real NOT NULL,
	[errselmag] real NOT NULL,
	[u] real NOT NULL,
	[g] real NOT NULL,
	[r] real NOT NULL,
	[i] real NOT NULL,
	[z] real NOT NULL,
	[erru] real NOT NULL,
	[errg] real NOT NULL,
	[errr] real NOT NULL,
	[erri] real NOT NULL,
	[errz] real NOT NULL,
	[u_T07] real NOT NULL,
	[g_T07] real NOT NULL,
	[r_T07] real NOT NULL,
	[i_T07] real NOT NULL,
	[iy_T07] real NOT NULL,
	[z_T07] real NOT NULL,
	[erru_T07] real NOT NULL,
	[errg_T07] real NOT NULL,
	[errr_T07] real NOT NULL,
	[erri_T07] real NOT NULL,
	[erriy_T07] real NOT NULL,
	[errz_T07] real NOT NULL,
	[DeltaUG] real NOT NULL,
	[DeltaGR] real NOT NULL,
	[DeltaRI] real NOT NULL,
	[E_BV] real NOT NULL,
	[r2] real NOT NULL,
	[r2_T07] real NOT NULL,
	[classFlag] int NOT NULL,
	[agnFlag] int NOT NULL,
	[photoMask] tinyint NOT NULL,
	[spectroMask] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\\VIPERSPDR1\VIPERSPDR1_PhotoObj.bin'
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
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,
	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ theprefix VIPERS plus the internal identification number. The internal
	--/ idnumber (num) is in the form
	--/   attxxxxxx
	--/ where
	--/    a identifies the sky area (1 for W1 and 4 for W4),
	--/    tt identifies the CFHTLS tile number where the object is located,
	--/    xxxxxx is the original CFHTLS ID within the tile.
	--/ Thecorrespondence between our tile identifier and the official CFHTLS
	--/ tilename is provided in Guzzo et al. 2013. </summary>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ theprefix VIPERS plus the internal identification number. The internal
	--/ idnumber (num) is in the form
	--/   attxxxxxx
	--/ where
	--/    a identifies the sky area (1 for W1 and 4 for W4),
	--/    tt identifies the CFHTLS tile number where the object is located,
	--/    xxxxxx is the original CFHTLS ID within the tile.
	--/ Thecorrespondence between our tile identifier and the official CFHTLS
	--/ tilename is provided in Guzzo et al. 2013. </summary>
	[num] bigint NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from
	--/ CFHTLST0005 catalogue. </summary>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error </summary>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006
	--/ cataloguein some specific cases. See Guzzo et al. 2013, section 3 and
	--/ appendixC, for details on the tile to tile color offests, as well as
	--/ forT0005 and T0006 catalogue differences.
	--/ Allmagnitudes are given in the AB system, and are corrected for
	--/ Galacticextinction as follows:
	--/ 
	--/    u = u_raw - 4.716 * E(B-V)
	--/    g = g_raw - 3.654 * E(B-V)
	--/    r = r_raw - 2.691 * E(B-V)
	--/    i = i_raw - 1.998 * E(B-V)
	--/    z = z_raw - 1.530 * E(B-V)
	--/ 
	--/ whereE(B-V) is the extinction factor (color excess).
	--/ Whenan object has not been observed in a given band, magnitude and
	--/ errorare set equal to -99. When a magnitude (and its error) could not
	--/ bemeasured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[u] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006
	--/ cataloguein some specific cases. See Guzzo et al. 2013, section 3 and
	--/ appendixC, for details on the tile to tile color offests, as well as
	--/ forT0005 and T0006 catalogue differences.
	--/ Allmagnitudes are given in the AB system, and are corrected for
	--/ Galacticextinction as follows:
	--/ 
	--/    u = u_raw - 4.716 * E(B-V)
	--/    g = g_raw - 3.654 * E(B-V)
	--/    r = r_raw - 2.691 * E(B-V)
	--/    i = i_raw - 1.998 * E(B-V)
	--/    z = z_raw - 1.530 * E(B-V)
	--/ 
	--/ whereE(B-V) is the extinction factor (color excess).
	--/ Whenan object has not been observed in a given band, magnitude and
	--/ errorare set equal to -99. When a magnitude (and its error) could not
	--/ bemeasured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[g] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006
	--/ cataloguein some specific cases. See Guzzo et al. 2013, section 3 and
	--/ appendixC, for details on the tile to tile color offests, as well as
	--/ forT0005 and T0006 catalogue differences.
	--/ Allmagnitudes are given in the AB system, and are corrected for
	--/ Galacticextinction as follows:
	--/ 
	--/    u = u_raw - 4.716 * E(B-V)
	--/    g = g_raw - 3.654 * E(B-V)
	--/    r = r_raw - 2.691 * E(B-V)
	--/    i = i_raw - 1.998 * E(B-V)
	--/    z = z_raw - 1.530 * E(B-V)
	--/ 
	--/ whereE(B-V) is the extinction factor (color excess).
	--/ Whenan object has not been observed in a given band, magnitude and
	--/ errorare set equal to -99. When a magnitude (and its error) could not
	--/ bemeasured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[r] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006
	--/ cataloguein some specific cases. See Guzzo et al. 2013, section 3 and
	--/ appendixC, for details on the tile to tile color offests, as well as
	--/ forT0005 and T0006 catalogue differences.
	--/ Allmagnitudes are given in the AB system, and are corrected for
	--/ Galacticextinction as follows:
	--/ 
	--/    u = u_raw - 4.716 * E(B-V)
	--/    g = g_raw - 3.654 * E(B-V)
	--/    r = r_raw - 2.691 * E(B-V)
	--/    i = i_raw - 1.998 * E(B-V)
	--/    z = z_raw - 1.530 * E(B-V)
	--/ 
	--/ whereE(B-V) is the extinction factor (color excess).
	--/ Whenan object has not been observed in a given band, magnitude and
	--/ errorare set equal to -99. When a magnitude (and its error) could not
	--/ bemeasured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[i] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006
	--/ cataloguein some specific cases. See Guzzo et al. 2013, section 3 and
	--/ appendixC, for details on the tile to tile color offests, as well as
	--/ forT0005 and T0006 catalogue differences.
	--/ Allmagnitudes are given in the AB system, and are corrected for
	--/ Galacticextinction as follows:
	--/ 
	--/    u = u_raw - 4.716 * E(B-V)
	--/    g = g_raw - 3.654 * E(B-V)
	--/    r = r_raw - 2.691 * E(B-V)
	--/    i = i_raw - 1.998 * E(B-V)
	--/    z = z_raw - 1.530 * E(B-V)
	--/ 
	--/ whereE(B-V) is the extinction factor (color excess).
	--/ Whenan object has not been observed in a given band, magnitude and
	--/ errorare set equal to -99. When a magnitude (and its error) could not
	--/ bemeasured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> Error of u magnitude. </summary>
	--/ <unit> mag </unit>
	[erru] real NOT NULL,

	--/ <summary> Error of g magnitude. </summary>
	--/ <unit> mag </unit>
	[errg] real NOT NULL,

	--/ <summary> Error of r magnitude. </summary>
	--/ <unit> mag </unit>
	[errr] real NOT NULL,

	--/ <summary> Error of i magnitude. </summary>
	--/ <unit> mag </unit>
	[erri] real NOT NULL,

	--/ <summary> Error of z magnitude. </summary>
	--/ <unit> mag </unit>
	[errz] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[u_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[g_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[r_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[i_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[iy_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue.
	--/ 
	--/    - All magnitudes are corrected for Galactic extinction using the
	--/      same prescription as the one used for the T0005 ones.
	--/    - When an object has not been observed in a given band, magnitude
	--/      and error are set equal to -99.
	--/    - When a magnitude (and its error) could not be measured, these
	--/      values are set to 99.
	--/    - Objects observed in i band, have y magniudes set to -99.99. 
	--/ 
	--/ Objectsobserved in y band instead of i band, have i magniudes set to
	--/ -99.99.	--/ <unit> mag </unit>
	[z_T07] real NOT NULL,

	--/ <summary> Error of u_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[erru_T07] real NOT NULL,

	--/ <summary> Error of g_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[errg_T07] real NOT NULL,

	--/ <summary> Error of r_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[errr_T07] real NOT NULL,

	--/ <summary> Error of i_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[erri_T07] real NOT NULL,

	--/ <summary> Error of iy_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[erriy_T07] real NOT NULL,

	--/ <summary> Error of z_T07 magnitude. </summary>
	--/ <unit> mag </unit>
	[errz_T07] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied
	--/ tothe CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both
	--/ galaxyand AGN selection, the colors used to assign classFlag and
	--/ agnFlagcan be obtained by applying the following corrections to the
	--/ colorsderived from the magnitudes listed in the database:
	--/ 
	--/    u-g_corr = u-g - DeltaUG
	--/    g-r_corr = g-r - DeltaGR
	--/    r-i_corr = r-i - DeltaRI </summary>
	[DeltaUG] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied
	--/ tothe CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both
	--/ galaxyand AGN selection, the colors used to assign classFlag and
	--/ agnFlagcan be obtained by applying the following corrections to the
	--/ colorsderived from the magnitudes listed in the database:
	--/ 
	--/    u-g_corr = u-g - DeltaUG
	--/    g-r_corr = g-r - DeltaGR
	--/    r-i_corr = r-i - DeltaRI </summary>
	[DeltaGR] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied
	--/ tothe CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both
	--/ galaxyand AGN selection, the colors used to assign classFlag and
	--/ agnFlagcan be obtained by applying the following corrections to the
	--/ colorsderived from the magnitudes listed in the database:
	--/ 
	--/    u-g_corr = u-g - DeltaUG
	--/    g-r_corr = g-r - DeltaGR
	--/    r-i_corr = r-i - DeltaRI </summary>
	[DeltaRI] real NOT NULL,

	--/ <summary> Extinction factor (color excess) E(B-V) derived from Schlegel's maps. </summary>
	[E_BV] real NOT NULL,

	--/ <summary> 
	--/ Radiusenclosing half the object light as from CFHTLS T0005 catalogue,
	--/ measuredin pixels </summary>
	--/ <unit> pixel </unit>
	[r2] real NOT NULL,

	--/ <summary> Radius enclosing half the object light as from CFHTLS T0007 catalogue,
	--/ measuredin pixels </summary>
	--/ <unit> pixel </unit>
	[r2_T07] real NOT NULL,

	--/ <summary> 
	--/ theVIPERS selection flag based on the CFHTLS T005 catalogue, where
	--/ 
	--/  -99: problematic object, missing photometric data
	--/ 
	--/  -88: problematic object, possibly saturated image
	--/ 
	--/   -3: magnitude i < 17.5
	--/ 
	--/   -2: magnitude i > 22.5
	--/ 
	--/   -1: stellar like object according to the VIPERS star/galaxy
	--/       separation criteria
	--/ 
	--/    0: object with colors compatible with most galaxies at z < 0.5
	--/ 
	--/    1: object with colors compatible with most galaxies at z > 0.5
	--/ 
	--/ Seesection 4 and Fig. 3 in Guzzo et al. 2013. </summary>
	[classFlag] int NOT NULL,

	--/ <summary> 
	--/ Avalue equal to 1 is assigned to all AGN candidates, and equal to 0
	--/ otherwise.An object is an AGN candidate if it is stellar-like
	--/ (classFlag= -1) and exhibits colours that are clearly different from
	--/ thoseof the main stellar sequence (see equations 2 and 3 and Section
	--/ 2.2in Garilli et al. 2013) </summary>
	[agnFlag] int NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1
	--/ ifthe object is inside the mask, 0 if it is outside. Objects outside
	--/ thephotometric mask have a less reliable photometry. </summary>
	[photoMask] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the spectroscopic mask.
	--/ 1if the object is inside the mask, 0 if it is outside. Objects outside
	--/ thespectroscopic mask have not entered the mask preparation phase (see
	--/ Garilliet al. 2013 for details) </summary>
	[spectroMask] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, id_IAU, num, ra, dec, selmag, errselmag, u, g, r, i, z, erru, errg, errr, erri, errz, u_T07, g_T07, r_T07, i_T07, iy_T07, z_T07, erru_T07, errg_T07, errr_T07, erri_T07, erriy_T07, errz_T07, DeltaUG, DeltaGR, DeltaRI, E_BV, r2, r2_T07, classFlag, agnFlag, photoMask, spectroMask)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, id_IAU, num, ra, dec, selmag, errselmag, u, g, r, PhotoObjRAW.i, PhotoObjRAW.z, erru, errg, errr, erri, errz, u_T07, g_T07, r_T07, i_T07, iy_T07, z_T07, erru_T07, errg_T07, errr_T07, erri_T07, erriy_T07, errz_T07, DeltaUG, DeltaGR, DeltaRI, E_BV, r2, r2_T07, classFlag, agnFlag, photoMask, spectroMask
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