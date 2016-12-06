USE [SkyNode_SPITZER]

GO

-- CREATE goodsnIRS16micron TABLE
CREATE TABLE dbo.goodsnIRS16micron
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source ID </summary>
	[id] int NOT NULL,

	--/ <summary> Right Ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Coverage </summary>
	[cov] int NOT NULL,

	--/ <summary> 3.6 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s3_6] real NOT NULL,

	--/ <summary> 3.6 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s3_6] real NOT NULL,

	--/ <summary> 4.5 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s4_5] real NOT NULL,

	--/ <summary> 4.5 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s4_5] real NOT NULL,

	--/ <summary> 5.8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s5_8] real NOT NULL,

	--/ <summary> 5.8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s5_8] real NOT NULL,

	--/ <summary> 8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s8] real NOT NULL,

	--/ <summary> 8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s8] real NOT NULL,

	--/ <summary> 16 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s16] real NOT NULL,

	--/ <summary> 16 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s16] real NOT NULL,

	--/ <summary> 24 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s24] real NOT NULL,

	--/ <summary> 24 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s24] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	[zspec] real NOT NULL,

	--/ <summary> Reference for the spectroscopic redshift </summary>
	[r_zspec] int NOT NULL,

	--/ <summary> X-ray detection flag </summary>
	[xdet] tinyint NOT NULL,

	--/ <summary> Soft X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[sbf] float NOT NULL,

	--/ <summary> Hard X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[hbf] float NOT NULL,

	--/ <summary> Star flag </summary>
	[star] tinyint NOT NULL,

	--/ <summary> 16 micron concentration index </summary>
	[ratio] real NOT NULL,

	--/ <summary> Number of 8 micron sources within 4 arcsec </summary>
	[ncf] tinyint NOT NULL,

	--/ <summary> Number of 16 micron sources within 5.4 arcsec </summary>
	[ncf16] tinyint NOT NULL,

	--/ <summary> Quality flag </summary>
	[q] smallint NOT NULL,

	--/ <summary> Extended source flag </summary>
	[e] tinyint NOT NULL,

	--/ <summary> HST B magnitude </summary>
	--/ <unit> mag </unit>
	[bmag] real NOT NULL,

	--/ <summary> HST V magnitude </summary>
	--/ <unit> mag </unit>
	[vmag] real NOT NULL,

	--/ <summary> HST I magnitude </summary>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> HST z magnitude </summary>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> HST B magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ebmag] real NOT NULL,

	--/ <summary> HST V magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[evmag] real NOT NULL,

	--/ <summary> HST I magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[eimag] real NOT NULL,

	--/ <summary> HST z magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ezmag] real NOT NULL,

	--/ <summary> Number of I-band sources within 1 arcsec </summary>
	--/ <unit> mag </unit>
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnIRS16micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_Zone] ON [dbo].[goodsnIRS16micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_ZoneID] ON [dbo].[goodsnIRS16micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodsnIRS16micron_HtmID] ON [dbo].[goodsnIRS16micron] 
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

-----------------------------------------------------------------------------------------


-- CREATE goodsnMIPS24micron TABLE
CREATE TABLE dbo.goodsnMIPS24micron
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Uncertanity in flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodsnMIPS24micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodsnMIPS24micron_Zone] ON [dbo].[goodsnMIPS24micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodsnMIPS24micron_ZoneID] ON [dbo].[goodsnMIPS24micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodsnMIPS24micron_HtmID] ON [dbo].[goodsnMIPS24micron] 
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

---------------------------------------------------------------------------------------------------

-- CREATE goodssIRS16micron TABLE
CREATE TABLE dbo.goodssIRS16micron
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source ID </summary>
	[id] int NOT NULL,

	--/ <summary> Right Ascension (J2000) </summary>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Coverage </summary>
	[cov] int NOT NULL,

	--/ <summary> 3.6 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s3_6] real NOT NULL,

	--/ <summary> 3.6 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s3_6] real NOT NULL,

	--/ <summary> 4.5 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s4_5] real NOT NULL,

	--/ <summary> 4.5 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s4_5] real NOT NULL,

	--/ <summary> 5.8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s5_8] real NOT NULL,

	--/ <summary> 5.8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s5_8] real NOT NULL,

	--/ <summary> 8 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s8] real NOT NULL,

	--/ <summary> 8 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s8] real NOT NULL,

	--/ <summary> 16 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s16] real NOT NULL,

	--/ <summary> 16 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s16] real NOT NULL,

	--/ <summary> 24 micron flux density </summary>
	--/ <unit> microjy </unit>
	[s24] real NOT NULL,

	--/ <summary> 24 micron flux density uncertainty </summary>
	--/ <unit> microjy </unit>
	[e_s24] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	[zspec] real NOT NULL,

	--/ <summary> Reference for the spectroscopic redshift </summary>
	[r_zspec] int NOT NULL,

	--/ <summary> X-ray detection flag </summary>
	[xdet] tinyint NOT NULL,

	--/ <summary> Soft X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[sbf] float NOT NULL,

	--/ <summary> Hard X-ray flux </summary>
	--/ <unit> 1e-15 mW m^-2 </unit>
	[hbf] float NOT NULL,

	--/ <summary> Star flag </summary>
	[star] tinyint NOT NULL,

	--/ <summary> 16 micron concentration index </summary>
	[ratio] real NOT NULL,

	--/ <summary> Number of 8 micron sources within 4 arcsec </summary>
	[ncf] tinyint NOT NULL,

	--/ <summary> Number of 16 micron sources within 5.4 arcsec </summary>
	[ncf16] tinyint NOT NULL,

	--/ <summary> Quality flag </summary>
	[q] smallint NOT NULL,

	--/ <summary> Extended source flag </summary>
	[e] tinyint NOT NULL,

	--/ <summary> HST B magnitude </summary>
	--/ <unit> mag </unit>
	[bmag] real NOT NULL,

	--/ <summary> HST V magnitude </summary>
	--/ <unit> mag </unit>
	[vmag] real NOT NULL,

	--/ <summary> HST I magnitude </summary>
	--/ <unit> mag </unit>
	[imag] real NOT NULL,

	--/ <summary> HST z magnitude </summary>
	--/ <unit> mag </unit>
	[zmag] real NOT NULL,

	--/ <summary> HST B magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ebmag] real NOT NULL,

	--/ <summary> HST V magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[evmag] real NOT NULL,

	--/ <summary> HST I magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[eimag] real NOT NULL,

	--/ <summary> HST z magnitude uncertainty </summary>
	--/ <unit> mag </unit>
	[ezmag] real NOT NULL,

	--/ <summary> Number of I-band sources within 1 arcsec </summary>
	--/ <unit> mag </unit>
	[icls] tinyint NOT NULL,

	CONSTRAINT [PK_goodssIRS16micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodssIRS16micron_Zone] ON [dbo].[goodssIRS16micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodssIRS16micron_ZoneID] ON [dbo].[goodssIRS16micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodssIRS16micron_HtmID] ON [dbo].[goodssIRS16micron] 
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

------------------------------------------------------------------------------------------------

-- CREATE goodssMIPS24micron TABLE
CREATE TABLE dbo.goodssMIPS24micron
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg (J2000) </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Uncertanity in flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_goodssMIPS24micron] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_Zone] ON [dbo].[goodssMIPS24micron] 
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

CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_ZoneID] ON [dbo].[goodssMIPS24micron] 
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
CREATE NONCLUSTERED INDEX [IX_goodssMIPS24micron_HtmID] ON [dbo].[goodssMIPS24micron] 
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