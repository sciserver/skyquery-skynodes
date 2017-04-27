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
	--/ the prefix VIPERS plus the internal identification number. The internal 
	--/ id number (num) is in the form 
	--/    attxxxxxx 
	--/ where 
	--/     a identifies the sky area (1 for W1 and 4 for W4), 
	--/     tt identifies the CFHTLS tile number where the object is located, 
	--/     xxxxxx is the original CFHTLS ID within the tile. 
	--/ The correspondence between our tile identifier and the official CFHTLS 
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of 
	--/ the prefix VIPERS plus the internal identification number. The internal 
	--/ id number (num) is in the form 
	--/    attxxxxxx 
	--/ where 
	--/     a identifies the sky area (1 for W1 and 4 for W4), 
	--/     tt identifies the CFHTLS tile number where the object is located, 
	--/     xxxxxx is the original CFHTLS ID within the tile. 
	--/ The correspondence between our tile identifier and the official CFHTLS 
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[num] bigint NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from 
	--/ CFHTLS T0005 catalogue. </summary>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error </summary>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[u] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[g] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[r] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
	--/ <unit> mag </unit>
	[i] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0005 catalogue, supplemented by T0006 
	--/ catalogue in some specific cases. See Guzzo et al. 2013, section 3 and 
	--/ appendix C, for details on the tile to tile color offests, as well as 
	--/ for T0005 and T0006 catalogue differences. 
	--/ All magnitudes are given in the AB system, and are corrected for 
	--/ Galactic extinction as follows: 
	--/  
	--/     u = u_raw - 4.716 * E(B-V) 
	--/     g = g_raw - 3.654 * E(B-V) 
	--/     r = r_raw - 2.691 * E(B-V) 
	--/     i = i_raw - 1.998 * E(B-V) 
	--/     z = z_raw - 1.530 * E(B-V) 
	--/  
	--/ where E(B-V) is the extinction factor (color excess). 
	--/ When an object has not been observed in a given band, magnitude and 
	--/ error are set equal to -99. When a magnitude (and its error) could not 
	--/ be measured, these values are set to 99. </summary>
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
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
	[u_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
	[g_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
	[r_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
	[i_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
	[iy_T07] real NOT NULL,

	--/ <summary> Magnitudes from the CFHTLS T0007 catalogue. 
	--/  
	--/     - All magnitudes are corrected for Galactic extinction using the 
	--/       same prescription as the one used for the T0005 ones. 
	--/     - When an object has not been observed in a given band, magnitude 
	--/       and error are set equal to -99. 
	--/     - When a magnitude (and its error) could not be measured, these 
	--/       values are set to 99. 
	--/     - Objects observed in i band, have y magniudes set to -99.99.  
	--/  
	--/ Objects observed in y band instead of i band, have i magniudes set to 
	--/ -99.99. </summary>
	--/ <unit> mag </unit>
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
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	[DeltaUG] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied 
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	[DeltaGR] real NOT NULL,

	--/ <summary> Tile-to-tile colors offsets used in the targets sample selection applied 
	--/ to the CFHTLS T005 data (see Guzzo et al. 2013, section 3.1). For both 
	--/ galaxy and AGN selection, the colors used to assign classFlag and 
	--/ agnFlag can be obtained by applying the following corrections to the 
	--/ colors derived from the magnitudes listed in the database: 
	--/  
	--/     u-g_corr = u-g - DeltaUG 
	--/     g-r_corr = g-r - DeltaGR 
	--/     r-i_corr = r-i - DeltaRI </summary>
	[DeltaRI] real NOT NULL,

	--/ <summary> Extinction factor (color excess) E(B-V) derived from Schlegel's maps. </summary>
	[E_BV] real NOT NULL,

	--/ <summary>  
	--/ Radius enclosing half the object light as from CFHTLS T0005 catalogue, 
	--/ measured in pixels </summary>
	--/ <unit> pixel </unit>
	[r2] real NOT NULL,

	--/ <summary> Radius enclosing half the object light as from CFHTLS T0007 catalogue, 
	--/ measured in pixels </summary>
	--/ <unit> pixel </unit>
	[r2_T07] real NOT NULL,

	--/ <summary>  
	--/ the VIPERS selection flag based on the CFHTLS T005 catalogue, where 
	--/  
	--/   -99: problematic object, missing photometric data 
	--/  
	--/   -88: problematic object, possibly saturated image 
	--/  
	--/    -3: magnitude i &lt; 17.5 
	--/  
	--/    -2: magnitude i &gt; 22.5 
	--/  
	--/    -1: stellar like object according to the VIPERS star/galaxy 
	--/        separation criteria 
	--/  
	--/     0: object with colors compatible with most galaxies at z &lt; 0.5 
	--/  
	--/     1: object with colors compatible with most galaxies at z &gt; 0.5 
	--/  
	--/ See section 4 and Fig. 3 in Guzzo et al. 2013. </summary>
	[classFlag] int NOT NULL,

	--/ <summary>  
	--/ A value equal to 1 is assigned to all AGN candidates, and equal to 0 
	--/ otherwise. An object is an AGN candidate if it is stellar-like 
	--/ (classFlag = -1) and exhibits colours that are clearly different from 
	--/ those of the main stellar sequence (see equations 2 and 3 and Section 
	--/ 2.2 in Garilli et al. 2013) </summary>
	[agnFlag] int NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1 
	--/ if the object is inside the mask, 0 if it is outside. Objects outside 
	--/ the photometric mask have a less reliable photometry. </summary>
	[photoMask] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the spectroscopic mask. 
	--/ 1 if the object is inside the mask, 0 if it is outside. Objects outside 
	--/ the spectroscopic mask have not entered the mask preparation phase (see 
	--/ Garilli et al. 2013 for details) </summary>
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

-----------------------------------------------------------------------------

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[id_IAU] char(16) NOT NULL,
	[num] bigint NOT NULL,
	[ra] real NOT NULL,
	[dec] real NOT NULL,
	[selmag] real NOT NULL,
	[errselmag] real NOT NULL,
	[pointing] char(6) NOT NULL,
	[quadrant] tinyint NOT NULL,
	[zflg] real NOT NULL,
	[zspec] real NOT NULL,
	[epoch] tinyint NOT NULL,
	[photoMask] tinyint NOT NULL,
	[tsr] real NOT NULL,
	[ssr] real NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\skyquery01\Data\temp0\data0\ebanyai\VIPERSPDR1\\VIPERSPDR1_SpecObj.bin'
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

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ The correspondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ Thecorrespondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[num] bigint NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] real NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] real NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from
	--/ CFHTLS T0005 catalogues. </summary>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error. </summary>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary>  </summary>
	[pointing] char(6) NOT NULL,

	--/ <summary>  </summary>
	[quadrant] tinyint NOT NULL,

	--/ <summary> The integer part of the flag has the following meaning:
	--/ 
	--/    4 a high-confidence, highly secure redshift, based on a high SNR
	--/      spectrum and supported by obvious and consistent spectral
	--/      features. The confidence level of Flag 4 measurements is estimated
	--/      to be 99% secure. 
	--/    3 also a very secure redshift, comparable in confidence with Flag
	--/      4, supported by clear spectral features in the spectrum, but not
	--/      necessarily with high SNR.
	--/    2 a fairly secure, ~90% confidence redshift measurement, supported
	--/      by cross-correlation results, continuum shape and some spectral
	--/      features.
	--/    9 a redshift based on only one single clear spectral emission
	--/      feature.
	--/    1 a reasonable redshift measurement, based on weak spectral features
	--/      and/or continuum shape, for which there is roughly a 50% chance
	--/      that the redshift is  actually wrong.
	--/    0 no reliable spectroscopic redshift measurement was
	--/      possible. Redshift is set to the conventional value of 9.9999.
	--/ 
	--/ In case of broad emission lines typical of broad line AGN, a prefix of 1
	--/ is added to zflag, i.e.
	--/ 
	--/    14 secure AGN with a &gt;95% secure redshift, at least 2 broad lines;
	--/    13 secure AGN with good confidence redshift, based on one broad line
	--/       and some faint additional feature;
	--/    12 a >95% secure redshift measurement, but lines are not
	--/       significantly broad, might not be an AGN;
	--/    19 secure AGN with one single secure emission line feature, redshift
	--/       based on this line only;
	--/    11 a tentative redshift measurement, with spectral features not
	--/       significantly broad.
	--/ 
	--/ Second objects in slit get a 2 as prefix to the flag, i.e.
	--/ 
	--/    24 a second object with flag 4
	--/    23 a second object with flag 3
	--/    22 a second object with flag 2
	--/    29 a second object with flag 9
	--/    21 a second object with flag 1
	--/    20 a second object with flag 0
	--/ 
	--/ And similarly for BLAGN (214, 213, 212, ...).
	--/ 
	--/ Suffix in form of decimal digit has the following meaning:
	--/ 
	--/    .5 the spectroscopic redshift is compatible within 1 sigma with
	--/       photometric redshift, i.e
	--/           zphot_min &lt; zspec &lt; zphot_max
	--/    .4 the spectroscopic redshift is compatible with photometric
	--/       redshift at the 2 sigma level, i.e.
	--/            minvalue &lt; zspec &lt; maxvalue
	--/       where
	--/            minvalue = min[ zphot-(1+zphot)*0.05, zphot_min ]
	--/            maxvalue = max[ zphot+(1+zphot)*0.05, zphot_max ]
	--/       and 0.05 is twice the median scatter of the comparison between
	--/       spectroscopic and photometric redshifts.
	--/    .2 spectroscopic redshift is NOT compatible with photometric
	--/       redshift
	--/    .1 no photometric redshift available </summary>
	[zflg] real NOT NULL,

	--/ <summary> Spectroscopic redshift. A conventional zpsec value of 9.9999 is assigned
	--/ in case a redshift could not be measured. </summary>
	[zspec] real NOT NULL,

	--/ <summary> Observing epoch. epoch=1 objects have been observed before VIMOS
	--/ refurbishing in summer 2010, epoch=2 objects have been observed after
	--/ summer 2010. </summary>
	[epoch] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1
	--/ if the object is inside the mask, 0 if it is outside. Objects outside
	--/ the photometric mask have a less reliable photometry </summary>
	[photoMask] tinyint NOT NULL,

	--/ <summary> The Target Sampling Rate is defined as the ratio of the observed objects
	--/ over the number of possible targets: TSR=Nspec/Nparent, where Nspec is
	--/ the number of detected targets and Nparent is the number of all the
	--/ possible random targets.
	--/ TSR has been computed in bins of apparent magnitude to take into account
	--/ the possible dependence of the sampling rate on the clustering of bright
	--/ objects (possibly causing slit collision) and the higher fraction of
	--/ observed bright objects for which a spectrum has not been extracted (see
	--/ Garilli et al. 2013).
	--/ TSR and is needed to take into account the fact that not all the
	--/ possible targets can be observed in the single pass strategy adopted in
	--/ VIPERS. See Garilli et al. 2013 for details
	--/ TSR is = -1 for serendipitous targets (flags 2*.*), and observed objects
	--/ not fulfilling the selection criterion for z&gt;0.5 galaxies (i.e. AGN);
	--/ TSR = -99 for objects outside the considered area and selection
	--/ magnitude range (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	[tsr] real NOT NULL,

	--/ <summary> The SSR is defined as the ratio of the galaxies with a successfully
	--/ measured redshift (flag = 2.*,3.*,4.*,9.*) over the total sample of
	--/ detected galaxies.
	--/ SSR is a function of the apparent magnitude (since to bright objects
	--/ correspond spectra with high signal-to-noise, from which the redshift
	--/ can be more easily measured), and of redshift (because the spectral
	--/ features visible in the observed spectral range can change). Therefore
	--/ SSR has been computed in bins of redshift and apparent magnitude.
	--/ SSR is = -1 for stars (z=0.0000), non measured objects (flag 0), low
	--/ confidence redshift measurements (flags 1.*), spectroscopic BLAGN (flags
	--/ 1*.*), serendipitous targets (flags=2*.*), and hight redshift galaxies
	--/ (zspec&gt;3);
	--/ SSR = -99 for objects outside the considered area and selection
	--/ magnituderange (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	[ssr] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, id_IAU, num, ra, dec, selmag, errselmag, pointing, quadrant, zflg, zspec, epoch, photoMask, tsr, ssr)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
id_IAU, num, ra, dec, selmag, errselmag, pointing, quadrant, zflg, zspec, epoch, photoMask, tsr, ssr
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