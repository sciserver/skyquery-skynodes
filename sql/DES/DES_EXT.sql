USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
(	[seqID] bigint NOT NULL,
	[dtpropid] char(10) NOT NULL,
	[surveyid] char(24) NOT NULL,
	[release_date] char(10) NOT NULL,
	[start_date] char(10) NOT NULL,
	[date_obs] char(23) NOT NULL,
	[dtpi] char(7) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[telescope] char(4) NOT NULL,
	[instrument] char(5) NOT NULL,
	[filter] char(32) NOT NULL,
	[exposure] real NOT NULL,
	[obstype] char(6) NOT NULL,
	[obsmode] char(7) NOT NULL,
	[proctype] char(7) NOT NULL,
	[prodtype] char(6) NOT NULL,
	[seeing] real NOT NULL,
	[depth] real NOT NULL,
	[dtacqnam] char(56) NOT NULL,
	[archive_file] char(34) NOT NULL,
	[filesize] bigint NOT NULL,
	[reference] char(77) NOT NULL,
	[md5sum] char(32) NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\DES\DES.bin'
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

	--/ <summary> sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> NOAO proposal identification, or generic program identifier for data without assigned proposal ID. </summary>
	[dtpropid] char(10) NOT NULL,

	--/ <summary> The survey ID. AS not all NOAO data re from surveys, this may be a blank value. </summary>
	[surveyid] char(24) NOT NULL,

	--/ <summary> Date for public release of the data. </summary>
	[release_date] char(10) NOT NULL,

	--/ <summary> Calendar data (not UT) at start of observing night. </summary>
	[start_date] char(10) NOT NULL,

	--/ <summary> UT date and time, from DATE-OBS header keyword. Not available for all instruments. </summary>
	[date_obs] char(23) NOT NULL,

	--/ <summary> Principal investigator </summary>
	[dtpi] char(7) NOT NULL,

	--/ <summary> Right ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> Telescope </summary>
	[telescope] char(4) NOT NULL,

	--/ <summary> Instrument </summary>
	[instrument] char(5) NOT NULL,

	--/ <summary> Filter used for observation. Not available for all instruments. </summary>
	[filter] char(32) NOT NULL,

	--/ <summary> Exposure time. Not available for all instruments. </summary>
	--/ <unit> sec </unit>
	[exposure] real NOT NULL,

	--/ <summary> Type of observation, from OBSTYPE header keyword. Not available for all instruments. </summary>
	[obstype] char(6) NOT NULL,

	--/ <summary> A newer FITS keyword indicating the type of observation mode. Older files may sometimes lack any value for this. </summary>
	[obsmode] char(7) NOT NULL,

	--/ <summary> Data processing type: Raw (raw data), INstCal(pipeline-calibrated single exposure), Resampled (calibrated image 
	--/ onto sky plane), Skysub (skysubstracted NEWFIRM image), Stack (coadded sum of a sequence of exposures), or MasterCal 
	--/ calibration file). </summary>
	[proctype] char(7) NOT NULL,

	--/ <summary> Data product type: Image, Dqmask (data quality mask), Expmap (Exposure map for stacked images), png (preview image). </summary>
	[prodtype] char(6) NOT NULL,

	--/ <summary> Average seeing FWHM in arcsec. AVailable for pipeline-processed imaging data only. </summary>
	--/ <unit> arcsec </unit>
	[seeing] real NOT NULL,

	--/ <summary> Approximate 5-sigma photometric depth for piont sources. Available for pipeline-processed imaging data only. </summary>
	[depth] real NOT NULL,

	--/ <summary> Original data file name supplied at the telescope by the observer or data-taking system. </summary>
	[dtacqnam] char(56) NOT NULL,

	--/ <summary> Filename assigned to a data file in the NOAO Science Archive. All files are renamed to unique names when they enter the </summary>
	[archive_file] char(34) NOT NULL,

	--/ <summary> File size in bytes </summary>
	--/ <unit> byte </unit>
	[filesize] bigint NOT NULL,

	--/ <summary> reference to fits file. </summary>
	[reference] char(77) NOT NULL,

	--/ <summary> md5sum is used to verify that a file has not changed as a result of a faulty file transfer, a disk error or non-malicious </summary>
	[md5sum] char(32) NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, seqID, dtpropid, surveyid, release_date, start_date, date_obs, dtpi, ra, dec, telescope, instrument, filter, exposure, obstype, obsmode, proctype, prodtype, seeing, depth, dtacqnam, archive_file, filesize, reference, md5sum)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
seqID, dtpropid, surveyid, release_date, start_date, date_obs, dtpi, ra, dec, telescope, instrument, filter, exposure, obstype, obsmode, proctype, prodtype, seeing, depth, dtacqnam, archive_file, filesize, reference, md5sum
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
