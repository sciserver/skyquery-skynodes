CREATE TABLE [dbo].[PhotoObj](
--/ <summary>A view of the SpecObj table so SkyNode queries will work</summary>
--/ <remarks>Using the FUSE SkyNode for cross-matching requires it to have a table named PhotoPrimary.  Even though FUSE data is spectroscopic data, a PhotoPrimary view of the main SpecObj table is defined for this purpose.</remarks>

	--/ <summary>Unique ID of each object</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary></summary>
	[TELESCOP] [varchar](64) NOT NULL, 

	--/ <summary>Rootname of the observation ppppttooeee</summary>
	[ROOTNAME] [varchar](64) NOT NULL, 

	--/ <summary>PROGRAM IDENTIFICATION</summary>
	[PRGRM_ID] [varchar](64) NOT NULL, 

	--/ <summary>Target ID</summary>
	[TARG_ID] [float] NOT NULL, 

	--/ <summary> Last name of principal investigator</summary>
	[PR_INV_L] [varchar](64) NOT NULL, 

	--/ <summary> First name of principal investigator </summary>
	[PR_INV_R] [varchar](64) NOT NULL, 

	--/ <summary>Target name on proposal</summary>
	[TARGNAME] [varchar](64) NOT NULL, 

	--/ <summary>Right ascension of the target</summary>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of the target</summary>
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

	--/ <summary>Position angle of Y axis</summary>
	--/ <unit>deg</unit>
	[APER_PA] [float] NOT NULL, 

	--/ <summary>Ecliptic latitud</summary>
	--/ <unit>deg</unit>
	[ELAT] [float] NOT NULL, 

	--/ <summary>Ecliptic longitud</summary>
	--/ <unit>deg</unit>
	[ELONG] [float] NOT NULL, 

	--/ <summary>Galactic latitud</summary>
	--/ <unit>deg</unit>
	[GLAT] [float] NOT NULL, 

	--/ <summary>Galactic longitud</summary>
	--/ <unit>deg</unit>
	[GLONG] [float] NOT NULL, 

	--/ <summary>Object class</summary>
	[OBJCLASS] [float] NOT NULL, 

	--/ <summary> MK spectral type and luminosity class </summary>
	[SP_TYPE] [varchar](64) NULL, 

	--/ <summary>Point or Extended Continuum Emission</summary>
	[SRC_TYPE] [varchar](64) NULL, 

	--/ <summary>Target V magnitud</summary>
	[VMAG] [float] NOT NULL, 

	--/ <summary>Color excess</summary>
	[EBV] [float] NOT NULL, 

	--/ <summary>Redshift</summary>
	[Z] [float] NOT NULL, 

	--/ <summary>High proper motion target</summary>
	[HIGH_PM] [varchar](64) NOT NULL, 

	--/ <summary>Fixed or Moving target</summary>
	[MOV_TARG] [varchar](64) NOT NULL, 

	--/ <summary>UT date of start of exposure yyyy-mm-dd</summary>
	[DATEOBS] [varchar](64) NOT NULL, 

	--/ <summary>Exposure start time - Modified Julian Date</summary>
	[OBSSTART] [float] NOT NULL, 

	--/ <summary>Exposure end time - Modified Julian Date</summary>
	[OBSEND] [float] NOT NULL, 

	--/ <summary> Total time after screening </summary>
	--/ <unit>s</unit>
	[OBSTIME] [float] NOT NULL, 

	--/ <summary>Exposure duration of raw data file</summary>
	--/ <unit>s</unit>
	[RAWTIME] [float] NOT NULL, 

	--/ <summary>Night time after screening</summary>
	--/ <unit>s</unit>
	[OBSNIGHT] [float] NOT NULL, 

	--/ <summary>Instrument mode TTAG or HIST</summary>
	[INSTMODE] [varchar](64) NOT NULL, 

	--/ <summary>Planned target aperture</summary>
	[APERTURE] [varchar](64) NOT NULL, 

	--/ <summary>CALFUSE pipeline version number</summary>
	[CF_VERS] [varchar](64) NOT NULL, 

	--/ <summary>Bandwidth of the data</summary>
	--/ <unit>Angstroms</unit>
	[BANDWID] [float] NOT NULL, 

	--/ <summary>Central wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[CENTRWV] [float] NOT NULL, 

	--/ <summary>Minimun wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[WAVEMIN] [float] NOT NULL, 

	--/ <summary>Maximun wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[WAVEMAX] [float] NOT NULL  
) ON [PRIMARY]


ALTER TABLE [dbo].[PhotoObj] 
ADD  CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
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

CREATE TABLE [dbo].[SpecLine](
--/ <summary>The flux for each spectral line is in this table</summary>
--/ <remarks></remarks>

	--/ <summary></summary>
	[ObjID] [bigint] NOT NULL, 

	--/ <summary>Unique ID for each spectral line</summary>
	[LineID] [int] NOT NULL, 

	--/ <summary>Wavelength</summary>
	[WAVE] [float] NOT NULL, 

	--/ <summary>Flux</summary>
	[FLUX] [float] NOT NULL, 

	--/ <summary>Error</summary>
	[ERROR] [float] NOT NULL 
) ON [PRIMARY]

ALTER TABLE [dbo].[SpecLine] ADD  CONSTRAINT [PK_SpecLine] PRIMARY KEY CLUSTERED 
(
	[ObjID] ASC,
	[LineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


CREATE TABLE [dbo].[SpecObj]
(
--/ <summary>The main table containing the astronomical data</summary>
--/ <remarks></remarks>

	--/ <summary>Unique ID of each object</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary></summary>
	[TELESCOP] [varchar](64) NOT NULL, 

	--/ <summary>Rootname of the observation ppppttooeee</summary>
	[ROOTNAME] [varchar](64) NOT NULL, 

	--/ <summary>PROGRAM IDENTIFICATION</summary>
	[PRGRM_ID] [varchar](64) NOT NULL, 

	--/ <summary>Target ID</summary>
	[TARG_ID] [float] NOT NULL, 

	--/ <summary> Last name of principal investigator</summary>
	[PR_INV_L] [varchar](64) NOT NULL, 

	--/ <summary> First name of principal investigator </summary>
	[PR_INV_R] [varchar](64) NOT NULL, 

	--/ <summary>Target name on proposal</summary>
	[TARGNAME] [varchar](64) NOT NULL, 

	--/ <summary>Right ascension of the target</summary>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of the target</summary>
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

	--/ <summary>Position angle of Y axis</summary>
	--/ <unit>deg</unit>
	[APER_PA] [float] NOT NULL, 

	--/ <summary>Ecliptic latitud</summary>
	--/ <unit>deg</unit>
	[ELAT] [float] NOT NULL, 

	--/ <summary>Ecliptic longitud</summary>
	--/ <unit>deg</unit>
	[ELONG] [float] NOT NULL, 

	--/ <summary>Galactic latitud</summary>
	--/ <unit>deg</unit>
	[GLAT] [float] NOT NULL, 

	--/ <summary>Galactic longitud</summary>
	--/ <unit>deg</unit>
	[GLONG] [float] NOT NULL, 

	--/ <summary>Object class</summary>
	[OBJCLASS] [float] NOT NULL, 

	--/ <summary> MK spectral type and luminosity class </summary>
	[SP_TYPE] [varchar](64) NULL, 

	--/ <summary>Point or Extended Continuum Emission</summary>
	[SRC_TYPE] [varchar](64) NULL, 

	--/ <summary>Target V magnitud</summary>
	[VMAG] [float] NOT NULL, 

	--/ <summary>Color excess</summary>
	[EBV] [float] NOT NULL, 

	--/ <summary>Redshift</summary>
	[Z] [float] NOT NULL, 

	--/ <summary>High proper motion target</summary>
	[HIGH_PM] [varchar](64) NOT NULL, 

	--/ <summary>Fixed or Moving target</summary>
	[MOV_TARG] [varchar](64) NOT NULL, 

	--/ <summary>UT date of start of exposure yyyy-mm-dd</summary>
	[DATEOBS] [varchar](64) NOT NULL, 

	--/ <summary>Exposure start time - Modified Julian Date</summary>
	[OBSSTART] [float] NOT NULL, 

	--/ <summary>Exposure end time - Modified Julian Date</summary>
	[OBSEND] [float] NOT NULL, 

	--/ <summary> Total time after screening </summary>
	--/ <unit>s</unit>
	[OBSTIME] [float] NOT NULL, 

	--/ <summary>Exposure duration of raw data file</summary>
	--/ <unit>s</unit>
	[RAWTIME] [float] NOT NULL, 

	--/ <summary>Night time after screening</summary>
	--/ <unit>s</unit>
	[OBSNIGHT] [float] NOT NULL, 

	--/ <summary>Instrument mode TTAG or HIST</summary>
	[INSTMODE] [varchar](64) NOT NULL, 

	--/ <summary>Planned target aperture</summary>
	[APERTURE] [varchar](64) NOT NULL, 

	--/ <summary>CALFUSE pipeline version number</summary>
	[CF_VERS] [varchar](64) NOT NULL, 

	--/ <summary>Bandwidth of the data</summary>
	--/ <unit>Angstroms</unit>
	[BANDWID] [float] NOT NULL, 

	--/ <summary>Central wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[CENTRWV] [float] NOT NULL, 

	--/ <summary>Minimun wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[WAVEMIN] [float] NOT NULL, 

	--/ <summary>Maximun wavelenght of the data</summary>
	--/ <unit>Angstroms</unit>
	[WAVEMAX] [float] NOT NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[SpecObj] 
ADD CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO