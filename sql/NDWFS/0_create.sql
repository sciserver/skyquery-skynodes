--/ <dataset>
--/ <summary> NOAO Deep Wide-Field Survey </summary>
--/ <remarks>
--/ The NOAO Deep Wide-Field Survey (NDWFS) is a deep optical and near-infrared imaging survey that 
--/ covers two 9.3 square degree fields. It was designed primarily for the study of the existence and 
--/ evolution of large scale structures at redshifts z>1 as sampled by diverse populations of objects. 
--/ </remarks>
--/ <url>https://www.noao.edu/noao/noaodeep/</url>
--/ <icon>ndwfs.png</icon>
--/ <docpage>ndwfs.html</docpage>
--/ </dataset>
 GO


--/ <summary> The main Photo table for the NOAO Deep Field catalog containing the individual band detections </summary>
--/ <remarks> The main Photo table for the NOAO Deep Field catalog containing detections in   the individual bands. The merged catalog  will be located in the PhotoObjAll table </remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object id, hashed from BAND, FIELD and NUMBER</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[OBJID] [bigint] NOT NULL, 

	--/ <summary>Designates filter</summary>
	--/ <quantity>instr.filter</quantity>
	[BAND] [varchar](4) NOT NULL, 

	--/ <summary>Field identifier</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[FIELD] [varchar](16) NOT NULL, 

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[X_IMAGE] [real] NULL, 

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[Y_IMAGE] [real] NULL, 

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[XPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pixel</unit>
	[YPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>Running object number</summary>
	--/ <quantity>meta.id</quantity>
	[NUMBER] [int] NOT NULL, 

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal</quantity>
	--/ <unit>count</unit>
	[FLUX_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal</quantity>
	--/ <unit>count</unit>
	[FLUXERR_ISO] [real] NULL, 

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAG_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISO] [real] NULL, 

	--/ <summary>Corrected isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOCOR] [real] NULL, 

	--/ <summary>RMS error for corrected isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOCOR] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_01] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_02] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_03] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_04] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_05] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_06] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_07] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_08] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_09] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_10] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_15] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_20] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_01] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_02] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_03] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_04] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_05] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_06] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_07] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_08] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_09] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_10] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_15] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_20] [real] NULL, 

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_AUTO] [real] NULL, 

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_AUTO] [real] NULL, 

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[KRON_RADIUS] [real] NULL, 

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>instr.background</quantity>
	--/ <unit>count</unit>
	[BACKGROUND] [real] NULL, 

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.sensitivity</quantity>
	--/ <unit>count</unit>
	[THRESHOLD] [real] NULL, 

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	--/ <unit>count</unit>
	[FLUX_MAX] [real] NULL, 

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>pixel+2</unit>
	[ISOAREA_IMAGE] [bigint] NULL, 

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Right ascension of brightest pix (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ALPHAPEAK_J2000] [float] NULL, 

	--/ <summary>Declination of brightest pix (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[DELTAPEAK_J2000] [float] NULL, 

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[X2_IMAGE] [real] NULL, 

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[Y2_IMAGE] [real] NULL, 

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	--/ <unit>pixel+2</unit>
	[XY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CXX_IMAGE] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CYY_IMAGE] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CXY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CXX_WORLD] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CYY_WORLD] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CXY_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>pixel</unit>
	[A_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>pixel</unit>
	[B_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>deg</unit>
	[A_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>deg</unit>
	[B_WORLD] [real] NULL, 

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[THETA_IMAGE] [real] NULL, 

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[THETA_WORLD] [real] NULL, 

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>phys.angSize.axisRatio</quantity>
	[ELONGATION] [real] NULL, 

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[ELLIPTICITY] [real] NULL, 

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRX2_IMAGE] [real] NULL, 

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRY2_IMAGE] [real] NULL, 

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRXY_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>pixel</unit>
	[ERRA_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>pixel</unit>
	[ERRB_IMAGE] [real] NULL, 

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>stat.error;pos.posAng</quantity>
	--/ <unit>deg</unit>
	[ERRTHETA_IMAGE] [real] NULL, 

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pixel</unit>
	[FWHM_IMAGE] [real] NULL, 

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGS] [bigint] NULL, 

	--/ <summary>FLAG-image flags OR'ed over the iso. profile</summary>
	--/ <quantity>meta.code</quantity>
	[IMAFLAGS_ISO] [bigint] NULL, 

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[CLASS_STAR] [real] NULL 
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PhotoObj] 
ADD PRIMARY KEY CLUSTERED 
(
	[OBJID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO


--/ <summary> The main Photo table for the NOAO Deep Field catalog containing the individual band detections </summary>
--/ <remarks> The main Photo table for the NOAO Deep Field catalog containing detections in   the individual bands. The merged catalog  will be located in the PhotoObjAll table </remarks>
CREATE TABLE [dbo].[PhotoObjK]
(

	--/ <summary>unique object id, hashed from BAND, FIELD and NUMBER</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[OBJID] [bigint] NOT NULL, 

	--/ <summary>Designates filter</summary>
	--/ <quantity>instr.filter</quantity>
	[BAND] [varchar](4) NOT NULL, 

	--/ <summary>Field identifier</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[FIELD] [varchar](16) NOT NULL, 

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pixel</unit>
	[X_IMAGE] [real] NULL, 

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pixel</unit>
	[Y_IMAGE] [real] NULL, 

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pixel</unit>
	[XPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pixel</unit>
	[YPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>Running object number</summary>
	--/ <quantity>meta.id</quantity>
	[NUMBER] [int] NOT NULL, 

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal</quantity>
	--/ <unit>count</unit>
	[FLUX_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal</quantity>
	--/ <unit>count</unit>
	[FLUXERR_ISO] [real] NULL, 

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAG_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISO] [real] NULL, 

	--/ <summary>Corrected isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAG_ISOCOR] [real] NULL, 

	--/ <summary>RMS error for corrected isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[MAGERR_ISOCOR] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_01] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_02] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_03] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_04] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_05] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_06] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_07] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_08] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_09] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_10] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_15] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <quantity>phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUX_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <quantity>stat.error;phot.flux.aper</quantity>
	--/ <unit>count</unit>
	[FLUXERR_APER_20] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_01] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_02] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_03] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_04] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_05] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_06] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_07] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_08] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_09] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_10] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_15] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_APER_20] [real] NULL, 

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAG_AUTO] [real] NULL, 

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper</quantity>
	--/ <unit>mag</unit>
	[MAGERR_AUTO] [real] NULL, 

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[KRON_RADIUS] [real] NULL, 

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>instr.background</quantity>
	--/ <unit>count</unit>
	[BACKGROUND] [real] NULL, 

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.sensitivity</quantity>
	--/ <unit>count</unit>
	[THRESHOLD] [real] NULL, 

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	--/ <unit>count</unit>
	[FLUX_MAX] [real] NULL, 

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>pixel+2</unit>
	[ISOAREA_IMAGE] [bigint] NULL, 

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>Unique HTM ID</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Unique HTM ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Right ascension of brightest pix (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ALPHAPEAK_J2000] [float] NULL, 

	--/ <summary>Declination of brightest pix (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[DELTAPEAK_J2000] [float] NULL, 

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[X2_IMAGE] [real] NULL, 

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[Y2_IMAGE] [real] NULL, 

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	--/ <unit>pixel+2</unit>
	[XY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CXX_IMAGE] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CYY_IMAGE] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>pixel-2</unit>
	[CXY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CXX_WORLD] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CYY_WORLD] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	--/ <unit>deg-2</unit>
	[CXY_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>pixel</unit>
	[A_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>pixel</unit>
	[B_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>deg</unit>
	[A_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>deg</unit>
	[B_WORLD] [real] NULL, 

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[THETA_IMAGE] [real] NULL, 

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[THETA_WORLD] [real] NULL, 

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>phys.angSize.axisRatio</quantity>
	[ELONGATION] [real] NULL, 

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[ELLIPTICITY] [real] NULL, 

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRX2_IMAGE] [real] NULL, 

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRY2_IMAGE] [real] NULL, 

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	--/ <unit>pixel+2</unit>
	[ERRXY_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>stat.error;phys.angSize.smajAxis</quantity>
	--/ <unit>pixel</unit>
	[ERRA_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>stat.error;phys.angSize.sminAxis</quantity>
	--/ <unit>pixel</unit>
	[ERRB_IMAGE] [real] NULL, 

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>stat.error;pos.posAng</quantity>
	--/ <unit>deg</unit>
	[ERRTHETA_IMAGE] [real] NULL, 

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pixel</unit>
	[FWHM_IMAGE] [real] NULL, 

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGS] [bigint] NULL, 

	--/ <summary>FLAG-image flags OR'ed over the iso. profile</summary>
	--/ <quantity>meta.code</quantity>
	[IMAFLAGS_ISO] [bigint] NULL, 

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[CLASS_STAR] [real] NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[PhotoObjK] 
ADD CONSTRAINT [PK_PhotoObjK] PRIMARY KEY CLUSTERED 
(
	[OBJID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO



--/ <summary> All PhotoObjAll pairs within 2 arcseconds  </summary>
--/ <remarks> SDSS objects within 2 arcsec and their match parameters stored here.   The two halves of the pair come from different bands. The first  half of the pair  </remarks>
CREATE TABLE [dbo].[Neighbors](

	--/ <summary>The unique objId of the center object</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>The objId of the neighbor</summary>
	--/ <quantity>meta.id</quantity>
	[neighborObjID] [bigint] NULL, 

	--/ <summary>Distance between center and neighbor</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcmin</unit>
	[distance] [float] NOT NULL, 

	--/ <summary>Filter band of the center</summary>
	--/ <quantity>instr.filter</quantity>
	[band] [varchar](3) NOT NULL, 

	--/ <summary>Filter band of the neighbor</summary>
	--/ <quantity>instr.filter</quantity>
	[neighborBand] [varchar](3) NULL 
) ON [PRIMARY]


