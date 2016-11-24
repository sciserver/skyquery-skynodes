USE [SkyNode_AKARI]
GO

--------------------------------------------------------------------------------------
-- IRC
IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO

-- CREATE PhotoObjRAW TABLE

CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[OBJNAME] char(14) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[POSERRMJ]  real NOT NULL,
	[POSERRMI] real NOT NULL,
	[POSERRPA] real NOT NULL,
	[FLUX09] real NOT NULL,
	[FLUX18] real NOT NULL,
	[FERR09] real NOT NULL,
	[FERR18] real NOT NULL,
	[FQUAL09] tinyint NOT NULL,
	[FQUAL18] tinyint NOT NULL,
	[FLAGS09] char(4) NOT NULL,
	[FLAGS18] char(4) NOT NULL,
	[NSCANC09]  int NOT NULL,
	[NSCANC18] int NOT NULL,
	[NSCANP09] int NOT NULL,
	[NSCANP18] int NOT NULL,
	[MCONF09] smallint NOT NULL,
	[MCONF18] smallint NOT NULL,
	[NDENS09] int NOT NULL,
	[NDENS18] int NOT NULL,
	[EXTENDED09] smallint NOT NULL,
	[EXTENDED18] smallint NOT NULL,
	[MEAN_AB09] real NOT NULL,
	[MEAN_AB18] real NOT NULL,
	[NDATA_POS] int NOT NULL,
	[NDATA09] int NOT NULL,
	[NDATA18] int NOT NULL,
	
 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\AKARI\akari_irc.bin' 
     WITH 
    ( 
   DATAFILETYPE = 'native',
   TABLOCK 
    )
GO

IF OBJECT_ID ('dbo.IRC', 'U') IS NOT NULL
    DROP TABLE dbo.IRC;
GO

-- CREATE IRC TABLE

CREATE TABLE dbo.IRC 
(
	--/ <summary> AKARI source ID number. </summary>
	[objID] bigint NOT NULL,
	
	--/ <summary> Source name from its J2000 coordinates, following the IAU Recommendations for
	--/ Nomenclature (2006). The format is HHMMSSS+/−DDMMSS, e.g., 0123456+765432
	--/ for a source at (01h23m45.6s, +76d54m32s). The source must be referred to in the
	--/ literatures by its full name; AKARI-IRC-V1 J0123456+765432, where V1 refers to the version code.</summary>
	[OBJNAME] char(14) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
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

	--/ <summary> Position error major axis. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>
	--/ <unit> arsec </unit>
	[POSERRMJ]  real NOT NULL,

	--/ <summary>  Position error minor axis. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>
	--/ <unit> arsec </unit>
	[POSERRMI] real NOT NULL,

	--/ <summary>  Position error Position Angle. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>
	--/ <unit> deg </unit>
	[POSERRPA] real NOT NULL,

	--/ <summary> Flux density in S9W. </summary>
	--/ <unit> Jy </unit>
	[FLUX09] real NOT NULL,

	--/ <summary> Flux density in L18W. </summary>
	--/ <unit> Jy </unit>
	[FLUX18] real NOT NULL,

	--/ <summary> Flux error in S9W. Errors are defined as equation 5. </summary>
	--/ <unit> Jy </unit>
	[FERR09] real NOT NULL,

	--/ <summary> Flux error in L18W. Errors are defined as equation 5. </summary>
	--/ <unit> Jy </unit> 
	[FERR18] real NOT NULL,


	--/ <summary> Flux quality flag for S9W. 3 when flux is valid and 0 when flux is not
	--/ available. </summary>
	[FQUAL09] tinyint NOT NULL,

	--/ <summary> Flux quality flag for L18W. 3 when flux is valid and 0 when flux is not
	--/ available.</summary>
	[FQUAL18] tinyint NOT NULL,

	--/ <summary> Bit flags data quality for S9W. Bit flags of data quality:
	--/ 1(LSB): not month confirmed
	--/ This means that the period between the first detection and the last detection is shorter
	--/ than a month.
	--/ 2: saturated (not used in this version)
	--/ 4: use SAA (not used in this version)
	--/ 8(MSB): use edge events
	--/ If the number of events is too small, we use the event data near the edge of the image
	--/ strip. In this case, this flag warn you of underestimation of the flux. </summary>
	[FLAGS09] char(4) NOT NULL,

	--/ <summary>  Bit flags data quality for L18W. Bit flags of data quality:
	--/ 1(LSB): not month confirmed
	--/ This means that the period between the first detection and the last detection is shorter
	--/ than a month.
	--/ 2: saturated (not used in this version)
	--/ 4: use SAA (not used in this version)
	--/ 8(MSB): use edge events
	--/ If the number of events is too small, we use the event data near the edge of the image
	--/ strip. In this case, this flag warn you of underestimation of the flux. </summary>
	[FLAGS18] char(4) NOT NULL,

	--/ <summary> Number of scans on which the source is detected for S9W. Normally, NSCANC is less or equal to
	--/ SCANP. In some exceptional case, resultant position of the source drops out from the image
	--/ stripe boundary and NSCANC is larger than NSCANP. </summary>
	[NSCANC09]  int NOT NULL,

	--/ <summary> Number of scans on which the source is detected  for L18W. Normally, NSCANC is less or equal to
	--/ NSCANP. In some exceptional case, resultant position of the source drops out from the image
	--/ stripe boundary and NSCANC is larger than NSCANP. </summary>
	[NSCANC18] int NOT NULL,

	--/ <summary> Total number of scans that possibly observed the source for S9W. </summary>
	[NSCANP09] int NOT NULL,

	--/ <summary> Total number of scans that possibly observed the source for L18W. </summary>
	[NSCANP18] int NOT NULL,

	--/ <summary> 1 is month confirmed and 0 is not. Inverted value of LSB of FLAGS09. </summary>
	[MCONF09] smallint NOT NULL,

	--/ <summary> 1 is month confirmed and 0 is not. Inverted value of LSB of FLAGS18. </summary>
	[MCONF18] smallint NOT NULL,
	
	--/ <summary> The number of sources in 45 arcsec radius for S9W. </summary>
	[NDENS09] int NOT NULL,
	
	--/ <summary> The number of sources in 45 arcsec radius for L18W. </summary>
	[NDENS18] int NOT NULL,
	
	--/ <summary> The flag indicates that the source is possibly more extended than the point spread function.
	--/ This is "TRUE" when MEAN AB &gt; 15.6 [arcsec] </summary>
	[EXTENDED09] smallint NOT NULL,
	
	--/ <summary> The flag indicates that the source is possibly more extended than the point spread function.
	--/ This is "TRUE" when MEAN AB &gt; 15.6 [arcsec] </summary>
	[EXTENDED18] smallint NOT NULL,
	
	--/ <summary> The average of radius along major and minor axes of images, i.e. (&lt; a &gt; + &lt; b &gt;)/2 where
	--/ &lt; a &gt; and &lt; b &gt; are the mean semi-major and semi-minor axis lengths of images estimated by
	--/ SExtractor. </summary>
	--/ <unit> arsec </unit>
	[MEAN_AB09] real NOT NULL,
	
	--/ <summary> The average of radius along major and minor axes of images, i.e. (&lt; a &gt; + &lt; b &gt;)/2 where
	--/ &lt; a &gt; and &lt; b &gt; are the mean semi-major and semi-minor axis lengths of images estimated by
	--/ SExtractor. </summary>
	--/ <unit> arsec </unit>
	[MEAN_AB18] real NOT NULL,
	
	--/ <summary> Number of events used to calculate the mean coordinates. If the source has more than two
	--/ available S9W events, the position is estimated from S9W events only, else the position is
	--/ estimated from L18W events, i.e.
	--/ NDATA POS = NSCANC09 for NSCANC09 &ge; 2
	--/ NDATA POS = NSCANC18 for NSCANC09 &lt; 2 </summary>
	[NDATA_POS] int NOT NULL,
	
	--/ <summary> Number of events that contribute to the flux measurements for S9W. Normally, events
	--/ near the edge of the image strip are excluded from the measurements. Note that if only 0 or 1
	--/ event are available, the flux is computed also from edge events. </summary>
	[NDATA09] int NOT NULL,
	
	--/ <summary> Number of events that contribute to the flux measurements for L18W. Normally, events
	--/ near the edge of the image strip are excluded from the measurements. Note that if only 0 or 1
	--/ event are available, the flux is computed also from edge events. </summary>
	[NDATA18] int NOT NULL,
	
 CONSTRAINT [PK_IRC] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.IRC WITH (TABLOCKX)
(objID, OBJNAME, ra, dec, cx,cy,cz,htmid, zoneid, POSERRMJ,POSERRMI,POSERRPA,
FLUX09, FLUX18, FERR09, FERR18, FQUAL09, FQUAL18,FLAGS09, FLAGS18, NSCANC09, NSCANC18, 
NSCANP09, NSCANP18, MCONF09, MCONF18, NDENS09, NDENS18, EXTENDED09, EXTENDED18,
MEAN_AB09, MEAN_AB18, NDATA_POS, NDATA09, NDATA18)
SELECT objID, OBJNAME, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, POSERRMJ,POSERRMI,POSERRPA,
FLUX09, FLUX18, FERR09, FERR18, FQUAL09, FQUAL18,FLAGS09, FLAGS18, NSCANC09, NSCANC18, 
NSCANP09, NSCANP18, MCONF09, MCONF18, NDENS09, NDENS18, EXTENDED09, EXTENDED18,
MEAN_AB09, MEAN_AB18, NDATA_POS, NDATA09, NDATA18
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE

DROP TABLE dbo.PhotoObjRAW;
GO

-- Spatial index

CREATE NONCLUSTERED INDEX [IX_IRC_Zone] ON [dbo].[IRC] 
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


CREATE NONCLUSTERED INDEX [IX_IRC_ZoneID] ON [dbo].[IRC] 
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
CREATE NONCLUSTERED INDEX [IX_IRC_HtmID] ON [dbo].[IRC] 
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

-------------------------------------------------------------------------------------------------------------------------------------
-- FIS

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO

-- CREATE PhotoObjRAW TABLE

CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[OBJNAME] char(14) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[POSERRMJ]  real NOT NULL,
	[POSERRMI] real NOT NULL,
	[POSERRPA] real NOT NULL,
	[FLUX65] real NOT NULL,
	[FLUX90] real NOT NULL,
	[FLUX140] real NOT NULL,
	[FLUX160] real NOT NULL,
	[FERR65] real NOT NULL,
	[FERR90] real NOT NULL,
	[FERR140] real NOT NULL,
	[FERR160] real NOT NULL,
	[FQUAL65] tinyint NOT NULL,
	[FQUAL90] tinyint NOT NULL,
	[FQUAL140] tinyint NOT NULL,
	[FQUAL160] tinyint NOT NULL,
	[FLAGS65] char(4) NOT NULL,
	[FLAGS90] char(4) NOT NULL,
	[FLAGS140] char(4) NOT NULL,
	[FLAGS160] char(4) NOT NULL,
	[NSCANC65]  int NOT NULL,
	[NSCANC90] int NOT NULL,
	[NSCANC140] int NOT NULL,
	[NSCANC160] int NOT NULL,
	[NSCANP65] int NOT NULL,
	[NSCANP90] int NOT NULL,
	[NSCANP140]  int NOT NULL,
	[NSCANP160] int NOT NULL,
	[MCONF65] smallint NOT NULL,
	[MCONF90] smallint NOT NULL,
	[MCONF140] smallint NOT NULL,
	[MCONF160] smallint NOT NULL,
	[NDENS] int NOT NULL,
	
 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\AKARI\akari_fis.bin' 
     WITH 
    ( 
   DATAFILETYPE = 'native',
   TABLOCK 
    )
GO

IF OBJECT_ID ('dbo.FIS', 'U') IS NOT NULL
    DROP TABLE dbo.FIS;
GO

-- CREATE PhotoObj TABLE

CREATE TABLE dbo.FIS 
(
	--/ <summary> Internal Object ID. A unique number for each object in the catalogue. This is mostly for internal use in the
	--/ AKARI-CAS, and should be ignored in the astronomical analysis.</summary>
	[objID] bigint NOT NULL,
	
	--/ <summary> Source identifier from its J2000 coordinates, following the IAU Recommendations for
	--/ Nomenclature (2006). The format is HHMMSSS+/−DDMMSS, e.g., 0123456+765432
	--/ for a source at (01h23m45.6s, +76d54m32s). The source must be referred to in the
	--/ literatures by its full name; AKARI-FIS-V1 J0123456+765432.</summary>
	[OBJNAME] char(14) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
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

	--/ <summary> Position error major axis. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>
	--/ <unit> arcsec </unit>
	[POSERRMJ]  real NOT NULL,

	--/ <summary>  Position error minor axis. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>
	--/ <unit> arcsec </unit>
	[POSERRMI] real NOT NULL,

	--/ <summary>  Position error Position Angle. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>
	
	--/ <unit> deg </unit>
	[POSERRPA] real NOT NULL,

	--/ <summary> Flux density in N60 in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>
	--/ <unit> Jy </unit>
	[FLUX65] real NOT NULL,

	--/ <summary> Flux density in WIDE-S in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>
	--/ <unit> Jy </unit>
	[FLUX90] real NOT NULL,

	--/ <summary>  Flux density in WIDE-L in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>
	--/ <unit> Jy </unit>
	[FLUX140] real NOT NULL,

	--/ <summary> Flux density in N160 in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>
	--/ <unit> Jy </unit>
	[FLUX160] real NOT NULL,

	--/ <summary> Flux uncertainty in N60 in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>
	--/ <unit> Jy </unit>
	[FERR65] real NOT NULL,

	--/ <summary> Flux uncertainty in WIDE-S in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>
	--/ <unit> Jy </unit> 
	[FERR90] real NOT NULL,

	--/ <summary>  Flux uncertainty in WIDE-L in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>
	--/ <unit> Jy </unit> 
	[FERR140] real NOT NULL,

	--/ <summary> Flux uncertainty in N160 in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>
	--/ <unit> Jy </unit> 
	[FERR160] real NOT NULL,

	--/ <summary> Flux density quality flag for N60. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>
	[FQUAL65] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for WIDE-S. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>
	[FQUAL90] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for WIDE-L. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary> 
	[FQUAL140] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for N160. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>
	[FQUAL160] tinyint NOT NULL,

	--/ <summary> Bit flags of data quality for N60. A 16 bits flag per band indicating various data condition. In version 1 catalogue three
	--/ bits are used. The first bit (bit0) is used to indicate the CDS sampling mode. The second
	--/ bit (bit1) warns the flux of the band is less than a half of the detection limit, and is not
	--/ reliable. The fourth bit (bit3) tells that the source is possibly false detection due to ‘sidelobe’
	--/ effects (see, Section 7.7). The third bit (bit2) was previously indicated an anomaly
	--/ which does not exist in the current version, and thus is kept unused. Sources with bit1 or
	--/ bit3 = 1 have FQUAL = 2 or less. Other bits are reserved for the future implementation.
	--/ In the text format version the values are expressed in Hexadecimal format.
	--/                                 USB ------------- bit ----- LSB
	--/                                     ...  7  6  5  4  3  2  1 0
	--/                                 decimal |  |  |  |  |  |  |  |
	--/ reserved ------------------------- 128--+  |  |  |  |  |  |  |
	--/ reserved -------------------------- 64 ----+  |  |  |  |  |  |
	--/ reserved -------------------------- 32 -------+  |  |  |  |  |
	--/ reserved -------------------------- 16 ----------+  |  |  |  |
	--/ 1: possibly ‘side-lobe’ detection--- 8 -------------+  |  |  |
	--/ not used ------------------- ------- 4 ----------------+  |  |
	--/ 1: Flux too low -------------------- 2 -------------------+  |
	--/ 0: Normal mode, 1: CDS mode -------- 1 ----------------------+
	--/ x NULL is set in case of no measurement (FQUAL = 0). The value is −1 in the files, and
	--/ is defined as NULL in the FITS header. </summary>
	[FLAGS65] char(4) NOT NULL,

	--/ <summary> Bit flags of data quality for WIDE-S. A 16 bits flag per band indicating various data condition. In version 1 catalogue three
	--/ bits are used. The first bit (bit0) is used to indicate the CDS sampling mode. The second
	--/ bit (bit1) warns the flux of the band is less than a half of the detection limit, and is not
	--/ reliable. The fourth bit (bit3) tells that the source is possibly false detection due to ‘sidelobe’
	--/ effects (see, Section 7.7). The third bit (bit2) was previously indicated an anomaly
	--/ which does not exist in the current version, and thus is kept unused. Sources with bit1 or
	--/ bit3 = 1 have FQUAL = 2 or less. Other bits are reserved for the future implementation.
	--/ In the text format version the values are expressed in Hexadecimal format.
	--/                                 USB ------------- bit ----- LSB
	--/                                     ...  7  6  5  4  3  2  1 0
	--/                                 decimal |  |  |  |  |  |  |  |
	--/ reserved ------------------------- 128--+  |  |  |  |  |  |  |
	--/ reserved -------------------------- 64 ----+  |  |  |  |  |  |
	--/ reserved -------------------------- 32 -------+  |  |  |  |  |
	--/ reserved -------------------------- 16 ----------+  |  |  |  |
	--/ 1: possibly ‘side-lobe’ detection--- 8 -------------+  |  |  |
	--/ not used ------------------- ------- 4 ----------------+  |  |
	--/ 1: Flux too low -------------------- 2 -------------------+  |
	--/ 0: Normal mode, 1: CDS mode -------- 1 ----------------------+
	--/ x NULL is set in case of no measurement (FQUAL = 0). The value is −1 in the files, and
	--/ is defined as NULL in the FITS header. </summary>
	[FLAGS90] char(4) NOT NULL,

	--/ <summary> Bit flags of data quality for WIDE-L. A 16 bits flag per band indicating various data condition. In version 1 catalogue three
	--/ bits are used. The first bit (bit0) is used to indicate the CDS sampling mode. The second
	--/ bit (bit1) warns the flux of the band is less than a half of the detection limit, and is not
	--/ reliable. The fourth bit (bit3) tells that the source is possibly false detection due to ‘sidelobe’
	--/ effects (see, Section 7.7). The third bit (bit2) was previously indicated an anomaly
	--/ which does not exist in the current version, and thus is kept unused. Sources with bit1 or
	--/ bit3 = 1 have FQUAL = 2 or less. Other bits are reserved for the future implementation.
	--/ In the text format version the values are expressed in Hexadecimal format.
	--/                                 USB ------------- bit ----- LSB
	--/                                     ...  7  6  5  4  3  2  1 0
	--/                                 decimal |  |  |  |  |  |  |  |
	--/ reserved ------------------------- 128--+  |  |  |  |  |  |  |
	--/ reserved -------------------------- 64 ----+  |  |  |  |  |  |
	--/ reserved -------------------------- 32 -------+  |  |  |  |  |
	--/ reserved -------------------------- 16 ----------+  |  |  |  |
	--/ 1: possibly ‘side-lobe’ detection--- 8 -------------+  |  |  |
	--/ not used ------------------- ------- 4 ----------------+  |  |
	--/ 1: Flux too low -------------------- 2 -------------------+  |
	--/ 0: Normal mode, 1: CDS mode -------- 1 ----------------------+
	--/ x NULL is set in case of no measurement (FQUAL = 0). The value is −1 in the files, and
	--/ is defined as NULL in the FITS header. </summary>
	[FLAGS140] char(4) NOT NULL,

	--/ <summary> Bit flags of data quality for N160. A 16 bits flag per band indicating various data condition. In version 1 catalogue three
	--/ bits are used. The first bit (bit0) is used to indicate the CDS sampling mode. The second
	--/ bit (bit1) warns the flux of the band is less than a half of the detection limit, and is not
	--/ reliable. The fourth bit (bit3) tells that the source is possibly false detection due to ‘sidelobe’
	--/ effects (see, Section 7.7). The third bit (bit2) was previously indicated an anomaly
	--/ which does not exist in the current version, and thus is kept unused. Sources with bit1 or
	--/ bit3 = 1 have FQUAL = 2 or less. Other bits are reserved for the future implementation.
	--/ In the text format version the values are expressed in Hexadecimal format.
	--/                                 USB ------------- bit ----- LSB
	--/                                     ...  7  6  5  4  3  2  1 0
	--/                                 decimal |  |  |  |  |  |  |  |
	--/ reserved ------------------------- 128--+  |  |  |  |  |  |  |
	--/ reserved -------------------------- 64 ----+  |  |  |  |  |  |
	--/ reserved -------------------------- 32 -------+  |  |  |  |  |
	--/ reserved -------------------------- 16 ----------+  |  |  |  |
	--/ 1: possibly ‘side-lobe’ detection--- 8 -------------+  |  |  |
	--/ not used ------------------- ------- 4 ----------------+  |  |
	--/ 1: Flux too low -------------------- 2 -------------------+  |
	--/ 0: Normal mode, 1: CDS mode -------- 1 ----------------------+
	--/ x NULL is set in case of no measurement (FQUAL = 0). The value is −1 in the files, and
	--/ is defined as NULL in the FITS header. </summary>
	[FLAGS160] char(4) NOT NULL,

	--/ <summary> nScanConfirm for N60. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>
	[NSCANC65]  int NOT NULL,

	--/ <summary> nScanConfirm for WIDE-S. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>
	[NSCANC90] int NOT NULL,

	--/ <summary> nScanConfirm for WIDE-L. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>
	[NSCANC140] int NOT NULL,

	--/ <summary> nScanConfirm for N160. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>
	[NSCANC160] int NOT NULL,

	--/ <summary> nScanPossible for N60. Total number of scans that passed on the source (that possibly observed the source) </summary>
	[NSCANP65] int NOT NULL,

	--/ <summary> nScanPossible for WIDE-S. Total number of scans that passed on the source (that possibly observed the source) </summary>
	[NSCANP90] int NOT NULL,

	--/ <summary> nScanPossible for WIDE-L. Total number of scans that passed on the source (that possibly observed the source) </summary>
	[NSCANP140]  int NOT NULL,

	--/ <summary> nScanPossible for N160. Total number of scans that passed on the source (that possibly observed the source) </summary>
	[NSCANP160] int NOT NULL,

	--/ <summary> Months confirmation flag for N60. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>
	[MCONF65] smallint NOT NULL,

	--/ <summary> Months confirmation flag for WIDE-S. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>
	[MCONF90] smallint NOT NULL,

	--/ <summary> Months confirmation flag for WIDE-L. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>
	[MCONF140] smallint NOT NULL,

	--/ <summary> Months confirmation flag for N160. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>
	[MCONF160] smallint NOT NULL,

	--/ <summary> Number of neighbouring sources. Number of sources in the catalogue within the distance of 5 arcmin from the source. This
	--/ value is intended to be an indicator of crowdedness of the sky region. Since the source
	--/ extraction program is tuned so that a unique source is found within 48 arcsec radius, the
	--/ 5 arcmin radius corresponds to approximately 40 beams. </summary>
	[NDENS] int NOT NULL,

 CONSTRAINT [PK_FIS] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.FIS WITH (TABLOCKX)
(objID, OBJNAME, ra, dec, cx,cy,cz,htmid, zoneId, POSERRMJ,POSERRMI,POSERRPA,
FLUX65, FLUX90, FLUX140, FLUX160, FERR65, FERR90, FERR140, FERR160, FQUAL65, FQUAL90, FQUAL140, FQUAL160,
FLAGS65, FLAGS90, FLAGS140, FLAGS160, NSCANC65, NSCANC90, NSCANC140, NSCANC160, NSCANP65, NSCANP90, NSCANP140, NSCANP160,
MCONF65, MCONF90, MCONF140, MCONF160, NDENS)
SELECT objID, OBJNAME, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, SkyQuery_CODE_dev.SkyQuery.ZoneIDFromDec(dec,4.0/3600.00000000) AS zoneid, POSERRMJ,POSERRMI,POSERRPA,
FLUX65, FLUX90, FLUX140, FLUX160, FERR65, FERR90, FERR140, FERR160, FQUAL65, FQUAL90, FQUAL140, FQUAL160,
FLAGS65, FLAGS90, FLAGS140, FLAGS160, NSCANC65, NSCANC90, NSCANC140, NSCANC160, NSCANP65, NSCANP90, NSCANP140, NSCANP160,
MCONF65, MCONF90, MCONF140, MCONF160, NDENS
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE

DROP TABLE dbo.PhotoObjRAW;
GO

-- Spatial index

CREATE NONCLUSTERED INDEX [IX_FIS_Zone] ON [dbo].[FIS] 
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


CREATE NONCLUSTERED INDEX [IX_FIS_ZoneID] ON [dbo].[FIS] 
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
CREATE NONCLUSTERED INDEX [IX_FIS_HtmID] ON [dbo].[FIS] 
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
