USE SkyNode_TwoDF

--/ <summary>The main PhotoObj table for the 2DF catalog</summary>
--/ <remarks>The main PhotoObj table for the 2DF catalog</remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>unique object identifier, SEQNUM in original catalog</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>Catalogue Type: n for NGP,s for SGP and r for random fiels</summary>
	[cat] [char](1) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	[cx] [float] NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NULL, 

	--/ <summary>HTM ID</summary>
	[htmid] [bigint] NULL, 

	--/ <summary>Unique HTM ID</summary>
	[zoneid] [bigint] NULL, 

	--/ <summary>Final bj magnitude with extinction correction</summary>
	--/ <unit>mag</unit>
	[bjsel] [real] NOT NULL, 

	--/ <summary>psi classification parameter</summary>
	[prob] [real] NOT NULL, 

	--/ <summary>k classification parameter = k / k_star</summary>
	[park] [real] NOT NULL, 

	--/ <summary>mu classification parameter = mu / mu_star</summary>
	[parmu] [real] NOT NULL, 

	--/ <summary>Final classification</summary>
	[igal] [smallint] NOT NULL, 

	--/ <summary>Eyeball classification</summary>
	[jon] [smallint] NOT NULL, 

	--/ <summary>Orientation measured in degrees clockwise from E to W</summary>
	[orient] [real] NOT NULL, 

	--/ <summary>Eccentricity (e)</summary>
	[eccent] [real] NOT NULL, 

	--/ <summary>Isophotal area in pixels</summary>
	[area] [real] NOT NULL, 

	--/ <summary>Plate x_bj in 8 micron pixels</summary>
	[x_bj] [real] NOT NULL, 

	--/ <summary>Plate y_bj in 8 micron pixels</summary>
	[y_bj] [real] NOT NULL, 

	--/ <summary>Distortion corrected difference (x_bj - x_R)*100</summary>
	[dx] [real] NOT NULL, 

	--/ <summary>Distortion corrected difference (y_bj - y_R)*100</summary>
	[dy] [real] NOT NULL, 

	--/ <summary>Final bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[bjg] [real] NOT NULL, 

	--/ <summary>Unmatched APM 'total' mag</summary>
	--/ <unit>mag</unit>
	[rmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw APM profile integrated mag</summary>
	--/ <unit>mag</unit>
	[pmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw APM 2" profile integrated mag</summary>
	--/ <unit>mag</unit>
	[fmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw stellar mag (from APMCAL)</summary>
	--/ <unit>mag</unit>
	[smag] [real] NOT NULL, 

	--/ <summary>Not used.</summary>
	[redmag] [real] NOT NULL, 

	--/ <summary>UKST field</summary>
	[ifield] [int] NOT NULL, 

	--/ <summary>Galaxy number in UKST field</summary>
	[igfield] [int] NOT NULL, 

	--/ <summary>2dFGRS assigned name</summary>
	[name] [varchar](10) NOT NULL, 

	--/ <summary>Original bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[bjg_old] [real] NOT NULL, 

	--/ <summary>Original bj magnitude with extinction correction</summary>
	--/ <unit>mag</unit>
	[bjselold] [real] NOT NULL, 

	--/ <summary>100k release bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[bjg_100] [real] NOT NULL, 

	--/ <summary>100k release bj  magnitude with extinction correction</summary>
	--/ <unit>mag</unit>
	[bjsel100] [real] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
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

---------------------------------------------------------------

--/ <summary>The main SpecObj table for the 2DF catalog</summary>
--/ <remarks>The main SpecObj table for the 2DF catalog</remarks>
CREATE TABLE [dbo].[SpecObj]
(

	--/ <summary>unique object identifier, SEQNUM in original catalog</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>Catalogue Type: n for NGP,s for SGP and r for random fiels</summary>
	[cat] [char](1) NOT NULL, 

	--/ <summary>Number of spectra obtained</summary>
	[spectra] [smallint] NOT NULL, 

	--/ <summary>2dFGRS name</summary>
	[name] [varchar](10) NOT NULL, 

	--/ <summary>UKST plate (=IFIELD)</summary>
	[UKST] [varchar](3) NOT NULL, 

	--/ <summary>Right Ascension (J2000)</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>Declination (J2000)</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	[cx] [float] NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NULL, 

	--/ <summary>HTM ID</summary>
	[htmid] [bigint] NULL, 

	--/ <summary>Zone ID</summary>
	[zoneid] [bigint] NULL, 

	--/ <summary>Final bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[bjg] [real] NOT NULL, 

	--/ <summary>Final bj magnitude with extinction correction</summary>
	--/ <unit>mag</unit>
	[bjsel] [real] NOT NULL, 

	--/ <summary>Original bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[bjg_old] [real] NOT NULL, 

	--/ <summary>Original bj magnitude with extinction correction</summary>
	--/ <unit>mag</unit>
	[bjselold] [real] NOT NULL, 

	--/ <summary>Galactic extinction value</summary>
	[galext] [real] NOT NULL, 

	--/ <summary>SuperCosmos bj magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[sb_bj] [real] NOT NULL, 

	--/ <summary>SuperCosmos R magnitude without extinction correction</summary>
	--/ <unit>mag</unit>
	[sr_r] [real] NOT NULL, 

	--/ <summary>Best redshift (observed)</summary>
	[z] [real] NOT NULL, 

	--/ <summary>Best redshift (heliocentric)</summary>
	[z_helio] [real] NOT NULL, 

	--/ <summary>Observation run of best spectrum</summary>
	[obsrun] [varchar](5) NOT NULL, 

	--/ <summary>Redshift quality parameter for best spectrum; reliable redshifts have >=3</summary>
	[quality] [smallint] NOT NULL, 

	--/ <summary>Redshift type (abs=1, emi=2, man=3)</summary>
	[abemma] [smallint] NOT NULL, 

	--/ <summary>Cross-correlation redshift from best spectrum</summary>
	[z_abs] [real] NOT NULL, 

	--/ <summary>Cross-correlation template from best spectrum</summary>
	[kbestr] [smallint] NOT NULL, 

	--/ <summary>Cross-correlation R value from best spectrum</summary>
	[r_crcor] [real] NOT NULL, 

	--/ <summary>Emission redshift from best spectrum</summary>
	[z_emi] [real] NOT NULL, 

	--/ <summary>Number of emission lines for Z_EMI from best spectrum</summary>
	[nmbest] [smallint] NOT NULL, 

	--/ <summary>Median S/N per pixel from best spectrum</summary>
	[snr] [real] NOT NULL, 

	--/ <summary>Eta spectral type parameter from best spectrum (-99.9 if none)</summary>
	[eta_type] [real] NOT NULL 
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