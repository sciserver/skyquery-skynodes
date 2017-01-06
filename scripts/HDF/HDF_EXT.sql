USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
(	[objID] char(14) NOT NULL,
	[x] real NOT NULL,
	[y] real NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[mt] real NOT NULL,
	[mt_limit] char(5) NOT NULL,
	[mi] real NOT NULL,
	[mi_limit] char(5) NOT NULL,
	[U_B] real NOT NULL,
	[U_B_limit] char(5) NOT NULL,
	[B_V] real NOT NULL,
	[B_V_limit] char(5) NOT NULL,
	[V_I] real NOT NULL,
	[V_I_limit] char(5) NOT NULL,
	[SN] real NOT NULL,
	[area] real NOT NULL,
	[r1] real NOT NULL,
	[bpa] real NOT NULL,
	[PA] real NOT NULL,
	[Flags] char(3) NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\HDF\hdf.bin'
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

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> This is the FOCAS catalog entry number. The numbers after the decimal point indicate the level of splitting.
	--/ Both parents and daughters are included in the catalog shown here. Thus many objects are included repeatedly in the catalog,
	--/ both as part of the parent and as a separate daughter entry. </summary>
	[objID] char(14) NOT NULL,

	--/ <summary> The x pixel position of each object, as defined by brightest pixel within the 3x3 pixel grid with the greatest 
	--/ luminosity within the detection area. For objects with a bright off-center peak, this position can be significantly different 
	--/ from the weighted center of the luminosity distribution within the detection area. For the HDF, such differences are typically 
	--/ less than 0.1 arsces.</summary>
	--/ <unit> pix </unit>
	[x] real NOT NULL,

	--/ <summary> The y pixel position of each object, as defined by brightest pixel within the 3x3 pixel grid with the greatest 
	--/ luminosity within the detection area. For objects with a bright off-center peak, this position can be significantly different 
	--/ from the weighted center of the luminosity distribution within the detection area. For the HDF, such differences are typically 
	--/ less than 0.1 arsces. </summary>
	--/ <unit> pix </unit>
	[y] real NOT NULL,

	--/ <summary> Degrees of the right ascension corresponding to the x, y centers, epoch J2000. </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Degrees of the declination corresponding to the x, y centers, epoch J2000. </summary>
	--/ <unit> deg (J2000)  </unit>
	[dec] float NOT NULL,

	--/ <summary> Total magnitude. The magnitudes of the detected sources in the F606W image. 
	--/ These magnitudes are in he AB system, where m = -2,5 log f_v – 48.60. The “isophotal” 
	--/ magnitude mi is determined from the sum of the counts within the detection isophote. 
	--/ The “total magnitude is computed from the number of counts within a “grown” area. 
	--/ The total area is determined by first filling in any x or y concavities in the isophote 
	--/ shape and then adding by rings around the object until the area exceeds the detection
	--/ area by at least a factor of two. For daughter objects, the total magnitude is divided
	--/ between the daughters in proportion to their isophotal luminosities. The isophoal
	--/ mangitudes correspond to the higher isophotes at which the object broke into multiple components. </summary>
	[mt] real NOT NULL,

	--/ <summary>  </summary>
	[mt_limit] char(5) NOT NULL,

	--/ <summary> Isophotal magnitude. The magnitudes of the detected sources in the F606W image. 
	--/ These magnitudes are in he AB system, where m = -2,5 log f_v – 48.60. The “isophotal” 
	--/ magnitude mi is determined from the sum of the counts within the detection isophote. 
	--/ The “total magnitude is computed from the number of counts within a “grown” area. 
	--/ The total area is determined by first filling in any x or y concavities in the isophote 
	--/ shape and then adding by rings around the object until the area exceeds the detection
	--/ area by at least a factor of two. For daughter objects, the total magnitude is divided
	--/ between the daughters in proportion to their isophotal luminosities. The isophoal
	--/ mangitudes correspond to the higher isophotes at which the object broke into multiple components.  </summary>
	[mi] real NOT NULL,

	--/ <summary>  </summary>
	[mi_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 – B_450, B_450 – V606, and V_606 – I_814, to avoid  
	--/ confusion with the ground based Johnson and Strömgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99). </summary>
	--/ <unit> mag </unit>
	[U_B] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	[U_B_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 – B_450, B_450 – V606, and V_606 – I_814, to avoid  
	--/ confusion with the ground based Johnson and Strömgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99).  </summary>
	--/ <unit> mag </unit>
	[B_V] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	[B_V_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 – B_450, B_450 – V606, and V_606 – I_814, to avoid  
	--/ confusion with the ground based Johnson and Strömgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99).  </summary>
	--/ <unit> mag </unit>
	[V_I] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	[V_I_limit] char(5) NOT NULL,

	--/ <summary> The signal-to-noise ratio of the detection in the summed F606W+F814W image, based on a semi-empirical noise model. (See 1996AJ....112.1335W) </summary>
	[SN] real NOT NULL,

	--/ <summary> Area in pixels within the detection isophote. </summary>
	--/ <unit> pix </unit>
	[area] real NOT NULL,

	--/ <summary> Intensity-weighted first-moment radius determined from pixels within the detection isophote. The radii are determined relative 
	--/ to the x,y centers listed in the catalog. </summary>
	--/ <unit> arcsec </unit>
	[r1] real NOT NULL,

	--/ <summary> The intensity-weighted axial ratio taken from the second moment of the light distribution </summary>
	--/ <unit>  </unit>
	[bpa] real NOT NULL,

	--/ <summary> The intensity weighted position angle defined such that an object pointing North-South has Phi = 0, 
	--/ and the position angle increase as the major axis of the object rotates toward the east. (For further details see 1996AJ....112.1335W .)</summary>
	[PA] real NOT NULL,

	--/ <summary> S indicates that the source is a single object (not split into subcomponents). B indicates that the outer 
	--/ isophote of the source overlaps a chip boundary in one or more banpasses. F indicates that object components originally 
	--/ detected by FOCAS were manually merged back into their parent. </summary>
	[Flags] char(3) NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, x, y, ra, dec,mt, mt_limit, mi, mi_limit, U_B, U_B_limit,
 B_V, B_V_limit, V_I, V_I_limit, SN, area, r1, bpa, PA, Flags)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, PhotoObjRAW.x, PhotoObjRAW.y, ra, dec, mt, mt_limit, mi, mi_limit, U_B, U_B_limit,
 B_V, B_V_limit, V_I, V_I_limit, SN, area, r1, bpa, PA, Flags
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE PhotoObjRAW

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

CREATE NONCLUSTERED INDEX [IX_Photo_ZoneID] ON [dbo].[PhotoObj] 
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