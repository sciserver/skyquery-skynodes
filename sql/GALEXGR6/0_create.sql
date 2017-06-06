--/ <dataset>
--/ <summary> The Galaxy Evolution Explorer General Release 6 </summary>
--/ <remarks>
--/ 
--/ </remarks>
--/ <url>http://galex.stsci.edu/GR6/</url>
--/ <icon>galexgr6.png</icon>
--/ <docpage>galexgr6.html</docpage>
--/ </dataset>
GO
 
--/ <summary> Auxiliary information about the observation commands sent to the spacecraft </summary>
--/ <remarks>	</remarks>
CREATE TABLE [dbo].[acsData](
	--/ <summary>Eclipse number</summary>
	--/ <quantity>meta.id</quantity>
	[eclipse_num] [int] NOT NULL,

	--/ <summary>Pointer to target</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](32) NOT NULL,

	--/ <summary>Time of command execution, relative to start of eclipse</summary>
	--/ <quantity>time.duration</quantity>
	[offset_secs] [float] NOT NULL,

	--/ <summary>Observation mode</summary>
	--/ <quantity>obs.param</quantity>
	[mode] [varchar](8) NOT NULL,

	--/ <summary>Boresight right ascension, J2000 frame</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Boresight declination, J2000 frame</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Satellite twist angle aka roll</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[twist] [float] NOT NULL,

	--/ <summary>X axis rotation rate</summary>
	--/ <quantity>phys.veloc.rotat;pos.cartesian.x</quantity>
	--/ <unit>rad s-1</unit>
	[omegax] [float] NOT NULL,

	--/ <summary>Y axis rotation rate</summary>
	--/ <quantity>phys.veloc.rotat;pos.cartesian.y</quantity>
	--/ <unit>rad s-1</unit>
	[omegay] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmId] [bigint] NOT NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneId] [int] NOT NULL,
	CONSTRAINT [PK_acsData] PRIMARY KEY CLUSTERED 
	(
		[eclipse_num] ASC,
		[target_id] ASC,
		[offset_secs] ASC
	) WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
) ON [PRIMARY]


GO

--/ <summary>  </summary>
--/ <remarks>  </remarks>
CREATE TABLE [dbo].[DataConstants](
	[field] [varchar](64) NULL,
	[name] [varchar](64) NULL,
	[value] [binary](8) NULL,
	[description] [varchar](2048) NULL
) ON [PRIMARY]

GO


--/ <summary> Direct or spectro image characteristics for an image </summary>
--/ <remarks> Contains a record describing the attributes for each single image NUV o FUV </remarks>
CREATE TABLE [dbo].[img](
	--/ <summary>Pointer to IMG Table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgID] [bigint] NOT NULL,

	--/ <summary>Pointer to imgrun table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgRunID] [bigint] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq</quantity>
	[ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.dec</quantity>
	[dec_cent] [float] NULL,

	--/ <summary>Reduction version (high level)</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[tileNum] [int] NULL,

	[tile] [varchar](32) NULL,

	--/ <summary>Observation type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code</quantity>
	[ow] [int] NULL,

	--/ <summary>Reduction product number (type)</summary>
	--/ <quantity>meta.id</quantity>
	[prod] [int] NULL,

	--/ <summary>pointer to the extraction of the two NUV and FUV images</summary>
	--/ <quantity>meta.id</quantity>
	[img] [int] NULL,

	--/ <summary>Reduction try number (low level)</summary>
	--/ <quantity>meta.id</quantity>
	[try] [int] NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuv_fileNPath] [varchar](256) NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuv_fileNPath] [varchar](256) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[nuv_simple] [varchar](32) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_simple] [varchar](32) NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_bitpix] [int] NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_bitpix] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis1] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis1] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis2] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis2] [int] NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity></quantity>
	[nuv_extend] [varchar](32) NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_extend] [varchar](32) NULL,

	[nuv_longstrn] [varchar](32) NULL,

	[fuv_longstrn] [varchar](32) NULL,

	[nuv_cdelt1] [float] NULL,

	[fuv_cdelt1] [float] NULL,

	[nuv_cdelt2] [float] NULL,

	[fuv_cdelt2] [float] NULL,

	--/ <quantity>time.equinox</quantity>
	[nuv_equinox] [float] NULL,

	--/ <quantity>time.equinox</quantity>
	[fuv_equinox] [float] NULL,

	--/ <quantity>time.epoch</quantity>
	[nuv_epoch] [float] NULL,

	--/ <quantity>time.epoch</quantity>
	[fuv_epoch] [float] NULL,

	[nuv_ctype1] [varchar](32) NULL,

	[fuv_ctype1] [varchar](32) NULL,

	[nuv_ctype2] [varchar](32) NULL,

	[fuv_ctype2] [varchar](32) NULL,

	[nuv_crpix1] [float] NULL,

	[fuv_crpix1] [float] NULL,

	[nuv_crpix2] [float] NULL,

	[fuv_crpix2] [float] NULL,

	[nuv_crval1] [float] NULL,

	[fuv_crval1] [float] NULL,

	[nuv_crval2] [float] NULL,

	[fuv_crval2] [float] NULL,

	[nuv_crota2] [float] NULL,

	[fuv_crota2] [float] NULL,

	[nuv_bunit] [varchar](32) NULL,

	[fuv_bunit] [varchar](32) NULL,

	[nuv_bscale] [float] NULL,

	[fuv_bscale] [float] NULL,

	[nuv_bzero] [float] NULL,

	[fuv_bzero] [float] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[nuv_band] [int] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[fuv_band] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[nuv_ow] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[fuv_ow] [int] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[nuv_ra_cent] [float] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[fuv_ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[nuv_dec_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[fuv_dec_cent] [float] NULL,

	--/ <summary>Satellite twist angle aka roll</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[nuv_twist] [float] NULL,

	--/ <summary>Satellite twist angle aka roll</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[fuv_twist] [float] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_leg] [int] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_leg] [int] NULL,

	[nuv_mpsnpos] [int] NULL,

	[fuv_mpsnpos] [int] NULL,

	[nuv_object] [varchar](128) NULL,

	[fuv_object] [varchar](128) NULL,

	[nuv_expstart] [float] NULL,

	[fuv_expstart] [float] NULL,

	--/ <quantity>time.epoch;obs</quantity>
	[nuv_obs_date] [varchar](32) NULL,

	--/ <quantity>time.epoch;obs</quantity>
	[fuv_obs_date] [varchar](32) NULL,

	--/ <quantity>time.epoch</quantity>
	[nuv_time_obs] [varchar](32) NULL,

	--/ <quantity>time.epoch</quantity>
	[fuv_time_obs] [varchar](32) NULL,

	--/ <quantity>meta.id</quantity>
	[nuv_planid] [int] NULL,

	--/ <quantity>meta.id</quantity>
	[fuv_planid] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_tilenum] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_tilenum] [int] NULL,

	[nuv_tile] [varchar](64) NULL,

	[fuv_tile] [varchar](64) NULL,

	--/ <quantity>meta.id</quantity>
	[nuv_tilename] [varchar](64) NULL,

	--/ <quantity>meta.id</quantity>
	[fuv_tilename] [varchar](64) NULL,

	[nuv_mpsplan] [varchar](32) NULL,

	[fuv_mpsplan] [varchar](32) NULL,

	[nuv_mpstype] [varchar](32) NULL,

	[fuv_mpstype] [varchar](32) NULL,

	[nuv_mpsphase] [varchar](32) NULL,

	[fuv_mpsphase] [varchar](32) NULL,

	[nuv_skygrid] [int] NULL,

	[fuv_skygrid] [int] NULL,

	[nuv_nhvnom] [float] NULL,

	[fuv_nhvnom] [float] NULL,

	[nuv_nhvnomn] [float] NULL,

	[fuv_nhvnomn] [float] NULL,

	[nuv_nhvnomf] [float] NULL,

	[fuv_nhvnomf] [float] NULL,

	[nuv_grelease] [varchar](32) NULL,

	[fuv_grelease] [varchar](32) NULL,

	[nuv_phtfirst] [float] NULL,

	[fuv_phtfirst] [float] NULL,

	[nuv_phtlast] [float] NULL,

	[fuv_phtlast] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[nuv_exptime] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[fuv_exptime] [float] NULL,

	[nuv_ngaps] [float] NULL,

	[fuv_ngaps] [float] NULL,

	[nuv_totread] [float] NULL,

	[fuv_totread] [float] NULL,

	[nuv_totmap] [float] NULL,

	[fuv_totmap] [float] NULL,

	[nuv_totonmap] [float] NULL,

	[fuv_totonmap] [float] NULL,

	[nuv_rrmed] [float] NULL,

	[fuv_rrmed] [float] NULL,

	[nuv_rrave] [float] NULL,

	[fuv_rrave] [float] NULL,

	[nuv_naspok] [float] NULL,

	[fuv_naspok] [float] NULL,

	[nuv_avefdead] [float] NULL,

	[fuv_avefdead] [float] NULL,

	[nuv_expend] [float] NULL,

	[fuv_expend] [float] NULL,

	[nuv_nadded] [float] NULL,

	[fuv_nadded] [float] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;stat.mean</quantity>
	[nuv_avaspra] [float] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;stat.mean</quantity>
	[fuv_avaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;stat.mean</quantity>
	[nuv_avaspdec] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;stat.mean</quantity>
	[fuv_avaspdec] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	[nuv_avasprol] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng;stat.mean</quantity>
	[fuv_avasprol] [float] NULL,

	[nuv_avrrmed] [float] NULL,

	[fuv_avrrmed] [float] NULL,

	[nuv_avrrave] [float] NULL,

	[fuv_avrrave] [float] NULL,

	[nuv_pmedrr] [float] NULL,

	[fuv_pmedrr] [float] NULL,

	[nuv_pthresh] [float] NULL,

	[fuv_pthresh] [float] NULL,

	[nuv_pmedbg] [float] NULL,

	[fuv_pmedbg] [float] NULL,

	[nuv_prmsbg] [float] NULL,

	[fuv_prmsbg] [float] NULL,

	[nuv_pthrbg] [float] NULL,

	[fuv_pthrbg] [float] NULL,

	[nuv_psigdet] [float] NULL,

	[fuv_psigdet] [float] NULL,

	[nuv_pmedthr] [float] NULL,

	[fuv_pmedthr] [float] NULL,

	[nuv_prmsthr] [float] NULL,

	[fuv_prmsthr] [float] NULL,

	[subvis] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[subGridId] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[gridId] [int] NULL,

	--/ <summary>indicates GR release, 2.0, 3.0, ...</summary>
	--/ <quantity>meta.version</quantity>
	[GRReleaseNumber] [real] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmid] [bigint] NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [int] NULL,

 CONSTRAINT [PKImg] PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--/ <summary> Image generation parameters </summary>
--/ <remarks> Each record contains the parameters to generate the image in grism or direct mode.&lt;br>  For each Target there are at least two entries. </remarks>
CREATE TABLE [dbo].[ImgRun](

	--/ <quantity>meta.id</quantity>
	[imgRunID] [bigint] NOT NULL,

	--/ <quantity>meta.id</quantity>
	[ParentImgRunID] [bigint] NULL,
	
	--/ <summary>foreign key for imgRunObsPendingJoin</summary>
	--/ <quantity>meta.id</quantity>
	[joinID] [int] NULL,

	--/ <summary>tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tileNum] [int] NULL,

	--/ <summary>spectral tile number</summary>
	--/ <quantity>meta.id</quantity>
	[specTileNum] [int] NULL,

	--/ <summary>is this record from a visit or from a coadd, possible values are (visitI,coaddI, visitS, coaddS, visitIAIS)</summary>
	--/ <quantity>meta.note</quantity>
	[source] [varchar](12) NULL,

	--/ <summary>Number of photometric object</summary>
	--/ <quantity>meta.number;phot</quantity>
	[nPhotoObjects] [int] NULL,

	--/ <summary>Number of visits</summary>
	--/ <quantity>meta.number;obs</quantity>
	[nPhotoVisits] [int] NULL,

	--/ <summary>Photometric observation date</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[PhotoObsDate] [datetime] NULL,

	[spectra] [bit] NULL,

	--/ <summary>Number of visits</summary>
	--/ <quantity>meta.number;spect</quantity>
	[nSpectra] [int] NULL,

	--/ <summary>Number of visits</summary>
	--/ <quantity>meta.number;spect</quantity>
	[nSpectraVisits] [int] NULL,

	--/ <summary>Spectroscopic observation date</summary>
	--/ <quantity>time.epoch;spect</quantity>
	[SpecObsDate] [datetime] NULL,

	--/ <summary>visit number assigned by caltech, applies to both spectra and imaging</summary>
	--/ <quantity>meta.id</quantity>
	[visitNum] [smallint] NULL,

	--/ <summary>leg, subvisit,</summary>
	--/ <quantity>meta.code</quantity>
	[subvis] [smallint] NULL,

	--/ <summary>minimum observation for this coadd imaging tile</summary>
	--/ <quantity>time.epoch;obs;stat.min</quantity>
	[minPhotoObsDate] [datetime] NULL,

	--/ <summary>maximum observation for this coadd imaging tile</summary>
	--/ <quantity>time.epoch;obs;stat.max</quantity>
	[maxPhotoObsDate] [datetime] NULL,

	--/ <summary>minimum observation for this coadd spectroscopic tile</summary>
	--/ <quantity>time.epoch;spect;stat.min</quantity>
	[minSpecObsDate] [datetime] NULL,

	--/ <summary>maximum observation for this coadd spectroscopic tile</summary>
	--/ <quantity>time.epoch;spect;stat.max</quantity>
	[maxSpecObsDate] [datetime] NULL,
 CONSTRAINT [PKImgRun] PRIMARY KEY CLUSTERED 
(
	[imgRunID] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--/ <summary> Extraction run information </summary>
--/ <remarks> Each record contains the extraction parameters for NUV and FUV band. </remarks>
CREATE TABLE [dbo].[photoextract](
	--/ <summary>pointer to the extraction of the two NUV and FUV images</summary>
	--/ <quantity>meta.id</quantity>
	[photoExtractID] [bigint] NOT NULL,

	--/ <summary>Pointer to IMG Table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgID] [bigint] NOT NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.note</quantity>
	[FileNPath] [varchar](256) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[simple] [varchar](32) NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[bitpix] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[naxis] [int] NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity>meta.note</quantity>
	[extend] [varchar](32) NULL,

	[origin] [varchar](32) NULL,

	--/ <summary>NUV source catalog file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvfile] [varchar](256) NULL,

	--/ <summary>FUV source catalog file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvfile] [varchar](256) NULL,

	--/ <summary>NUV weight image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvwtfil] [varchar](256) NULL,

	--/ <summary>FUV weight image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvwtfil] [varchar](256) NULL,

	--/ <summary>NUV count image file (</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvcntfi] [varchar](256) NULL,

	--/ <summary>FUV count image file (</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvcntfi] [varchar](256) NULL,

	--/ <summary>NUV intensity image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvintfi] [varchar](256) NULL,

	--/ <summary>FUV intensity image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvintfi] [varchar](256) NULL,

	--/ <summary>NUV literal weight file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvlwtfi] [varchar](256) NULL,

	--/ <summary>FUV literal weight file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvlwtfi] [varchar](256) NULL,

	--/ <summary>NUV sky background file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvskyfi] [varchar](256) NULL,

	--/ <summary>FUV sky background file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvskyfi] [varchar](256) NULL,

	--/ <summary>NUV artifact flags file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvflgfi] [varchar](256) NULL,

	--/ <summary>FUV artifact flags file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvflgfi] [varchar](256) NULL,

	--/ <summary>RTA star m</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[mchfile] [varchar](256) NULL,

	[starcat] [varchar](256) NULL,

	[nstar] [int] NULL,

	[nmch] [int] NULL,

	[rmean] [float] NULL,

	[rmeansd] [float] NULL,

	[rstddev] [float] NULL,

	[rmin] [float] NULL,

	[rmax] [float] NULL,

	[acnmch] [int] NULL,

	[acrave] [float] NULL,

	[acravsd] [float] NULL,

	[acrsd] [float] NULL,

	[acrmin] [float] NULL,

	[acrmax] [float] NULL,

	--/ <summary>Minimum S/N for NUV merges.</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[nuvs2n] [float] NULL,

	--/ <summary>Minimum S/N for FUV merges.</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[fuvs2n] [float] NULL,

	--/ <summary>S/N Cutoff for any NUV sources.</summary>
	--/ <quantity>stat.snr</quantity>
	[nuvs2ncu] [float] NULL,

	--/ <summary>S/N Cutoff for any FUV sources.</summary>
	--/ <quantity>stat.snr</quantity>
	[fuvs2ncu] [float] NULL,

	--/ <summary>Number of NUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[nuvnum] [int] NULL,

	--/ <summary>Number of FUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[fuvnum] [int] NULL,

	--/ <summary>Maximum separation in arcsec.</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>arcsec</unit>
	[seplim] [float] NULL,

	--/ <summary>Accept all witin this separation in arcsec.</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>arcsec</unit>
	[autosep] [float] NULL,

	--/ <summary>Minimum probability for matches.</summary>
	--/ <quantity>stat.probability;stat.min</quantity>
	[problim] [varchar](32) NULL,

	--/ <summary>NUV median background in pho/s/sq.arcmin</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[nuvback] [float] NULL,

	--/ <summary>FUV median background in pho/s/sq.arcmin</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[fuvback] [float] NULL,

	--/ <summary>Band Separation Correction in X(ra) (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bsc_x] [float] NULL,

	--/ <summary>Band Separation Correction in Y(dec)(arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bsc_y] [float] NULL,

	--/ <summary>Radial error in correction estimate (arcsec)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>arcsec</unit>
	[bsc_e] [float] NULL,

	--/ <summary>Number of points used in band separ. estimate</summary>
	--/ <quantity>meta.number</quantity>
	[bsc_n] [float] NULL,

	--/ <summary>Un-matched FUV Cand. w/s2n>NUVS2N(usu. 2) /sq.d</summary>
	--/ <quantity></quantity>
	[fufdenc] [float] NULL,

	--/ <summary>Number unfilled NUV w/possbl FUV match(any S/N)</summary>
	--/ <quantity>meta.number</quantity>
	[nufmat] [int] NULL,

	--/ <summary>Number unfilled FUV w/possbl NUV match(any S/N)</summary>
	--/ <quantity>meta.number</quantity>
	[fufmat] [int] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[dec_cent] [float] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[rao] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[deco] [float] NULL,

	--/ <summary>Total number of sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totnum] [int] NULL,

	--/ <summary>Number of filled sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totfill] [int] NULL,

	--/ <summary>Number of unfilled NUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totufn] [int] NULL,

	--/ <summary>Number of unfilled FUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totuff] [int] NULL,

	--/ <summary>Largest NUV ID number plus one.</summary>
	--/ <quantity>meta.id</quantity>
	[lrgnuvid] [int] NULL,

	--/ <summary>Field center galactic longitude (deg)</summary>
	--/ <quantity>pos.galactic.lon;obs.field</quantity>
	[glono] [float] NULL,

	--/ <summary>Field center galactic lattitude (deg)</summary>
	--/ <quantity>pos.galactic.lat;obs.field</quantity>
	[glato] [float] NULL,

	--/ <summary>NUV Zero Point Magnitude</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	[n_zpmag] [float] NULL,

	--/ <summary>FUV Zero Point Magnitude</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	[f_zpmag] [float] NULL,

	--/ <summary>NUV Zero Point Scale Factor</summary>
	--/ <quantity>instr.scale</quantity>
	[n_zpscal] [float] NULL,

	--/ <summary>FUV Zero Point Scale Factor</summary>
	--/ <quantity>instr.scale</quantity>
	[f_zpscal] [float] NULL,

	--/ <summary>Calibration magnitude type</summary>
	--/ <quantity>meta.note</quantity>
	[calmag] [varchar](32) NULL,

	--/ <summary>NUV scale: pho/sec to micro Janskys</summary>
	--/ <quantity>instr.scale</quantity>
	[n_cuj] [float] NULL,

	--/ <summary>FUV scale: pho/sec to micro Janskys</summary>
	--/ <quantity>instr.scale</quantity>
	[f_cuj] [float] NULL,

	--/ <summary>Neighbor radius limit 1 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r1] [float] NULL,

	--/ <summary>Neighbor radius limit 2 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r2] [float] NULL,

	--/ <summary>Neighbor radius limit 3 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r3] [float] NULL,

	--/ <summary>Median Source NUV background(pho/sec/sq.arcsec)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcsec-2</unit>
	[n_back] [float] NULL,

	--/ <summary>Median Source FUV background(pho/sec/sq.arcsec)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcsec-2</unit>
	[f_back] [float] NULL,

	--/ <summary>(Adjusted) Median separation between matches (a</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsepa] [float] NULL,

	--/ <summary>Median separation between matches (arcsec)</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsep] [float] NULL,

	--/ <summary>Median sep. betw. matches (sigma arcsec)</summary>
	--/ <quantity>stat.error;pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsepsg] [float] NULL,

	--/ <summary>Matched sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[matden] [float] NULL,

	--/ <summary>Un-matched NUV sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[nufden] [float] NULL,

	--/ <summary>Un-matched FUV sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[fufden] [float] NULL,

	--/ <summary>Number of NUV 0 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg0] [int] NULL,

	--/ <summary>Number of NUV 1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg1] [int] NULL,

	--/ <summary>Number of NUV 2 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg2] [int] NULL,

	--/ <summary>Number of NUV 3 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg3] [int] NULL,

	--/ <summary>Number of NUV 4 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg4] [int] NULL,

	--/ <summary>Number of NUV 5 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg5] [int] NULL,

	--/ <summary>Number of NUV 6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg6] [int] NULL,

	--/ <summary>Number of NUV -6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambgm6] [int] NULL,

	--/ <summary>Number of NUV -1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambgm1] [int] NULL,

	--/ <summary>Number of FUV 0 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg0] [int] NULL,

	--/ <summary>Number of FUV 1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg1] [int] NULL,

	--/ <summary>Number of FUV 2 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg2] [int] NULL,

	--/ <summary>Number of FUV 3 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg3] [int] NULL,

	--/ <summary>Number of FUV 4 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg4] [int] NULL,

	--/ <summary>Number of FUV 5 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg5] [int] NULL,

	--/ <summary>Number of FUV 6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg6] [int] NULL,

	--/ <summary>Number of FUV -6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambgm6] [int] NULL,

	--/ <summary>Number of FUV -1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambgm1] [int] NULL,

	--/ <quantity>meta.id;meta.file</quantity>
	[filename] [varchar](256) NULL,

	--/ <quantity>meta.id;meta.file</quantity>
	[directry] [varchar](192) NULL,

	--/ <summary>Reduction version (high level)</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[tilenum] [int] NULL,

	--/ <summary>Observation type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code</quantity>
	[ow] [int] NULL,

	--/ <summary>Reduction product number (type)</summary>
	--/ <quantity>meta.version</quantity>
	[prod] [int] NULL,

	--/ <summary>Image number (visit+subvis)</summary>
	--/ <quantity>meta.id</quantity>
	[img] [int] NULL,

	--/ <summary>Reduction try number (low level)</summary>
	--/ <quantity>meta.id</quantity>
	[try] [int] NULL,

	--/ <summary>PETAL card value from -scst.fits file.</summary>
	--/ <quantity>meta.code</quantity>
	[petal] [int] NULL,

	--/ <quantity>time.epoch</quantity>
	[epoch] [float] NULL,

	[object] [varchar](128) NULL,

	[crval1] [float] NULL,

	[crval2] [float] NULL,

	[crpix1] [float] NULL,

	[crpix2] [float] NULL,

	[cdelt1] [float] NULL,

	[cdelt2] [float] NULL,

	[crota1] [float] NULL,

	[crota2] [float] NULL,

	[grelease] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[equinox] [float] NULL,

	[eclipse] [int] NULL,

	[leg] [int] NULL,

	[mpsnpos] [int] NULL,

	[visit] [int] NULL,

	[subvis] [int] NULL,

	[roll] [float] NULL,

	--/ <quantity>time.epoch</quantity>
	[obs_date] [varchar](32) NULL,

	--/ <quantity>time.epoch</quantity>
	[obsdatim] [varchar](32) NULL,

	--/ <quantity>meta.id</quantity>
	[tilename] [varchar](64) NULL,

	--/ <quantity>meta.id</quantity>
	[planid] [int] NULL,

	[mpsphase] [varchar](32) NULL,

	[mpsplan] [varchar](32) NULL,

	[mpstype] [varchar](32) NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[avaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[avaspdec] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[avasprol] [float] NULL,

	[avaspok] [float] NULL,

	--/ <summary>Number of apertures.</summary>
	--/ <quantity>meta.number</quantity>
	[num_aper] [int] NULL,

	--/ <summary>Aperture #1 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper1] [float] NULL,

	--/ <summary>Aperture #2 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper2] [float] NULL,

	--/ <summary>Aperture #3 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper3] [float] NULL,

	--/ <summary>Aperture #4 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper4] [float] NULL,

	--/ <summary>Aperture #5 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper5] [float] NULL,

	--/ <summary>Aperture #6 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper6] [float] NULL,

	--/ <summary>Aperture #7 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper7] [float] NULL,

	--/ <summary>Number of fraction-of-light radii.</summary>
	--/ <quantity>meta.number</quantity>
	[num_fol] [int] NULL,

	--/ <summary>Fraction-of-light radius #1</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac1] [float] NULL,

	--/ <summary>Fraction-of-light radius #2</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac2] [float] NULL,

	--/ <summary>Fraction-of-light radius #3</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac3] [float] NULL,

	--/ <summary>Fraction-of-light radius #4</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac4] [float] NULL,

	--/ <summary>Fraction-of-light radius #5</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac5] [float] NULL,

	[abscal] [varchar](32) NULL,

	[calinfo] [varchar](32) NULL,

	[statfile] [varchar](32) NULL,

	[abspipe] [varchar](32) NULL,

	[prundat0] [varchar](32) NULL,

	[prundat1] [varchar](32) NULL,

	[nlegs] [int] NULL,

	[nhvnom] [float] NULL,

	[nhvnomn] [float] NULL,

	[nhvnomf] [float] NULL,

	[mpscow] [varchar](32) NULL,

	[longstrn] [varchar](32) NULL,

	[pipestat] [int] NULL,

	[nepoch] [float] NULL,

	[nobject] [varchar](128) NULL,

	[norigin] [varchar](32) NULL,

	[ncrval1] [float] NULL,

	[ncrval2] [float] NULL,

	[ncrpix1] [float] NULL,

	[ncrpix2] [float] NULL,

	[ncdelt1] [float] NULL,

	[ncdelt2] [float] NULL,

	[ncrota1] [float] NULL,

	[ncrota2] [float] NULL,

	--/ <summary>IMAGE WIDTH (PIXELS) SEXIMASX originally</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[nsximasx] [int] NULL,

	--/ <summary>IMAGE HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[nsximasy] [int] NULL,

	--/ <summary>STRIP HEIGHT (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[nsxstrsy] [int] NULL,

	--/ <summary>FITS IMAGE BITPIX</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	[nsximabp] [int] NULL,

	--/ <summary>PIXEL SCALE (ARCSEC)</summary>
	--/ <quantity>instr.scale</quantity>
	--/ <unit>arcsec</unit>
	[nsxpixs] [float] NULL,

	--/ <summary>SEEING FWHM (ARCSEC)</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	--/ <unit>arcsec</unit>
	[nsxsfwhm] [float] NULL,

	--/ <summary>CLASSIFICATION NNW FILENAME</summary>
	--/ <quantity>meta.id</quantity>
	[nsxnnwf] [varchar](128) NULL,

	--/ <summary>GAIN (IN E- PER ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxgain] [float] NULL,

	--/ <summary>MEDIAN BACKGROUND (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxbkgnd] [float] NULL,

	--/ <summary>MEDIAN RMS (ADU)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>adu</unit>
	[nsxbkdev] [float] NULL,

	--/ <summary>EXTRACTION THRESHOLD (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxbkthd] [float] NULL,

	--/ <summary>CONFIGURATION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nsxconff] [varchar](128) NULL,

	--/ <summary>DETECTION TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxdett] [varchar](32) NULL,

	--/ <summary>THRESHOLD TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxthldt] [varchar](32) NULL,

	--/ <summary>THRESHOLD</summary>
	--/ <quantity></quantity>
	[nsxthld] [float] NULL,

	--/ <summary>EXTRACTION MINIMUM AREA (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxminar] [int] NULL,

	--/ <summary>CONVOLUTION FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxconv] [varchar](32) NULL,

	--/ <summary>CONVOLUTION NORM. FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxconvn] [varchar](32) NULL,

	--/ <summary>CONVOLUTION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nsxconvf] [varchar](128) NULL,

	--/ <summary>NUMBER OF SUB-THRESHOLDS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxdbldn] [int] NULL,

	--/ <summary>CONTRAST PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[nsxdbldc] [float] NULL,

	--/ <summary>CLEANING FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxcln] [varchar](32) NULL,

	--/ <summary>CLEANING PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[nsxclnpa] [float] NULL,

	--/ <summary>CLEANING OBJECT-STACK</summary>
	--/ <quantity>meta.code</quantity>
	[nsxclnst] [int] NULL,

	--/ <summary>APERTURE DIAMETER (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxaperd] [int] NULL,

	--/ <summary>KRON PARAMETER</summary>
	--/ <quantity>obs.param</quantity>
	[nsxapek1] [float] NULL,

	--/ <summary>KRON ANALYSIS RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxapek2] [float] NULL,

	--/ <summary>KRON MINIMUM RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxapek3] [float] NULL,

	--/ <summary>SATURATION LEVEL (ADU)</summary>
	--/ <quantity>instr.saturation</quantity>
	--/ <unit>adu</unit>
	[nsxsatlv] [float] NULL,

	--/ <summary>MAGNITUDE ZERO-POINT</summary>
	--/ <quantity>phot.mag</quantity>
	[nsxmgzpt] [float] NULL,

	--/ <summary>MAGNITUDE GAMMA</summary>
	--/ <quantity>phot.mag</quantity>
	[nsxmggam] [float] NULL,

	--/ <summary>BACKGROUND MESH WIDTH (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxbkgsx] [int] NULL,

	--/ <summary>BACKGROUND MESH HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxbkgsy] [int] NULL,

	--/ <summary>BACKGROUND FILTER WIDTH</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxbkgfx] [int] NULL,

	--/ <summary>BACKGROUND FILTER HEIGHT</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxbkgfy] [int] NULL,

	--/ <summary>PHOTOM BACKGROUND TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxpbkgt] [varchar](32) NULL,

	--/ <summary>LOCAL AREA THICKNESS (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[nsxpbkgs] [int] NULL,

	--/ <summary>PIXEL STACKSIZE (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[nsxpixsk] [int] NULL,

	--/ <summary>FRAME-BUFFER SIZE (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[nsxfbufs] [int] NULL,

	--/ <summary>ISO-APER RATIO</summary>
	--/ <quantity>arith.ratio</quantity>
	[nsxisapr] [float] NULL,

	--/ <summary>NB OF DETECTIONS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxndet] [int] NULL,

	--/ <summary>NB OF FINAL EXTRACTED OBJECTS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxnfin] [int] NULL,

	--/ <summary>NB OF PARAMETERS PER OBJECT</summary>
	--/ <quantity>meta.number</quantity>
	[nsxnpara] [int] NULL,

	[ngreleas] [varchar](32) NULL,

	[nctype1] [varchar](32) NULL,

	[nctype2] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[nequinox] [float] NULL,

	--/ <summary>RA_CENT originally</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[nra_cent] [float] NULL,

	--/ <summary>DEC_CENT originally</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[ndec_cen] [float] NULL,

	[ntwist] [float] NULL,

	[neclipse] [int] NULL,

	[ngrspa] [float] NULL,

	[nleg] [int] NULL,

	[nmpsnpos] [int] NULL,

	[nvisit] [int] NULL,

	[nsubvis] [int] NULL,

	[nminivis] [int] NULL,

	[now] [int] NULL,

	[nband] [int] NULL,

	[nroll] [float] NULL,

	[nexptime] [float] NULL,

	--/ <summary>EXPSTART originally</summary>
	--/ <quantity>time.start</quantity>
	[nexpstar] [float] NULL,

	[nexpend] [float] NULL,

	--/ <summary>OBS-DATE originally</summary>
	--/ <quantity>time.epoch</quantity>
	[nobs_dat] [varchar](32) NULL,

	--/ <summary>TIME-OBS, was OBS-TIME</summary>
	--/ <quantity>time.epoch</quantity>
	[ntime_ob] [varchar](32) NULL,

	[nobssecs] [float] NULL,

	--/ <summary>OBSDATIM originally</summary>
	--/ <quantity></quantity>
	[nobsdati] [varchar](32) NULL,

	--/ <summary>TILENAME originally</summary>
	--/ <quantity>meta.id</quantity>
	[ntilenam] [varchar](64) NULL,

	[ntilenum] [int] NULL,

	[nplanid] [int] NULL,

	--/ <summary>MPSPHASE originally</summary>
	--/ <quantity></quantity>
	[nmpsphas] [varchar](32) NULL,

	[nmpsplan] [varchar](32) NULL,

	[nmpstype] [varchar](32) NULL,

	[nimagszx] [int] NULL,

	[nimagszy] [int] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.mean</quantity>
	[navaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.mean</quantity>
	[navaspde] [float] NULL,

	[navaspx] [float] NULL,

	[navaspy] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	[navaspro] [float] NULL,

	[navaspok] [float] NULL,

	[ncalpath] [varchar](32) NULL,

	[nflatfl] [varchar](32) NULL,

	--/ <summary>INTIMAGE originally</summary>
	--/ <quantity></quantity>
	[nintimag] [varchar](256) NULL,

	[nphofile] [varchar](32) NULL,

	--/ <summary>NVALIDPH originally</summary>
	--/ <quantity></quantity>
	[nnvalidp] [int] NULL,

	--/ <summary>FILTERED originally</summary>
	--/ <quantity></quantity>
	[nfiltere] [int] NULL,

	[npsffwhm] [float] NULL,

	--/ <summary>CONVFWHM originally</summary>
	--/ <quantity></quantity>
	[ncnvfwhm] [float] NULL,

	[npoisbg] [float] NULL,

	[nsigthre] [int] NULL,

	[nabsthre] [int] NULL,

	--/ <summary>SXDBGRMS originally</summary>
	--/ <quantity></quantity>
	[nsxdbgrm] [float] NULL,

	[nareadet] [float] NULL,

	[npsigdet] [float] NULL,

	[npmedbg] [float] NULL,

	[npmedrr] [float] NULL,

	[npthrbg] [float] NULL,

	[npthresh] [float] NULL,

	--/ <summary>AVEPEFIX originally</summary>
	--/ <quantity></quantity>
	[navepefi] [float] NULL,

	--/ <summary>MINPEFIX originally</summary>
	--/ <quantity></quantity>
	[nminpefi] [float] NULL,

	--/ <summary>MAXPEFIX originally</summary>
	--/ <quantity></quantity>
	[nmaxpefi] [float] NULL,

	[navepea] [float] NULL,

	[nminpea] [float] NULL,

	[nmaxpea] [float] NULL,

	[nsxwd] [varchar](192) NULL,

	[nacoxyav] [float] NULL,

	[nacoxyme] [float] NULL,

	[nacoxysd] [float] NULL,

	[nacoxymn] [float] NULL,

	[nacoxymx] [float] NULL,

	[nabscal] [varchar](32) NULL,

	[ncalinfo] [varchar](32) NULL,

	[nstatfil] [varchar](32) NULL,

	[nabspipe] [varchar](32) NULL,

	[nprunda0] [varchar](32) NULL,

	[nprunda1] [varchar](32) NULL,

	[npipecmn] [varchar](32) NULL,

	[nnlegs] [int] NULL,

	[nmpscow] [varchar](32) NULL,

	[nnhvnom] [float] NULL,

	[nnhvnomn] [float] NULL,

	[nnhvnomf] [float] NULL,

	[npipesta] [int] NULL,

	[nlongstr] [varchar](32) NULL,

	[fepoch] [float] NULL,

	[fobject] [varchar](128) NULL,

	[forigin] [varchar](32) NULL,

	[fcrval1] [float] NULL,

	[fcrval2] [float] NULL,

	[fcrpix1] [float] NULL,

	[fcrpix2] [float] NULL,

	[fcdelt1] [float] NULL,

	[fcdelt2] [float] NULL,

	[fcrota1] [float] NULL,

	[fcrota2] [float] NULL,

	--/ <summary>IMAGE WIDTH (PIXELS) SEXIMASX originally</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[fsximasx] [int] NULL,

	--/ <summary>IMAGE HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[fsximasy] [int] NULL,

	--/ <summary>STRIP HEIGHT (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[fsxstrsy] [int] NULL,

	--/ <summary>FITS IMAGE BITPIX</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	[fsximabp] [int] NULL,

	--/ <summary>PIXEL SCALE (ARCSEC)</summary>
	--/ <quantity>instr.scale</quantity>
	--/ <unit>arcsec</unit>
	[fsxpixs] [float] NULL,

	--/ <summary>SEEING FWHM (ARCSEC)</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	--/ <unit>arcsec</unit>
	[fsxsfwhm] [float] NULL,

	--/ <summary>CLASSIFICATION NNW FILENAME</summary>
	--/ <quantity>meta.id</quantity>
	[fsxnnwf] [varchar](128) NULL,

	--/ <summary>GAIN (IN E- PER ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxgain] [float] NULL,

	--/ <summary>MEDIAN BACKGROUND (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxbkgnd] [float] NULL,

	--/ <summary>MEDIAN RMS (ADU)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>adu</unit>
	[fsxbkdev] [float] NULL,

	--/ <summary>EXTRACTION THRESHOLD (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxbkthd] [float] NULL,

	--/ <summary>CONFIGURATION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fsxconff] [varchar](128) NULL,

	--/ <summary>DETECTION TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxdett] [varchar](32) NULL,

	--/ <summary>THRESHOLD TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxthldt] [varchar](32) NULL,

	--/ <summary>THRESHOLD</summary>
	--/ <quantity></quantity>
	[fsxthld] [float] NULL,

	--/ <summary>EXTRACTION MINIMUM AREA (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fsxminar] [int] NULL,

	--/ <summary>CONVOLUTION FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxconv] [varchar](32) NULL,

	--/ <summary>CONVOLUTION NORM. FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxconvn] [varchar](32) NULL,

	--/ <summary>CONVOLUTION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fsxconvf] [varchar](128) NULL,

	--/ <summary>NUMBER OF SUB-THRESHOLDS</summary>
	--/ <quantity>meta.number</quantity>
	[fsxdbldn] [int] NULL,

	--/ <summary>CONTRAST PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[fsxdbldc] [float] NULL,

	--/ <summary>CLEANING FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxcln] [varchar](32) NULL,

	--/ <summary>CLEANING PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[fsxclnpa] [float] NULL,

	--/ <summary>CLEANING OBJECT-STACK</summary>
	--/ <quantity>meta.code</quantity>
	[fsxclnst] [int] NULL,

	--/ <summary>APERTURE DIAMETER (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fsxaperd] [int] NULL,

	--/ <summary>KRON PARAMETER</summary>
	--/ <quantity>obs.param</quantity>
	[fsxapek1] [float] NULL,

	--/ <summary>KRON ANALYSIS RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxapek2] [float] NULL,

	--/ <summary>KRON MINIMUM RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxapek3] [float] NULL,

	--/ <summary>SATURATION LEVEL (ADU)</summary>
	--/ <quantity>instr.saturation</quantity>
	--/ <unit>adu</unit>
	[fsxsatlv] [float] NULL,

	--/ <summary>MAGNITUDE ZERO-POINT</summary>
	--/ <quantity>phot.mag</quantity>
	[fsxmgzpt] [float] NULL,

	--/ <summary>MAGNITUDE GAMMA</summary>
	--/ <quantity>phot.ma</quantity>
	[fsxmggam] [float] NULL,

	--/ <summary>BACKGROUND MESH WIDTH (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgsx] [int] NULL,

	--/ <summary>BACKGROUND MESH HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgsy] [int] NULL,

	--/ <summary>BACKGROUND FILTER WIDTH</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgfx] [int] NULL,

	--/ <summary>BACKGROUND FILTER HEIGHT</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgfy] [int] NULL,

	--/ <summary>PHOTOM BACKGROUND TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxpbkgt] [varchar](32) NULL,

	--/ <summary>LOCAL AREA THICKNESS (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[fsxpbkgs] [int] NULL,

	--/ <summary>PIXEL STACKSIZE (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[fsxpixsk] [int] NULL,

	--/ <summary>FRAME-BUFFER SIZE (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[fsxfbufs] [int] NULL,

	--/ <summary>ISO-APER RATIO</summary>
	--/ <quantity>arith.ratio</quantity>
	[fsxisapr] [float] NULL,

	--/ <summary>NB OF DETECTIONS</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxndet] [int] NULL,

	--/ <summary>NB OF FINAL EXTRACTED OBJECTS</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxnfin] [int] NULL,

	--/ <summary>NB OF PARAMETERS PER OBJECT</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxnpara] [int] NULL,

	[fgreleas] [varchar](32) NULL,

	[fctype1] [varchar](32) NULL,

	[fctype2] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[fequinox] [float] NULL,

	--/ <summary>RA_CENT originally</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[fra_cent] [float] NULL,

	--/ <summary>DEC_CENT originally</summary>
	--/ <quantity></quantity>
	[fdec_cen] [float] NULL,

	[ftwist] [float] NULL,

	[feclipse] [int] NULL,

	[fgrspa] [float] NULL,

	[fleg] [int] NULL,

	[fmpsnpos] [int] NULL,

	[fvisit] [int] NULL,

	[fsubvis] [int] NULL,

	[fminivis] [int] NULL,

	[fow] [int] NULL,

	[fband] [int] NULL,

	[froll] [float] NULL,

	[fexptime] [float] NULL,

	--/ <summary>EXPSTART originally</summary>
	--/ <quantity>time.start</quantity>
	[fexpstar] [float] NULL,

	[fexpend] [float] NULL,

	--/ <summary>OBS-DATE originally</summary>
	--/ <quantity>time.epoch</quantity>
	[fobs_dat] [varchar](32) NULL,

	--/ <summary>TIME-OBS, was OBS-TIME</summary>
	--/ <quantity>time.epoch</quantity>
	[ftime_ob] [varchar](32) NULL,

	[fobssecs] [float] NULL,

	--/ <summary>OBSDATIM originally</summary>
	--/ <quantity></quantity>
	[fobsdati] [varchar](32) NULL,

	--/ <summary>TILENAME originally</summary>
	--/ <quantity>meta.id</quantity>
	[ftilenam] [varchar](64) NULL,

	[ftilenum] [int] NULL,

	[fplanid] [int] NULL,

	--/ <summary>MPSPHASE originally</summary>
	--/ <quantity></quantity>
	[fmpsphas] [varchar](32) NULL,

	[fmpsplan] [varchar](32) NULL,

	[fmpstype] [varchar](32) NULL,

	[fimagszx] [int] NULL,

	[fimagszy] [int] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.mean</quantity>
	[favaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.mean</quantity>
	[favaspde] [float] NULL,

	[favaspx] [float] NULL,

	[favaspy] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	[favaspro] [float] NULL,

	[favaspok] [float] NULL,

	[fcalpath] [varchar](32) NULL,

	[fflatfl] [varchar](32) NULL,

	--/ <summary>INTIMAGE originally</summary>
	--/ <quantity></quantity>
	[fintimag] [varchar](256) NULL,

	[fphofile] [varchar](32) NULL,

	--/ <summary>NVALIDPH originally</summary>
	--/ <quantity></quantity>
	[fnvalidp] [int] NULL,

	--/ <summary>FILTERED originally</summary>
	--/ <quantity></quantity>
	[ffiltere] [int] NULL,

	[fpsffwhm] [float] NULL,

	--/ <summary>CONVFWHM originally</summary>
	--/ <quantity></quantity>
	[fcnvfwhm] [float] NULL,

	[fpoisbg] [float] NULL,

	[fsigthre] [int] NULL,

	[fabsthre] [int] NULL,

	--/ <summary>SXDBGRMS originally</summary>
	--/ <quantity></quantity>
	[fsxdbgrm] [float] NULL,

	[fareadet] [float] NULL,

	[fpsigdet] [float] NULL,

	[fpmedbg] [float] NULL,

	[fpmedrr] [float] NULL,

	[fpthrbg] [float] NULL,

	[fpthresh] [float] NULL,

	--/ <summary>AVEPEFIX originally</summary>
	--/ <quantity></quantity>
	[favepefi] [float] NULL,

	--/ <summary>MINPEFIX originally</summary>
	--/ <quantity></quantity>
	[fminpefi] [float] NULL,

	--/ <summary>MAXPEFIX originally</summary>
	--/ <quantity></quantity>
	[fmaxpefi] [float] NULL,

	[favepea] [float] NULL,

	[fminpea] [float] NULL,

	[fmaxpea] [float] NULL,

	[fsxwd] [varchar](192) NULL,

	[facoxyav] [float] NULL,

	[facoxyme] [float] NULL,

	[facoxysd] [float] NULL,

	[facoxymn] [float] NULL,

	[facoxymx] [float] NULL,

	[fabscal] [varchar](32) NULL,

	[fcalinfo] [varchar](32) NULL,

	[fstatfil] [varchar](32) NULL,

	[fabspipe] [varchar](32) NULL,

	[fprunda0] [varchar](32) NULL,

	[fprunda1] [varchar](32) NULL,

	[fpipecmn] [varchar](32) NULL,

	[fnlegs] [int] NULL,

	[fmpscow] [varchar](32) NULL,

	[fnhvnom] [float] NULL,

	[fnhvnomn] [float] NULL,

	[fnhvnomf] [float] NULL,

	[fpipesta] [int] NULL,

	[flongstr] [varchar](32) NULL,

	[artflagb] [int] NULL,

	--/ <summary>Number of coadded visits.</summary>
	--/ <quantity>meta.number</quantity>
	[nnadded] [int] NULL,

	--/ <summary>Number of coadded visits.</summary>
	--/ <quantity>meta.number</quantity>
	[fnadded] [int] NULL,

	--/ <summary>file creation date (YYYY-MM-DDThh:mm:ss UT)</summary>
	--/ <quantity>time.epoch</quantity>
	[date] [varchar](64) NULL,

	[ndtdet] [int] NULL,

	[ndttdc] [int] NULL,

	[ndtampa] [int] NULL,

	[ndtampb] [int] NULL,

	[ndtcon] [int] NULL,

	[itnuvoba] [int] NULL,

	[ndthvps] [int] NULL,

	[ndtlvps] [int] NULL,

	[ndtdib] [int] NULL,

	[ndhvmon] [int] NULL,

	[ndhimon] [int] NULL,

	[ndsfhv] [int] NULL,

	[ndctec] [int] NULL,

	[ndcfec] [int] NULL,

	[ndcdec] [int] NULL,

	[fdtdet] [int] NULL,

	[fdttdc] [int] NULL,

	[fdtampa] [int] NULL,

	[fdtampb] [int] NULL,

	[fdtcon] [int] NULL,

	[itfuvoba] [int] NULL,

	[fdthvps] [int] NULL,

	[fdtlvps] [int] NULL,

	[fdtdib] [int] NULL,

	[fdhvmon] [int] NULL,

	[fdhimon] [int] NULL,

	[fdsfhv] [int] NULL,

	[fdctec] [int] NULL,

	[fdcfec] [int] NULL,

	[fdcdec] [int] NULL,

	[itm1hshl] [int] NULL,

	[itm2hub] [int] NULL,

	[itcylbaf] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 0 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc0] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 1 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc1] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 2 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc2] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 3 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc3] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 0 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc0] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 1 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc1] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 2 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc2] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 3 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc3] [int] NULL,

	--/ <summary>BQ: Number of points used to compute DX,DY,etc.</summary>
	--/ <quantity>meta.number</quantity>
	[bqnum] [int] NULL,

	--/ <summary>BQ: Delta Detector X Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxmed] [float] NULL,

	--/ <summary>BQ: Delta Detector Y Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddymed] [float] NULL,

	--/ <summary>BQ: Delta Detector X RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddxrms] [float] NULL,

	--/ <summary>BQ: Delta Detector Y RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddyrms] [float] NULL,

	--/ <summary>BQ: Delta Detector X Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddxmrm] [float] NULL,

	--/ <summary>BQ: Delta Detector Y Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddymrm] [float] NULL,

	--/ <summary>BQ: Inner(0.3 deg) Delta Detector X Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxinn] [float] NULL,

	--/ <summary>BQ: Inner(0.3 deg) Delta Detector Y Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddyinn] [float] NULL,

	--/ <summary>BQ: Outer(0.3 deg) Delta Detector X Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxout] [float] NULL,

	--/ <summary>BQ: Outer(0.3 deg) Delta Detector Y Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddyout] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqsdxmed] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqsdymed] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdxrms] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdyrms] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdxmrm] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdymrm] [float] NULL,

	--/ <summary>BQ: Median match angle (deg)</summary>
	--/ <quantity>pos.posAng;stat.median</quantity>
	--/ <unit>deg</unit>
	[bqangmed] [float] NULL,

	--/ <summary>BQ: Median probability</summary>
	--/ <quantity>stat.probability;stat.median</quantity>
	[bqprobmd] [float] NULL,

	--/ <summary>BQ: Median radial separation (arcsec)</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[bqsepmed] [float] NULL,

	--/ <summary>BQ: Median of log of NUV flux in pho/sec</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>ph s-1</unit>
	[bqnfxmed] [float] NULL,

	--/ <summary>BQ: Median of log of FUV flux in pho/sec</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ph s-1</unit>
	[bqffxmed] [float] NULL,

	--/ <summary>BQ: Median of NUV Major Axis FWHM (arcsec)</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[bqnaxmed] [float] NULL,

	--/ <summary>BQ: Median of FUV Major Axis FWHM (arcsec)</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[bqfaxmed] [float] NULL,

	--/ <summary>BQ: Median of NUV ellipticity (high s/n)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[bqnelmed] [float] NULL,

	--/ <summary>BQ: Median of NUV axis angle (deg) (high s/n)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[bqnaamed] [float] NULL,

	--/ <summary>BQ: Median of FUV axis angle (deg) (high s/n)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[bqfaamed] [float] NULL,

	--/ <summary>BQ: Median of NUV background (pho/s/sq.arcmin)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[bqnbckmd] [float] NULL,

	--/ <summary>BQ: Median of FUV background (pho/s/sq.arcmin)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[bqfbckmd] [float] NULL,

	--/ <summary>BQ: NUV and FUV average exposure time in sec</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>sec</unit>
	[aexptime] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	[exptime] [float] NULL,

	--/ <summary>BQ: Sky median separation in RA (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bqsmdra] [float] NULL,

	--/ <summary>BQ: Sky median separation in DEC (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bqsmddec] [float] NULL,

	--/ <summary>BQ: Sky adjusted median separation in RA (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bqamdra] [float] NULL,

	--/ <summary>BQ: Sky adjusted median separation in DEC (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bqamddec] [float] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[subGridId] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[gridId] [int] NULL,

	--/ <summary>indicates GR release, 2.0, 3.0, ...</summary>
	--/ <quantity>meta.version</quantity>
	[GRReleaseNumber] [real] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [int] NULL,
 CONSTRAINT [PKPhotoExtract] PRIMARY KEY CLUSTERED 
(
	[photoExtractID] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


--/ <summary>  </summary>
--/ <remarks>  </remarks>
CREATE TABLE [dbo].[photoobjall](
	--/ <summary>Galex Global Object ID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Pointer to photoExtract Table</summary>
	--/ <quantity>meta.id</quantity>
	[photoExtractID] [bigint] NOT NULL DEFAULT ((0)),

	--/ <summary>Version number</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tilenum] [int] NULL,

	--/ <summary>Obs.type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr</quantity>
	[ow] [int] NULL,

	--/ <summary>Product number (_visits,_main,etc.)</summary>
	--/ <quantity>meta.id</quantity>
	[prod] [int] NULL,

	--/ <summary>image number (exposure# for _visits)</summary>
	--/ <quantity>meta.number</quantity>
	[img] [int] NULL,

	--/ <summary>Try number (processing attempt number)</summary>
	--/ <quantity>meta.number</quantity>
	[try] [int] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[band] [int] NULL,

	--/ <summary>Merged ID.</summary>
	--/ <quantity>meta.id</quantity>
	[id] [int] NULL,

	--/ <summary>Sub-visit number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[subvisit] [smallint] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[leg] [smallint] NULL,

	--/ <summary>Right Ascension(degrees).</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination (degrees).</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Band-merged Right Ascension(degrees).</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[alpha_j2000_merged] [float] NULL,

	--/ <summary>Band-merged Declination (degrees).</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[delta_j2000_merged] [float] NULL,

	--/ <summary>Chi-squared probability of match.</summary>
	--/ <quantity>stat.probability</quantity>
	[prob] [real] NULL,

	--/ <summary>Separation between band positions.</summary>
	--/ <quantity>pos.distance</quantity>
	[sep] [real] NULL,

	--/ <summary>Separation on images (no adjustment)</summary>
	--/ <quantity>pos.distance</quantity>
	[sep_img] [real] NULL,

	--/ <summary>E(B-V) Galactic Reddening.</summary>
	--/ <quantity>phot.excess</quantity>
	[E_bv] [real] NULL,

	--/ <summary>Galactic longitude in degrees.</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [real] NULL,

	--/ <summary>Galactic latitude in degrees.</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [real] NULL,

	--/ <summary>Is AIS/MIS source a primary? (1/0)</summary>
	--/ <quantity>meta.code</quantity>
	[primary_flag] [int] NULL,

	--/ <summary>distance from center of FOV in degrees</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>deg</unit>
	[fov_radius] [real] NULL,

	--/ <summary>NUV detector X position (pixels)</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[nuv_det_x] [real] NULL,

	--/ <summary>NUV detector Y position (pixels)</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[nuv_det_y] [real] NULL,

	--/ <summary>FUV detector X position (pixels)</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[fuv_det_x] [real] NULL,

	--/ <summary>FUV detector Y position (pixels)</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[fuv_det_y] [real] NULL,

	--/ <summary>Astrometry check type</summary>
	--/ <quantity></quantity>
	[chkobj_type] [int] NULL,

	--/ <summary>Astrometry check ID</summary>
	--/ <quantity>meta.id</quantity>
	[chkobj_id] [int] NULL,

	--/ <summary>Astrometry check radius in degrees</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>deg</unit>
	[chkobj_r] [real] NULL,

	--/ <summary>Astrometry check position angle in degrees</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[chkobj_pa] [real] NULL,

	--/ <summary>Miscellaneous flags</summary>
	--/ <quantity>meta.code</quantity>
	[misc_flags] [int] NULL,

	--/ <summary>NUV calibrated flux (micro Jansky)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>uJy</unit>
	[nuv_flux] [real] NULL,

	--/ <summary>NUV calibrated flux error</summary>
	--/ <quantity>stat.error;phot.flux;em.UV</quantity>
	--/ <unit>uJy</unit>
	[nuv_fluxerr] [real] NULL,

	--/ <summary>NUV calibrated magnitude</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	--/ <unit>mag</unit>
	[nuv_mag] [real] NULL,

	--/ <summary>NUV calibrated magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.UV</quantity>
	--/ <unit>mag</unit>
	[nuv_magerr] [real] NULL,

	--/ <summary>FUV calibrated flux (micro Jansky)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>uJy</unit>
	[fuv_flux] [real] NULL,

	--/ <summary>FUV calibrated flux error</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>uJy</unit>
	[fuv_fluxerr] [real] NULL,

	--/ <summary>FUV calibrated magnitude</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_mag] [real] NULL,

	--/ <summary>FUV calibrated magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_magerr] [real] NULL,

	--/ <summary>NUV signal-to-noise from 'AUTO' flux value</summary>
	--/ <quantity>stat.snr</quantity>
	[nuv_s2n] [real] NULL,

	--/ <summary>FUV signal-to-noise from 'AUTO' flux value</summary>
	--/ <quantity>stat.snr</quantity>
	[fuv_s2n] [real] NULL,

	--/ <summary>NUV calibrated flux using FUV positn(-nd-fcat)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_fcat_flux] [real] NULL,

	--/ <summary>Error for nuv_fcat_flux</summary>
	--/ <quantity>stat.error;phot.flux;em.UV</quantity>
	[nuv_fcat_fluxerr] [real] NULL,

	--/ <summary>FUV calibrated flux using NUV positn(-fd-ncat)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_ncat_flux] [real] NULL,

	--/ <summary>Error for fuv_ncat_flux</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	[fuv_ncat_fluxerr] [real] NULL,

	--/ <summary>FUV adjusted RA in degrees</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[fuv_ra_adj] [float] NULL,

	--/ <summary>FUV adjusted DEC in degrees</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[fuv_dec_adj] [float] NULL,

	--/ <summary>FUV_FLAGS from -fd-ncat.fits</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_ncat_flags] [smallint] NULL,

	--/ <summary>FUV calibrated magnitude from -fd-ncat.fits</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	[fuv_ncat_mag] [real] NULL,

	--/ <summary>Error for fuv_ncat_mag</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	[fuv_ncat_magerr] [real] NULL,

	--/ <summary>Signal to noise for fuv_ncat_flux</summary>
	--/ <quantity>stat.snr;em.UV.FUV</quantity>
	[fuv_ncat_s2n] [real] NULL,

	--/ <summary>NUV calibrated magnitude from -nd-fcat.fits</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	[nuv_fcat_mag] [real] NULL,

	--/ <summary>Error for nuv_fcat_mag</summary>
	--/ <quantity>stat.error;phot.mag;em.UV</quantity>
	[nuv_fcat_magerr] [real] NULL,

	--/ <summary>Signal to noise for nuv_fcat_flux</summary>
	--/ <quantity>stat.snr;em.UV</quantity>
	[nuv_fcat_s2n] [real] NULL,

	--/ <summary>FUV FWHM_IMAGE value from -fd-ncat.fits (px)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_fwhm_image] [real] NULL,

	--/ <summary>FUV FWHM_WORLD value from -fd-ncat.fits (deg)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>deg</unit>
	[fuv_ncat_fwhm_world] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #1 (-fd-ncat)(px)[0.20]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_1] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #2 (-fd-ncat)(px)[0.50]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_2] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #3 (-fd-ncat)(px)[0.80]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_3] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #4 (-fd-ncat)(px)[0.90]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_4] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #5 (-fd-ncat)(px)[0.95]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_5] [real] NULL,

	--/ <summary>FUV FLUX_APER #1 (-fd-ncat)(cnt/sec)[ 2. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_1] [real] NULL,

	--/ <summary>FUV FLUX_APER #2 (-fd-ncat)(cnt/sec)[ 3. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_2] [real] NULL,

	--/ <summary>FUV FLUX_APER #3 (-fd-ncat)(cnt/sec)[ 5. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_3] [real] NULL,

	--/ <summary>FUV FLUX_APER #4 (-fd-ncat)(cnt/sec)[ 8. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_4] [real] NULL,

	--/ <summary>FUV FLUX_APER #5 (-fd-ncat)(cnt/sec)[12. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_5] [real] NULL,

	--/ <summary>FUV FLUX_APER #6 (-fd-ncat)(cnt/sec)[17. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_6] [real] NULL,

	--/ <summary>FUV FLUX_APER #7 (-fd-ncat)(cnt/sec)[23. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_7] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_1</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_1] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_2</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_2] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_3</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_3] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_4</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_4] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_5</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_5] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_6</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_6] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_7</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_7] [real] NULL,

	--/ <summary>FUV MAG_APER #1 (-fd-ncat)(raw mag)[ 2. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_1] [real] NULL,

	--/ <summary>FUV MAG_APER #2 (-fd-ncat)(raw mag)[ 3. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_2] [real] NULL,

	--/ <summary>FUV MAG_APER #3 (-fd-ncat)(raw mag)[ 5. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_3] [real] NULL,

	--/ <summary>FUV MAG_APER #4 (-fd-ncat)(raw mag)[ 8. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_4] [real] NULL,

	--/ <summary>FUV MAG_APER #5 (-fd-ncat)(raw mag)[12. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_5] [real] NULL,

	--/ <summary>FUV MAG_APER #6 (-fd-ncat)(raw mag)[17. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_6] [real] NULL,

	--/ <summary>FUV MAG_APER #7 (-fd-ncat)(raw mag)[23. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_7] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_1</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_1] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_2</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_2] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_3</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_3] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_4</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_4] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_5</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_5] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_6</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_6] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_7</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_7] [real] NULL,

	--/ <summary>NUV neighbor count out to radius R1</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r1] [smallint] NULL,

	--/ <summary>NUV neighbor count out to radius R2</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r2] [smallint] NULL,

	--/ <summary>NUV neighbor count out to radius R3</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r3] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R1</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r1] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R2</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r2] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R3</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r3] [smallint] NULL,

	--/ <summary>NUV neighbor flux out to radius R1</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r1] [real] NULL,

	--/ <summary>NUV neighbor flux out to radius R2</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r2] [real] NULL,

	--/ <summary>NUV neighbor flux out to radius R3</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r3] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R1</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r1] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R2</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r2] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R3</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r3] [real] NULL,

	--/ <summary>Closest neighbor radius in arcseconds</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[cn_radius] [real] NULL,

	--/ <summary>Closest neighbor position angle in degrees</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[cn_pa] [real] NULL,

	--/ <summary>Closest neighbor NUV magnitude</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>mag</unit>
	[cn_mag_nuv] [real] NULL,

	--/ <summary>Closest neighbor FUV magnitude</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[cn_mag_fuv] [real] NULL,

	--/ <summary>NUV sky background(pho/sec/sq.arcsec)(at centr)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>ph sec-1 arcsec-2</unit>
	[nuv_skybg] [real] NULL,

	--/ <summary>FUV sky background(pho/sec/sq.arcsec)(at centr)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ph sec-1 arcsec-2</unit>
	[fuv_skybg] [real] NULL,

	--/ <summary>NUV effective exposure (response)</summary>
	--/ <quantity>stat.weight</quantity>
	[nuv_weight] [real] NULL,

	--/ <summary>FUV effective exposure (response)</summary>
	--/ <quantity>stat.weight</quantity>
	[fuv_weight] [real] NULL,

	--/ <summary>NUV intensity (photons/second/pixel)</summary>
	--/ <quantity>spect.line.intensity;em.UV</quantity>
	--/ <unit>ph sec-1 pix</unit>
	[nuv_int] [real] NULL,

	--/ <summary>FUV intensity (photons/second/pixel)</summary>
	--/ <quantity>spect.line.intensity;em.UV.FUV</quantity>
	--/ <unit>ph sec-1 pix</unit>
	[fuv_int] [real] NULL,

	--/ <summary>NUV threshold sigmas (int-bg)/wt)</summary>
	--/ <quantity>instr.param</quantity>
	[nuv_thres] [real] NULL,

	--/ <summary>FUV threshold sigmas (int-bg)/wt)</summary>
	--/ <quantity>instr.param</quantity>
	[fuv_thres] [real] NULL,

	--/ <summary>NUV ratio of min to max response near source</summary>
	--/ <quantity>stat.value</quantity>
	[nuv_contrast] [real] NULL,

	--/ <summary>FUV ratio of min to max response near source</summary>
	--/ <quantity>stat.value</quantity>
	[fuv_contrast] [real] NULL,

	--/ <summary>NUV median Q within 40 arcsec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_mdn] [real] NULL,

	--/ <summary>NUV  5th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_p05] [real] NULL,

	--/ <summary>NUV 95th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_p95] [real] NULL,

	--/ <summary>FUV median Q within 40 arcsec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_mdn] [real] NULL,

	--/ <summary>FUV  5th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_p05] [real] NULL,

	--/ <summary>FUV 95th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_p95] [real] NULL,

	--/ <summary>NUV number of masked pixels near source</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_maskpix] [int] NULL,

	--/ <summary>FUV number of masked pixels near source</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_maskpix] [int] NULL,

	--/ <summary>NUV artifact flag (logical OR near source)</summary>
	--/ <quantity>meta.code</quantity>
	[nuv_artifact] [int] NULL,

	--/ <summary>FUV artifact flag (logical OR near source)</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_artifact] [int] NULL,

	--/ <summary>NUV spacecraft X position</summary>
	--/ <quantity>pos.cartesian.x;instr</quantity>
	[nuv_scx] [real] NULL,

	--/ <summary>NUV spacecraft Y position</summary>
	--/ <quantity>pos.cartesian.y;instr</quantity>
	[nuv_scy] [real] NULL,

	--/ <summary>FUV spacecraft X position</summary>
	--/ <quantity>pos.cartesian.x;instr</quantity>
	[fuv_scx] [real] NULL,

	--/ <summary>FUV spacecraft Y position</summary>
	--/ <quantity>pos.cartesian.y;instr</quantity>
	[fuv_scy] [real] NULL,

	--/ <summary>NUV detector Q value</summary>
	--/ <quantity></quantity>
	[nuv_Q] [real] NULL,

	--/ <summary>FUV detector Q value</summary>
	--/ <quantity></quantity>
	[fuv_Q] [real] NULL,

	--/ <summary>NUV ambiguity flag.</summary>
	--/ <quantity>meta.code</quantity>
	[nuv_ambg] [int] NULL,

	--/ <summary>FUV ambiguity flag.</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_ambg] [int] NULL,

	--/ <summary>NUV number of candidates.</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc] [int] NULL,

	--/ <summary>FUV number of candidates.</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc] [int] NULL,

	--/ <summary>First candidate for NUV source(FUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid1] [int] NULL,

	--/ <summary>First candidate for FUV source(NUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid1] [int] NULL,

	--/ <summary>Second candidate for NUV source(FUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid2] [int] NULL,

	--/ <summary>Second candidate for FUV source(NUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid2] [int] NULL,

	--/ <summary>Closest unmatched FUV source within 7 arcsec</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid3] [int] NULL,

	--/ <summary>Closest unmatched NUV source within 7 arcsec</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid3] [int] NULL,

	--/ <summary>NUV position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[nuv_poserr] [real] NULL,

	--/ <summary>FUV position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[fuv_poserr] [real] NULL,

	--/ <summary>Interband position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[ib_poserr] [real] NULL,

	--/ <summary>NUV Poisson position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[nuv_pperr] [real] NULL,

	--/ <summary>FUV Poisson position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[fuv_pperr] [real] NULL,

	--/ <summary>Reliability based on random unfilled FUV</summary>
	--/ <quantity>meta.code.qual</quantity>
	[match_reliability] [real] NULL,

	--/ <summary>position angle betw. band sources.</summary>
	--/ <quantity>pos.posAng</quantity>
	[sourcepa] [real] NULL,

	--/ <summary>Running object number</summary>
	--/ <quantity>meta.number</quantity>
	[NUV_NUMBER] [int] NULL,

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal;em.UV</quantity>
	[NUV_FLUX_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal;em.UV</quantity>
	[NUV_FLUXERR_ISO] [real] NULL,

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal;em.UV</quantity>
	[NUV_MAG_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV</quantity>
	[NUV_MAGERR_ISO] [real] NULL,

	--/ <summary>Flux aperture (   2.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_1] [real] NULL,

	--/ <summary>Flux aperture (   3.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_2] [real] NULL,

	--/ <summary>Flux aperture (   5.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_3] [real] NULL,

	--/ <summary>Flux aperture (   8.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_4] [real] NULL,

	--/ <summary>Flux aperture (  12.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_5] [real] NULL,

	--/ <summary>Flux aperture (  17.000 px)</summary>
	--/ <quantity></quantity>
	[NUV_FLUX_APER_6] [real] NULL,

	--/ <summary>Flux aperture (  23.000 px)</summary>
	--/ <quantity></quantity>
	[NUV_FLUX_APER_7] [real] NULL,

	--/ <summary>Flux error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_1] [real] NULL,

	--/ <summary>Flux error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_2] [real] NULL,

	--/ <summary>Flux error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_3] [real] NULL,

	--/ <summary>Flux error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_4] [real] NULL,

	--/ <summary>Flux error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_5] [real] NULL,

	--/ <summary>Flux error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_6] [real] NULL,

	--/ <summary>Flux error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_7] [real] NULL,

	--/ <summary>Magnitude aperture (   2.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_1] [real] NULL,

	--/ <summary>Magnitude aperture (   3.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_2] [real] NULL,

	--/ <summary>Magnitude aperture (   5.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_3] [real] NULL,

	--/ <summary>Magnitude aperture (   8.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_4] [real] NULL,

	--/ <summary>Magnitude aperture (  12.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_5] [real] NULL,

	--/ <summary>Magnitude aperture (  17.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_6] [real] NULL,

	--/ <summary>Magnitude aperture (  23.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_7] [real] NULL,

	--/ <summary>Magnitude error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_1] [real] NULL,

	--/ <summary>Magnitude error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_2] [real] NULL,

	--/ <summary>Magnitude error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_3] [real] NULL,

	--/ <summary>Magnitude error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_4] [real] NULL,

	--/ <summary>Magnitude error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_5] [real] NULL,

	--/ <summary>Magnitude error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_6] [real] NULL,

	--/ <summary>Magnitude error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_7] [real] NULL,

	--/ <summary>Flux within a Kron-like elliptical aperture</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO flux</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_AUTO] [real] NULL,

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_AUTO] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.2000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_1] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.5000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_2] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.8000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_3] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_4] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9500)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_5] [real] NULL,

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_KRON_RADIUS] [real] NULL,

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>phot.flux</quantity>
	[NUV_BACKGROUND] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[NUV_THRESHOLD] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[NUV_MU_THRESHOLD] [real] NULL,

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	[NUV_FLUX_MAX] [real] NULL,

	--/ <summary>Peak surface brightness above background</summary>
	--/ <quantity>phot.flux.sb;stat.max</quantity>
	[NUV_MU_MAX] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREA_IMAGE] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREA_WORLD] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREAF_IMAGE] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREAF_WORLD] [real] NULL,

	--/ <summary>Minimum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.min</quantity>
	[NUV_XMIN_IMAGE] [int] NULL,

	--/ <summary>Minimum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.min</quantity>
	[NUV_YMIN_IMAGE] [int] NULL,

	--/ <summary>Maximum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.max</quantity>
	[NUV_XMAX_IMAGE] [int] NULL,

	--/ <summary>Maximum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.max</quantity>
	[NUV_YMAX_IMAGE] [int] NULL,

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[NUV_X_IMAGE] [real] NULL,

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[NUV_Y_IMAGE] [real] NULL,

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[NUV_XPEAK_IMAGE] [int] NULL,

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[NUV_YPEAK_IMAGE] [int] NULL,

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;pos.barycenter</quantity>
	[NUV_ALPHA_J2000] [float] NULL,

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;pos.barycenter</quantity>
	[NUV_DELTA_J2000] [float] NULL,

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_X2_IMAGE] [real] NULL,

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_Y2_IMAGE] [real] NULL,

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	[NUV_XY_IMAGE] [real] NULL,

	--/ <summary>Variance along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_X2_WORLD] [real] NULL,

	--/ <summary>Variance along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_Y2_WORLD] [real] NULL,

	--/ <summary>Covariance between X-WORLD and Y-WORLD</summary>
	--/ <quantity>stat.covariance</quantity>
	[NUV_XY_WORLD] [real] NULL,

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXX_IMAGE] [real] NULL,

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CYY_IMAGE] [real] NULL,

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXY_IMAGE] [real] NULL,

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXX_WORLD] [real] NULL,

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CYY_WORLD] [real] NULL,

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXY_WORLD] [real] NULL,

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[NUV_A_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[NUV_B_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[NUV_A_WORLD] [real] NULL,

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[NUV_B_WORLD] [real] NULL,

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_IMAGE] [real] NULL,

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_WORLD] [real] NULL,

	--/ <summary>Position angle (east of north) (J2000)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_J2000] [real] NULL,

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>pos.phaseAng</quantity>
	[NUV_ELONGATION] [real] NULL,

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ELLIPTICITY] [real] NULL,

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[NUV_ERRX2_IMAGE] [float] NULL,

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[NUV_ERRY2_IMAGE] [float] NULL,

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[NUV_ERRXY_IMAGE] [real] NULL,

	--/ <summary>Variance of position along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[NUV_ERRX2_WORLD] [float] NULL,

	--/ <summary>Variance of position along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[NUV_ERRY2_WORLD] [float] NULL,

	--/ <summary>Covariance of position X-WORLD/Y-WORLD</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[NUV_ERRXY_WORLD] [real] NULL,

	--/ <summary>Cxx error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXX_IMAGE] [real] NULL,

	--/ <summary>Cyy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCYY_IMAGE] [real] NULL,

	--/ <summary>Cxy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXY_IMAGE] [real] NULL,

	--/ <summary>Cxx error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXX_WORLD] [real] NULL,

	--/ <summary>Cyy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCYY_WORLD] [real] NULL,

	--/ <summary>Cxy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXY_WORLD] [real] NULL,

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRA_IMAGE] [real] NULL,

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRB_IMAGE] [real] NULL,

	--/ <summary>World RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRA_WORLD] [real] NULL,

	--/ <summary>World RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRB_WORLD] [real] NULL,

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_IMAGE] [real] NULL,

	--/ <summary>Error ellipse pos. angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_WORLD] [real] NULL,

	--/ <summary>J2000 error ellipse pos. angle (east of north)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_J2000] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_FWHM_IMAGE] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_FWHM_WORLD] [real] NULL,

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[NUV_FLAGS] [smallint] NULL,

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[NUV_CLASS_STAR] [real] NULL,

	--/ <summary>Running object number</summary>
	--/ <quantity>met.number</quantity>
	[FUV_NUMBER] [int] NULL,

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal;em.UV.FUV</quantity>
	[FUV_FLUX_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal;em.UV.FUV</quantity>
	[FUV_FLUXERR_ISO] [real] NULL,

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal;em.UV.FUV</quantity>
	[FUV_MAG_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV.FUV</quantity>
	[FUV_MAGERR_ISO] [real] NULL,

	--/ <summary>Flux aperture (   2.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_1] [real] NULL,

	--/ <summary>Flux aperture (   3.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_2] [real] NULL,

	--/ <summary>Flux aperture (   5.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_3] [real] NULL,

	--/ <summary>Flux aperture (   8.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_4] [real] NULL,

	--/ <summary>Flux aperture (  12.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_5] [real] NULL,

	--/ <summary>Flux aperture (  17.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_6] [real] NULL,

	--/ <summary>Flux aperture (  23.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_7] [real] NULL,

	--/ <summary>Flux error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_1] [real] NULL,

	--/ <summary>Flux error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_2] [real] NULL,

	--/ <summary>Flux error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_3] [real] NULL,

	--/ <summary>Flux error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_4] [real] NULL,

	--/ <summary>Flux error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_5] [real] NULL,

	--/ <summary>Flux error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_6] [real] NULL,

	--/ <summary>Flux error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_7] [real] NULL,

	--/ <summary>Magnitude aperture (   2.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_1] [real] NULL,

	--/ <summary>Magnitude aperture (   3.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_2] [real] NULL,

	--/ <summary>Magnitude aperture (   5.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_3] [real] NULL,

	--/ <summary>Magnitude aperture (   8.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_4] [real] NULL,

	--/ <summary>Magnitude aperture (  12.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_5] [real] NULL,

	--/ <summary>Magnitude aperture (  17.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_6] [real] NULL,

	--/ <summary>Magnitude aperture (  23.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_7] [real] NULL,

	--/ <summary>Magnitude error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_1] [real] NULL,

	--/ <summary>Magnitude error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_2] [real] NULL,

	--/ <summary>Magnitude error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_3] [real] NULL,

	--/ <summary>Magnitude error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_4] [real] NULL,

	--/ <summary>Magnitude error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_5] [real] NULL,

	--/ <summary>Magnitude error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_6] [real] NULL,

	--/ <summary>Magnitude error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_7] [real] NULL,

	--/ <summary>Flux within a Kron-like elliptical aperture</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO flux</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_AUTO] [real] NULL,

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[FUV_MAGERR_AUTO] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.2000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_1] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.5000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_2] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.8000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_3] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_4] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9500)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_5] [real] NULL,

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_KRON_RADIUS] [real] NULL,

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>phot.flux</quantity>
	[FUV_BACKGROUND] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[FUV_THRESHOLD] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[FUV_MU_THRESHOLD] [real] NULL,

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	[FUV_FLUX_MAX] [real] NULL,

	--/ <summary>Peak surface brightness above background</summary>
	--/ <quantity>phot.flux.sb;stat.max</quantity>
	[FUV_MU_MAX] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREA_IMAGE] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREA_WORLD] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREAF_IMAGE] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREAF_WORLD] [real] NULL,

	--/ <summary>Minimum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.min</quantity>
	[FUV_XMIN_IMAGE] [int] NULL,

	--/ <summary>Minimum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.min</quantity>
	[FUV_YMIN_IMAGE] [int] NULL,

	--/ <summary>Maximum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.max</quantity>
	[FUV_XMAX_IMAGE] [int] NULL,

	--/ <summary>Maximum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.max</quantity>
	[FUV_YMAX_IMAGE] [int] NULL,

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[FUV_X_IMAGE] [real] NULL,

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[FUV_Y_IMAGE] [real] NULL,

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[FUV_XPEAK_IMAGE] [int] NULL,

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[FUV_YPEAK_IMAGE] [int] NULL,

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;pos.barycenter</quantity>
	[FUV_ALPHA_J2000] [float] NULL,

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;pos.barycenter</quantity>
	[FUV_DELTA_J2000] [float] NULL,

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_X2_IMAGE] [real] NULL,

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_Y2_IMAGE] [real] NULL,

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	[FUV_XY_IMAGE] [real] NULL,

	--/ <summary>Variance along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_X2_WORLD] [real] NULL,

	--/ <summary>Variance along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_Y2_WORLD] [real] NULL,

	--/ <summary>Covariance between X-WORLD and Y-WORLD</summary>
	--/ <quantity>stat.covariance</quantity>
	[FUV_XY_WORLD] [real] NULL,

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXX_IMAGE] [real] NULL,

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CYY_IMAGE] [real] NULL,

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXY_IMAGE] [real] NULL,

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXX_WORLD] [real] NULL,

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CYY_WORLD] [real] NULL,

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXY_WORLD] [real] NULL,

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[FUV_A_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[FUV_B_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[FUV_A_WORLD] [real] NULL,

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[FUV_B_WORLD] [real] NULL,

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_IMAGE] [real] NULL,

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_WORLD] [real] NULL,

	--/ <summary>Position angle (east of north) (J2000)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_J2000] [real] NULL,

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>pos.phaseAng</quantity>
	[FUV_ELONGATION] [real] NULL,

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ELLIPTICITY] [real] NULL,

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[FUV_ERRX2_IMAGE] [float] NULL,

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[FUV_ERRY2_IMAGE] [float] NULL,

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[FUV_ERRXY_IMAGE] [real] NULL,

	--/ <summary>Variance of position along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[FUV_ERRX2_WORLD] [float] NULL,

	--/ <summary>Variance of position along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[FUV_ERRY2_WORLD] [float] NULL,

	--/ <summary>Covariance of position X-WORLD/Y-WORLD</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[FUV_ERRXY_WORLD] [real] NULL,

	--/ <summary>Cxx error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXX_IMAGE] [real] NULL,

	--/ <summary>Cyy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCYY_IMAGE] [real] NULL,

	--/ <summary>Cxy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXY_IMAGE] [real] NULL,

	--/ <summary>Cxx error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXX_WORLD] [real] NULL,

	--/ <summary>Cyy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCYY_WORLD] [real] NULL,

	--/ <summary>Cxy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXY_WORLD] [real] NULL,

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRA_IMAGE] [real] NULL,

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRB_IMAGE] [real] NULL,

	--/ <summary>World RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRA_WORLD] [real] NULL,

	--/ <summary>World RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRB_WORLD] [real] NULL,

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_IMAGE] [real] NULL,

	--/ <summary>Error ellipse pos. angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_WORLD] [real] NULL,

	--/ <summary>J2000 error ellipse pos. angle (east of north)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_J2000] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_FWHM_IMAGE] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_FWHM_WORLD] [real] NULL,

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[FUV_FLAGS] [smallint] NULL,

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[FUV_CLASS_STAR] [real] NULL,

	--/ <summary>Spectrum Flag. Does this object have a spectrum? Yes (1), No (0)</summary>
	--/ <quantity>meta.code;spect</quantity>
	[isThereSpectrum] [bit] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NULL DEFAULT ((0)),

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NULL DEFAULT ((0)),

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PKPhotoObjAll] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PhotoObj]
) ON [PhotoObj]

GO

--/ <summary> A location on the sky planned for observations </summary>
--/ <remarks> </remarks>
CREATE TABLE [dbo].[PSExtract](

	--/ <quantity>meta.id</quantity>
	[PSExtractID] [bigint] NOT NULL,
	
	--/ <quantity>meta.id</quantity>
	[survey] [char](3) NOT NULL,
	
	--/ <quantity>meta.id</quantity>
	[tilename] [varchar](32) NOT NULL,
	
	--/ <quantity>pos.eq.ra</quantity>
	[raCenter] [numeric](10, 5) NOT NULL,
	
	--/ <quantity>pos.eq.dec</quantity>
	[decCenter] [numeric](10, 5) NOT NULL,
	
	--/ <quantity>pos.cartesian.x</quantity>
	[xCenter] [numeric](10, 5) NULL,
	
	--/ <quantity>pos.cartesian.y</quantity>
	[yCenter] [numeric](10, 5) NULL,
	
	--/ <quantity>instr.offset</quantity>
	--/ <unit>arcmin</unit>
	[offSetDstInArcMin] [float] NULL,
	
	--/ <quantity>time.duration;obs.exposure</quantity>
	[nuv_exptime] [float] NULL,
	
	--/ <quantity>time.duration;obs.exposure</quantity>
	[fuv_exptime] [float] NULL,
	
	--/ <quantity>meta.id</quantity>
	[imagingTilenum] [int] NOT NULL,
	
	--/ <quantity>meta.id</quantity>
	[spectraTilenum] [int] NOT NULL,
	
	--/ <quantity>meta.number</quantity>
	[nuv_Visits] [int] NULL,
	
	--/ <quantity>meta.number</quantity>
	[fuv_Visits] [int] NULL,
	
	--/ <quantity>meta.number</quantity>
	[nSpectra] [int] NOT NULL,
	[img] [int] NOT NULL,
	[subvis] [smallint] NOT NULL,
	[fullResColorJpeg] [varchar](256) NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE dbo.PSExtract
ADD CONSTRAINT PK_PSExtract PRIMARY KEY CLUSTERED 
(
	PSExtractID
) WITH (DATA_COMPRESSION = PAGE, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

--/ <summary> A location on the sky planned for observations </summary>
--/ <remarks> </remarks>
CREATE TABLE [dbo].[target](

	--/ <quantity>meta.id</quantity>
	[plan_id] [bigint] NOT NULL,

	--/ <summary>Unique Id of tile</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](32) NOT NULL,

	--/ <summary>Time of command execution, relative to start of eclipse</summary>
	--/ <quantity>time.duration</quantity>
	[offset_secs] [float] NOT NULL,

	--/ <summary>Observation mode</summary>
	--/ <quantity>meta.note;obs</quantity>
	[mode] [varchar](8) NOT NULL,

	--/ <summary>Boresight right ascension, J2000 frame</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Boresight declination, J2000 frame</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Satellite twist angle aka roll</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[twist] [float] NOT NULL,

	--/ <summary>X axis rotation rate</summary>
	--/ <quantity></quantity>
	--/ <unit>rad s-1</unit>
	[omegax] [float] NOT NULL,

	--/ <summary>Y axis rotation rate</summary>
	--/ <quantity>phys.veloc.rotat</quantity>
	--/ <unit>rad s-1</unit>
	[omegay] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmId] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneId] [int] NOT NULL,
 CONSTRAINT [PK_Target] PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC,
	[target_id] ASC,
	[offset_secs] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--/ <summary>  </summary>
--/ <remarks>  </remarks>
CREATE TABLE [dbo].[visitimg](
	--/ <summary>Pointer to IMG Table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgID] [bigint] NOT NULL,

	--/ <summary>Pointer to imgrun table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgRunID] [bigint] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[dec_cent] [float] NULL,

	--/ <summary>Reduction version (high level)</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[tileNum] [int] NULL,

	[tile] [varchar](32) NULL,

	--/ <summary>Observation type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[ow] [int] NULL,

	--/ <summary>Reduction product number (type)</summary>
	--/ <quantity>meta.id</quantity>
	[prod] [int] NULL,

	--/ <summary>pointer to the extraction of the two NUV and FUV images</summary>
	--/ <quantity>meta.id</quantity>
	[img] [int] NULL,

	--/ <summary>Reduction try number (low level)</summary>
	--/ <quantity>meta.number</quantity>
	[try] [int] NULL,

	[visit] [int] NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.note</quantity>
	[nuv_fileNPath] [varchar](256) NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_fileNPath] [varchar](256) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[nuv_simple] [varchar](32) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_simple] [varchar](32) NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_bitpix] [int] NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_bitpix] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis] [int] NULL,

	--/ <summary>length of data axis 1</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis1] [int] NULL,

	--/ <summary>length of data axis 1</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis1] [int] NULL,

	--/ <summary>length of data axis 2</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_naxis2] [int] NULL,

	--/ <summary>length of data axis 2</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_naxis2] [int] NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity>meta.note</quantity>
	[nuv_extend] [varchar](32) NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_extend] [varchar](32) NULL,

	--/ <summary>The HEASARC Long String Convention may be used.</summary>
	--/ <quantity>meta.note</quantity>
	[nuv_longstrn] [varchar](32) NULL,

	--/ <summary>The HEASARC Long String Convention may be used.</summary>
	--/ <quantity>meta.note</quantity>
	[fuv_longstrn] [varchar](32) NULL,

	[nuv_cdelt1] [float] NULL,

	[fuv_cdelt1] [float] NULL,

	[nuv_cdelt2] [float] NULL,

	[fuv_cdelt2] [float] NULL,

	[nuv_equinox] [float] NULL,

	[fuv_equinox] [float] NULL,

	[nuv_epoch] [float] NULL,

	[fuv_epoch] [float] NULL,

	[nuv_ctype1] [varchar](32) NULL,

	[fuv_ctype1] [varchar](32) NULL,

	[nuv_ctype2] [varchar](32) NULL,

	[fuv_ctype2] [varchar](32) NULL,

	[nuv_crpix1] [float] NULL,

	[fuv_crpix1] [float] NULL,

	[nuv_crpix2] [float] NULL,

	[fuv_crpix2] [float] NULL,

	[nuv_crval1] [float] NULL,

	[fuv_crval1] [float] NULL,

	[nuv_crval2] [float] NULL,

	[fuv_crval2] [float] NULL,

	[nuv_crota2] [float] NULL,

	[fuv_crota2] [float] NULL,

	[nuv_bunit] [varchar](32) NULL,

	[fuv_bunit] [varchar](32) NULL,

	[nuv_bscale] [float] NULL,

	[fuv_bscale] [float] NULL,

	[nuv_bzero] [float] NULL,

	[fuv_bzero] [float] NULL,

	[nuv_phofile] [varchar](192) NULL,

	[fuv_phofile] [varchar](192) NULL,

	[nuv_aspfile] [varchar](192) NULL,

	[fuv_aspfile] [varchar](192) NULL,

	[nuv_hkfile] [varchar](32) NULL,

	[fuv_hkfile] [varchar](32) NULL,

	[nuv_calpath] [varchar](64) NULL,

	[fuv_calpath] [varchar](64) NULL,

	[nuv_flatfl] [varchar](128) NULL,

	[fuv_flatfl] [varchar](128) NULL,

	[nuv_dtbgndfl] [varchar](32) NULL,

	[fuv_dtbgndfl] [varchar](32) NULL,

	[nuv_spflatfl] [varchar](32) NULL,

	[fuv_spflatfl] [varchar](32) NULL,

	[nuv_maskfl] [varchar](128) NULL,

	[fuv_maskfl] [varchar](128) NULL,

	[nuv_smapvers] [varchar](128) NULL,

	[fuv_smapvers] [varchar](128) NULL,

	[nuv_psffwhm] [float] NULL,

	[fuv_psffwhm] [float] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[nuv_band] [int] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[fuv_band] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[nuv_ow] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[fuv_ow] [int] NULL,

	[nuv_direct] [int] NULL,

	[fuv_direct] [int] NULL,

	[nuv_grism] [int] NULL,

	[fuv_grism] [int] NULL,

	[nuv_opaque] [int] NULL,

	[fuv_opaque] [int] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[nuv_ra_cent] [float] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[fuv_ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[nuv_dec_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[fuv_dec_cent] [float] NULL,

	[nuv_twist] [float] NULL,

	[fuv_twist] [float] NULL,

	[nuv_grspa] [float] NULL,

	[fuv_grspa] [float] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_leg] [int] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_leg] [int] NULL,

	[nuv_mpsnpos] [int] NULL,

	[fuv_mpsnpos] [int] NULL,

	[nuv_minivis] [int] NULL,

	[fuv_minivis] [int] NULL,

	[nuv_subvis] [int] NULL,

	[fuv_subvis] [int] NULL,

	[nuv_object] [varchar](64) NULL,

	[fuv_object] [varchar](64) NULL,

	[nuv_expstart] [float] NULL,

	[fuv_expstart] [float] NULL,

	[nuv_expend] [float] NULL,

	[fuv_expend] [float] NULL,

	[nuv_obs_date] [varchar](32) NULL,

	[fuv_obs_date] [varchar](32) NULL,

	[nuv_time_obs] [varchar](32) NULL,

	[fuv_time_obs] [varchar](32) NULL,

	[nuv_obsdatim] [varchar](32) NULL,

	[fuv_obsdatim] [varchar](32) NULL,

	[nuv_obssecs] [float] NULL,

	[fuv_obssecs] [float] NULL,

	[nuv_eclipse] [int] NULL,

	[fuv_eclipse] [int] NULL,

	[nuv_visit] [int] NULL,

	[fuv_visit] [int] NULL,

	[nuv_planid] [int] NULL,

	[fuv_planid] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_tilenum] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_tilenum] [int] NULL,

	[nuv_tile] [varchar](32) NULL,

	[fuv_tile] [varchar](32) NULL,

	[nuv_tilename] [varchar](32) NULL,

	[fuv_tilename] [varchar](32) NULL,

	[nuv_mpsplan] [varchar](32) NULL,

	[fuv_mpsplan] [varchar](32) NULL,

	[nuv_mpstype] [varchar](32) NULL,

	[fuv_mpstype] [varchar](32) NULL,

	[nuv_mpsphase] [varchar](32) NULL,

	[fuv_mpsphase] [varchar](32) NULL,

	[nuv_roll] [float] NULL,

	[fuv_roll] [float] NULL,

	[nuv_skygrid] [int] NULL,

	[fuv_skygrid] [int] NULL,

	[nuv_nhvnom] [int] NULL,

	[fuv_nhvnom] [int] NULL,

	[nuv_nhvnomn] [int] NULL,

	[fuv_nhvnomn] [int] NULL,

	[nuv_nhvnomf] [int] NULL,

	[fuv_nhvnomf] [int] NULL,

	[nuv_whichims] [int] NULL,

	[fuv_whichims] [int] NULL,

	[nuv_nvalidph] [int] NULL,

	[fuv_nvalidph] [int] NULL,

	[nuv_smnsecs] [int] NULL,

	[fuv_smnsecs] [int] NULL,

	[nuv_smr0] [float] NULL,

	[fuv_smr0] [float] NULL,

	[nuv_smr1] [float] NULL,

	[fuv_smr1] [float] NULL,

	[nuv_smnltr0] [int] NULL,

	[fuv_smnltr0] [int] NULL,

	[nuv_smnltr1] [int] NULL,

	[fuv_smnltr1] [int] NULL,

	[nuv_smnr0r1] [int] NULL,

	[fuv_smnr0r1] [int] NULL,

	[nuv_smngtr1] [int] NULL,

	[fuv_smngtr1] [int] NULL,

	[nuv_smr8ltr0] [float] NULL,

	[fuv_smr8ltr0] [float] NULL,

	[nuv_smr8gtr1] [float] NULL,

	[fuv_smr8gtr1] [float] NULL,

	[nuv_smr8r0r1] [float] NULL,

	[fuv_smr8r0r1] [float] NULL,

	[nuv_grelease] [varchar](32) NULL,

	[fuv_grelease] [varchar](32) NULL,

	[nuv_scstgrel] [varchar](32) NULL,

	[fuv_scstgrel] [varchar](32) NULL,

	[nuv_ndtdet] [float] NULL,

	[fuv_ndtdet] [float] NULL,

	[nuv_ndttdc] [float] NULL,

	[fuv_ndttdc] [float] NULL,

	[nuv_ndtampa] [float] NULL,

	[fuv_ndtampa] [float] NULL,

	[nuv_ndtampb] [float] NULL,

	[fuv_ndtampb] [float] NULL,

	[nuv_ndtcon] [float] NULL,

	[fuv_ndtcon] [float] NULL,

	[nuv_itnuvoba] [float] NULL,

	[fuv_itnuvoba] [float] NULL,

	[nuv_ndthvps] [float] NULL,

	[fuv_ndthvps] [float] NULL,

	[nuv_ndtlvps] [float] NULL,

	[fuv_ndtlvps] [float] NULL,

	[nuv_ndtdib] [float] NULL,

	[fuv_ndtdib] [float] NULL,

	[nuv_ndhvmon] [float] NULL,

	[fuv_ndhvmon] [float] NULL,

	[nuv_ndhimon] [float] NULL,

	[fuv_ndhimon] [float] NULL,

	[nuv_ndsfhv] [float] NULL,

	[fuv_ndsfhv] [float] NULL,

	[nuv_ndctec] [float] NULL,

	[fuv_ndctec] [float] NULL,

	[nuv_ndcfec] [float] NULL,

	[fuv_ndcfec] [float] NULL,

	[nuv_ndcdec] [float] NULL,

	[fuv_ndcdec] [float] NULL,

	[nuv_fdtdet] [float] NULL,

	[fuv_fdtdet] [float] NULL,

	[nuv_fdttdc] [float] NULL,

	[fuv_fdttdc] [float] NULL,

	[nuv_fdtampa] [float] NULL,

	[fuv_fdtampa] [float] NULL,

	[nuv_fdtampb] [float] NULL,

	[fuv_fdtampb] [float] NULL,

	[nuv_fdtcon] [float] NULL,

	[fuv_fdtcon] [float] NULL,

	[nuv_itfuvoba] [float] NULL,

	[fuv_itfuvoba] [float] NULL,

	[nuv_fdthvps] [float] NULL,

	[fuv_fdthvps] [float] NULL,

	[nuv_fdtlvps] [float] NULL,

	[fuv_fdtlvps] [float] NULL,

	[nuv_fdtdib] [float] NULL,

	[fuv_fdtdib] [float] NULL,

	[nuv_fdhvmon] [float] NULL,

	[fuv_fdhvmon] [float] NULL,

	[nuv_fdhimon] [float] NULL,

	[fuv_fdhimon] [float] NULL,

	[nuv_fdsfhv] [float] NULL,

	[fuv_fdsfhv] [float] NULL,

	[nuv_fdctec] [float] NULL,

	[fuv_fdctec] [float] NULL,

	[nuv_fdcfec] [float] NULL,

	[fuv_fdcfec] [float] NULL,

	[nuv_fdcdec] [float] NULL,

	[fuv_fdcdec] [float] NULL,

	[nuv_itm1hshl] [float] NULL,

	[fuv_itm1hshl] [float] NULL,

	[nuv_itm2hub] [float] NULL,

	[fuv_itm2hub] [float] NULL,

	[nuv_itcylbaf] [float] NULL,

	[fuv_itcylbaf] [float] NULL,

	[nuv_nchunks] [int] NULL,

	[fuv_nchunks] [int] NULL,

	[nuv_nruns] [float] NULL,

	[fuv_nruns] [float] NULL,

	[nuv_phtrng0] [float] NULL,

	[fuv_phtrng0] [float] NULL,

	[nuv_phtrng1] [float] NULL,

	[fuv_phtrng1] [float] NULL,

	[nuv_phtfirst] [float] NULL,

	[fuv_phtfirst] [float] NULL,

	[nuv_phtlast] [float] NULL,

	[fuv_phtlast] [float] NULL,

	[nuv_phtelap] [float] NULL,

	[fuv_phtelap] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>sec</unit>
	[nuv_exptime] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>sec</unit>
	[fuv_exptime] [float] NULL,

	[nuv_ngaps] [float] NULL,

	[fuv_ngaps] [float] NULL,

	[nuv_totread] [float] NULL,

	[fuv_totread] [float] NULL,

	[nuv_totmap] [float] NULL,

	[fuv_totmap] [float] NULL,

	[nuv_totonmap] [float] NULL,

	[fuv_totonmap] [float] NULL,

	[nuv_nmasked] [float] NULL,

	[fuv_nmasked] [float] NULL,

	[nuv_nvisible] [float] NULL,

	[fuv_nvisible] [float] NULL,

	[nuv_nstim1] [float] NULL,

	[fuv_nstim1] [float] NULL,

	[nuv_stim1x] [float] NULL,

	[fuv_stim1x] [float] NULL,

	[nuv_stim1y] [float] NULL,

	[fuv_stim1y] [float] NULL,

	[nuv_nstim2] [float] NULL,

	[fuv_nstim2] [float] NULL,

	[nuv_stim2x] [float] NULL,

	[fuv_stim2x] [float] NULL,

	[nuv_stim2y] [float] NULL,

	[fuv_stim2y] [float] NULL,

	[nuv_nstim3] [float] NULL,

	[fuv_nstim3] [float] NULL,

	[nuv_stim3x] [float] NULL,

	[fuv_stim3x] [float] NULL,

	[nuv_stim3y] [float] NULL,

	[fuv_stim3y] [float] NULL,

	[nuv_nstim4] [float] NULL,

	[fuv_nstim4] [float] NULL,

	[nuv_stim4x] [float] NULL,

	[fuv_stim4x] [float] NULL,

	[nuv_stim4y] [float] NULL,

	[fuv_stim4y] [float] NULL,

	[nuv_cntmed] [float] NULL,

	[fuv_cntmed] [float] NULL,

	[nuv_cntave] [float] NULL,

	[fuv_cntave] [float] NULL,

	[nuv_cntpct1] [float] NULL,

	[fuv_cntpct1] [float] NULL,

	[nuv_cntpct99] [float] NULL,

	[fuv_cntpct99] [float] NULL,

	[nuv_xnot0ave] [float] NULL,

	[fuv_xnot0ave] [float] NULL,

	[nuv_ynot0ave] [float] NULL,

	[fuv_ynot0ave] [float] NULL,

	[nuv_nnot0] [float] NULL,

	[fuv_nnot0] [float] NULL,

	[nuv_rrmed] [float] NULL,

	[fuv_rrmed] [float] NULL,

	[nuv_rrave] [float] NULL,

	[fuv_rrave] [float] NULL,

	[nuv_rrpct1] [float] NULL,

	[fuv_rrpct1] [float] NULL,

	[nuv_rrpct99] [float] NULL,

	[fuv_rrpct99] [float] NULL,

	[nuv_naspok] [int] NULL,

	[fuv_naspok] [int] NULL,

	[nuv_naspall] [int] NULL,

	[fuv_naspall] [int] NULL,

	[nuv_naspxy] [int] NULL,

	[fuv_naspxy] [int] NULL,

	[nuv_avaspx] [float] NULL,

	[fuv_avaspx] [float] NULL,

	[nuv_avaspy] [float] NULL,

	[fuv_avaspy] [float] NULL,

	[nuv_avasprrx] [float] NULL,

	[fuv_avasprrx] [float] NULL,

	[nuv_avasprry] [float] NULL,

	[fuv_avasprry] [float] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[nuv_avaspra] [float] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[fuv_avaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[nuv_avaspdec] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[fuv_avaspdec] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[nuv_avasprol] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[fuv_avasprol] [float] NULL,

	[nuv_nstmsamp] [int] NULL,

	[fuv_nstmsamp] [int] NULL,

	[nuv_stmtime] [float] NULL,

	[fuv_stmtime] [float] NULL,

	[nuv_stm1x] [float] NULL,

	[fuv_stm1x] [float] NULL,

	[nuv_stm1y] [float] NULL,

	[fuv_stm1y] [float] NULL,

	[nuv_stm2x] [float] NULL,

	[fuv_stm2x] [float] NULL,

	[nuv_stm2y] [float] NULL,

	[fuv_stm2y] [float] NULL,

	[nuv_stm3x] [float] NULL,

	[fuv_stm3x] [float] NULL,

	[nuv_stm3y] [float] NULL,

	[fuv_stm3y] [float] NULL,

	[nuv_stm4x] [float] NULL,

	[fuv_stm4x] [float] NULL,

	[nuv_stm4y] [float] NULL,

	[fuv_stm4y] [float] NULL,

	[nuv_stmsclx] [float] NULL,

	[fuv_stmsclx] [float] NULL,

	[nuv_stmoffx] [float] NULL,

	[fuv_stmoffx] [float] NULL,

	[nuv_stmoffy] [float] NULL,

	[fuv_stmoffy] [float] NULL,

	[nuv_stm1xsd] [float] NULL,

	[fuv_stm1xsd] [float] NULL,

	[nuv_stm3xsd] [float] NULL,

	[fuv_stm3xsd] [float] NULL,

	[nuv_stm1ysd] [float] NULL,

	[fuv_stm1ysd] [float] NULL,

	[nuv_stm2ysd] [float] NULL,

	[fuv_stm2ysd] [float] NULL,

	[nuv_r8int] [float] NULL,

	[fuv_r8int] [float] NULL,

	[nuv_nrates] [int] NULL,

	[fuv_nrates] [int] NULL,

	[nuv_maxrates] [int] NULL,

	[fuv_maxrates] [int] NULL,

	[nuv_aver8] [float] NULL,

	[fuv_aver8] [float] NULL,

	[nuv_sigr8] [float] NULL,

	[fuv_sigr8] [float] NULL,

	[nuv_minr8] [float] NULL,

	[fuv_minr8] [float] NULL,

	[nuv_maxr8] [float] NULL,

	[fuv_maxr8] [float] NULL,

	[nuv_avestmr8] [float] NULL,

	[fuv_avestmr8] [float] NULL,

	[nuv_sigstmr8] [float] NULL,

	[fuv_sigstmr8] [float] NULL,

	[nuv_minstmr8] [float] NULL,

	[fuv_minstmr8] [float] NULL,

	[nuv_maxstmr8] [float] NULL,

	[fuv_maxstmr8] [float] NULL,

	[nuv_nodead] [int] NULL,

	[fuv_nodead] [int] NULL,

	[nuv_ndedhist] [int] NULL,

	[fuv_ndedhist] [int] NULL,

	[nuv_ndedzero] [int] NULL,

	[fuv_ndedzero] [int] NULL,

	[nuv_ndead] [int] NULL,

	[fuv_ndead] [int] NULL,

	[nuv_avefdead] [float] NULL,

	[fuv_avefdead] [float] NULL,

	[nuv_sigfdead] [float] NULL,

	[fuv_sigfdead] [float] NULL,

	[nuv_minfdead] [float] NULL,

	[fuv_minfdead] [float] NULL,

	[nuv_maxfdead] [float] NULL,

	[fuv_maxfdead] [float] NULL,

	[nuv_ndead1] [int] NULL,

	[fuv_ndead1] [int] NULL,

	[nuv_avefded1] [float] NULL,

	[fuv_avefded1] [float] NULL,

	[nuv_sigfded1] [float] NULL,

	[fuv_sigfded1] [float] NULL,

	[nuv_minfded1] [float] NULL,

	[fuv_minfded1] [float] NULL,

	[nuv_maxfded1] [float] NULL,

	[fuv_maxfded1] [float] NULL,

	[nuv_ndead2] [int] NULL,

	[fuv_ndead2] [int] NULL,

	[nuv_avefded2] [float] NULL,

	[fuv_avefded2] [float] NULL,

	[nuv_sigfded2] [float] NULL,

	[fuv_sigfded2] [float] NULL,

	[nuv_minfded2] [float] NULL,

	[fuv_minfded2] [float] NULL,

	[nuv_maxfded2] [float] NULL,

	[fuv_maxfded2] [float] NULL,

	[nuv_nskip] [int] NULL,

	[fuv_nskip] [int] NULL,

	[nuv_nskip00] [int] NULL,

	[fuv_nskip00] [int] NULL,

	[nuv_nskip01] [int] NULL,

	[fuv_nskip01] [int] NULL,

	[nuv_nskip02] [int] NULL,

	[fuv_nskip02] [int] NULL,

	[nuv_nskip03] [int] NULL,

	[fuv_nskip03] [int] NULL,

	[nuv_nskip04] [int] NULL,

	[fuv_nskip04] [int] NULL,

	[nuv_nskip05] [int] NULL,

	[fuv_nskip05] [int] NULL,

	[nuv_nskip06] [int] NULL,

	[fuv_nskip06] [int] NULL,

	[nuv_nskip07] [int] NULL,

	[fuv_nskip07] [int] NULL,

	[nuv_nskip08] [int] NULL,

	[fuv_nskip08] [int] NULL,

	[nuv_nskip09] [int] NULL,

	[fuv_nskip09] [int] NULL,

	[nuv_nskip10] [int] NULL,

	[fuv_nskip10] [int] NULL,

	[nuv_nskip11] [int] NULL,

	[fuv_nskip11] [int] NULL,

	[nuv_pmedrr] [float] NULL,

	[fuv_pmedrr] [float] NULL,

	[nuv_pthresh] [float] NULL,

	[fuv_pthresh] [float] NULL,

	[nuv_pmedbg] [float] NULL,

	[fuv_pmedbg] [float] NULL,

	[nuv_prmsbg] [float] NULL,

	[fuv_prmsbg] [float] NULL,

	[nuv_pthrbg] [float] NULL,

	[fuv_pthrbg] [float] NULL,

	[nuv_psigdet] [float] NULL,

	[fuv_psigdet] [float] NULL,

	[nuv_pmedthr] [float] NULL,

	[fuv_pmedthr] [float] NULL,

	[nuv_prmsthr] [float] NULL,

	[fuv_prmsthr] [float] NULL,

	[subvis] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[subGridId] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[gridId] [int] NULL,

	--/ <summary>indicates GR release, 2.0, 3.0, ...</summary>
	--/ <quantity>meta.version</quantity>
	[GRReleaseNumber] [real] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmid] [bigint] NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneid] [int] NULL,
 CONSTRAINT [PKVisitImg] PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--/ <summary> Extraction run information </summary>
--/ <remarks> Each record contains the extraction parameters for NUV and FUV band. </remarks>
CREATE TABLE [dbo].[visitphotoextract](
	--/ <summary>pointer to the extraction of the two NUV and FUV images</summary>
	--/ <quantity>meta.id</quantity>
	[photoExtractID] [bigint] NOT NULL,

	--/ <summary>Pointer to IMG Table for NUV or FUV image</summary>
	--/ <quantity>meta.id</quantity>
	[imgID] [bigint] NOT NULL,

	--/ <summary>fits file where this metadata is extracted</summary>
	--/ <quantity>meta.note</quantity>
	[fileNPath] [varchar](256) NULL,

	--/ <summary>file does conform to FITS standard</summary>
	--/ <quantity>meta.note</quantity>
	[simple] [varchar](32) NULL,

	--/ <summary>number of bits per data pixel</summary>
	--/ <quantity>meta.number</quantity>
	[bitpix] [int] NULL,

	--/ <summary>number of data axes</summary>
	--/ <quantity>meta.number</quantity>
	[naxis] [int] NULL,

	--/ <summary>FITS dataset may contain extensions</summary>
	--/ <quantity>meta.note</quantity>
	[extend] [varchar](32) NULL,

	[origin] [varchar](32) NULL,

	--/ <summary>NUV source catalog file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvfile] [varchar](256) NULL,

	--/ <summary>FUV source catalog file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvfile] [varchar](256) NULL,

	--/ <summary>NUV weight image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvwtfil] [varchar](256) NULL,

	--/ <summary>FUV weight image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvwtfil] [varchar](256) NULL,

	--/ <summary>NUV count image file (</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvcntfi] [varchar](256) NULL,

	--/ <summary>FUV count image file (</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvcntfi] [varchar](256) NULL,

	--/ <summary>NUV intensity image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvintfi] [varchar](256) NULL,

	--/ <summary>FUV intensity image file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvintfi] [varchar](256) NULL,

	--/ <summary>NUV literal weight file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvlwtfi] [varchar](256) NULL,

	--/ <summary>FUV literal weight file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvlwtfi] [varchar](256) NULL,

	--/ <summary>NUV sky background file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvskyfi] [varchar](256) NULL,

	--/ <summary>FUV sky background file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvskyfi] [varchar](256) NULL,

	--/ <summary>NUV artifact flags file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nuvflgfi] [varchar](256) NULL,

	--/ <summary>FUV artifact flags file</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fuvflgfi] [varchar](256) NULL,

	--/ <summary>RTA star m</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[mchfile] [varchar](256) NULL,

	[starcat] [varchar](256) NULL,

	[nstar] [int] NULL,

	[nmch] [int] NULL,

	[rmean] [float] NULL,

	[rmeansd] [float] NULL,

	[rstddev] [float] NULL,

	[rmin] [float] NULL,

	[rmax] [float] NULL,

	[acnmch] [int] NULL,

	[acrave] [float] NULL,

	[acravsd] [float] NULL,

	[acrsd] [float] NULL,

	[acrmin] [float] NULL,

	[acrmax] [float] NULL,

	--/ <summary>Minimum S/N for NUV merges.</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[nuvs2n] [float] NULL,

	--/ <summary>Minimum S/N for FUV merges.</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[fuvs2n] [float] NULL,

	--/ <summary>S/N Cutoff for any NUV sources.</summary>
	--/ <quantity>stat.snr</quantity>
	[nuvs2ncu] [float] NULL,

	--/ <summary>S/N Cutoff for any FUV sources.</summary>
	--/ <quantity>stat.snr</quantity>
	[fuvs2ncu] [float] NULL,

	--/ <summary>Number of NUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[nuvnum] [int] NULL,

	--/ <summary>Number of FUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[fuvnum] [int] NULL,

	--/ <summary>Maximum separation in arcsec.</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>arcsec</unit>
	[seplim] [float] NULL,

	--/ <summary>Accept all witin this separation in arcsec.</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>arcsec</unit>
	[autosep] [float] NULL,

	--/ <summary>Minimum probability for matches.</summary>
	--/ <quantity>stat.probability;stat.min</quantity>
	[problim] [varchar](32) NULL,

	--/ <summary>NUV median background in pho/s/sq.arcmin</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[nuvback] [float] NULL,

	--/ <summary>FUV median background in pho/s/sq.arcmin</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[fuvback] [real] NULL,

	--/ <summary>Band Separation Correction in X(ra) (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bsc_x] [real] NULL,

	--/ <summary>Band Separation Correction in Y(dec)(arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bsc_y] [real] NULL,

	--/ <summary>Radial error in correction estimate (arcsec)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>arcsec</unit>
	[bsc_e] [real] NULL,

	--/ <summary>Number of points used in band separ. estimate</summary>
	--/ <quantity>meta.number</quantity>
	[bsc_n] [real] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[ra_cent] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[dec_cent] [float] NULL,

	--/ <summary>RA center for this field.</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[rao] [float] NULL,

	--/ <summary>DEC center for this field.</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[deco] [float] NULL,

	--/ <summary>Total number of sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totnum] [int] NULL,

	--/ <summary>Number of filled sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totfill] [int] NULL,

	--/ <summary>Number of unfilled NUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totufn] [int] NULL,

	--/ <summary>Number of unfilled FUV sources.</summary>
	--/ <quantity>meta.number</quantity>
	[totuff] [int] NULL,

	--/ <summary>Largest NUV ID number plus one.</summary>
	--/ <quantity>meta.id</quantity>
	[lrgnuvid] [int] NULL,

	--/ <summary>Field center galactic longitude (deg)</summary>
	--/ <quantity>pos.galactic.lon;obs.field</quantity>
	[glono] [float] NULL,

	--/ <summary>Field center galactic lattitude (deg)</summary>
	--/ <quantity>pos.galactic.lat;obs.field</quantity>
	[glato] [float] NULL,

	--/ <summary>NUV Zero Point Magnitude</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	[n_zpmag] [float] NULL,

	--/ <summary>FUV Zero Point Magnitude</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	[f_zpmag] [float] NULL,

	--/ <summary>NUV Zero Point Scale Factor</summary>
	--/ <quantity>instr.scale</quantity>
	[n_zpscal] [float] NULL,

	--/ <summary>FUV Zero Point Scale Factor</summary>
	--/ <quantity>instr.scale</quantity>
	[f_zpscal] [float] NULL,

	--/ <summary>Calibration magnitude type</summary>
	--/ <quantity>meta.note</quantity>
	[calmag] [varchar](32) NULL,

	--/ <summary>NUV scale: pho/sec to micro Janskys</summary>
	--/ <quantity>instr.scale</quantity>
	[n_cuj] [float] NULL,

	--/ <summary>FUV scale: pho/sec to micro Janskys</summary>
	--/ <quantity>instr.scale</quantity>
	[f_cuj] [float] NULL,

	--/ <summary>Neighbor radius limit 1 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r1] [float] NULL,

	--/ <summary>Neighbor radius limit 2 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r2] [float] NULL,

	--/ <summary>Neighbor radius limit 3 (arcsec)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r3] [float] NULL,

	--/ <summary>Median Source NUV background(pho/sec/sq.arcsec)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcsec-2</unit>
	[n_back] [float] NULL,

	--/ <summary>Median Source FUV background(pho/sec/sq.arcsec)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcsec-2</unit>
	[f_back] [float] NULL,

	--/ <summary>(Adjusted) Median separation between matches (a</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsepa] [float] NULL,

	--/ <summary>Median separation between matches (arcsec)</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsep] [float] NULL,

	--/ <summary>Median sep. betw. matches (sigma arcsec)</summary>
	--/ <quantity>stat.error;pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[medsepsg] [float] NULL,

	--/ <summary>Matched sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[matden] [float] NULL,

	--/ <summary>Un-matched NUV sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[nufden] [float] NULL,

	--/ <summary>Un-matched FUV sources per sq. deg. (rad&lt;0.5)</summary>
	--/ <quantity>meta.number</quantity>
	[fufden] [float] NULL,

	--/ <summary>Un-matched FUV Cand. w/s2n>NUVS2N(usu. 2) /sq.d</summary>
	--/ <quantity></quantity>
	[fufdenc] [float] NULL,

	--/ <summary>Number unfilled NUV w/possbl FUV match(any S/N)</summary>
	--/ <quantity>meta.number</quantity>
	[nufmat] [int] NULL,

	--/ <summary>Number unfilled FUV w/possbl NUV match(any S/N)</summary>
	--/ <quantity>meta.number</quantity>
	[fufmat] [int] NULL,

	--/ <summary>Number of NUV 0 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg0] [int] NULL,

	--/ <summary>Number of NUV 1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg1] [int] NULL,

	--/ <summary>Number of NUV 2 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg2] [int] NULL,

	--/ <summary>Number of NUV 3 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg3] [int] NULL,

	--/ <summary>Number of NUV 4 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg4] [int] NULL,

	--/ <summary>Number of NUV 5 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg5] [int] NULL,

	--/ <summary>Number of NUV 6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambg6] [int] NULL,

	--/ <summary>Number of NUV -6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambgm6] [int] NULL,

	--/ <summary>Number of NUV -1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[n_ambgm1] [int] NULL,

	--/ <summary>Number of FUV 0 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg0] [int] NULL,

	--/ <summary>Number of FUV 1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg1] [int] NULL,

	--/ <summary>Number of FUV 2 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg2] [int] NULL,

	--/ <summary>Number of FUV 3 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg3] [int] NULL,

	--/ <summary>Number of FUV 4 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg4] [int] NULL,

	--/ <summary>Number of FUV 5 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg5] [int] NULL,

	--/ <summary>Number of FUV 6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambg6] [int] NULL,

	--/ <summary>Number of FUV -6 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambgm6] [int] NULL,

	--/ <summary>Number of FUV -1 ambig.</summary>
	--/ <quantity>meta.number</quantity>
	[f_ambgm1] [int] NULL,

	--/ <quantity>meta.id;meta.file</quantity>
	[filename] [varchar](256) NULL,

	--/ <quantity>meta.id;meta.file</quantity>
	[directry] [varchar](192) NULL,

	--/ <summary>Reduction version (high level)</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number (a.k.a. field or target)</summary>
	--/ <quantity>meta.id</quantity>
	[tilenum] [int] NULL,

	--/ <summary>Observation type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code</quantity>
	[ow] [int] NULL,

	--/ <summary>Reduction product number (type)</summary>
	--/ <quantity>meta.version</quantity>
	[prod] [int] NULL,

	--/ <summary>Image number (visit+subvis)</summary>
	--/ <quantity>meta.id</quantity>
	[img] [int] NULL,

	--/ <summary>Reduction try number (low level)</summary>
	--/ <quantity>meta.id</quantity>
	[try] [int] NULL,

	--/ <summary>PETAL card value from -scst.fits file.</summary>
	--/ <quantity>meta.code</quantity>
	[petal] [int] NULL,

	--/ <quantity>time.epoch</quantity>
	[epoch] [float] NULL,

	[object] [varchar](128) NULL,

	[crval1] [float] NULL,

	[crval2] [float] NULL,

	[crpix1] [float] NULL,

	[crpix2] [float] NULL,

	[cdelt1] [float] NULL,

	[cdelt2] [float] NULL,

	[crota1] [float] NULL,

	[crota2] [float] NULL,

	[grelease] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[equinox] [float] NULL,

	[eclipse] [int] NULL,

	[leg] [int] NULL,

	[mpsnpos] [int] NULL,

	[visit] [int] NULL,

	[subvis] [int] NULL,

	[roll] [float] NULL,

	--/ <quantity>time.epoch</quantity>
	[obs_date] [varchar](32) NULL,

	--/ <quantity>time.epoch</quantity>
	[obsdatim] [varchar](32) NULL,

	--/ <quantity>meta.id</quantity>
	[tilename] [varchar](64) NULL,

	--/ <quantity>meta.id</quantity>
	[planid] [int] NULL,

	[mpsphase] [varchar](32) NULL,

	[mpsplan] [varchar](32) NULL,

	[mpstype] [varchar](32) NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	[avaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	[avaspdec] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[avasprol] [float] NULL,

	[avaspok] [float] NULL,

	--/ <summary>Number of apertures.</summary>
	--/ <quantity>meta.number</quantity>
	[num_aper] [int] NULL,

	--/ <summary>Aperture #1 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper1] [float] NULL,

	--/ <summary>Aperture #2 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper2] [float] NULL,

	--/ <summary>Aperture #3 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper3] [float] NULL,

	--/ <summary>Aperture #4 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper4] [float] NULL,

	--/ <summary>Aperture #5 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper5] [float] NULL,

	--/ <summary>Aperture #6 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper6] [float] NULL,

	--/ <summary>Aperture #7 in pixels</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[sxaper7] [float] NULL,

	--/ <summary>Number of fraction-of-light radii.</summary>
	--/ <quantity>meta.number</quantity>
	[num_fol] [int] NULL,

	--/ <summary>Fraction-of-light radius #1</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac1] [float] NULL,

	--/ <summary>Fraction-of-light radius #2</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac2] [float] NULL,

	--/ <summary>Fraction-of-light radius #3</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac3] [float] NULL,

	--/ <summary>Fraction-of-light radius #4</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac4] [float] NULL,

	--/ <summary>Fraction-of-light radius #5</summary>
	--/ <quantity>phys.angSize</quantity>
	[sxfrac5] [float] NULL,

	[abscal] [varchar](64) NULL,

	[calinfo] [varchar](256) NULL,

	[statfile] [varchar](256) NULL,

	[abspipe] [varchar](192) NULL,

	[prundat0] [varchar](32) NULL,

	[prundat1] [varchar](32) NULL,

	[nlegs] [int] NULL,

	[nhvnom] [int] NULL,

	[nhvnomn] [int] NULL,

	[nhvnomf] [int] NULL,

	[mpscow] [varchar](32) NULL,

	[longstrn] [varchar](32) NULL,

	[pipestat] [int] NULL,

	[nepoch] [float] NULL,

	[nobject] [varchar](128) NULL,

	[norigin] [varchar](32) NULL,

	[ncrval1] [float] NULL,

	[ncrval2] [float] NULL,

	[ncrpix1] [float] NULL,

	[ncrpix2] [float] NULL,

	[ncdelt1] [float] NULL,

	[ncdelt2] [float] NULL,

	[ncrota1] [float] NULL,

	[ncrota2] [float] NULL,

	--/ <summary>IMAGE WIDTH (PIXELS) SEXIMASX originally</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[nsximasx] [int] NULL,

	--/ <summary>IMAGE HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[nsximasy] [int] NULL,

	--/ <summary>STRIP HEIGHT (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[nsxstrsy] [int] NULL,

	--/ <summary>FITS IMAGE BITPIX</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	[nsximabp] [int] NULL,

	--/ <summary>PIXEL SCALE (ARCSEC)</summary>
	--/ <quantity>instr.scale</quantity>
	--/ <unit>arcsec</unit>
	[nsxpixs] [float] NULL,

	--/ <summary>SEEING FWHM (ARCSEC)</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	--/ <unit>arcsec</unit>
	[nsxsfwhm] [float] NULL,

	--/ <summary>CLASSIFICATION NNW FILENAME</summary>
	--/ <quantity>meta.id</quantity>
	[nsxnnwf] [varchar](128) NULL,

	--/ <summary>GAIN (IN E- PER ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxgain] [float] NULL,

	--/ <summary>MEDIAN BACKGROUND (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxbkgnd] [float] NULL,

	--/ <summary>MEDIAN RMS (ADU)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>adu</unit>
	[nsxbkdev] [float] NULL,

	--/ <summary>EXTRACTION THRESHOLD (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[nsxbkthd] [float] NULL,

	--/ <summary>CONFIGURATION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nsxconff] [varchar](128) NULL,

	--/ <summary>DETECTION TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxdett] [varchar](32) NULL,

	--/ <summary>THRESHOLD TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxthldt] [varchar](32) NULL,

	--/ <summary>THRESHOLD</summary>
	--/ <quantity></quantity>
	[nsxthld] [float] NULL,

	--/ <summary>EXTRACTION MINIMUM AREA (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxminar] [int] NULL,

	--/ <summary>CONVOLUTION FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxconv] [varchar](32) NULL,

	--/ <summary>CONVOLUTION NORM. FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxconvn] [varchar](32) NULL,

	--/ <summary>CONVOLUTION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[nsxconvf] [varchar](128) NULL,

	--/ <summary>NUMBER OF SUB-THRESHOLDS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxdbldn] [int] NULL,

	--/ <summary>CONTRAST PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[nsxdbldc] [float] NULL,

	--/ <summary>CLEANING FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[nsxcln] [varchar](32) NULL,

	--/ <summary>CLEANING PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[nsxclnpa] [float] NULL,

	--/ <summary>CLEANING OBJECT-STACK</summary>
	--/ <quantity>meta.code</quantity>
	[nsxclnst] [int] NULL,

	--/ <summary>APERTURE DIAMETER (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxaperd] [int] NULL,

	--/ <summary>KRON PARAMETER</summary>
	--/ <quantity>obs.param</quantity>
	[nsxapek1] [float] NULL,

	--/ <summary>KRON ANALYSIS RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxapek2] [float] NULL,

	--/ <summary>KRON MINIMUM RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxapek3] [float] NULL,

	--/ <summary>SATURATION LEVEL (ADU)</summary>
	--/ <quantity>instr.saturation</quantity>
	--/ <unit>adu</unit>
	[nsxsatlv] [float] NULL,

	--/ <summary>MAGNITUDE ZERO-POINT</summary>
	--/ <quantity>phot.mag</quantity>
	[nsxmgzpt] [float] NULL,

	--/ <summary>MAGNITUDE GAMMA</summary>
	--/ <quantity>phot.mag</quantity>
	[nsxmggam] [float] NULL,

	--/ <summary>BACKGROUND MESH WIDTH (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxbkgsx] [int] NULL,

	--/ <summary>BACKGROUND MESH HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[nsxbkgsy] [int] NULL,

	--/ <summary>BACKGROUND FILTER WIDTH</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxbkgfx] [int] NULL,

	--/ <summary>BACKGROUND FILTER HEIGHT</summary>
	--/ <quantity>phys.angSize</quantity>
	[nsxbkgfy] [int] NULL,

	--/ <summary>PHOTOM BACKGROUND TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[nsxpbkgt] [varchar](32) NULL,

	--/ <summary>LOCAL AREA THICKNESS (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[nsxpbkgs] [int] NULL,

	--/ <summary>PIXEL STACKSIZE (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[nsxpixsk] [int] NULL,

	--/ <summary>FRAME-BUFFER SIZE (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[nsxfbufs] [int] NULL,

	--/ <summary>ISO-APER RATIO</summary>
	--/ <quantity>arith.ratio</quantity>
	[nsxisapr] [float] NULL,

	--/ <summary>NB OF DETECTIONS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxndet] [int] NULL,

	--/ <summary>NB OF FINAL EXTRACTED OBJECTS</summary>
	--/ <quantity>meta.number</quantity>
	[nsxnfin] [int] NULL,

	--/ <summary>NB OF PARAMETERS PER OBJECT</summary>
	--/ <quantity>meta.number</quantity>
	[nsxnpara] [int] NULL,

	[ngreleas] [varchar](32) NULL,

	[nctype1] [varchar](32) NULL,

	[nctype2] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[nequinox] [float] NULL,

	--/ <summary>RA_CENT originally</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[nra_cent] [float] NULL,

	--/ <summary>DEC_CENT originally</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[ndec_cen] [float] NULL,

	[ntwist] [float] NULL,

	[neclipse] [int] NULL,

	[ngrspa] [float] NULL,

	[nleg] [int] NULL,

	[nmpsnpos] [int] NULL,

	[nvisit] [int] NULL,

	[nsubvis] [int] NULL,

	[nminivis] [int] NULL,

	[now] [int] NULL,

	[nband] [int] NULL,

	[nroll] [float] NULL,

	[nexptime] [float] NULL,

	--/ <summary>EXPSTART originally</summary>
	--/ <quantity>time.start</quantity>
	[nexpstar] [float] NULL,

	[nexpend] [float] NULL,

	--/ <summary>OBS-DATE originally</summary>
	--/ <quantity>time.epoch</quantity>
	[nobs_dat] [varchar](32) NULL,

	--/ <summary>TIME-OBS, was OBS-TIME</summary>
	--/ <quantity>time.epoch</quantity>
	[ntime_ob] [varchar](32) NULL,

	[nobssecs] [float] NULL,

	--/ <summary>OBSDATIM originally</summary>
	--/ <quantity></quantity>
	[nobsdati] [varchar](32) NULL,

	--/ <summary>TILENAME originally</summary>
	--/ <quantity>meta.id</quantity>
	[ntilenam] [varchar](64) NULL,

	[ntilenum] [int] NULL,

	[nplanid] [int] NULL,

	--/ <summary>MPSPHASE originally</summary>
	--/ <quantity></quantity>
	[nmpsphas] [varchar](32) NULL,

	[nmpsplan] [varchar](32) NULL,

	[nmpstype] [varchar](32) NULL,

	[nimagszx] [int] NULL,

	[nimagszy] [int] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.mean</quantity>
	[navaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.mean</quantity>
	[navaspde] [float] NULL,

	[navaspx] [float] NULL,

	[navaspy] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	[navaspro] [float] NULL,

	[navaspok] [float] NULL,

	[ncalpath] [varchar](32) NULL,

	[nflatfl] [varchar](64) NULL,

	--/ <summary>INTIMAGE originally</summary>
	--/ <quantity></quantity>
	[nintimag] [varchar](256) NULL,

	[nphofile] [varchar](256) NULL,

	--/ <summary>NVALIDPH originally</summary>
	--/ <quantity></quantity>
	[nnvalidp] [int] NULL,

	--/ <summary>FILTERED originally</summary>
	--/ <quantity></quantity>
	[nfiltere] [int] NULL,

	[npsffwhm] [float] NULL,

	--/ <summary>CONVFWHM originally</summary>
	--/ <quantity></quantity>
	[ncnvfwhm] [float] NULL,

	[npoisbg] [float] NULL,

	[nsigthre] [int] NULL,

	[nabsthre] [int] NULL,

	--/ <summary>SXDBGRMS originally</summary>
	--/ <quantity></quantity>
	[nsxdbgrm] [float] NULL,

	[nareadet] [float] NULL,

	[npsigdet] [float] NULL,

	[npmedbg] [float] NULL,

	[npmedrr] [float] NULL,

	[npthrbg] [float] NULL,

	[npthresh] [float] NULL,

	--/ <summary>AVEPEFIX originally</summary>
	--/ <quantity></quantity>
	[navepefi] [float] NULL,

	--/ <summary>MINPEFIX originally</summary>
	--/ <quantity></quantity>
	[nminpefi] [float] NULL,

	--/ <summary>MAXPEFIX originally</summary>
	--/ <quantity></quantity>
	[nmaxpefi] [float] NULL,

	[navepea] [float] NULL,

	[nminpea] [float] NULL,

	[nmaxpea] [float] NULL,

	[nsxwd] [varchar](192) NULL,

	[nacoxyav] [float] NULL,

	[nacoxyme] [float] NULL,

	[nacoxysd] [float] NULL,

	[nacoxymn] [float] NULL,

	[nacoxymx] [float] NULL,

	[nabscal] [varchar](32) NULL,

	[ncalinfo] [varchar](128) NULL,

	[nstatfil] [varchar](128) NULL,

	[nabspipe] [varchar](128) NULL,

	[nprunda0] [varchar](32) NULL,

	[nprunda1] [varchar](32) NULL,

	[npipecmn] [varchar](32) NULL,

	[nnlegs] [int] NULL,

	[nmpscow] [varchar](32) NULL,

	[nnhvnom] [float] NULL,

	[nnhvnomn] [float] NULL,

	[nnhvnomf] [float] NULL,

	[npipesta] [int] NULL,

	[nlongstr] [varchar](32) NULL,

	[fepoch] [float] NULL,

	[fobject] [varchar](128) NULL,

	[forigin] [varchar](32) NULL,

	[fcrval1] [float] NULL,

	[fcrval2] [float] NULL,

	[fcrpix1] [float] NULL,

	[fcrpix2] [float] NULL,

	[fcdelt1] [float] NULL,

	[fcdelt2] [float] NULL,

	[fcrota1] [float] NULL,

	[fcrota2] [float] NULL,

	--/ <summary>IMAGE WIDTH (PIXELS) SEXIMASX originally</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[fsximasx] [int] NULL,

	--/ <summary>IMAGE HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	--/ <unit>pix</unit>
	[fsximasy] [int] NULL,

	--/ <summary>STRIP HEIGHT (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[fsxstrsy] [int] NULL,

	--/ <summary>FITS IMAGE BITPIX</summary>
	--/ <quantity>phys.size;obs.image</quantity>
	[fsximabp] [int] NULL,

	--/ <summary>PIXEL SCALE (ARCSEC)</summary>
	--/ <quantity>instr.scale</quantity>
	--/ <unit>arcsec</unit>
	[fsxpixs] [float] NULL,

	--/ <summary>SEEING FWHM (ARCSEC)</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	--/ <unit>arcsec</unit>
	[fsxsfwhm] [float] NULL,

	--/ <summary>CLASSIFICATION NNW FILENAME</summary>
	--/ <quantity>meta.id</quantity>
	[fsxnnwf] [varchar](128) NULL,

	--/ <summary>GAIN (IN E- PER ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxgain] [float] NULL,

	--/ <summary>MEDIAN BACKGROUND (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxbkgnd] [float] NULL,

	--/ <summary>MEDIAN RMS (ADU)</summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit>adu</unit>
	[fsxbkdev] [float] NULL,

	--/ <summary>EXTRACTION THRESHOLD (ADU)</summary>
	--/ <quantity></quantity>
	--/ <unit>adu</unit>
	[fsxbkthd] [float] NULL,

	--/ <summary>CONFIGURATION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fsxconff] [varchar](128) NULL,

	--/ <summary>DETECTION TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxdett] [varchar](32) NULL,

	--/ <summary>THRESHOLD TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxthldt] [varchar](32) NULL,

	--/ <summary>THRESHOLD</summary>
	--/ <quantity></quantity>
	[fsxthld] [float] NULL,

	--/ <summary>EXTRACTION MINIMUM AREA (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fsxminar] [int] NULL,

	--/ <summary>CONVOLUTION FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxconv] [varchar](32) NULL,

	--/ <summary>CONVOLUTION NORM. FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxconvn] [varchar](32) NULL,

	--/ <summary>CONVOLUTION FILENAME</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[fsxconvf] [varchar](128) NULL,

	--/ <summary>NUMBER OF SUB-THRESHOLDS</summary>
	--/ <quantity>meta.number</quantity>
	[fsxdbldn] [int] NULL,

	--/ <summary>CONTRAST PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[fsxdbldc] [float] NULL,

	--/ <summary>CLEANING FLAG</summary>
	--/ <quantity>meta.code</quantity>
	[fsxcln] [varchar](32) NULL,

	--/ <summary>CLEANING PARAMETER</summary>
	--/ <quantity>instr.param</quantity>
	[fsxclnpa] [float] NULL,

	--/ <summary>CLEANING OBJECT-STACK</summary>
	--/ <quantity>meta.code</quantity>
	[fsxclnst] [int] NULL,

	--/ <summary>APERTURE DIAMETER (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fsxaperd] [int] NULL,

	--/ <summary>KRON PARAMETER</summary>
	--/ <quantity>obs.param</quantity>
	[fsxapek1] [float] NULL,

	--/ <summary>KRON ANALYSIS RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxapek2] [float] NULL,

	--/ <summary>KRON MINIMUM RADIUS</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxapek3] [float] NULL,

	--/ <summary>SATURATION LEVEL (ADU)</summary>
	--/ <quantity>instr.saturation</quantity>
	--/ <unit>adu</unit>
	[fsxsatlv] [float] NULL,

	--/ <summary>MAGNITUDE ZERO-POINT</summary>
	--/ <quantity>phot.mag</quantity>
	[fsxmgzpt] [float] NULL,

	--/ <summary>MAGNITUDE GAMMA</summary>
	--/ <quantity>phot.ma</quantity>
	[fsxmggam] [float] NULL,

	--/ <summary>BACKGROUND MESH WIDTH (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgsx] [int] NULL,

	--/ <summary>BACKGROUND MESH HEIGHT (PIXELS)</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgsy] [int] NULL,

	--/ <summary>BACKGROUND FILTER WIDTH</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgfx] [int] NULL,

	--/ <summary>BACKGROUND FILTER HEIGHT</summary>
	--/ <quantity>phys.angSize</quantity>
	[fsxbkgfy] [int] NULL,

	--/ <summary>PHOTOM BACKGROUND TYPE</summary>
	--/ <quantity>meta.note</quantity>
	[fsxpbkgt] [varchar](32) NULL,

	--/ <summary>LOCAL AREA THICKNESS (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[fsxpbkgs] [int] NULL,

	--/ <summary>PIXEL STACKSIZE (PIXELS)</summary>
	--/ <quantity>phys.size</quantity>
	--/ <unit>pix</unit>
	[fsxpixsk] [int] NULL,

	--/ <summary>FRAME-BUFFER SIZE (LINES)</summary>
	--/ <quantity>phys.size</quantity>
	[fsxfbufs] [int] NULL,

	--/ <summary>ISO-APER RATIO</summary>
	--/ <quantity>arith.ratio</quantity>
	[fsxisapr] [float] NULL,

	--/ <summary>NB OF DETECTIONS</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxndet] [int] NULL,

	--/ <summary>NB OF FINAL EXTRACTED OBJECTS</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxnfin] [int] NULL,

	--/ <summary>NB OF PARAMETERS PER OBJECT</summary>
	--/ <quantity>meta.numbe</quantity>
	[fsxnpara] [int] NULL,

	[fgreleas] [varchar](32) NULL,

	[fctype1] [varchar](32) NULL,

	[fctype2] [varchar](32) NULL,

	--/ <quantity>time.equinox</quantity>
	[fequinox] [float] NULL,

	--/ <summary>RA_CENT originally</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[fra_cent] [float] NULL,

	--/ <summary>DEC_CENT originally</summary>
	--/ <quantity></quantity>
	[fdec_cen] [float] NULL,

	[ftwist] [float] NULL,

	[feclipse] [int] NULL,

	[fgrspa] [float] NULL,

	[fleg] [int] NULL,

	[fmpsnpos] [int] NULL,

	[fvisit] [int] NULL,

	[fsubvis] [int] NULL,

	[fminivis] [int] NULL,

	[fow] [int] NULL,

	[fband] [int] NULL,

	[froll] [float] NULL,

	[fexptime] [float] NULL,

	--/ <summary>EXPSTART originally</summary>
	--/ <quantity>time.start</quantity>
	[fexpstar] [float] NULL,

	[fexpend] [float] NULL,

	--/ <summary>OBS-DATE originally</summary>
	--/ <quantity>time.epoch</quantity>
	[fobs_dat] [varchar](32) NULL,

	--/ <summary>TIME-OBS, was OBS-TIME</summary>
	--/ <quantity>time.epoch</quantity>
	[ftime_ob] [varchar](32) NULL,

	[fobssecs] [float] NULL,

	--/ <summary>OBSDATIM originally</summary>
	--/ <quantity></quantity>
	[fobsdati] [varchar](32) NULL,

	--/ <summary>TILENAME originally</summary>
	--/ <quantity>meta.id</quantity>
	[ftilenam] [varchar](64) NULL,

	[ftilenum] [int] NULL,

	[fplanid] [int] NULL,

	--/ <summary>MPSPHASE originally</summary>
	--/ <quantity></quantity>
	[fmpsphas] [varchar](32) NULL,

	[fmpsplan] [varchar](32) NULL,

	[fmpstype] [varchar](32) NULL,

	[fimagszx] [int] NULL,

	[fimagszy] [int] NULL,

	--/ <summary>Average Aspect RA of Field Center</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.mean</quantity>
	[favaspra] [float] NULL,

	--/ <summary>Average Aspect DEC of Field Center</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.mean</quantity>
	[favaspde] [float] NULL,

	[favaspx] [float] NULL,

	[favaspy] [float] NULL,

	--/ <summary>Average Aspect ROLL angle (deg)</summary>
	--/ <quantity>pos.posAng</quantity>
	[favaspro] [float] NULL,

	[favaspok] [float] NULL,

	[fcalpath] [varchar](32) NULL,

	[fflatfl] [varchar](64) NULL,

	--/ <summary>INTIMAGE originally</summary>
	--/ <quantity></quantity>
	[fintimag] [varchar](256) NULL,

	[fphofile] [varchar](256) NULL,

	--/ <summary>NVALIDPH originally</summary>
	--/ <quantity></quantity>
	[fnvalidp] [int] NULL,

	--/ <summary>FILTERED originally</summary>
	--/ <quantity></quantity>
	[ffiltere] [int] NULL,

	[fpsffwhm] [float] NULL,

	--/ <summary>CONVFWHM originally</summary>
	--/ <quantity></quantity>
	[fcnvfwhm] [float] NULL,

	[fpoisbg] [float] NULL,

	[fsigthre] [int] NULL,

	[fabsthre] [int] NULL,

	--/ <summary>SXDBGRMS originally</summary>
	--/ <quantity></quantity>
	[fsxdbgrm] [float] NULL,

	[fareadet] [float] NULL,

	[fpsigdet] [float] NULL,

	[fpmedbg] [float] NULL,

	[fpmedrr] [float] NULL,

	[fpthrbg] [float] NULL,

	[fpthresh] [float] NULL,

	--/ <summary>AVEPEFIX originally</summary>
	--/ <quantity></quantity>
	[favepefi] [float] NULL,

	--/ <summary>MINPEFIX originally</summary>
	--/ <quantity></quantity>
	[fminpefi] [float] NULL,

	--/ <summary>MAXPEFIX originally</summary>
	--/ <quantity></quantity>
	[fmaxpefi] [float] NULL,

	[favepea] [float] NULL,

	[fminpea] [float] NULL,

	[fmaxpea] [float] NULL,

	[fsxwd] [varchar](192) NULL,

	[facoxyav] [float] NULL,

	[facoxyme] [float] NULL,

	[facoxysd] [float] NULL,

	[facoxymn] [float] NULL,

	[facoxymx] [float] NULL,

	[fabscal] [varchar](32) NULL,

	[fcalinfo] [varchar](128) NULL,

	[fstatfil] [varchar](128) NULL,

	[fabspipe] [varchar](128) NULL,

	[fprunda0] [varchar](32) NULL,

	[fprunda1] [varchar](32) NULL,

	[fpipecmn] [varchar](32) NULL,

	[fnlegs] [int] NULL,

	[fmpscow] [varchar](32) NULL,

	[fnhvnom] [float] NULL,

	[fnhvnomn] [float] NULL,

	[fnhvnomf] [float] NULL,

	[fpipesta] [int] NULL,

	[flongstr] [varchar](32) NULL,

	[artflagb] [int] NULL,

	--/ <summary>Number of coadded visits.</summary>
	--/ <quantity>meta.number</quantity>
	[nnadded] [int] NULL,

	--/ <summary>Number of coadded visits.</summary>
	--/ <quantity>meta.number</quantity>
	[fnadded] [int] NULL,

	--/ <summary>file creation date (YYYY-MM-DDThh:mm:ss UT)</summary>
	--/ <quantity>time.epoch</quantity>
	[date] [varchar](64) NULL,

	[ndtdet] [float] NULL,

	[ndttdc] [float] NULL,

	[ndtampa] [float] NULL,

	[ndtampb] [float] NULL,

	[ndtcon] [float] NULL,

	[itnuvoba] [float] NULL,

	[ndthvps] [float] NULL,

	[ndtlvps] [float] NULL,

	[ndtdib] [float] NULL,

	[ndhvmon] [float] NULL,

	[ndhimon] [float] NULL,

	[ndsfhv] [float] NULL,

	[ndctec] [float] NULL,

	[ndcfec] [float] NULL,

	[ndcdec] [float] NULL,

	[fdtdet] [float] NULL,

	[fdttdc] [float] NULL,

	[fdtampa] [float] NULL,

	[fdtampb] [float] NULL,

	[fdtcon] [float] NULL,

	[itfuvoba] [float] NULL,

	[fdthvps] [float] NULL,

	[fdtlvps] [float] NULL,

	[fdtdib] [float] NULL,

	[fdhvmon] [float] NULL,

	[fdhimon] [float] NULL,

	[fdsfhv] [float] NULL,

	[fdctec] [float] NULL,

	[fdcfec] [float] NULL,

	[fdcdec] [float] NULL,

	[itm1hshl] [float] NULL,

	[itm2hub] [float] NULL,

	[itcylbaf] [float] NULL,

	--/ <summary>BQ: Number of NUV sources with 0 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc0] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 1 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc1] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 2 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc2] [int] NULL,

	--/ <summary>BQ: Number of NUV sources with 3 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqn_nc3] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 0 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc0] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 1 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc1] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 2 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc2] [int] NULL,

	--/ <summary>BQ: Number of FUV sources with 3 candidates</summary>
	--/ <quantity>meta.number</quantity>
	[bqf_nc3] [int] NULL,

	--/ <summary>BQ: Number of points used to compute DX,DY,etc.</summary>
	--/ <quantity>meta.number</quantity>
	[bqnum] [int] NULL,

	--/ <summary>BQ: Delta Detector X Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxmed] [float] NULL,

	--/ <summary>BQ: Delta Detector Y Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddymed] [float] NULL,

	--/ <summary>BQ: Delta Detector X RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddxrms] [float] NULL,

	--/ <summary>BQ: Delta Detector Y RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddyrms] [float] NULL,

	--/ <summary>BQ: Delta Detector X Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddxmrm] [float] NULL,

	--/ <summary>BQ: Delta Detector Y Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqddymrm] [float] NULL,

	--/ <summary>BQ: Inner(0.3 deg) Delta Detector X Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxinn] [float] NULL,

	--/ <summary>BQ: Inner(0.3 deg) Delta Detector Y Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddyinn] [float] NULL,

	--/ <summary>BQ: Outer(0.3 deg) Delta Detector X Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddxout] [float] NULL,

	--/ <summary>BQ: Outer(0.3 deg) Delta Detector Y Median (arc</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqddyout] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqsdxmed] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y Median (arcsec)</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[bqsdymed] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdxrms] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdyrms] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) X Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdxmrm] [float] NULL,

	--/ <summary>BQ: Delta Sky(RA,Dec) Y Mean RMS</summary>
	--/ <quantity>stat.error</quantity>
	[bqsdymrm] [float] NULL,

	--/ <summary>BQ: Median match angle (deg)</summary>
	--/ <quantity>pos.posAng;stat.median</quantity>
	--/ <unit>deg</unit>
	[bqangmed] [float] NULL,

	--/ <summary>BQ: Median probability</summary>
	--/ <quantity>stat.probability;stat.median</quantity>
	[bqprobmd] [float] NULL,

	--/ <summary>BQ: Median radial separation (arcsec)</summary>
	--/ <quantity>pos.distance;stat.median</quantity>
	--/ <unit>arcsec</unit>
	[bqsepmed] [float] NULL,

	--/ <summary>BQ: Median of log of NUV flux in pho/sec</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>ph s-1</unit>
	[bqnfxmed] [float] NULL,

	--/ <summary>BQ: Median of log of FUV flux in pho/sec</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ph s-1</unit>
	[bqffxmed] [float] NULL,

	--/ <summary>BQ: Median of NUV Major Axis FWHM (arcsec)</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[bqnaxmed] [float] NULL,

	--/ <summary>BQ: Median of FUV Major Axis FWHM (arcsec)</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[bqfaxmed] [float] NULL,

	--/ <summary>BQ: Median of NUV ellipticity (high s/n)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[bqnelmed] [float] NULL,

	--/ <summary>BQ: Median of NUV axis angle (deg) (high s/n)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[bqnaamed] [float] NULL,

	--/ <summary>BQ: Median of FUV axis angle (deg) (high s/n)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[bqfaamed] [float] NULL,

	--/ <summary>BQ: Median of NUV background (pho/s/sq.arcmin)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[bqnbckmd] [float] NULL,

	--/ <summary>BQ: Median of FUV background (pho/s/sq.arcmin)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>ph s-1 arcmin-2</unit>
	[bqfbckmd] [float] NULL,

	--/ <summary>BQ: NUV and FUV average exposure time in sec</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>sec</unit>
	[aexptime] [float] NULL,

	--/ <summary>BQ: Exposure time in seconds (based on NUV).</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	[exptime] [float] NULL,

	--/ <summary>BQ: Sky median separation in RA (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bqsmdra] [float] NULL,

	--/ <summary>BQ: Sky median separation in DEC (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bqsmddec] [float] NULL,

	--/ <summary>BQ: Sky adjusted median separation in RA (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[bqamdra] [float] NULL,

	--/ <summary>BQ: Sky adjusted median separation in DEC (arcsec)</summary>
	--/ <quantity>pos.distance;pos.eq.dec</quantity>
	--/ <unit>arcsec</unit>
	[bqamddec] [float] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[subGridId] [int] NULL,

	--/ <summary>?</summary>
	--/ <quantity>meta.id</quantity>
	[gridId] [int] NULL,

	--/ <summary>indicates GR release, 2.0, 3.0, ...</summary>
	--/ <quantity>meta.version</quantity>
	[GRReleaseNumber] [real] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [int] NULL,
 CONSTRAINT [PKVisitPhotoextract] PRIMARY KEY CLUSTERED 
(
	[photoExtractID] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--/ <summary>  </summary>
--/ <remarks>  </remarks>
CREATE TABLE [dbo].[visitphotoobjall](
	--/ <summary>Galex Global Object ID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Pointer to photoExtract Table</summary>
	--/ <quantity>meta.id</quantity>
	[photoExtractID] [bigint] NOT NULL DEFAULT ((0)),

	--/ <summary>Version number</summary>
	--/ <quantity>meta.version</quantity>
	[vsn] [int] NULL,

	--/ <summary>Tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tilenum] [int] NULL,

	--/ <summary>Obs.type (0=single,1=multi)</summary>
	--/ <quantity>meta.code;obs</quantity>
	[type] [int] NULL,

	--/ <summary>Optics wheel (1=drct,2=grsm,3=opaq)</summary>
	--/ <quantity>meta.code;instr</quantity>
	[ow] [int] NULL,

	--/ <summary>Product number (_visits,_main,etc.)</summary>
	--/ <quantity>meta.id</quantity>
	[prod] [int] NULL,

	--/ <summary>image number (exposure# for _visits)</summary>
	--/ <quantity>meta.number</quantity>
	[img] [int] NULL,

	--/ <summary>Try number (processing attempt number)</summary>
	--/ <quantity>meta.number</quantity>
	[try] [int] NULL,

	--/ <summary>Band number (1=nuv,2=fuv,3=both)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[band] [int] NULL,

	--/ <summary>Merged ID.</summary>
	--/ <quantity>meta.id</quantity>
	[id] [int] NULL,

	--/ <summary>Sub-visit number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[subvisit] [smallint] NULL,

	--/ <summary>Planned leg number for AIS</summary>
	--/ <quantity>meta.number</quantity>
	[leg] [smallint] NULL,

	--/ <summary>Right Ascension(degrees).</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination (degrees).</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Band-merged Right Ascension(degrees).</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[alpha_j2000_merged] [float] NULL,

	--/ <summary>Band-merged Declination (degrees).</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[delta_j2000_merged] [float] NULL,

	--/ <summary>Chi-squared probability of match.</summary>
	--/ <quantity>stat.probability</quantity>
	[prob] [real] NULL,

	--/ <summary>Separation between band positions.</summary>
	--/ <quantity>pos.distance</quantity>
	[sep] [real] NULL,

	--/ <summary>Separation on images (no adjustment)</summary>
	--/ <quantity>pos.distance</quantity>
	[sep_img] [real] NULL,

	--/ <summary>E(B-V) Galactic Reddening.</summary>
	--/ <quantity>phot.excess</quantity>
	[E_bv] [real] NULL,

	--/ <summary>Galactic longitude in degrees.</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [real] NULL,

	--/ <summary>Galactic latitude in degrees.</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [real] NULL,

	--/ <summary>Is AIS/MIS source a primary? (1/0)</summary>
	--/ <quantity>meta.code</quantity>
	[primary_flag] [int] NULL,

	--/ <summary>distance from center of FOV in degrees</summary>
	--/ <quantity>pos.distance</quantity>
	--/ <unit>deg</unit>
	[fov_radius] [real] NULL,

	--/ <summary>NUV detector X position (pixels)</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[nuv_det_x] [real] NULL,

	--/ <summary>NUV detector Y position (pixels)</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[nuv_det_y] [real] NULL,

	--/ <summary>FUV detector X position (pixels)</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[fuv_det_x] [real] NULL,

	--/ <summary>FUV detector Y position (pixels)</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[fuv_det_y] [real] NULL,

	--/ <summary>Astrometry check type</summary>
	--/ <quantity></quantity>
	[chkobj_type] [int] NULL,

	--/ <summary>Astrometry check ID</summary>
	--/ <quantity>meta.id</quantity>
	[chkobj_id] [int] NULL,

	--/ <summary>Astrometry check radius in degrees</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>deg</unit>
	[chkobj_r] [real] NULL,

	--/ <summary>Astrometry check position angle in degrees</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[chkobj_pa] [real] NULL,

	--/ <summary>Miscellaneous flags</summary>
	--/ <quantity>meta.code</quantity>
	[misc_flags] [int] NULL,

	--/ <summary>NUV calibrated flux (micro Jansky)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>uJy</unit>
	[nuv_flux] [real] NULL,

	--/ <summary>NUV calibrated flux error</summary>
	--/ <quantity>stat.error;phot.flux;em.UV</quantity>
	--/ <unit>uJy</unit>
	[nuv_fluxerr] [real] NULL,

	--/ <summary>NUV calibrated magnitude</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	--/ <unit>mag</unit>
	[nuv_mag] [real] NULL,

	--/ <summary>NUV calibrated magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.UV</quantity>
	--/ <unit>mag</unit>
	[nuv_magerr] [real] NULL,

	--/ <summary>FUV calibrated flux (micro Jansky)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>uJy</unit>
	[fuv_flux] [real] NULL,

	--/ <summary>FUV calibrated flux error</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>uJy</unit>
	[fuv_fluxerr] [real] NULL,

	--/ <summary>FUV calibrated magnitude</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_mag] [real] NULL,

	--/ <summary>FUV calibrated magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_magerr] [real] NULL,

	--/ <summary>NUV signal-to-noise from 'AUTO' flux value</summary>
	--/ <quantity>stat.snr</quantity>
	[nuv_s2n] [real] NULL,

	--/ <summary>FUV signal-to-noise from 'AUTO' flux value</summary>
	--/ <quantity>stat.snr</quantity>
	[fuv_s2n] [real] NULL,

	--/ <summary>NUV calibrated flux using FUV positn(-nd-fcat)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_fcat_flux] [real] NULL,

	--/ <summary>Error for nuv_fcat_flux</summary>
	--/ <quantity>stat.error;phot.flux;em.UV</quantity>
	[nuv_fcat_fluxerr] [real] NULL,

	--/ <summary>FUV calibrated flux using NUV positn(-fd-ncat)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_ncat_flux] [real] NULL,

	--/ <summary>Error for fuv_ncat_flux</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	[fuv_ncat_fluxerr] [real] NULL,

	--/ <summary>FUV adjusted RA in degrees</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[fuv_ra_adj] [float] NULL,

	--/ <summary>FUV adjusted DEC in degrees</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[fuv_dec_adj] [float] NULL,

	--/ <summary>FUV_FLAGS from -fd-ncat.fits</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_ncat_flags] [smallint] NULL,

	--/ <summary>FUV calibrated magnitude from -fd-ncat.fits</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	[fuv_ncat_mag] [real] NULL,

	--/ <summary>Error for fuv_ncat_mag</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	[fuv_ncat_magerr] [real] NULL,

	--/ <summary>Signal to noise for fuv_ncat_flux</summary>
	--/ <quantity>stat.snr;em.UV.FUV</quantity>
	[fuv_ncat_s2n] [real] NULL,

	--/ <summary>NUV calibrated magnitude from -nd-fcat.fits</summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	[nuv_fcat_mag] [real] NULL,

	--/ <summary>Error for nuv_fcat_mag</summary>
	--/ <quantity>stat.error;phot.mag;em.UV</quantity>
	[nuv_fcat_magerr] [real] NULL,

	--/ <summary>Signal to noise for nuv_fcat_flux</summary>
	--/ <quantity>stat.snr;em.UV</quantity>
	[nuv_fcat_s2n] [real] NULL,

	--/ <summary>FUV FWHM_IMAGE value from -fd-ncat.fits (px)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_fwhm_image] [real] NULL,

	--/ <summary>FUV FWHM_WORLD value from -fd-ncat.fits (deg)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>deg</unit>
	[fuv_ncat_fwhm_world] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #1 (-fd-ncat)(px)[0.20]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_1] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #2 (-fd-ncat)(px)[0.50]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_2] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #3 (-fd-ncat)(px)[0.80]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_3] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #4 (-fd-ncat)(px)[0.90]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_4] [real] NULL,

	--/ <summary>FUV FLUX_RADIUS #5 (-fd-ncat)(px)[0.95]</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[fuv_ncat_flux_radius_5] [real] NULL,

	--/ <summary>FUV FLUX_APER #1 (-fd-ncat)(cnt/sec)[ 2. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_1] [real] NULL,

	--/ <summary>FUV FLUX_APER #2 (-fd-ncat)(cnt/sec)[ 3. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_2] [real] NULL,

	--/ <summary>FUV FLUX_APER #3 (-fd-ncat)(cnt/sec)[ 5. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_3] [real] NULL,

	--/ <summary>FUV FLUX_APER #4 (-fd-ncat)(cnt/sec)[ 8. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_4] [real] NULL,

	--/ <summary>FUV FLUX_APER #5 (-fd-ncat)(cnt/sec)[12. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_5] [real] NULL,

	--/ <summary>FUV FLUX_APER #6 (-fd-ncat)(cnt/sec)[17. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_6] [real] NULL,

	--/ <summary>FUV FLUX_APER #7 (-fd-ncat)(cnt/sec)[23. px]</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_flux_aper_7] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_1</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_1] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_2</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_2] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_3</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_3] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_4</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_4] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_5</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_5] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_6</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_6] [real] NULL,

	--/ <summary>error for fuv_ncat_flux_aper_7</summary>
	--/ <quantity>stat.error;phot.flux;em.UV.FUV</quantity>
	--/ <unit>ct sec-1</unit>
	[fuv_ncat_fluxerr_aper_7] [real] NULL,

	--/ <summary>FUV MAG_APER #1 (-fd-ncat)(raw mag)[ 2. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_1] [real] NULL,

	--/ <summary>FUV MAG_APER #2 (-fd-ncat)(raw mag)[ 3. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_2] [real] NULL,

	--/ <summary>FUV MAG_APER #3 (-fd-ncat)(raw mag)[ 5. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_3] [real] NULL,

	--/ <summary>FUV MAG_APER #4 (-fd-ncat)(raw mag)[ 8. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_4] [real] NULL,

	--/ <summary>FUV MAG_APER #5 (-fd-ncat)(raw mag)[12. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_5] [real] NULL,

	--/ <summary>FUV MAG_APER #6 (-fd-ncat)(raw mag)[17. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_6] [real] NULL,

	--/ <summary>FUV MAG_APER #7 (-fd-ncat)(raw mag)[23. px]</summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_mag_aper_7] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_1</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_1] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_2</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_2] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_3</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_3] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_4</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_4] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_5</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_5] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_6</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_6] [real] NULL,

	--/ <summary>error for fuv_ncat_mag_aper_7</summary>
	--/ <quantity>stat.error;phot.mag;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[fuv_ncat_magerr_aper_7] [real] NULL,

	--/ <summary>NUV neighbor count out to radius R1</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r1] [smallint] NULL,

	--/ <summary>NUV neighbor count out to radius R2</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r2] [smallint] NULL,

	--/ <summary>NUV neighbor count out to radius R3</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc_r3] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R1</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r1] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R2</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r2] [smallint] NULL,

	--/ <summary>FUV neighbor count out to radius R3</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc_r3] [smallint] NULL,

	--/ <summary>NUV neighbor flux out to radius R1</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r1] [real] NULL,

	--/ <summary>NUV neighbor flux out to radius R2</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r2] [real] NULL,

	--/ <summary>NUV neighbor flux out to radius R3</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[nuv_nf_r3] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R1</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r1] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R2</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r2] [real] NULL,

	--/ <summary>FUV neighbor flux out to radius R3</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[fuv_nf_r3] [real] NULL,

	--/ <summary>Closest neighbor radius in arcseconds</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[cn_radius] [real] NULL,

	--/ <summary>Closest neighbor position angle in degrees</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[cn_pa] [real] NULL,

	--/ <summary>Closest neighbor NUV magnitude</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>mag</unit>
	[cn_mag_nuv] [real] NULL,

	--/ <summary>Closest neighbor FUV magnitude</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>mag</unit>
	[cn_mag_fuv] [real] NULL,

	--/ <summary>NUV sky background(pho/sec/sq.arcsec)(at centr)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	--/ <unit>ph sec-1 arcsec-2</unit>
	[nuv_skybg] [real] NULL,

	--/ <summary>FUV sky background(pho/sec/sq.arcsec)(at centr)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	--/ <unit>ph sec-1 arcsec-2</unit>
	[fuv_skybg] [real] NULL,

	--/ <summary>NUV effective exposure (response)</summary>
	--/ <quantity>stat.weight</quantity>
	[nuv_weight] [real] NULL,

	--/ <summary>FUV effective exposure (response)</summary>
	--/ <quantity>stat.weight</quantity>
	[fuv_weight] [real] NULL,

	--/ <summary>NUV intensity (photons/second/pixel)</summary>
	--/ <quantity>spect.line.intensity;em.UV</quantity>
	--/ <unit>ph sec-1 pix</unit>
	[nuv_int] [real] NULL,

	--/ <summary>FUV intensity (photons/second/pixel)</summary>
	--/ <quantity>spect.line.intensity;em.UV.FUV</quantity>
	--/ <unit>ph sec-1 pix</unit>
	[fuv_int] [real] NULL,

	--/ <summary>NUV threshold sigmas (int-bg)/wt)</summary>
	--/ <quantity>instr.param</quantity>
	[nuv_thres] [real] NULL,

	--/ <summary>FUV threshold sigmas (int-bg)/wt)</summary>
	--/ <quantity>instr.param</quantity>
	[fuv_thres] [real] NULL,

	--/ <summary>NUV ratio of min to max response near source</summary>
	--/ <quantity>stat.value</quantity>
	[nuv_contrast] [real] NULL,

	--/ <summary>FUV ratio of min to max response near source</summary>
	--/ <quantity>stat.value</quantity>
	[fuv_contrast] [real] NULL,

	--/ <summary>NUV median Q within 40 arcsec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_mdn] [real] NULL,

	--/ <summary>NUV  5th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_p05] [real] NULL,

	--/ <summary>NUV 95th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[nuv_scq_p95] [real] NULL,

	--/ <summary>FUV median Q within 40 arcsec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_mdn] [real] NULL,

	--/ <summary>FUV  5th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_p05] [real] NULL,

	--/ <summary>FUV 95th percentile Q: 40 arcssec of source</summary>
	--/ <quantity></quantity>
	[fuv_scq_p95] [real] NULL,

	--/ <summary>NUV number of masked pixels near source</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_maskpix] [int] NULL,

	--/ <summary>FUV number of masked pixels near source</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_maskpix] [int] NULL,

	--/ <summary>NUV artifact flag (logical OR near source)</summary>
	--/ <quantity>meta.code</quantity>
	[nuv_artifact] [int] NULL,

	--/ <summary>FUV artifact flag (logical OR near source)</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_artifact] [int] NULL,

	--/ <summary>NUV spacecraft X position</summary>
	--/ <quantity>pos.cartesian.x;instr</quantity>
	[nuv_scx] [real] NULL,

	--/ <summary>NUV spacecraft Y position</summary>
	--/ <quantity>pos.cartesian.y;instr</quantity>
	[nuv_scy] [real] NULL,

	--/ <summary>FUV spacecraft X position</summary>
	--/ <quantity>pos.cartesian.x;instr</quantity>
	[fuv_scx] [real] NULL,

	--/ <summary>FUV spacecraft Y position</summary>
	--/ <quantity>pos.cartesian.y;instr</quantity>
	[fuv_scy] [real] NULL,

	--/ <summary>NUV detector Q value</summary>
	--/ <quantity></quantity>
	[nuv_Q] [real] NULL,

	--/ <summary>FUV detector Q value</summary>
	--/ <quantity></quantity>
	[fuv_Q] [real] NULL,

	--/ <summary>NUV ambiguity flag.</summary>
	--/ <quantity>meta.code</quantity>
	[nuv_ambg] [int] NULL,

	--/ <summary>FUV ambiguity flag.</summary>
	--/ <quantity>meta.code</quantity>
	[fuv_ambg] [int] NULL,

	--/ <summary>NUV number of candidates.</summary>
	--/ <quantity>meta.number</quantity>
	[nuv_nc] [int] NULL,

	--/ <summary>FUV number of candidates.</summary>
	--/ <quantity>meta.number</quantity>
	[fuv_nc] [int] NULL,

	--/ <summary>First candidate for NUV source(FUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid1] [int] NULL,

	--/ <summary>First candidate for FUV source(NUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid1] [int] NULL,

	--/ <summary>Second candidate for NUV source(FUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid2] [int] NULL,

	--/ <summary>Second candidate for FUV source(NUV IDs)</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid2] [int] NULL,

	--/ <summary>Closest unmatched FUV source within 7 arcsec</summary>
	--/ <quantity>meta.id</quantity>
	[nuv_cid3] [int] NULL,

	--/ <summary>Closest unmatched NUV source within 7 arcsec</summary>
	--/ <quantity>meta.id</quantity>
	[fuv_cid3] [int] NULL,

	--/ <summary>NUV position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[nuv_poserr] [real] NULL,

	--/ <summary>FUV position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[fuv_poserr] [real] NULL,

	--/ <summary>Interband position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[ib_poserr] [real] NULL,

	--/ <summary>NUV Poisson position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[nuv_pperr] [real] NULL,

	--/ <summary>FUV Poisson position error in arcseconds</summary>
	--/ <quantity>stat.error;pos</quantity>
	--/ <unit>arcsec</unit>
	[fuv_pperr] [real] NULL,

	--/ <summary>Reliability based on random unfilled FUV</summary>
	--/ <quantity>meta.code.qual</quantity>
	[match_reliability] [real] NULL,

	--/ <summary>position angle betw. band sources.</summary>
	--/ <quantity>pos.posAng</quantity>
	[sourcepa] [real] NULL,

	--/ <summary>Running object number</summary>
	--/ <quantity>meta.number</quantity>
	[NUV_NUMBER] [int] NULL,

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal;em.UV</quantity>
	[NUV_FLUX_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal;em.UV</quantity>
	[NUV_FLUXERR_ISO] [real] NULL,

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal;em.UV</quantity>
	[NUV_MAG_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV</quantity>
	[NUV_MAGERR_ISO] [real] NULL,

	--/ <summary>Flux aperture (   2.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_1] [real] NULL,

	--/ <summary>Flux aperture (   3.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_2] [real] NULL,

	--/ <summary>Flux aperture (   5.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_3] [real] NULL,

	--/ <summary>Flux aperture (   8.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_4] [real] NULL,

	--/ <summary>Flux aperture (  12.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_APER_5] [real] NULL,

	--/ <summary>Flux aperture (  17.000 px)</summary>
	--/ <quantity></quantity>
	[NUV_FLUX_APER_6] [real] NULL,

	--/ <summary>Flux aperture (  23.000 px)</summary>
	--/ <quantity></quantity>
	[NUV_FLUX_APER_7] [real] NULL,

	--/ <summary>Flux error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_1] [real] NULL,

	--/ <summary>Flux error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_2] [real] NULL,

	--/ <summary>Flux error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_3] [real] NULL,

	--/ <summary>Flux error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_4] [real] NULL,

	--/ <summary>Flux error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_5] [real] NULL,

	--/ <summary>Flux error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_6] [real] NULL,

	--/ <summary>Flux error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_APER_7] [real] NULL,

	--/ <summary>Magnitude aperture (   2.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_1] [real] NULL,

	--/ <summary>Magnitude aperture (   3.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_2] [real] NULL,

	--/ <summary>Magnitude aperture (   5.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_3] [real] NULL,

	--/ <summary>Magnitude aperture (   8.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_4] [real] NULL,

	--/ <summary>Magnitude aperture (  12.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_5] [real] NULL,

	--/ <summary>Magnitude aperture (  17.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_6] [real] NULL,

	--/ <summary>Magnitude aperture (  23.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_APER_7] [real] NULL,

	--/ <summary>Magnitude error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_1] [real] NULL,

	--/ <summary>Magnitude error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_2] [real] NULL,

	--/ <summary>Magnitude error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_3] [real] NULL,

	--/ <summary>Magnitude error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_4] [real] NULL,

	--/ <summary>Magnitude error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_5] [real] NULL,

	--/ <summary>Magnitude error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_6] [real] NULL,

	--/ <summary>Magnitude error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_APER_7] [real] NULL,

	--/ <summary>Flux within a Kron-like elliptical aperture</summary>
	--/ <quantity>phot.flux.aper;em.UV</quantity>
	[NUV_FLUX_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO flux</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV</quantity>
	[NUV_FLUXERR_AUTO] [real] NULL,

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.UV</quantity>
	[NUV_MAG_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[NUV_MAGERR_AUTO] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.2000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_1] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.5000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_2] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.8000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_3] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9000)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_4] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9500)</summary>
	--/ <quantity>phot.flux;em.UV</quantity>
	[NUV_FLUX_RADIUS_5] [real] NULL,

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_KRON_RADIUS] [real] NULL,

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>phot.flux</quantity>
	[NUV_BACKGROUND] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[NUV_THRESHOLD] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[NUV_MU_THRESHOLD] [real] NULL,

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	[NUV_FLUX_MAX] [real] NULL,

	--/ <summary>Peak surface brightness above background</summary>
	--/ <quantity>phot.flux.sb;stat.max</quantity>
	[NUV_MU_MAX] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREA_IMAGE] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREA_WORLD] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREAF_IMAGE] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[NUV_ISOAREAF_WORLD] [real] NULL,

	--/ <summary>Minimum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.min</quantity>
	[NUV_XMIN_IMAGE] [int] NULL,

	--/ <summary>Minimum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.min</quantity>
	[NUV_YMIN_IMAGE] [int] NULL,

	--/ <summary>Maximum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.max</quantity>
	[NUV_XMAX_IMAGE] [int] NULL,

	--/ <summary>Maximum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.max</quantity>
	[NUV_YMAX_IMAGE] [int] NULL,

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[NUV_X_IMAGE] [real] NULL,

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[NUV_Y_IMAGE] [real] NULL,

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[NUV_XPEAK_IMAGE] [int] NULL,

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[NUV_YPEAK_IMAGE] [int] NULL,

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;pos.barycenter</quantity>
	[NUV_ALPHA_J2000] [float] NULL,

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;pos.barycenter</quantity>
	[NUV_DELTA_J2000] [float] NULL,

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_X2_IMAGE] [real] NULL,

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_Y2_IMAGE] [real] NULL,

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	[NUV_XY_IMAGE] [real] NULL,

	--/ <summary>Variance along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_X2_WORLD] [real] NULL,

	--/ <summary>Variance along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance</quantity>
	[NUV_Y2_WORLD] [real] NULL,

	--/ <summary>Covariance between X-WORLD and Y-WORLD</summary>
	--/ <quantity>stat.covariance</quantity>
	[NUV_XY_WORLD] [real] NULL,

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXX_IMAGE] [real] NULL,

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CYY_IMAGE] [real] NULL,

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXY_IMAGE] [real] NULL,

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXX_WORLD] [real] NULL,

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CYY_WORLD] [real] NULL,

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_CXY_WORLD] [real] NULL,

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[NUV_A_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[NUV_B_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[NUV_A_WORLD] [real] NULL,

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[NUV_B_WORLD] [real] NULL,

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_IMAGE] [real] NULL,

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_WORLD] [real] NULL,

	--/ <summary>Position angle (east of north) (J2000)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_THETA_J2000] [real] NULL,

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>pos.phaseAng</quantity>
	[NUV_ELONGATION] [real] NULL,

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ELLIPTICITY] [real] NULL,

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[NUV_ERRX2_IMAGE] [float] NULL,

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[NUV_ERRY2_IMAGE] [float] NULL,

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[NUV_ERRXY_IMAGE] [real] NULL,

	--/ <summary>Variance of position along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[NUV_ERRX2_WORLD] [float] NULL,

	--/ <summary>Variance of position along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[NUV_ERRY2_WORLD] [float] NULL,

	--/ <summary>Covariance of position X-WORLD/Y-WORLD</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[NUV_ERRXY_WORLD] [real] NULL,

	--/ <summary>Cxx error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXX_IMAGE] [real] NULL,

	--/ <summary>Cyy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCYY_IMAGE] [real] NULL,

	--/ <summary>Cxy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXY_IMAGE] [real] NULL,

	--/ <summary>Cxx error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXX_WORLD] [real] NULL,

	--/ <summary>Cyy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCYY_WORLD] [real] NULL,

	--/ <summary>Cxy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[NUV_ERRCXY_WORLD] [real] NULL,

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRA_IMAGE] [real] NULL,

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRB_IMAGE] [real] NULL,

	--/ <summary>World RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRA_WORLD] [real] NULL,

	--/ <summary>World RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[NUV_ERRB_WORLD] [real] NULL,

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_IMAGE] [real] NULL,

	--/ <summary>Error ellipse pos. angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_WORLD] [real] NULL,

	--/ <summary>J2000 error ellipse pos. angle (east of north)</summary>
	--/ <quantity>pos.posAng</quantity>
	[NUV_ERRTHETA_J2000] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_FWHM_IMAGE] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[NUV_FWHM_WORLD] [real] NULL,

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[NUV_FLAGS] [smallint] NULL,

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[NUV_CLASS_STAR] [real] NULL,

	--/ <summary>Running object number</summary>
	--/ <quantity>met.number</quantity>
	[FUV_NUMBER] [int] NULL,

	--/ <summary>Isophotal flux</summary>
	--/ <quantity>phot.flux.isophotal;em.UV.FUV</quantity>
	[FUV_FLUX_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal flux</summary>
	--/ <quantity>stat.error;phot.flux.isophotal;em.UV.FUV</quantity>
	[FUV_FLUXERR_ISO] [real] NULL,

	--/ <summary>Isophotal magnitude</summary>
	--/ <quantity>phot.mag.isophotal;em.UV.FUV</quantity>
	[FUV_MAG_ISO] [real] NULL,

	--/ <summary>RMS error for isophotal magnitude</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.UV.FUV</quantity>
	[FUV_MAGERR_ISO] [real] NULL,

	--/ <summary>Flux aperture (   2.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_1] [real] NULL,

	--/ <summary>Flux aperture (   3.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_2] [real] NULL,

	--/ <summary>Flux aperture (   5.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_3] [real] NULL,

	--/ <summary>Flux aperture (   8.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_4] [real] NULL,

	--/ <summary>Flux aperture (  12.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_5] [real] NULL,

	--/ <summary>Flux aperture (  17.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_6] [real] NULL,

	--/ <summary>Flux aperture (  23.000 px)</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_APER_7] [real] NULL,

	--/ <summary>Flux error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_1] [real] NULL,

	--/ <summary>Flux error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_2] [real] NULL,

	--/ <summary>Flux error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_3] [real] NULL,

	--/ <summary>Flux error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_4] [real] NULL,

	--/ <summary>Flux error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_5] [real] NULL,

	--/ <summary>Flux error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_6] [real] NULL,

	--/ <summary>Flux error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_APER_7] [real] NULL,

	--/ <summary>Magnitude aperture (   2.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_1] [real] NULL,

	--/ <summary>Magnitude aperture (   3.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_2] [real] NULL,

	--/ <summary>Magnitude aperture (   5.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_3] [real] NULL,

	--/ <summary>Magnitude aperture (   8.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_4] [real] NULL,

	--/ <summary>Magnitude aperture (  12.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_5] [real] NULL,

	--/ <summary>Magnitude aperture (  17.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_6] [real] NULL,

	--/ <summary>Magnitude aperture (  23.000 px)</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_APER_7] [real] NULL,

	--/ <summary>Magnitude error aperture (   2.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_1] [real] NULL,

	--/ <summary>Magnitude error aperture (   3.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_2] [real] NULL,

	--/ <summary>Magnitude error aperture (   5.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_3] [real] NULL,

	--/ <summary>Magnitude error aperture (   8.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_4] [real] NULL,

	--/ <summary>Magnitude error aperture (  12.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_5] [real] NULL,

	--/ <summary>Magnitude error aperture (  17.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_6] [real] NULL,

	--/ <summary>Magnitude error aperture (  23.000 px)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAGERR_APER_7] [real] NULL,

	--/ <summary>Flux within a Kron-like elliptical aperture</summary>
	--/ <quantity>phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUX_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO flux</summary>
	--/ <quantity>stat.error;phot.flux.aper;em.UV.FUV</quantity>
	[FUV_FLUXERR_AUTO] [real] NULL,

	--/ <summary>Kron-like elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.UV.FUV</quantity>
	[FUV_MAG_AUTO] [real] NULL,

	--/ <summary>RMS error for AUTO magnitude</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.UV</quantity>
	[FUV_MAGERR_AUTO] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.2000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_1] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.5000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_2] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.8000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_3] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9000)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_4] [real] NULL,

	--/ <summary>Fraction-of-light radius (  0.9500)</summary>
	--/ <quantity>phot.flux;em.UV.FUV</quantity>
	[FUV_FLUX_RADIUS_5] [real] NULL,

	--/ <summary>Kron apertures in units of A or B</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_KRON_RADIUS] [real] NULL,

	--/ <summary>Background at centroid position</summary>
	--/ <quantity>phot.flux</quantity>
	[FUV_BACKGROUND] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[FUV_THRESHOLD] [real] NULL,

	--/ <summary>Detection threshold above background</summary>
	--/ <quantity>instr.saturation</quantity>
	[FUV_MU_THRESHOLD] [real] NULL,

	--/ <summary>Peak flux above background</summary>
	--/ <quantity>phot.flux;stat.max</quantity>
	[FUV_FLUX_MAX] [real] NULL,

	--/ <summary>Peak surface brightness above background</summary>
	--/ <quantity>phot.flux.sb;stat.max</quantity>
	[FUV_MU_MAX] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREA_IMAGE] [real] NULL,

	--/ <summary>Isophotal area above Analysis threshold</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREA_WORLD] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREAF_IMAGE] [real] NULL,

	--/ <summary>Isophotal area (filtered) above Detection thres</summary>
	--/ <quantity>phys.angSize.area</quantity>
	[FUV_ISOAREAF_WORLD] [real] NULL,

	--/ <summary>Minimum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.min</quantity>
	[FUV_XMIN_IMAGE] [int] NULL,

	--/ <summary>Minimum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.min</quantity>
	[FUV_YMIN_IMAGE] [int] NULL,

	--/ <summary>Maximum x-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.x;stat.max</quantity>
	[FUV_XMAX_IMAGE] [int] NULL,

	--/ <summary>Maximum y-coordinate among detected pixels</summary>
	--/ <quantity>pos.cartesian.y;stat.max</quantity>
	[FUV_YMAX_IMAGE] [int] NULL,

	--/ <summary>Object position along x</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[FUV_X_IMAGE] [real] NULL,

	--/ <summary>Object position along y</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[FUV_Y_IMAGE] [real] NULL,

	--/ <summary>x-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[FUV_XPEAK_IMAGE] [int] NULL,

	--/ <summary>y-coordinate of the brightest pixel</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[FUV_YPEAK_IMAGE] [int] NULL,

	--/ <summary>Right ascension of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;pos.barycenter</quantity>
	[FUV_ALPHA_J2000] [float] NULL,

	--/ <summary>Declination of barycenter (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;pos.barycenter</quantity>
	[FUV_DELTA_J2000] [float] NULL,

	--/ <summary>Variance along x</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_X2_IMAGE] [real] NULL,

	--/ <summary>Variance along y</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_Y2_IMAGE] [real] NULL,

	--/ <summary>Covariance between x and y</summary>
	--/ <quantity>stat.covariance</quantity>
	[FUV_XY_IMAGE] [real] NULL,

	--/ <summary>Variance along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_X2_WORLD] [real] NULL,

	--/ <summary>Variance along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance</quantity>
	[FUV_Y2_WORLD] [real] NULL,

	--/ <summary>Covariance between X-WORLD and Y-WORLD</summary>
	--/ <quantity>stat.covariance</quantity>
	[FUV_XY_WORLD] [real] NULL,

	--/ <summary>Cxx object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXX_IMAGE] [real] NULL,

	--/ <summary>Cyy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CYY_IMAGE] [real] NULL,

	--/ <summary>Cxy object ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXY_IMAGE] [real] NULL,

	--/ <summary>Cxx object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXX_WORLD] [real] NULL,

	--/ <summary>Cyy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CYY_WORLD] [real] NULL,

	--/ <summary>Cxy object ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_CXY_WORLD] [real] NULL,

	--/ <summary>Profile RMS along major axis</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[FUV_A_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along minor axis</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[FUV_B_IMAGE] [real] NULL,

	--/ <summary>Profile RMS along major axis (world units)</summary>
	--/ <quantity>phys.angSize.smajAxis;stat.mean</quantity>
	[FUV_A_WORLD] [real] NULL,

	--/ <summary>Profile RMS along minor axis (world units)</summary>
	--/ <quantity>phys.angSize.sminAxis;stat.mean</quantity>
	[FUV_B_WORLD] [real] NULL,

	--/ <summary>Position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_IMAGE] [real] NULL,

	--/ <summary>Position angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_WORLD] [real] NULL,

	--/ <summary>Position angle (east of north) (J2000)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_THETA_J2000] [real] NULL,

	--/ <summary>A_IMAGE/B_IMAGE</summary>
	--/ <quantity>pos.phaseAng</quantity>
	[FUV_ELONGATION] [real] NULL,

	--/ <summary>1 - B_IMAGE/A_IMAGE</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ELLIPTICITY] [real] NULL,

	--/ <summary>Variance of position along x</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[FUV_ERRX2_IMAGE] [float] NULL,

	--/ <summary>Variance of position along y</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[FUV_ERRY2_IMAGE] [float] NULL,

	--/ <summary>Covariance of position between x and y</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[FUV_ERRXY_IMAGE] [real] NULL,

	--/ <summary>Variance of position along X-WORLD (alpha)</summary>
	--/ <quantity>stat.variance;pos.cartesian.x</quantity>
	[FUV_ERRX2_WORLD] [float] NULL,

	--/ <summary>Variance of position along Y-WORLD (delta)</summary>
	--/ <quantity>stat.variance;pos.cartesian.y</quantity>
	[FUV_ERRY2_WORLD] [float] NULL,

	--/ <summary>Covariance of position X-WORLD/Y-WORLD</summary>
	--/ <quantity>stat.covariance;pos</quantity>
	[FUV_ERRXY_WORLD] [real] NULL,

	--/ <summary>Cxx error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXX_IMAGE] [real] NULL,

	--/ <summary>Cyy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCYY_IMAGE] [real] NULL,

	--/ <summary>Cxy error ellipse parameter</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXY_IMAGE] [real] NULL,

	--/ <summary>Cxx error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXX_WORLD] [real] NULL,

	--/ <summary>Cyy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCYY_WORLD] [real] NULL,

	--/ <summary>Cxy error ellipse parameter (WORLD units)</summary>
	--/ <quantity>src.ellipticity</quantity>
	[FUV_ERRCXY_WORLD] [real] NULL,

	--/ <summary>RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRA_IMAGE] [real] NULL,

	--/ <summary>RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRB_IMAGE] [real] NULL,

	--/ <summary>World RMS position error along major axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRA_WORLD] [real] NULL,

	--/ <summary>World RMS position error along minor axis</summary>
	--/ <quantity>pos.errorEllipse</quantity>
	[FUV_ERRB_WORLD] [real] NULL,

	--/ <summary>Error ellipse position angle (CCW/x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_IMAGE] [real] NULL,

	--/ <summary>Error ellipse pos. angle (CCW/world-x)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_WORLD] [real] NULL,

	--/ <summary>J2000 error ellipse pos. angle (east of north)</summary>
	--/ <quantity>pos.posAng</quantity>
	[FUV_ERRTHETA_J2000] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_FWHM_IMAGE] [real] NULL,

	--/ <summary>FWHM assuming a gaussian core</summary>
	--/ <quantity>phys.angSize</quantity>
	[FUV_FWHM_WORLD] [real] NULL,

	--/ <summary>Extraction flags</summary>
	--/ <quantity>meta.code</quantity>
	[FUV_FLAGS] [smallint] NULL,

	--/ <summary>S/G classifier output</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[FUV_CLASS_STAR] [real] NULL,

	--/ <summary>Spectrum Flag. Does this object have a spectrum? Yes (1), No (0)</summary>
	--/ <quantity>meta.code;spect</quantity>
	[isThereSpectrum] [bit] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NULL DEFAULT ((0)),

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NULL DEFAULT ((0)),

	--/ <summary>20-deep hierarchical trangular mesh ID of this object.</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NULL DEFAULT ((0)),

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PKVisitPhotoObjAll] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (DATA_COMPRESSION = PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [VPHOTOOBJ]
) ON [VPHOTOOBJ]

GO

