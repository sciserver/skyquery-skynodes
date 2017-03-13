-- CREATE PhotoObj TABLE
CREATE TABLE dbo.PhotoObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM;pos.eq;pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone;pos.eq;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[seqID] bigint NOT NULL,

	--/ <summary> NOAO proposal identification, or generic program identifier for data without assigned proposal ID. </summary>
	--/ <quantity>meta.id</quantity>
	[dtpropid] char(10) NOT NULL,

	--/ <summary> The survey ID. AS not all NOAO data re from surveys, this may be a blank value. </summary>
	--/ <quantity>meta.id</quantity>
	[surveyid] char(24) NOT NULL,

	--/ <summary> Date for public release of the data. </summary>
	--/ <quantity>time.release</quantity>
	[release_date] char(10) NOT NULL,

	--/ <summary> Calendar data (not UT) at start of observing night. </summary>
	--/ <quantity>time.start;obs</quantity>
	[start_date] char(10) NOT NULL,

	--/ <summary> UT date and time, from DATE-OBS header keyword. Not available for all instruments. </summary>
	--/ <quantity>time.epoch</quantity>
	[date_obs] char(23) NOT NULL,

	--/ <summary> Principal investigator </summary>
	--/ <quantity>meta.id.PI</quantity>
	[dtpi] char(7) NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Telescope </summary>
	--/ <quantity>instr.tel</quantity>
	[telescope] char(4) NOT NULL,

	--/ <summary> Instrument </summary>
	--/ <quantity>instr</quantity>
	[instrument] char(5) NOT NULL,

	--/ <summary> Filter used for observation. Not available for all instruments. </summary>
	--/ <quantity>instr.filter</quantity>
	[filter] char(32) NOT NULL,

	--/ <summary> Exposure time. Not available for all instruments. </summary>
	--/ <quantity>obs.exposure</quantity>
	--/ <unit> s </unit>
	[exposure] real NOT NULL,

	--/ <summary> Type of observation, from OBSTYPE header keyword. Not available for all instruments. </summary>
	--/ <quantity>obs</quantity>
	[obstype] char(6) NOT NULL,

	--/ <summary> A newer FITS keyword indicating the type of observation mode. Older files may sometimes lack any value for this. </summary>
	--/ <quantity>obs</quantity>
	[obsmode] char(7) NOT NULL,

	--/ <summary> Data processing type: Raw (raw data), INstCal(pipeline-calibrated single exposure), Resampled (calibrated image 
	--/ onto sky plane), Skysub (skysubstracted NEWFIRM image), Stack (coadded sum of a sequence of exposures), or MasterCal 
	--/ calibration file). </summary>
	--/ <quantity>meta.dataset</quantity>
	[proctype] char(7) NOT NULL,

	--/ <summary> Data product type: Image, Dqmask (data quality mask), Expmap (Exposure map for stacked images), png (preview image). </summary>
	--/ <quantity>meta.dataset</quantity>
	[prodtype] char(6) NOT NULL,

	--/ <summary> Average seeing FWHM in arcsec. AVailable for pipeline-processed imaging data only. </summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	--/ <unit> arcsec </unit>
	[seeing] real NOT NULL,

	--/ <summary> Approximate 5-sigma photometric depth for piont sources. Available for pipeline-processed imaging data only. </summary>
	--/ <quantity></quantity>
	[depth] real NOT NULL,

	--/ <summary> Original data file name supplied at the telescope by the observer or data-taking system. </summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[dtacqnam] char(56) NOT NULL,

	--/ <summary> Filename assigned to a data file in the NOAO Science Archive. All files are renamed to unique names when they enter the </summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[archive_file] char(34) NOT NULL,

	--/ <summary> File size in bytes </summary>
	--/ <quantity>phys.size;meta.file</quantity>
	--/ <unit> byte </unit>
	[filesize] bigint NOT NULL,

	--/ <summary> reference to fits file. </summary>
	--/ <quantity>meta.ref;meta.file</quantity>
	[reference] char(77) NOT NULL,

	--/ <summary> md5sum is used to verify that a file has not changed as a result of a faulty file transfer, a disk error or non-malicious </summary>
	--/ <quantity>meta</quantity>
	[md5sum] char(32) NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

