--/ <dataset>
--/ <summary> Far Ultraviolet Spectroscopic Explorer (FUSE) </summary>
--/ <remarks>
--/ Over eight years of operations, FUSE acquired over 6000 observations of nearly 3000 separate 
--/ astronomical targets.
--/ </remarks>
--/ <url>http://archive.stsci.edu/fuse</url>
--/ <icon>fuse.png</icon>
--/ <docpage>fuse.html</docpage>
--/ </dataset>
 GO

--/ <summary>A view of the SpecObj table so SkyNode queries will work</summary>
--/ <remarks>Using the FUSE SkyNode for cross-matching requires it to have a table named PhotoPrimary.  Even though FUSE data is spectroscopic data, a PhotoPrimary view of the main SpecObj table is defined for this purpose.</remarks>
CREATE TABLE [dbo].[PhotoObj](
	--/ <summary>Unique ID of each object</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>instr.tel</quantity>
	[TELESCOP] [varchar](64) NOT NULL, 

	--/ <summary>Rootname of the observation ppppttooeee</summary>
	--/ <quantity>meta.id;obs</quantity>
	[ROOTNAME] [varchar](64) NOT NULL, 

	--/ <summary>PROGRAM IDENTIFICATION</summary>
	--/ <quantity>meta.id</quantity>
	[PRGRM_ID] [varchar](64) NOT NULL, 

	--/ <summary>Target ID</summary>
	--/ <quantity>meta.id;src</quantity>
	[TARG_ID] [float] NOT NULL, 

	--/ <summary> Last name of principal investigator</summary>
	--/ <quantity>meta.id.PI</quantity>
	[PR_INV_L] [varchar](64) NOT NULL, 

	--/ <summary> First name of principal investigator </summary>
	--/ <quantity>meta.id.PI</quantity>
	[PR_INV_R] [varchar](64) NOT NULL, 

	--/ <summary>Target name on proposal</summary>
	--/ <quantity>meta.id;src</quantity>
	[TARGNAME] [varchar](64) NOT NULL, 

	--/ <summary>Right ascension of the target</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of the target</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
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
	--/ <quantity>pos.HTM;pos.eq;pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone;pos.eq;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Position angle of Y axis</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[APER_PA] [float] NOT NULL, 

	--/ <summary>Ecliptic latitude</summary>
	--/ <quantity>pos.ecliptic.lat</quantity>
	--/ <unit>deg</unit>
	[ELAT] [float] NOT NULL, 

	--/ <summary>Ecliptic longitude</summary>
	--/ <quantity>pos.ecliptic.lon</quantity>
	--/ <unit>deg</unit>
	[ELONG] [float] NOT NULL, 

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[GLAT] [float] NOT NULL, 

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[GLONG] [float] NOT NULL, 

	--/ <summary>Object class</summary>
	--/ <quantity>src.class</quantity>
	[OBJCLASS] [float] NOT NULL, 

	--/ <summary> MK spectral type and luminosity class </summary>
	--/ <quantity>src.spType;src.class.luminosity</quantity>
	[SP_TYPE] [varchar](64) NULL, 

	--/ <summary>Point or Extended Continuum Emission</summary>
	--/ <quantity>src.class</quantity>
	[SRC_TYPE] [varchar](64) NULL, 

	--/ <summary>Target V magnitude</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	[VMAG] [float] NOT NULL, 

	--/ <summary>Color excess</summary>
	--/ <quantity>phot.color.excess</quantity>
	[EBV] [float] NOT NULL, 

	--/ <summary>Redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[Z] [float] NOT NULL, 

	--/ <summary>High proper motion target</summary>
	--/ <quantity>meta.note</quantity>
	[HIGH_PM] [varchar](64) NOT NULL, 

	--/ <summary>Fixed or Moving target</summary>
	--/ <quantity>meta.note</quantity>
	[MOV_TARG] [varchar](64) NOT NULL, 

	--/ <summary>UT date of start of exposure yyyy-mm-dd</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[DATEOBS] [varchar](64) NOT NULL, 

	--/ <summary>Exposure start time - Modified Julian Date</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[OBSSTART] [float] NOT NULL, 

	--/ <summary>Exposure end time - Modified Julian Date</summary>
	--/ <quantity>time.end;obs.exposure</quantity>
	[OBSEND] [float] NOT NULL, 

	--/ <summary> Total time after screening </summary>
	--/ <quantity>time</quantity>
	--/ <unit>s</unit>
	[OBSTIME] [float] NOT NULL, 

	--/ <summary>Exposure duration of raw data file</summary>
	--/ <quantity>time;obs.exposure</quantity>
	--/ <unit>s</unit>
	[RAWTIME] [float] NOT NULL, 

	--/ <summary>Night time after screening</summary>
	--/ <quantity>time</quantity>
	--/ <unit>s</unit>
	[OBSNIGHT] [float] NOT NULL, 

	--/ <summary>Instrument mode TTAG or HIST</summary>
	--/ <quantity>instr.bandpass</quantity>
	[INSTMODE] [varchar](64) NOT NULL, 

	--/ <summary>Planned target aperture</summary>
	--/ <quantity>instr.param</quantity>
	[APERTURE] [varchar](64) NOT NULL, 

	--/ <summary>CALFUSE pipeline version number</summary>
	--/ <quantity>meta.version</quantity>
	[CF_VERS] [varchar](64) NOT NULL, 

	--/ <summary>Bandwidth of the data</summary>
	--/ <quantity>instr.bandwith</quantity>
	--/ <unit>AA</unit>
	[BANDWID] [float] NOT NULL, 

	--/ <summary>Central wavelenght of the data</summary>
	--/ <quantity>em.wl.central</quantity>
	--/ <unit>AA</unit>
	[CENTRWV] [float] NOT NULL, 

	--/ <summary>Minimun wavelenght of the data</summary>
	--/ <quantity>em.wl;stat.min</quantity>
	--/ <unit>AA</unit>
	[WAVEMIN] [float] NOT NULL, 

	--/ <summary>Maximun wavelenght of the data</summary>
	--/ <quantity>em.wl;stat.max</quantity>
	--/ <unit>AA</unit>
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

--/ <summary>The flux for each spectral line is in this table</summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[SpecLine](

	--/ <summary></summary>
	--/ <quantity>meta.id</quantity>
	[ObjID] [bigint] NOT NULL, 

	--/ <summary>Unique ID for each spectral line</summary>
	--/ <quantity>meta.id;spect.line</quantity>
	[LineID] [int] NOT NULL, 

	--/ <summary>Wavelength</summary>
	--/ <quantity>em.wl</quantity>
	[WAVE] [float] NOT NULL, 

	--/ <summary>Flux</summary>
	--/ <quantity>phot.flux</quantity>
	[FLUX] [float] NOT NULL, 

	--/ <summary>Error</summary>
	--/ <quantity>stat.error</quantity>
	[ERROR] [float] NOT NULL 
) ON [PRIMARY]

ALTER TABLE [dbo].[SpecLine] ADD  CONSTRAINT [PK_SpecLine] PRIMARY KEY CLUSTERED 
(
	[ObjID] ASC,
	[LineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


--/ <summary>The main table containing the astronomical data</summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[SpecObj]
(

	--/ <summary>Unique ID of each object</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>instr.tel</quantity>
	[TELESCOP] [varchar](64) NOT NULL, 

	--/ <summary>Rootname of the observation ppppttooeee</summary>
	--/ <quantity>meta.id;obs</quantity>
	[ROOTNAME] [varchar](64) NOT NULL, 

	--/ <summary>PROGRAM IDENTIFICATION</summary>
	--/ <quantity>meta.id</quantity>
	[PRGRM_ID] [varchar](64) NOT NULL, 

	--/ <summary>Target ID</summary>
	--/ <quantity>meta.id;src</quantity>
	[TARG_ID] [float] NOT NULL, 

	--/ <summary> Last name of principal investigator</summary>
	--/ <quantity>meta.id.PI</quantity>
	[PR_INV_L] [varchar](64) NOT NULL, 

	--/ <summary> First name of principal investigator </summary>
	--/ <quantity>meta.id.PI</quantity>
	[PR_INV_R] [varchar](64) NOT NULL, 

	--/ <summary>Target name on proposal</summary>
	--/ <quantity>meta.id;src</quantity>
	[TARGNAME] [varchar](64) NOT NULL, 

	--/ <summary>Right ascension of the target</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL, 

	--/ <summary>Declination of the target</summary>
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
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone;pos.eq; pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Position angle of Y axis</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[APER_PA] [float] NOT NULL, 

	--/ <summary>Ecliptic latitude</summary>
	--/ <quantity>pos.ecliptic.lat</quantity>
	--/ <unit>deg</unit>
	[ELAT] [float] NOT NULL, 

	--/ <summary>Ecliptic longitude</summary>
	--/ <quantity>pos.ecliptic.lon</quantity>
	--/ <unit>deg</unit>
	[ELONG] [float] NOT NULL, 

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[GLAT] [float] NOT NULL, 

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[GLONG] [float] NOT NULL, 

	--/ <summary>Object class</summary>
	--/ <quantity>src.class</quantity>
	[OBJCLASS] [float] NOT NULL, 

	--/ <summary> MK spectral type and luminosity class </summary>
	--/ <quantity>src.spType;src.class.luminosity</quantity>
	[SP_TYPE] [varchar](64) NULL, 

	--/ <summary>Point or Extended Continuum Emission</summary>
	--/ <quantity>src.class</quantity>
	[SRC_TYPE] [varchar](64) NULL, 

	--/ <summary>Target V magnitud</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	[VMAG] [float] NOT NULL, 

	--/ <summary>Color excess</summary>
	--/ <quantity>phot.color.excess</quantity>
	[EBV] [float] NOT NULL, 

	--/ <summary>Redshift</summary>
	--/ <quantity>str.redshift</quantity>
	[Z] [float] NOT NULL, 

	--/ <summary>High proper motion target</summary>
	--/ <quantity>meta.note</quantity>
	[HIGH_PM] [varchar](64) NOT NULL, 

	--/ <summary>Fixed or Moving target</summary>
	--/ <quantity>meta.note</quantity>
	[MOV_TARG] [varchar](64) NOT NULL, 

	--/ <summary>UT date of start of exposure yyyy-mm-dd</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[DATEOBS] [varchar](64) NOT NULL, 

	--/ <summary>Exposure start time - Modified Julian Date</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[OBSSTART] [float] NOT NULL, 

	--/ <summary>Exposure end time - Modified Julian Date</summary>
	--/ <quantity>time.end;obs.exposure</quantity>
	[OBSEND] [float] NOT NULL, 

	--/ <summary> Total time after screening </summary>
	--/ <quantity>time</quantity>
	--/ <unit>s</unit>
	[OBSTIME] [float] NOT NULL, 

	--/ <summary>Exposure duration of raw data file</summary>
	--/ <quantity>time;obs.exposure</quantity>
	--/ <unit>s</unit>
	[RAWTIME] [float] NOT NULL, 

	--/ <summary>Night time after screening</summary>
	--/ <quantity>time</quantity>
	--/ <unit>s</unit>
	[OBSNIGHT] [float] NOT NULL, 

	--/ <summary>Instrument mode TTAG or HIST</summary>
	--/ <quantity>instr.bandpass</quantity>
	[INSTMODE] [varchar](64) NOT NULL, 

	--/ <summary>Planned target aperture</summary>
	--/ <quantity>instr.param</quantity>
	[APERTURE] [varchar](64) NOT NULL, 

	--/ <summary>CALFUSE pipeline version number</summary>
	--/ <quantity>meta.version</quantity>
	[CF_VERS] [varchar](64) NOT NULL, 

	--/ <summary>Bandwidth of the data</summary>
	--/ <quantity>instr.bandwith</quantity>
	--/ <unit>AA</unit>
	[BANDWID] [float] NOT NULL, 

	--/ <summary>Central wavelenght of the data</summary>
	--/ <quantity>em.wl.central</quantity>
	--/ <unit>AA</unit>
	[CENTRWV] [float] NOT NULL, 

	--/ <summary>Minimun wavelenght of the data</summary>
	--/ <quantity>em.wl;stat.min</quantity>
	--/ <unit>AA</unit>
	[WAVEMIN] [float] NOT NULL, 

	--/ <summary>Maximun wavelenght of the data</summary>
	--/ <quantity>em.wl;stat.max</quantity>
	--/ <unit>AA</unit>
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