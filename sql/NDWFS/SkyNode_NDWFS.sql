USE [SkyNode_NDWFS]
GO

--/ <summary> The main Photo table for the NOAO Deep Field catalog containing the individual band detections </summary>
--/ <remarks> The main Photo table for the NOAO Deep Field catalog containing detections in   the individual bands. The merged catalog  will be located in the PhotoObjAll table </remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object id, hashed from BAND, FIELD and NUMBER</summary>
	[OBJID] [bigint] NOT NULL, 

	--/ <summary>Designates filter</summary>
	[BAND] [varchar](4) NOT NULL, 

	--/ <summary>Field identifier</summary>
	[FIELD] [varchar](16) NOT NULL, 

	--/ <summary>Object position along x</summary>
	--/ <unit>pixel</unit>
	[X_IMAGE] [real] NULL, 

	--/ <summary>Object position along y</summary>
	--/ <unit>pixel</unit>
	[Y_IMAGE] [real] NULL, 

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <unit>pixel</unit>
	[XPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <unit>pixel</unit>
	[YPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>Running object number</summary>
	[NUMBER] [int] NOT NULL, 

	--/ <summary>Isophotal flux</summary>
	--/ <unit>count</unit>
	[FLUX_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <unit>count</unit>
	[FLUXERR_ISO] [real] NULL, 

	--/ <summary>Isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISO] [real] NULL, 

	--/ <summary>Corrected isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_ISOCOR] [real] NULL, 

	--/ <summary>RMS error for corrected isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOCOR] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_01] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_02] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_03] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_04] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_05] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_06] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_07] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_08] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_09] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_10] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_15] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_20] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_01] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_02] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_03] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_04] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_05] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_06] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_07] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_08] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_09] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_10] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_15] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_20] [real] NULL, 

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_AUTO] [real] NULL, 

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_AUTO] [real] NULL, 

	--/ <summary>Kron apertures in units of A or B</summary>
	[KRON_RADIUS] [real] NULL, 

	--/ <summary>Background at centroid position</summary>
	--/ <unit>count</unit>
	[BACKGROUND] [real] NULL, 

	--/ <summary>Detection threshold above background</summary>
	--/ <unit>count</unit>
	[THRESHOLD] [real] NULL, 

	--/ <summary>Peak flux above background</summary>
	--/ <unit>count</unit>
	[FLUX_MAX] [real] NULL, 

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <unit>pixel**2</unit>
	[ISOAREA_IMAGE] [bigint] NULL, 

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Right ascension of brightest pix (J2000)</summary>
	--/ <unit>deg</unit>
	[ALPHAPEAK_J2000] [float] NULL, 

	--/ <summary>Declination of brightest pix (J2000)</summary>
	--/ <unit>deg</unit>
	[DELTAPEAK_J2000] [float] NULL, 

	--/ <summary>Variance along x</summary>
	--/ <unit>pixel**2</unit>
	[X2_IMAGE] [real] NULL, 

	--/ <summary>Variance along y</summary>
	--/ <unit>pixel**2</unit>
	[Y2_IMAGE] [real] NULL, 

	--/ <summary>Covariance between x and y</summary>
	--/ <unit>pixel**2</unit>
	[XY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CXX_IMAGE] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CYY_IMAGE] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CXY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CXX_WORLD] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CYY_WORLD] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CXY_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along major axis</summary>
	--/ <unit>pixel</unit>
	[A_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <unit>pixel</unit>
	[B_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <unit>deg</unit>
	[A_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <unit>deg</unit>
	[B_WORLD] [real] NULL, 

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <unit>deg</unit>
	[THETA_IMAGE] [real] NULL, 

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <unit>deg</unit>
	[THETA_WORLD] [real] NULL, 

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	[ELONGATION] [real] NULL, 

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	[ELLIPTICITY] [real] NULL, 

	--/ <summary>Variance of position along x</summary>
	--/ <unit>pixel**2</unit>
	[ERRX2_IMAGE] [real] NULL, 

	--/ <summary>Variance of position along y</summary>
	--/ <unit>pixel**2</unit>
	[ERRY2_IMAGE] [real] NULL, 

	--/ <summary>Covariance of position between x and y</summary>
	--/ <unit>pixel**2</unit>
	[ERRXY_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along major axis</summary>
	--/ <unit>pixel</unit>
	[ERRA_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along minor axis</summary>
	--/ <unit>pixel</unit>
	[ERRB_IMAGE] [real] NULL, 

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <unit>deg</unit>
	[ERRTHETA_IMAGE] [real] NULL, 

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <unit>pixel</unit>
	[FWHM_IMAGE] [real] NULL, 

	--/ <summary>Extraction flags</summary>
	[FLAGS] [bigint] NULL, 

	--/ <summary>FLAG-image flags OR'ed over the iso. profile</summary>
	[IMAFLAGS_ISO] [bigint] NULL, 

	--/ <summary>S/G classifier output</summary>
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


-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO


-- Index to support on the fly zone table creation
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

--/ <summary> The main Photo table for the NOAO Deep Field catalog containing the individual band detections </summary>
--/ <remarks> The main Photo table for the NOAO Deep Field catalog containing detections in   the individual bands. The merged catalog  will be located in the PhotoObjAll table </remarks>
CREATE TABLE [dbo].[PhotoObjK]
(

	--/ <summary>unique object id, hashed from BAND, FIELD and NUMBER</summary>
	[OBJID] [bigint] NOT NULL, 

	--/ <summary>Designates filter</summary>
	[BAND] [varchar](4) NOT NULL, 

	--/ <summary>Field identifier</summary>
	[FIELD] [varchar](16) NOT NULL, 

	--/ <summary>Object position along x</summary>
	--/ <unit>pixel</unit>
	[X_IMAGE] [real] NULL, 

	--/ <summary>Object position along y</summary>
	--/ <unit>pixel</unit>
	[Y_IMAGE] [real] NULL, 

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <unit>pixel</unit>
	[XPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <unit>pixel</unit>
	[YPEAK_IMAGE] [bigint] NULL, 

	--/ <summary>Running object number</summary>
	[NUMBER] [int] NOT NULL, 

	--/ <summary>Isophotal flux</summary>
	--/ <unit>count</unit>
	[FLUX_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <unit>count</unit>
	[FLUXERR_ISO] [real] NULL, 

	--/ <summary>Isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_ISO] [real] NULL, 

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISO] [real] NULL, 

	--/ <summary>Corrected isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_ISOCOR] [real] NULL, 

	--/ <summary>RMS error for corrected isophotal magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_ISOCOR] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_01] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_02] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_03] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_04] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_05] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_06] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_07] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_08] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_09] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_10] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_15] [real] NULL, 

	--/ <summary>Flux vector within fixed circular aperture(s)</summary>
	--/ <unit>count</unit>
	[FLUX_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for aperture flux(es)</summary>
	--/ <unit>count</unit>
	[FLUXERR_APER_20] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_01] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_02] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_03] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_04] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_05] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_06] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_07] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_08] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_09] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_10] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_15] [real] NULL, 

	--/ <summary>Fixed aperture magnitude vector</summary>
	--/ <unit>mag</unit>
	[MAG_APER_20] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_01] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_02] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_03] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_04] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_05] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_06] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_07] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_08] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_09] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_10] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_15] [real] NULL, 

	--/ <summary>RMS error vector for fixed aperture mag.</summary>
	--/ <unit>mag</unit>
	[MAGERR_APER_20] [real] NULL, 

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <unit>mag</unit>
	[MAG_AUTO] [real] NULL, 

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <unit>mag</unit>
	[MAGERR_AUTO] [real] NULL, 

	--/ <summary>Kron apertures in units of A or B</summary>
	[KRON_RADIUS] [real] NULL, 

	--/ <summary>Background at centroid position</summary>
	--/ <unit>count</unit>
	[BACKGROUND] [real] NULL, 

	--/ <summary>Detection threshold above background</summary>
	--/ <unit>count</unit>
	[THRESHOLD] [real] NULL, 

	--/ <summary>Peak flux above background</summary>
	--/ <unit>count</unit>
	[FLUX_MAX] [real] NULL, 

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <unit>pixel**2</unit>
	[ISOAREA_IMAGE] [bigint] NULL, 

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>Unique HTM ID</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Unique HTM ID</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Right ascension of brightest pix (J2000)</summary>
	--/ <unit>deg</unit>
	[ALPHAPEAK_J2000] [float] NULL, 

	--/ <summary>Declination of brightest pix (J2000)</summary>
	--/ <unit>deg</unit>
	[DELTAPEAK_J2000] [float] NULL, 

	--/ <summary>Variance along x</summary>
	--/ <unit>pixel**2</unit>
	[X2_IMAGE] [real] NULL, 

	--/ <summary>Variance along y</summary>
	--/ <unit>pixel**2</unit>
	[Y2_IMAGE] [real] NULL, 

	--/ <summary>Covariance between x and y</summary>
	--/ <unit>pixel**2</unit>
	[XY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CXX_IMAGE] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CYY_IMAGE] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <unit>pixel**(-2)</unit>
	[CXY_IMAGE] [real] NULL, 

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CXX_WORLD] [real] NULL, 

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CYY_WORLD] [real] NULL, 

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <unit>deg**(-2)</unit>
	[CXY_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along major axis</summary>
	--/ <unit>pixel</unit>
	[A_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <unit>pixel</unit>
	[B_IMAGE] [real] NULL, 

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <unit>deg</unit>
	[A_WORLD] [real] NULL, 

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <unit>deg</unit>
	[B_WORLD] [real] NULL, 

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <unit>deg</unit>
	[THETA_IMAGE] [real] NULL, 

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <unit>deg</unit>
	[THETA_WORLD] [real] NULL, 

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	[ELONGATION] [real] NULL, 

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	[ELLIPTICITY] [real] NULL, 

	--/ <summary>Variance of position along x</summary>
	--/ <unit>pixel**2</unit>
	[ERRX2_IMAGE] [real] NULL, 

	--/ <summary>Variance of position along y</summary>
	--/ <unit>pixel**2</unit>
	[ERRY2_IMAGE] [real] NULL, 

	--/ <summary>Covariance of position between x and y</summary>
	--/ <unit>pixel**2</unit>
	[ERRXY_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along major axis</summary>
	--/ <unit>pixel</unit>
	[ERRA_IMAGE] [real] NULL, 

	--/ <summary>RMS position error along minor axis</summary>
	--/ <unit>pixel</unit>
	[ERRB_IMAGE] [real] NULL, 

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <unit>deg</unit>
	[ERRTHETA_IMAGE] [real] NULL, 

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <unit>pixel</unit>
	[FWHM_IMAGE] [real] NULL, 

	--/ <summary>Extraction flags</summary>
	[FLAGS] [bigint] NULL, 

	--/ <summary>FLAG-image flags OR'ed over the iso. profile</summary>
	[IMAFLAGS_ISO] [bigint] NULL, 

	--/ <summary>S/G classifier output</summary>
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

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObjK_Zone] ON [dbo].[PhotoObjK] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_PhotoObjK_ZoneID] ON [dbo].[PhotoObjK] 
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
CREATE NONCLUSTERED INDEX [IX_PhotoObjK_HtmID] ON [dbo].[PhotoObjK] 
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


--/ <summary> All PhotoObjAll pairs within 2 arcseconds  </summary>
--/ <remarks> SDSS objects within 2 arcsec and their match parameters stored here.   The two halves of the pair come from different bands. The first  half of the pair  </remarks>
CREATE TABLE [dbo].[Neighbors](

	--/ <summary>The unique objId of the center object</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>The objId of the neighbor</summary>
	[neighborObjID] [bigint] NULL, 

	--/ <summary>Distance between center and neighbor</summary>
	--/ <unit>arcmins</unit>
	[distance] [float] NOT NULL, 

	--/ <summary>Filter band of the center</summary>
	[band] [varchar](3) NOT NULL, 

	--/ <summary>Filter band of the neighbor</summary>
	[neighborBand] [varchar](3) NULL 
) ON [PRIMARY]


