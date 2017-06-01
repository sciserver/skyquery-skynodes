--/ <dataset>
--/ <summary> Deep Lens Survey catalog </summary>
--/ <remarks>
--/ The Deep Lens Survey is a 20 deg2 ultra-deep multi-band sky survey. The images were taken over about 100 nights on NOAO's Blanco and Mayall 4-meter telescopes.
--/ </remarks>
--/ <url>http://matilda.physics.ucdavis.edu/working/website/index.html</url>
--/ <icon>dls.png</icon>
--/ <docpage>dls.html</docpage>
--/ </dataset>
 GO


--/ <summary> The main PhotoObj table for the Deep Lens Survey catalog </summary>
--/ <remarks> The main PhotoObj table for the DLS catalog </remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL, 

	--/ <summary>master right ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>master declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian y coordinate</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian z coordinate</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>htmid for spatial search</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>zoneid for spatial search</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>master coordinate origin</summary>
	--/ <quantity>meta;pos</quantity>
	[band] [char](1) NOT NULL, 

	--/ <summary>RA in B</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.B</quantity>
	--/ <unit>deg</unit>
	[AlphaB] [float] NULL, 

	--/ <summary>DEC in B</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.B</quantity>
	--/ <unit>deg</unit>
	[DeltaB] [float] NULL, 

	--/ <summary>position on CCD in B</summary>
	--/ <quantity>pos.cartesian.x;instr.det;em.opt.B</quantity>
	--/ <unit>pix</unit>
	[XB] [float] NULL, 

	--/ <summary>position on CCD in B</summary>
	--/ <quantity>pos.cartesian.y;instr.det;em.opt.B</quantity>
	--/ <unit>pix</unit>
	[YB] [float] NULL, 

	--/ <summary>Semi-major axis in B</summary>
	--/ <quantity>phys.size.smajAxis;em.opt.B</quantity>
	--/ <unit>pix</unit>
	[AB] [real] NULL, 

	--/ <summary>Semi-minor axis in B</summary>
	--/ <quantity>phys.size.sminAxis;em.opt.B</quantity>
	--/ <unit>pix</unit>
	[BB] [real] NULL, 

	--/ <summary>Position angle</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[THETAB] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGSB] [int] NULL, 

	--/ <summary>Aperture magnitude in B</summary>
	--/ <quantity>phot.mag.aper;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAG_APERB] [real] NULL, 

	--/ <summary>error in aperture magnitude in B</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APERB] [real] NULL, 

	--/ <summary>Best magnitude in B</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAGB] [real] NULL, 

	--/ <summary>Error in best magnitude in B</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAGERRB] [real] NULL, 

	--/ <summary>Isophotal magnitude in B</summary>
	--/ <quantity>phot.mag.isophotal;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOB] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in B</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOB] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <quantity>phys.area</quantity>
	--/ <unit>pix+2</unit>
	[ISOAREAB] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	--/ <quantity>meta.code</quantity>
	[CLASS_STARB] [real] NULL, 

	--/ <summary>RA in V</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.V</quantity>
	--/ <unit>deg</unit>
	[AlphaV] [float] NULL, 

	--/ <summary>DEC in V</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.V</quantity>
	--/ <unit>deg</unit>
	[DeltaV] [float] NULL, 

	--/ <summary>position on CCD in V</summary>
	--/ <quantity>pos.cartesian.x;instr.det;em.opt.V</quantity>
	--/ <unit>pix</unit>
	[XV] [float] NULL, 

	--/ <summary>position on CCD in V</summary>
	--/ <quantity>pos.cartesian.y;instr.det;em.opt.V</quantity>
	--/ <unit>pix</unit>
	[YV] [float] NULL, 

	--/ <summary>Semi-major axis in V</summary>
	--/ <quantity>phys.size.smajAxis;em.opt.V</quantity>
	--/ <unit>pix</unit>
	[AV] [real] NULL, 

	--/ <summary>Semi-minor axis in V</summary>
	--/ <quantity>phys.size.sminAxis;em.opt.V</quantity>
	--/ <unit>pix</unit>
	[BV] [real] NULL, 

	--/ <summary>Position angle in V</summary>
	--/ <quantity>pos.posAng;em.opt.V</quantity>
	--/ <unit>deg</unit>
	[THETAV] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGSV] [int] NULL, 

	--/ <summary>Aperture magnitude in V</summary>
	--/ <quantity>phot.mag.aper;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAG_APERV] [real] NULL, 

	--/ <summary>error in aperture magnitude in V</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APERV] [real] NULL, 

	--/ <summary>Best magnitude in V</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAGV] [real] NULL, 

	--/ <summary>Error in best magnitude in V</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAGERRV] [real] NULL, 

	--/ <summary>Isophotal magnitude in V</summary>
	--/ <quantity>phot.mag.isophotal;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOV] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in V</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOV] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <quantity>phys.area</quantity>
	--/ <unit>pix+2</unit>
	[ISOAREAV] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	--/ <quantity>meta</quantity>
	[CLASS_STARV] [real] NULL, 

	--/ <summary>RA in R</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.R</quantity>
	--/ <unit>deg</unit>
	[AlphaR] [float] NULL, 

	--/ <summary>DEC in R</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.R</quantity>
	--/ <unit>deg</unit>
	[DeltaR] [float] NULL, 

	--/ <summary>position on CCD in R</summary>
	--/ <quantity>pos.cartesian.x;instr.det;em.opt.R</quantity>
	--/ <unit>pix</unit>
	[XR] [float] NULL, 

	--/ <summary>position on CCD in R</summary>
	--/ <quantity>pos.cartesian.y;instr.det;em.opt.R</quantity>
	--/ <unit>pix</unit>
	[YR] [float] NULL, 

	--/ <summary>Semi-major axis in R</summary>
	--/ <quantity>phys.size.smajAxis;em.opt.R</quantity>
	--/ <unit>pix</unit>
	[AR] [real] NULL, 

	--/ <summary>Semi-minor axis in R</summary>
	--/ <quantity>phys.size.sminAxis;em.opt.R</quantity>
	--/ <unit>pix</unit>
	[BR] [real] NULL, 

	--/ <summary>Position angle in R</summary>
	--/ <quantity>pos.posAng;em.opt.R</quantity>
	--/ <unit>deg</unit>
	[THETAR] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGSR] [int] NULL, 

	--/ <summary>Aperture magnitude in R</summary>
	--/ <quantity>phot.mag.aper;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAG_APERR] [real] NULL, 

	--/ <summary>error in aperture magnitude in R</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APERR] [real] NULL, 

	--/ <summary>Best magnitude in R</summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAGR] [real] NULL, 

	--/ <summary>Error in best magnitude in R</summary>
	--/ <quantity>stat.error;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAGERRR] [real] NULL, 

	--/ <summary>Isophotal magnitude in R</summary>
	--/ <quantity>phot.mag.isophotal;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOR] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in R</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOR] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <quantity>phys.area</quantity>
	--/ <unit>pix+2</unit>
	[ISOAREAR] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	--/ <quantity>meta</quantity>
	[CLASS_STARR] [real] NULL, 

	--/ <summary>RA in z</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.SDSS.z</quantity>
	--/ <unit>deg</unit>
	[Alphaz] [float] NULL, 

	--/ <summary>DEC in z</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.SDSS.z</quantity>
	--/ <unit>deg</unit>
	[Deltaz] [float] NULL, 

	--/ <summary>position on CCD in z</summary>
	--/ <quantity>pos.cartesian.x;instr.det;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[Xz] [float] NULL, 

	--/ <summary>position on CCD in z</summary>
	--/ <quantity>pos.cartesian.y;instr.det;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[Yz] [float] NULL, 

	--/ <summary>Semi-major axis in z</summary>
	--/ <quantity>phys.size.smajAxis;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[Az] [real] NULL, 

	--/ <summary>Semi-minor axis in z</summary>
	--/ <quantity>phys.size.sminAxis;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[Bz] [real] NULL, 

	--/ <summary>Position angle in z</summary>
	--/ <quantity>pos.posAng;em.opt.SDSS.z</quantity>
	--/ <unit>deg</unit>
	[THETAz] [real] NULL, 

	--/ <summary>Flags from Sextractor</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGSz] [int] NULL, 

	--/ <summary>Aperture magnitude in z</summary>
	--/ <quantity>phot.mag.aper;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAG_APERz] [real] NULL, 

	--/ <summary>error in aperture magnitude in z</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APERz] [real] NULL, 

	--/ <summary>Best magnitude in z</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAGz] [real] NULL, 

	--/ <summary>Error in best magnitude in z</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAGERRz] [real] NULL, 

	--/ <summary>Isophotal magnitude in z</summary>
	--/ <quantity>phot.mag.isophotal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOz] [real] NULL, 

	--/ <summary>Error in isophotal magnitude in z</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOz] [real] NULL, 

	--/ <summary>Isophotal area</summary>
	--/ <quantity>phys.size.area</quantity>
	--/ <unit>pix+2</unit>
	[ISOAREAz] [real] NULL, 

	--/ <summary>Fuzzy classifier</summary>
	--/ <quantity>meta</quantity>
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


/*
--/ <summary> Table to store precomputed JPEG images </summary>
	--/ <quantity></quantity>
--/ <remarks> Images are stored with their WCS.   </remarks>
CREATE TABLE [dbo].[Frame](

	--/ <summary>unique identifier of the field</summary>
	--/ <quantity></quantity>
	[fieldid] [bigint] NOT NULL, 

	--/ <summary>field name</summary>
	--/ <quantity></quantity>
	[name] [varchar](16) NOT NULL, 

	--/ <summary>ra of center</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[raCen] [float] NOT NULL, 

	--/ <summary>dec of center</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[decCen] [float] NOT NULL, 

	--/ <summary>pixel location of center</summary>
	--/ <quantity></quantity>
	--/ <unit>pix</unit>
	[crpix1] [float] NOT NULL, 

	--/ <summary>pixel location of center</summary>
	--/ <quantity></quantity>
	--/ <unit>pix</unit>
	[crpix2] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <quantity></quantity>
	--/ <unit>deg/pix</unit>
	[cd1_1] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <quantity></quantity>
	--/ <unit>deg/pix</unit>
	[cd1_2] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <quantity></quantity>
	--/ <unit>deg/pix</unit>
	[cd2_1] [float] NOT NULL, 

	--/ <summary>element of WCS CD matrix</summary>
	--/ <quantity></quantity>
	--/ <unit>deg/pix</unit>
	[cd2_2] [float] NOT NULL, 

	--/ <summary>log2 of zoom factor</summary>
	--/ <quantity></quantity>
	[zoom] [int] NOT NULL, 

	--/ <summary>width of image</summary>
	--/ <quantity></quantity>
	--/ <unit>pix</unit>
	[width] [int] NOT NULL, 

	--/ <summary>height of image</summary>
	--/ <quantity></quantity>
	--/ <unit>pix</unit>
	[height] [int] NOT NULL, 

	--/ <summary>pixel scale</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec/pix</unit>
	[scale] [float] NOT NULL, 

	--/ <summary>htmid for spatial searches</summary>
	--/ <quantity></quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity></quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity></quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity></quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>the binary blob of the image</summary>
	--/ <quantity></quantity>
	[img] [image] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
*/