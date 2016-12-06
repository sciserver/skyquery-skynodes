USE [SkyNode_DLS]
GO

--/ <summary> The main PhotoObj table for the Deep Lens Survey catalog </summary>
--/ <remarks> The main PhotoObj table for the DLS catalog </remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>primary key</summary>
	[objid] [bigint] NOT NULL, 

	--/ <summary>master right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>master declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>htmid for spatial search</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>zoneid for spatial search</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>master coordinate origin</summary>
	[band] [char](1) NOT NULL, 

	--/ <summary>RA in B</summary>
	--/ <unit>deg</unit>
	[AlphaB] [float] NULL, 

	--/ <summary>DEC in B</summary>
	--/ <unit>deg</unit>
	[DeltaB] [float] NULL, 

	--/ <summary>position on CCD in B</summary>
	--/ <unit>pix</unit>
	[XB] [float] NULL, 

	--/ <summary>position on CCD in B</summary>
	--/ <unit>pix</unit>
	[YB] [float] NULL, 

	--/ <summary>Semi-major axis in B</summary>
	--/ <unit>pix</unit>
	[AB] [real] NULL, 

	--/ <summary>Semi-minor axis in B</summary>
	--/ <unit>pix</unit>
	[BB] [real] NULL, 

	--/ <summary>Position angle</summary>
	--/ <unit>deg</unit>
	[THETAB] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	[FLAGSB] [int] NULL, 

	--/ <summary>Aperture magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAG_APERB] [real] NULL, 

	--/ <summary>error in aperture magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAGERR_APERB] [real] NULL, 

	--/ <summary>Best magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAGB] [real] NULL, 

	--/ <summary>Error in best magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAGERRB] [real] NULL, 

	--/ <summary>Isophotal magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAG_ISOB] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in B</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOB] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <unit>pix^2</unit>
	[ISOAREAB] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	[CLASS_STARB] [real] NULL, 

	--/ <summary>RA in V</summary>
	--/ <unit>deg</unit>
	[AlphaV] [float] NULL, 

	--/ <summary>DEC in V</summary>
	--/ <unit>deg</unit>
	[DeltaV] [float] NULL, 

	--/ <summary>position on CCD in V</summary>
	--/ <unit>pix</unit>
	[XV] [float] NULL, 

	--/ <summary>position on CCD in V</summary>
	--/ <unit>pix</unit>
	[YV] [float] NULL, 

	--/ <summary>Semi-major axis in V</summary>
	--/ <unit>pix</unit>
	[AV] [real] NULL, 

	--/ <summary>Semi-minor axis in V</summary>
	--/ <unit>pix</unit>
	[BV] [real] NULL, 

	--/ <summary>Position angle in V</summary>
	--/ <unit>deg</unit>
	[THETAV] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	[FLAGSV] [int] NULL, 

	--/ <summary>Aperture magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAG_APERV] [real] NULL, 

	--/ <summary>error in aperture magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAGERR_APERV] [real] NULL, 

	--/ <summary>Best magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAGV] [real] NULL, 

	--/ <summary>Error in best magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAGERRV] [real] NULL, 

	--/ <summary>Isophotal magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAG_ISOV] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in V</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOV] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <unit>pix^2</unit>
	[ISOAREAV] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	[CLASS_STARV] [real] NULL, 

	--/ <summary>RA in R</summary>
	--/ <unit>deg</unit>
	[AlphaR] [float] NULL, 

	--/ <summary>DEC in R</summary>
	--/ <unit>deg</unit>
	[DeltaR] [float] NULL, 

	--/ <summary>position on CCD in R</summary>
	--/ <unit>pix</unit>
	[XR] [float] NULL, 

	--/ <summary>position on CCD in R</summary>
	--/ <unit>pix</unit>
	[YR] [float] NULL, 

	--/ <summary>Semi-major axis in R</summary>
	--/ <unit>pix</unit>
	[AR] [real] NULL, 

	--/ <summary>Semi-minor axis in R</summary>
	--/ <unit>pix</unit>
	[BR] [real] NULL, 

	--/ <summary>Position angle in R</summary>
	--/ <unit>deg</unit>
	[THETAR] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	[FLAGSR] [int] NULL, 

	--/ <summary>Aperture magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAG_APERR] [real] NULL, 

	--/ <summary>error in aperture magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAGERR_APERR] [real] NULL, 

	--/ <summary>Best magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAGR] [real] NULL, 

	--/ <summary>Error in best magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAGERRR] [real] NULL, 

	--/ <summary>Isophotal magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAG_ISOR] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in R</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOR] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <unit>pix^2</unit>
	[ISOAREAR] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	[CLASS_STARR] [real] NULL, 

	--/ <summary>RA in z</summary>
	--/ <unit>deg</unit>
	[Alphaz] [float] NULL, 

	--/ <summary>DEC in z</summary>
	--/ <unit>deg</unit>
	[Deltaz] [float] NULL, 

	--/ <summary>position on CCD in z</summary>
	--/ <unit>pix</unit>
	[Xz] [float] NULL, 

	--/ <summary>position on CCD in z</summary>
	--/ <unit>pix</unit>
	[Yz] [float] NULL, 

	--/ <summary>Semi-major axis in z</summary>
	--/ <unit>pix</unit>
	[Az] [real] NULL, 

	--/ <summary>Semi-minor axis in z</summary>
	--/ <unit>pix</unit>
	[Bz] [real] NULL, 

	--/ <summary>Position angle in z</summary>
	--/ <unit>deg</unit>
	[THETAz] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	[FLAGSz] [int] NULL, 

	--/ <summary>Aperture magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAG_APERz] [real] NULL, 

	--/ <summary>error in aperture magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAGERR_APERz] [real] NULL, 

	--/ <summary>Best magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAGz] [real] NULL, 

	--/ <summary>Error in best magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAGERRz] [real] NULL, 

	--/ <summary>Isophotal magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAG_ISOz] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in z</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOz] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <unit>pix^2</unit>
	[ISOAREAz] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	[CLASS_STARz] [real] NULL 
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT PK_PhotoObj PRIMARY KEY
(
	[objID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)

GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- ZoneID index
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/*
--/ <summary> Table to store precomputed JPEG images </summary>
--/ <remarks> Images are stored with their WCS.   </remarks>
CREATE TABLE [dbo].[Frame](

	--/ <summary>unique identifier of the field</summary>
	[fieldid] [bigint] NOT NULL, 

	--/ <summary>field name</summary>
	[name] [varchar](16) NOT NULL, 

	--/ <summary>ra of center</summary>
	--/ <unit>deg</unit>
	[raCen] [float] NOT NULL, 

	--/ <summary>dec of center</summary>
	--/ <unit>deg</unit>
	[decCen] [float] NOT NULL, 

	--/ <summary>pixel location of center</summary>
	--/ <unit>pix</unit>
	[crpix1] [float] NOT NULL, 

	--/ <summary>pixel location of center</summary>
	--/ <unit>pix</unit>
	[crpix2] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <unit>deg/pix</unit>
	[cd1_1] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <unit>deg/pix</unit>
	[cd1_2] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <unit>deg/pix</unit>
	[cd2_1] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <unit>deg/pix</unit>
	[cd2_2] [float] NOT NULL, 

	--/ <summary>log2 of zoom factor</summary>
	[zoom] [int] NOT NULL, 

	--/ <summary>width of image</summary>
	--/ <unit>pix</unit>
	[width] [int] NOT NULL, 

	--/ <summary>height of image</summary>
	--/ <unit>pix</unit>
	[height] [int] NOT NULL, 

	--/ <summary>pixel scale</summary>
	--/ <unit>arcsec/pix</unit>
	[scale] [float] NOT NULL, 

	--/ <summary>htmid for spatial searches</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>the binary blob of the image</summary>
	[img] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
*/