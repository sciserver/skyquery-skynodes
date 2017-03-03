--/ <summary>The main PhotoObj table for the 2QZ catalog</summary>
	--/ <quantity></quantity>
--/ <remarks>The main PhotoObj table for the 2QZ catalog</remarks>
CREATE TABLE [dbo].[SpecObj]
(
	--/ <summary>unique object identifier</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>IAU format object name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](16) NOT NULL, 

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
	--/ <quantity>pos.zone</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Internal catalogue object number</summary>
	--/ <quantity>meta.id</quantity>
	[cat_num] [int] NOT NULL, 

	--/ <summary>Internal catalogue object name</summary>
	--/ <quantity>meta.id</quantity>
	[cat_name] [varchar](10) NOT NULL, 

	--/ <summary>Name of the sector this object inhabits</summary>
	--/ <quantity>meta.id</quantity>
	[sector] [varchar](25) NOT NULL, 

	--/ <summary>Right ascension B1950</summary>
	--/ <quantity>pos.eq.ra;pos.frame=b1950</quantity>
	--/ <unit>deg</unit>
	[raB1950] [float] NOT NULL, 

	--/ <summary>Declination B1950</summary>
	--/ <quantity>pos.eq.dec;pos.frame=b1950</quantity>
	--/ <unit>deg</unit>
	[decB1950] [float] NOT NULL, 

	--/ <summary>UKST survey field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[UKST] [smallint] NOT NULL, 

	--/ <summary>APM scan X position (~8 micron pixels)</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	[x_apm] [float] NOT NULL, 

	--/ <summary>APM scan Y position (~8 micron pixels)</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	[y_apm] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>rad</unit>
	[raBrad] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>rad</unit>
	[decBrad] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bj] [real] NOT NULL, 

	--/ <summary>u-bj colour</summary>
	--/ <quantity>phot.color;em.opt.U;em.opt.B</quantity>
	[u_bj] [real] NOT NULL, 

	--/ <summary>bj-r colour [incl. r upper limits as (bj-rlim-10)]</summary>
	--/ <quantity>phot.color;em.opt.B;em.opt.R</quantity>
	[bj_r] [real] NOT NULL, 

	--/ <summary>Number of observations made with 2dF</summary>
	--/ <quantity>meta.number;os</quantity>
	[n_obs] [smallint] NOT NULL, 

	--/ <summary>Redshift (Obs.#1)</summary>
	--/ <quantity>src.redshift</quantity>
	[z1] [real] NOT NULL, 

	--/ <summary>Identification quality x 10 + redshift quality</summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q1] [smallint] NOT NULL, 

	--/ <summary>Identification</summary>
	--/ <quantity>meta.class;spect</quantity>
	[id1] [varchar](10) NOT NULL, 

	--/ <summary>Observation date</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[date1] [varchar](8) NOT NULL, 

	--/ <summary>2dF field number x 10 + spectrograph number</summary>
	--/ <quantity>meta.id</quantity>
	[fld1] [smallint] NOT NULL, 

	--/ <summary>2dF fibre number (in spectrograph)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fibre1] [smallint] NOT NULL, 

	--/ <summary>Signal-to-noise ratio in the 4000-5000A band</summary>
	--/ <quantity>stat.snr</quantity>
	[SN1] [real] NOT NULL, 

	--/ <summary>Redshift (Obs.#2)</summary>
	--/ <quantity>src.redshift</quantity>
	[z2] [real] NOT NULL, 

	--/ <summary>Identification quality x 10 + redshift quality</summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q2] [smallint] NOT NULL, 

	--/ <summary>Identification</summary>
	--/ <quantity>meta.class;spect</quantity>
	[id2] [varchar](10) NOT NULL, 

	--/ <summary>Observation date</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[date2] [varchar](8) NOT NULL, 

	--/ <summary>2dF field number x 10 + spectrograph number</summary>
	--/ <quantity>meta.id</quantity>
	[fld2] [smallint] NOT NULL, 

	--/ <summary>2dF fibre number (in spectrograph)</summary>
	--/ <quantity>met.id;instr.param</quantity>
	[fibre2] [smallint] NOT NULL, 

	--/ <summary>Signal-to-noise ratio in the 4000-5000A band</summary>
	--/ <quantity>stat.snr</quantity>
	[SN2] [real] NOT NULL, 

	--/ <summary>Previously known redshift (Veron-Cetty &amp; Veron 2000)</summary>
	--/ <quantity>src.redshift</quantity>
	[zprev] [real] NOT NULL, 

	--/ <summary>NVSS radio flux</summary>
	--/ <quantity>phot.flux;em.radio</quantity>
	--/ <unit>mJy</unit>
	[radio] [real] NOT NULL, 

	--/ <summary>RASS  x-ray flux, 0.2-2.4keV (x10-13 erg s-1 cm-2)</summary>
	--/ <quantity>phot.flux;em.X-ray.soft</quantity>
	--/ <unit>keV</unit>
	[Xray] [real] NOT NULL, 

	--/ <summary>E_{B-V} (Schlegel, Finkbeiner &amp; Davis 1998)</summary>
	--/ <quantity>phot.color.excess</quantity>
	[dust] [real] NOT NULL, 

	--/ <summary>Specific comments on observation 1</summary>
	--/ <quantity>meta.note</quantity>
	[comm1] [varchar](20) NOT NULL, 

	--/ <summary>Specific comments on observation 2</summary>
	--/ <quantity>meta.note</quantity>
	[comm2] [varchar](20) NOT NULL 

) ON [PRIMARY]


ALTER TABLE [dbo].[SpecObj] 
ADD CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

