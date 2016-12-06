USE [SkyNode_IRAS]
GO

--/ <summary>The main PhotoObj table for the IRAS catalog</summary>
--/ <remarks>The main PhotoObj table for the IRAS catalog</remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>unique object identifier</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>IRAS Source Name</summary>
	[name] [varchar](11) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 
    [cx] [float] NOT NULL, --/ <column>Cartesian coordinate x</column>

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Uncertainty ellipse major axis</summary>
	--/ <unit>arcsec</unit>
	[err_maj] [real] NOT NULL, 

	--/ <summary>Uncertainty ellipse minor axis</summary>
	--/ <unit>arcsec</unit>
	[err_min] [real] NOT NULL, 

	--/ <summary>Uncertainty ellipse position angle</summary>
	--/ <unit>deg</unit>
	[err_ang] [smallint] NOT NULL, 

	--/ <summary>Number of times observed (&lt;25)</summary>
	[nhcon] [smallint] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 12 microns</summary>
	--/ <unit>Jansky</unit>
	[flux_12] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 25 microns</summary>
	--/ <unit>Jansky</unit>
	[flux_25] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 60 microns</summary>
	--/ <unit>Jansky</unit>
	[flux_60] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density,100 microns</summary>
	--/ <unit>Jansky</unit>
	[flux_100] [real] NOT NULL, 

	--/ <summary>flux density quality, 12 microns</summary>
	[fqual_12] [smallint] NOT NULL, 

	--/ <summary>flux density quality, 25 microns</summary>
	[fqual_25] [smallint] NOT NULL, 

	--/ <summary>flux density quality, 60 microns</summary>
	[fqual_60] [smallint] NOT NULL, 

	--/ <summary>flux density quality,100 microns</summary>
	[fqual_100] [smallint] NOT NULL, 

	--/ <summary>Number of significant LRS spectra</summary>
	[nlrs] [smallint] NOT NULL, 

	--/ <summary>Characterization of averaged LRS spectrum, __ is NULL</summary>
	[lrschar] [char](2) NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 12 microns</summary>
	[relunc_12] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 25 microns</summary>
	[relunc_25] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 60 microns</summary>
	[relunc_60] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties,100 microns</summary>
	[relunc_100] [smallint] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 12 microns</summary>
	[tsnr_12] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 25 microns</summary>
	[tsnr_25] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 60 microns</summary>
	[tsnr_60] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio,100 microns</summary>
	[tsnr_100] [int] NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 12 microns</summary>
	[cc_12] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 25 microns</summary>
	[cc_25] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 60 microns</summary>
	[cc_60] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL,100 microns</summary>
	[cc_100] [char](1) NOT NULL, 

	--/ <summary>Percent Likelihood of Variability</summary>
	[lvar] [smallint] NOT NULL, 

	--/ <summary>Discrepant Fluxes flag (hex-encoded)</summary>
	[disc] [binary](1) NOT NULL, 

	--/ <summary>Confusion flag (hex-encoded)</summary>
	[confuse] [binary](1) NOT NULL, 

	--/ <summary>Number of nearby hours-confirmed point sources</summary>
	[pnearh] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed point sources</summary>
	[pnearw] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 12 microns</summary>
	[ses1_12] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 25 microns</summary>
	[ses1_25] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 60 microns</summary>
	[ses1_60] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources,100 microns</summary>
	[ses1_100] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 12 microns</summary>
	[ses2_12] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 25 microns</summary>
	[ses2_25] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 60 microns</summary>
	[ses2_60] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources,100 microns</summary>
	[ses2_100] [smallint] NOT NULL, 

	--/ <summary>Source is located in high source density bin (hex-encoded)</summary>
	[hsdflag] [binary](1) NOT NULL, 

	--/ <summary>Number of nearby 100 micron only WSDB sources</summary>
	[cirr1] [smallint] NOT NULL, 

	--/ <summary>Spatially filtered 100 micron sky brightness ratio to flux density of point source (see text)</summary>
	[cirr2] [smallint] NOT NULL, 

	--/ <summary>Total 100 micron sky surface brightness</summary>
	--/ <unit>MJy/sr</unit>
	[cirr3] [smallint] NOT NULL, 

	--/ <summary>Number of positional associations</summary>
	[nid] [smallint] NOT NULL, 

	--/ <summary>Type of Object</summary>
	[idtype] [smallint] NOT NULL, 

	--/ <summary>Possible number of HCONs, 99 for NULL</summary>
	[mhcon] [smallint] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 12 microns</summary>
	[fcor_12] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 25 microns</summary>
	[fcor_25] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 60 microns</summary>
	[fcor_60] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL,100 microns</summary>
	[fcor_100] [int] NOT NULL 
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PhotoObj] ADD PRIMARY KEY CLUSTERED 
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

-- Zone index
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