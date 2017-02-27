--/ <summary>The main PhotoObj table for the IRAS catalog</summary>
--/ <remarks>The main PhotoObj table for the IRAS catalog</remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>unique object identifier</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>IRAS Source Name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](11) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
    [cx] [float] NOT NULL,

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone; pos.eq; pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Uncertainty ellipse major axis</summary>
	--/ <quantity>stat.error;pos.errorEllipse.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[err_maj] [real] NOT NULL, 

	--/ <summary>Uncertainty ellipse minor axis</summary>
	--/ <quantity>stat.error;pos.errorEllipse.sminAxis</quantity>
	--/ <unit>arcsec</unit>
	[err_min] [real] NOT NULL, 

	--/ <summary>Uncertainty ellipse position angle</summary>
	--/ <quantity>pos.posAng;pos.errorEllipse</quantity>
	--/ <unit>deg</unit>
	[err_ang] [smallint] NOT NULL, 

	--/ <summary>Number of times observed (&lt;25)</summary>
	--/ <quantity>meta.number;obs</quantity>
	[nhcon] [smallint] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 12 microns</summary>
	--/ <quantity>phot.flux.density;em.IR.IRAS.12;stat.mean</quantity>
	--/ <unit>Jy</unit>
	[flux_12] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 25 microns</summary>
	--/ <quantity>phot.flux.density;em.IR.IRAS.25;stat.mean</quantity>
	--/ <unit>Jy</unit>
	[flux_25] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density, 60 microns</summary>
	--/ <quantity>phot.flux.density;em.IR.IRAS.60;stat.mean</quantity>
	--/ <unit>Jy</unit>
	[flux_60] [real] NOT NULL, 

	--/ <summary>Averaged non-color corrected flux density,100 microns</summary>
	--/ <quantity>phot.flux.density;em.IR.IRAS.100;stat.mean</quantity>
	--/ <unit>Jy</unit>
	[flux_100] [real] NOT NULL, 

	--/ <summary>flux density quality, 12 microns</summary>
	--/ <quantity>meta.code.qual;em.IR.IRAS.12</quantity>
	[fqual_12] [smallint] NOT NULL, 

	--/ <summary>flux density quality, 25 microns</summary>
	--/ <quantity>meta.code.qual;em.IR.IRAS.25</quantity>
	[fqual_25] [smallint] NOT NULL, 

	--/ <summary>flux density quality, 60 microns</summary>
	--/ <quantity>meta.code.qual;em.IR.IRAS.60</quantity>
	[fqual_60] [smallint] NOT NULL, 

	--/ <summary>flux density quality,100 microns</summary>
	--/ <quantity>meta.code.qual;em.IR.IRAS.100</quantity>
	[fqual_100] [smallint] NOT NULL, 

	--/ <summary>Number of significant LRS spectra</summary>
	--/ <quantity></quantity>
	[nlrs] [smallint] NOT NULL, 

	--/ <summary>Characterization of averaged LRS spectrum, __ is NULL</summary>
	--/ <quantity>meta.code</quantity>
	[lrschar] [char](2) NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 12 microns</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.IRAS.12</quantity>
	[relunc_12] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 25 microns</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.IRAS.25</quantity>
	[relunc_25] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties, 60 microns</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.IRAS.60</quantity>
	[relunc_60] [smallint] NOT NULL, 

	--/ <summary>Percent relative flux density uncertainties,100 microns</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.IRAS.100</quantity>
	[relunc_100] [smallint] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 12 microns</summary>
	--/ <quantity>stat.snr;em.IR.IRAS.12</quantity>
	[tsnr_12] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 25 microns</summary>
	--/ <quantity>stat.snr;em.IR.IRAS.25</quantity>
	[tsnr_25] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio, 60 microns</summary>
	--/ <quantity>stat.snr;em.IR.IRAS.60</quantity>
	[tsnr_60] [int] NOT NULL, 

	--/ <summary>Ten times the minimum signal-to-noise ratio,100 microns</summary>
	--/ <quantity>stat.snr;em.IR.IRAS.100</quantity>
	[tsnr_100] [int] NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 12 microns</summary>
	--/ <quantity>stat.correlation;em.IR.IRAS.12</quantity>
	[cc_12] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 25 microns</summary>
	--/ <quantity>stat.correlation;em.IR.IRAS.25</quantity>
	[cc_25] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL, 60 microns</summary>
	--/ <quantity>stat.correlation;em.IR.IRAS.60</quantity>
	[cc_60] [char](1) NOT NULL, 

	--/ <summary>Point source correlation coefficient,_ is NULL,100 microns</summary>
	--/ <quantity>stat.correlation;em.IR.IRAS.100</quantity>
	[cc_100] [char](1) NOT NULL, 

	--/ <summary>Percent Likelihood of Variability</summary>
	--/ <quantity>stat.likelihood;src.var</quantity>
	[lvar] [smallint] NOT NULL, 

	--/ <summary>Discrepant Fluxes flag (hex-encoded)</summary>
	--/ <quantity>meta.code;phot.flux</quantity>
	[disc] [binary](1) NOT NULL, 

	--/ <summary>Confusion flag (hex-encoded)</summary>
	--/ <quantity>meta.code</quantity>
	[confuse] [binary](1) NOT NULL, 

	--/ <summary>Number of nearby hours-confirmed point sources</summary>
	--/ <quantity>meta.number;src</quantity>
	[pnearh] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed point sources</summary>
	--/ <quantity>meta.number;src</quantity>
	[pnearw] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 12 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.12</quantity>
	[ses1_12] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 25 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.25</quantity>
	[ses1_25] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources, 60 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.60</quantity>
	[ses1_60] [smallint] NOT NULL, 

	--/ <summary>Number of seconds-confirmed nearby small extended sources,100 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.100</quantity>
	[ses1_100] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 12 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.12</quantity>
	[ses2_12] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 25 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.25</quantity>
	[ses2_25] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources, 60 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.60</quantity>
	[ses2_60] [smallint] NOT NULL, 

	--/ <summary>Number of nearby weeks-confirmed small extended sources,100 microns</summary>
	--/ <quantity>meta.number;src;em.IR.IRAS.100</quantity>
	[ses2_100] [smallint] NOT NULL, 

	--/ <summary>Source is located in high source density bin (hex-encoded)</summary>
	--/ <quantity>meta.code.qual;pos</quantity>
	[hsdflag] [binary](1) NOT NULL, 

	--/ <summary>Number of nearby 100 micron only WSDB sources</summary>
	--/ <quantity>meta.code;src</quantity>
	[cirr1] [smallint] NOT NULL, 

	--/ <summary>Spatially filtered 100 micron sky brightness ratio to flux density of point source (see text)</summary>
	--/ <quantity>phot.flux.sb;arith.ratio</quantity>
	[cirr2] [smallint] NOT NULL, 

	--/ <summary>Total 100 micron sky surface brightness</summary>
	--/ <quantity>phot.flux.sb;obs.background</quantity>
	--/ <unit>MJy sr-1</unit>
	[cirr3] [smallint] NOT NULL, 

	--/ <summary>Number of positional associations</summary>
	--/ <quantity>meta.number</quantity>
	[nid] [smallint] NOT NULL, 

	--/ <summary>Type of Object</summary>
	--/ <quantity>src.class</quantity>
	[idtype] [smallint] NOT NULL, 

	--/ <summary>Possible number of HCONs, 99 for NULL</summary>
	--/ <quantity>meta.number</quantity>
	[mhcon] [smallint] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 12 microns</summary>
	--/ <quantity>stat.param;phot.flux;em.IR.IRAS.12</quantity>
	[fcor_12] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 25 microns</summary>
	--/ <quantity>stat.param;phot.flux;em.IR.IRAS.25</quantity>
	[fcor_25] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL, 60 microns</summary>
	--/ <quantity>stat.param;phot.flux;em.IR.IRAS.60</quantity>
	[fcor_60] [int] NOT NULL, 

	--/ <summary>Flux correction factor applied (times 1000),9999 is NULL,100 microns</summary>
	--/ <quantity>stat.param;phot.flux;em.IR.IRAS.100</quantity>
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
