USE [SkyNode_TwoQZ]
GO

--/ <summary>The main PhotoObj table for the 2QZ catalog</summary>
--/ <remarks>The main PhotoObj table for the 2QZ catalog</remarks>
CREATE TABLE [dbo].[SpecObj]
(
	--/ <summary>unique object identifier</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>IAU format object name</summary>
	[name] [varchar](16) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

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

	--/ <summary>Internal catalogue object number</summary>
	[cat_num] [int] NOT NULL, 

	--/ <summary>Internal catalogue object name</summary>
	[cat_name] [varchar](10) NOT NULL, 

	--/ <summary>Name of the sector this object inhabits</summary>
	[sector] [varchar](25) NOT NULL, 

	--/ <summary>Right ascension B1950</summary>
	--/ <unit>deg</unit>
	[raB1950] [float] NOT NULL, 

	--/ <summary>Declination B1950</summary>
	--/ <unit>deg</unit>
	[decB1950] [float] NOT NULL, 

	--/ <summary>UKST survey field number</summary>
	[UKST] [smallint] NOT NULL, 

	--/ <summary>APM scan X position (~8 micron pixels)</summary>
	[x_apm] [float] NOT NULL, 

	--/ <summary>APM scan Y position (~8 micron pixels)</summary>
	[y_apm] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <unit>rad</unit>
	[raBrad] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <unit>rad</unit>
	[decBrad] [float] NOT NULL, 

	--/ <summary></summary>
	--/ <unit>mag</unit>
	[bj] [real] NOT NULL, 

	--/ <summary>u-bj colour</summary>
	[u_bj] [real] NOT NULL, 

	--/ <summary>bj-r colour [incl. r upper limits as (bj-rlim-10)]</summary>
	[bj_r] [real] NOT NULL, 

	--/ <summary>Number of observations made with 2dF</summary>
	[n_obs] [smallint] NOT NULL, 

	--/ <summary>Redshift (Obs.#1)</summary>
	[z1] [real] NOT NULL, 

	--/ <summary>Identification quality x 10 + redshift quality</summary>
	[q1] [smallint] NOT NULL, 

	--/ <summary>Identification</summary>
	[id1] [varchar](10) NOT NULL, 

	--/ <summary>Observation date</summary>
	[date1] [varchar](8) NOT NULL, 

	--/ <summary>2dF field number x 10 + spectrograph number</summary>
	[fld1] [smallint] NOT NULL, 

	--/ <summary>2dF fibre number (in spectrograph)</summary>
	[fibre1] [smallint] NOT NULL, 

	--/ <summary>Signal-to-noise ratio in the 4000-5000A band</summary>
	[SN1] [real] NOT NULL, 

	--/ <summary>Redshift (Obs.#2)</summary>
	[z2] [real] NOT NULL, 

	--/ <summary>Identification quality x 10 + redshift quality</summary>
	[q2] [smallint] NOT NULL, 

	--/ <summary>Identification</summary>
	[id2] [varchar](10) NOT NULL, 

	--/ <summary>Observation date</summary>
	[date2] [varchar](8) NOT NULL, 

	--/ <summary>2dF field number x 10 + spectrograph number</summary>
	[fld2] [smallint] NOT NULL, 

	--/ <summary>2dF fibre number (in spectrograph)</summary>
	[fibre2] [smallint] NOT NULL, 

	--/ <summary>Signal-to-noise ratio in the 4000-5000A band</summary>
	[SN2] [real] NOT NULL, 

	--/ <summary>Previously known redshift (Veron-Cetty &amp; Veron 2000)</summary>
	[zprev] [real] NOT NULL, 

	--/ <summary>NVSS radio flux</summary>
	--/ <unit>mJy</unit>
	[radio] [real] NOT NULL, 

	--/ <summary>RASS  x-ray flux, 0.2-2.4keV (x10-13 erg s-1 cm-2)</summary>
	--/ <unit>keV</unit>
	[Xray] [real] NOT NULL, 

	--/ <summary>E_{B-V} (Schlegel, Finkbeiner &amp; Davis 1998)</summary>
	[dust] [real] NOT NULL, 

	--/ <summary>Specific comments on observation 1</summary>
	[comm1] [varchar](20) NOT NULL, 

	--/ <summary>Specific comments on observation 2</summary>
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

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_SpecObj_Zone] ON [dbo].[SpecObj] 
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


CREATE NONCLUSTERED INDEX [IX_SpecObj_ZoneID] ON [dbo].[SpecObj] 
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
CREATE NONCLUSTERED INDEX [IX_SpecObj_HtmID] ON [dbo].[SpecObj] 
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