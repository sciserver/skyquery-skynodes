--/ <dataset>
--/ <summary>AKARI Point Source Catalogues</summary>
--/ <remarks>
--/ AKARI (Previously known as ASTRO-F or IRIS - InfraRed Imaging Surveyor) 
--/ is the second space mission for infrared astronomy in Japan. AKARI had 
--/ a 68.5cm telescope cooled down to 6K, and observed in the wavelength 
--/ range from 1.7 (near-infrared) to 180 (far-infrared) micrometer. 
--/ </remarks>
--/ <url>http://www.ir.isas.jaxa.jp/AKARI/</url>
--/ <icon>akari.png</icon>
--/ <docpage>akari.html</docpage>
--/ </dataset>
 GO


-- CREATE IRC TABLE

--/ <summary> The AKARI/IRC Point Source Catalogue Version 1.0 provides positions and fluxes of 870,973 sources (844,649 sources in 9µm band and 194,551 sources in 18µm band) in the Mid-Infrared wavelengths.</summary>
--/ <remarks></remarks>
--/ <icon>AKARI_IRC.png</icon>
CREATE TABLE dbo.IRC 
(
	--/ <summary> AKARI source ID number. </summary>	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,
	
	--/ <summary> Source name from its J2000 coordinates, following the IAU Recommendations for
	--/ Nomenclature (2006). The format is HHMMSSS+/−DDMMSS, e.g., 0123456+765432
	--/ for a source at (01h23m45.6s, +76d54m32s). The source must be referred to in the
	--/ literatures by its full name; AKARI-IRC-V1 J0123456+765432, where V1 refers to the version code.</summary>	--/ <quantity>meta.id</quantity>
	[OBJNAME] char(14) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.eq.zone; pos.frame=J2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Position error major axis. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>	--/ <quantity>stat.error; pos.errorEllipse.smajAxis</quantity>
	--/ <unit> arsec </unit>
	[POSERRMJ]  real NOT NULL,

	--/ <summary>  Position error minor axis. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>	--/ <quantity>stat.error; pos.errorEllipse.sminAxis</quantity>
	--/ <unit> arsec </unit>
	[POSERRMI] real NOT NULL,

	--/ <summary>  Position error Position Angle. One-sigma error of the source position expressed by an ellipse with Major and Minor axes
	--/ [arcsec], and Position Angle [deg; East from North]. If only two events are available, POSERRMJ
	--/ is calculated from the distance of the two events and POSERRMI is set to the same as POSERRMJ. </summary>	--/ <quantity>stat.error; pos.errorEllipse.posAng</quantity>
	--/ <unit> deg </unit>
	[POSERRPA] real NOT NULL,

	--/ <summary> Flux density in S9W. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.IRC09</quantity>
	--/ <unit> Jy </unit>
	[FLUX09] real NOT NULL,

	--/ <summary> Flux density in L18W. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.IRC18</quantity>
	--/ <unit> Jy </unit>
	[FLUX18] real NOT NULL,

	--/ <summary> Flux error in S9W. Errors are defined as equation 5. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.IRC09</quantity>
	--/ <unit> Jy </unit>
	[FERR09] real NOT NULL,

	--/ <summary> Flux error in L18W. Errors are defined as equation 5. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.IRC18</quantity>
	--/ <unit> Jy </unit> 
	[FERR18] real NOT NULL,


	--/ <summary> Flux quality flag for S9W. 3 when flux is valid and 0 when flux is not
	--/ available. </summary>	--/ <quantity>meta.code.qual; phot.flux; em.IR.AKARI.IRC09</quantity>
	[FQUAL09] tinyint NOT NULL,

	--/ <summary> Flux quality flag for L18W. 3 when flux is valid and 0 when flux is not
	--/ available.</summary>	--/ <quantity>meta.code.qual; phot.flux; em.IR.AKARI.IRC18</quantity>
	[FQUAL18] tinyint NOT NULL,

	--/ <summary> Bit flags data quality for S9W. Bit flags of data quality:
	--/ 1(LSB): not month confirmed
	--/ This means that the period between the first detection and the last detection is shorter
	--/ than a month.
	--/ 2: saturated (not used in this version)
	--/ 4: use SAA (not used in this version)
	--/ 8(MSB): use edge events
	--/ If the number of events is too small, we use the event data near the edge of the image
	--/ strip. In this case, this flag warn you of underestimation of the flux. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.IRC09</quantity>
	[FLAGS09] char(4) NOT NULL,

	--/ <summary>  Bit flags data quality for L18W. Bit flags of data quality:
	--/ 1(LSB): not month confirmed
	--/ This means that the period between the first detection and the last detection is shorter
	--/ than a month.
	--/ 2: saturated (not used in this version)
	--/ 4: use SAA (not used in this version)
	--/ 8(MSB): use edge events
	--/ If the number of events is too small, we use the event data near the edge of the image
	--/ strip. In this case, this flag warn you of underestimation of the flux. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.IRC18</quantity>
	[FLAGS18] char(4) NOT NULL,

	--/ <summary> Number of scans on which the source is detected for S9W. Normally, NSCANC is less or equal to
	--/ SCANP. In some exceptional case, resultant position of the source drops out from the image
	--/ stripe boundary and NSCANC is larger than NSCANP. </summary>	--/ <quantity>meta.code.number; obs; em.IR.AKARI.IRC09</quantity>
	[NSCANC09]  int NOT NULL,

	--/ <summary> Number of scans on which the source is detected  for L18W. Normally, NSCANC is less or equal to
	--/ NSCANP. In some exceptional case, resultant position of the source drops out from the image
	--/ stripe boundary and NSCANC is larger than NSCANP. </summary>	--/ <quantity>meta.code.number; obs; em.IR.AKARI.IRC18</quantity>
	[NSCANC18] int NOT NULL,

	--/ <summary> Total number of scans that possibly observed the source for S9W. </summary>	--/ <quantity>meta.code.number; obs; em.IR.AKARI.IRC09</quantity>
	[NSCANP09] int NOT NULL,

	--/ <summary> Total number of scans that possibly observed the source for L18W. </summary>	--/ <quantity>meta.code.number; obs; em.IR.AKARI.IRC18</quantity>
	[NSCANP18] int NOT NULL,

	--/ <summary> 1 is month confirmed and 0 is not. Inverted value of LSB of FLAGS09. </summary>	--/ <quantity>meta.code; em.IR.AKARI.IRC09</quantity>
	[MCONF09] smallint NOT NULL,

	--/ <summary> 1 is month confirmed and 0 is not. Inverted value of LSB of FLAGS18. </summary>	--/ <quantity>meta.code; em.IR.AKARI.IRC18</quantity>
	[MCONF18] smallint NOT NULL,
	
	--/ <summary> The number of sources in 45 arcsec radius for S9W. </summary>	--/ <quantity>meta.code.nubmer; src; em.IR.AKARI.IRC09</quantity>
	[NDENS09] int NOT NULL,
	
	--/ <summary> The number of sources in 45 arcsec radius for L18W. </summary>	--/ <quantity>meta.code.number; src; em.IR.AKARI.IRC18</quantity>
	[NDENS18] int NOT NULL,
	
	--/ <summary> The flag indicates that the source is possibly more extended than the point spread function.
	--/ This is "TRUE" when MEAN AB &gt; 15.6 [arcsec] </summary>	--/ <quantity>meta.code; em.IR.AKARI.IRC9</quantity>
	[EXTENDED09] smallint NOT NULL,
	
	--/ <summary> The flag indicates that the source is possibly more extended than the point spread function.
	--/ This is "TRUE" when MEAN AB &gt; 15.6 [arcsec] </summary>	--/ <quantity>meta.code; em.IR.AKARI.IRC18</quantity>
	[EXTENDED18] smallint NOT NULL,
	
	--/ <summary> The average of radius along major and minor axes of images, i.e. (&lt; a &gt; + &lt; b &gt;)/2 where
	--/ &lt; a &gt; and &lt; b &gt; are the mean semi-major and semi-minor axis lengths of images estimated by
	--/ SExtractor. </summary>	--/ <quantity>phys.size.radius; em.IR.AKARI.IRC9</quantity>
	--/ <unit> arsec </unit>
	[MEAN_AB09] real NOT NULL,
	
	--/ <summary> The average of radius along major and minor axes of images, i.e. (&lt; a &gt; + &lt; b &gt;)/2 where
	--/ &lt; a &gt; and &lt; b &gt; are the mean semi-major and semi-minor axis lengths of images estimated by
	--/ SExtractor. </summary>	--/ <quantity>phys.size.radius; stat.mean; em.IR.AKARI.IRC18</quantity>
	--/ <unit> arsec </unit>
	[MEAN_AB18] real NOT NULL,
	
	--/ <summary> Number of events used to calculate the mean coordinates. If the source has more than two
	--/ available S9W events, the position is estimated from S9W events only, else the position is
	--/ estimated from L18W events, i.e.
	--/ NDATA POS = NSCANC09 for NSCANC09 &#8805; 2
	--/ NDATA POS = NSCANC18 for NSCANC09 &lt; 2 </summary>	--/ <quantity>meta.code.number</quantity>
	[NDATA_POS] int NOT NULL,
	
	--/ <summary> Number of events that contribute to the flux measurements for S9W. Normally, events
	--/ near the edge of the image strip are excluded from the measurements. Note that if only 0 or 1
	--/ event are available, the flux is computed also from edge events. </summary>	--/ <quantity>meta.code.number; phot.flux; em.IR.AKARI.IRC9</quantity>
	[NDATA09] int NOT NULL,
	
	--/ <summary> Number of events that contribute to the flux measurements for L18W. Normally, events
	--/ near the edge of the image strip are excluded from the measurements. Note that if only 0 or 1
	--/ event are available, the flux is computed also from edge events. </summary>	--/ <quantity>meta.code.number; phot.flux; em.IR.AKARI.IRC18</quantity>
	[NDATA18] int NOT NULL,
	
 CONSTRAINT [PK_IRC] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- CREATE FIS TABLE

--/ <summary> The AKARI/FIS Bright Source Catalogue Version 1.0 provides the positions and fluxes of 427,071 point sources in the four far-infrared wavelengths centred at 65, 90, 140, and 160 μm. The sensitivity in the 90 μm band is about 0.55 Jy.</summary>
--/ <remarks></remarks>
--/ <icon>AKARI_FIS.png</icon>
CREATE TABLE dbo.FIS 
(
	--/ <summary> Internal Object ID. A unique number for each object in the catalogue. This is mostly for internal use in the
	--/ AKARI-CAS, and should be ignored in the astronomical analysis.</summary>	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,
	
	--/ <summary> Source identifier from its J2000 coordinates, following the IAU Recommendations for
	--/ Nomenclature (2006). The format is HHMMSSS+/−DDMMSS, e.g., 0123456+765432
	--/ for a source at (01h23m45.6s, +76d54m32s). The source must be referred to in the
	--/ literatures by its full name; AKARI-FIS-V1 J0123456+765432.</summary>	--/ <quantity>meta.id</quantity>
	[OBJNAME] char(14) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.eq.zone; pos.frame=J2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Position error major axis. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>	--/ <quantity>stat.error; pos.errorEllipse.smajAxis; pos.frame=j2000</quantity>
	--/ <unit> arcsec </unit>
	[POSERRMJ]  real NOT NULL,

	--/ <summary>  Position error minor axis. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>	--/ <quantity>stat.error; pos.errorEllipse.sminAxis; pos.frame=j2000</quantity>
	--/ <unit> arcsec </unit>
	[POSERRMI] real NOT NULL,

	--/ <summary>  Position error Position Angle. One-sigma error of the source position expressed by an ellipse with Major (POSERRMJ) and Minor axes (POSERRMI)
	--/ in arcsec, and Position Angle (POSERRPA) in degees measured from North to East. In the currently
	--/ version we give the same value (6.0 arcsec) for all the sources both in the major and minor
	--/ axis (thus polar-angle is 0.0) based on the statistical analysis in Section 5.5. </summary>	--/ <quantity>stat.error; pos.error.Ellipse.posAng; pos.frame=j2000</quantity>
	
	--/ <unit> deg </unit>
	[POSERRPA] real NOT NULL,

	--/ <summary> Flux density in N60 in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.FIS65</quantity>
	--/ <unit> Jy </unit>
	[FLUX65] real NOT NULL,

	--/ <summary> Flux density in WIDE-S in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.FIS90</quantity>
	--/ <unit> Jy </unit>
	[FLUX90] real NOT NULL,

	--/ <summary>  Flux density in WIDE-L in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.FIS140</quantity>
	--/ <unit> Jy </unit>
	[FLUX140] real NOT NULL,

	--/ <summary> Flux density in N160 in Jansky. In the catalogue the four FIS
	--/ bands are indicated by their central wavelengths as 65, 90, 140 and 160.
	--/ Values are given even for the unconfirmed sources as much as possible, though such the
	--/ data are not guaranteed. If it is not possible to measure the source flux, NULL value is
	--/ set; NaN in the FITS format and −999.9 in the text format, respectively. </summary>	--/ <quantity>phot.flux.density; em.IR.AKARI.FIS160</quantity>
	--/ <unit> Jy </unit>
	[FLUX160] real NOT NULL,

	--/ <summary> Flux uncertainty in N60 in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.FIS90</quantity>
	--/ <unit> Jy </unit>
	[FERR65] real NOT NULL,

	--/ <summary> Flux uncertainty in WIDE-S in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.FIS90</quantity>
	--/ <unit> Jy </unit> 
	[FERR90] real NOT NULL,

	--/ <summary>  Flux uncertainty in WIDE-L in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.FIS140</quantity>
	--/ <unit> Jy </unit> 
	[FERR140] real NOT NULL,

	--/ <summary> Flux uncertainty in N160 in Jansky. It is evaluated as the standard deviation of
	--/ the fluxes measured on the individual scans divided by the root square of the number of
	--/ measurements (presented in NSCANC). The error thus only includes relative uncertainty
	--/ at the measurements. Details of the flux uncertainty are discussed in Section 5.3.
	--/ When it is not possible to calculate the standard deviation, NULL is set to this column.
	--/ The text version has −99.9. </summary>	--/ <quantity>stat.error; phot.flux.density; em.IR.AKARI.FIS160</quantity>
	--/ <unit> Jy </unit> 
	[FERR160] real NOT NULL,

	--/ <summary> Flux density quality flag for N60. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>	--/ <quantity>meta.code.qual; phot.flux.density; em.IR.AKARI.FIS65</quantity>
	[FQUAL65] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for WIDE-S. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>	--/ <quantity>meta.code.qual; phot.flux.density; em.IR.AKARI.FIS90</quantity>
	[FQUAL90] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for WIDE-L. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary> 
	--/ <quantity>meta.code.qual; phot.flux.density; em.IR.AKARI.FIS140</quantity>
	[FQUAL140] tinyint NOT NULL,

	--/ <summary> Flux density quality flag for N160. Four level flux quality indicator:
	--/ 3: High quality (the source is confirmed and flux is reliable)
	--/ 2: The source is confirmed but flux is not reliable (see FLAGS)
	--/ 1: The source is not confirmed
	--/ 0: Not observed (no scan data available) </summary>	--/ <quantity>meta.code.qual; phot.flux.density; em.IR.AKARI.FIS160</quantity>
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
	--/ is defined as NULL in the FITS header. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.FIS65</quantity>
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
	--/ is defined as NULL in the FITS header. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.FIS90</quantity>
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
	--/ is defined as NULL in the FITS header. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.FIS140</quantity>
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
	--/ is defined as NULL in the FITS header. </summary>	--/ <quantity>meta.code.qual; em.IR.AKARI.FIS160</quantity>
	[FLAGS160] char(4) NOT NULL,

	--/ <summary> nScanConfirm for N60. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>	--/ <quantity>meta.number; em.IR.AKARI.FIS65</quantity>
	[NSCANC65]  int NOT NULL,

	--/ <summary> nScanConfirm for WIDE-S. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>	--/ <quantity>meta.number; em.IR.AKARI.FIS90</quantity>
	[NSCANC90] int NOT NULL,

	--/ <summary> nScanConfirm for WIDE-L. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>	--/ <quantity>meta.number; em.IR.AKARI.FIS140</quantity>
	[NSCANC140] int NOT NULL,

	--/ <summary> nScanConfirm for N160. Number of scans on which the source is properly detected with logEvidence larger than
	--/ the threshold. </summary>	--/ <quantity>meta.number; em.IR.AKARI.FIS160</quantity>
	[NSCANC160] int NOT NULL,

	--/ <summary> nScanPossible for N60. Total number of scans that passed on the source (that possibly observed the source) </summary>	--/ <quantity>meta.number; obs; em.IR.AKARI.FIS65</quantity>
	[NSCANP65] int NOT NULL,

	--/ <summary> nScanPossible for WIDE-S. Total number of scans that passed on the source (that possibly observed the source) </summary>	--/ <quantity>meta.number; obs; em.IR.AKARI.FIS90</quantity>
	[NSCANP90] int NOT NULL,

	--/ <summary> nScanPossible for WIDE-L. Total number of scans that passed on the source (that possibly observed the source) </summary>	--/ <quantity>meta.number; obs; em.IR.AKARI.FIS140</quantity>
	[NSCANP140]  int NOT NULL,

	--/ <summary> nScanPossible for N160. Total number of scans that passed on the source (that possibly observed the source) </summary>	--/ <quantity>meta.number; obvs; em.IR.AKARI.FIS160</quantity>
	[NSCANP160] int NOT NULL,

	--/ <summary> Months confirmation flag for N60. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>	--/ <quantity>meta.code; em.IR.AKARI.FIS65</quantity>
	[MCONF65] smallint NOT NULL,

	--/ <summary> Months confirmation flag for WIDE-S. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>	--/ <quantity>meta.code; em.IR.AKARI.FIS90</quantity>
	[MCONF90] smallint NOT NULL,

	--/ <summary> Months confirmation flag for WIDE-L. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>	--/ <quantity>meta.code; em.IR.AKARI.FIS140</quantity>
	[MCONF140] smallint NOT NULL,

	--/ <summary> Months confirmation flag for N160. The value is 1 when the source
	--/ is observed in the scans separated more than one months (usually an object is visible at
	--/ every 6 months). This information is independent to hours confirmation and can be 1 even
	--/ if the source is not confirmed (FQUAL = 1). Because of the visibility constraint of the
	--/ AKARI Survey, some sky regions were observed by scans only within a month. MCONF
	--/ = 0 does not mean that the source is unreliable.
	--/ This flag is NULL (−1) for FQUAL = 0 sources. </summary>	--/ <quantity>meta.code; em.IR.AKARI.FIS160</quantity>
	[MCONF160] smallint NOT NULL,

	--/ <summary> Number of neighbouring sources. Number of sources in the catalogue within the distance of 5 arcmin from the source. This
	--/ value is intended to be an indicator of crowdedness of the sky region. Since the source
	--/ extraction program is tuned so that a unique source is found within 48 arcsec radius, the
	--/ 5 arcmin radius corresponds to approximately 40 beams. </summary>	--/ <quantity>meta.number; src</quantity>
	[NDENS] int NOT NULL,

 CONSTRAINT [PK_FIS] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


