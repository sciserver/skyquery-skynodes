--/ <summary>The main PhotoObj table for the 2DF catalog</summary>
--/ <remarks>The main PhotoObj table for the 2DF catalog</remarks>
CREATE TABLE [dbo].[PhotoObj]
(

	--/ <summary>unique object identifier, SEQNUM in original catalog</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>Catalogue Type: n for NGP,s for SGP and r for random fiels</summary>
	--/ <quantity>meta.code;meta.table</quantity>
	[cat] [char](1) NOT NULL, 

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
	[cx] [float] NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NULL, 

	--/ <summary>HTM ID</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] [bigint] NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] [bigint] NULL, 

	--/ <summary>Final bj magnitude with extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bjsel] [real] NOT NULL, 

	--/ <summary>psi classification parameter</summary>
	--/ <quantity>src.morph.param</quantity>
	[prob] [real] NOT NULL, 

	--/ <summary>k classification parameter = k / k_star</summary>
	--/ <quantity>src.morph.param</quantity>
	[park] [real] NOT NULL, 

	--/ <summary>mu classification parameter = mu / mu_star</summary>
	--/ <quantity>src.morph.param</quantity>
	[parmu] [real] NOT NULL, 

	--/ <summary>Final classification</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[igal] [smallint] NOT NULL, 

	--/ <summary>Eyeball classification</summary>
	--/ <quantity>src.morph</quantity>
	[jon] [smallint] NOT NULL, 

	--/ <summary>Orientation measured in degrees clockwise from E to W</summary>
	--/ <quantity>pos.posAng</quantity>
	[orient] [real] NOT NULL, 

	--/ <summary>Eccentricity (e)</summary>
	--/ <quantity>src.orbital.eccentricity</quantity>
	[eccent] [real] NOT NULL, 

	--/ <summary>Isophotal area in pixels</summary>
	--/ <quantity>phys.area</quantity>
	[area] [real] NOT NULL, 

	--/ <summary>Plate x_bj in 8 micron pixels</summary>
	--/ <quantity>pos.cartesian.x;instr.plate</quantity>
	[x_bj] [real] NOT NULL, 

	--/ <summary>Plate y_bj in 8 micron pixels</summary>
	--/ <quantity>pos.cartesian.y;instr.plate</quantity>
	[y_bj] [real] NOT NULL, 

	--/ <summary>Distortion corrected difference (x_bj - x_R)*100</summary>
	--/ <quantity>pos;arith.diff</quantity>
	[dx] [real] NOT NULL, 

	--/ <summary>Distortion corrected difference (y_bj - y_R)*100</summary>
	--/ <quantity>pos;arith.diff</quantity>
	[dy] [real] NOT NULL, 

	--/ <summary>Final bj magnitude without extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bjg] [real] NOT NULL, 

	--/ <summary>Unmatched APM 'total' mag</summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[rmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw APM profile integrated mag</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[pmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw APM 2" profile integrated mag</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[fmag] [real] NOT NULL, 

	--/ <summary>Unmatched raw stellar mag (from APMCAL)</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[smag] [real] NOT NULL, 

	--/ <summary>Not used.</summary>
	--/ <quantity>phot.mag</quantity>
	[redmag] [real] NOT NULL, 

	--/ <summary>UKST field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[ifield] [int] NOT NULL, 

	--/ <summary>Galaxy number in UKST field</summary>
	--/ <quantity>meta.id.cross</quantity>
	[igfield] [int] NOT NULL, 

	--/ <summary>2dFGRS assigned name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](10) NOT NULL, 

	--/ <summary>Original bj magnitude without extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bjg_old] [real] NOT NULL, 

	--/ <summary>Original bj magnitude with extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bjselold] [real] NOT NULL, 

	--/ <summary>100k release bj magnitude without extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[bjg_100] [real] NOT NULL, 

	--/ <summary>100k release bj  magnitude with extinction correction</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
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

---------------------------------------------------------------

--/ <summary>The main SpecObj table for the 2DF catalog</summary>
	--/ <quantity></quantity>
--/ <remarks>The main SpecObj table for the 2DF catalog</remarks>
CREATE TABLE [dbo].[SpecObj]
(

	--/ <summary>unique object identifier, SEQNUM in original catalog</summary>
	--/ <quantity></quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>Catalogue Type: n for NGP,s for SGP and r for random fiels</summary>
	--/ <quantity></quantity>
	[cat] [char](1) NOT NULL, 

	--/ <summary>Number of spectra obtained</summary>
	--/ <quantity></quantity>
	[spectra] [smallint] NOT NULL, 

	--/ <summary>2dFGRS name</summary>
	--/ <quantity></quantity>
	[name] [varchar](10) NOT NULL, 

	--/ <summary>UKST plate (=IFIELD)</summary>
	--/ <quantity></quantity>
	[UKST] [varchar](3) NOT NULL, 

	--/ <summary>Right Ascension (J2000)</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity></quantity>
	[cx] [float] NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity></quantity>
	[cy] [float] NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity></quantity>
	[cz] [float] NULL, 

	--/ <summary>HTM ID</summary>
	--/ <quantity></quantity>
	[htmid] [bigint] NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity></quantity>
	[zoneid] [bigint] NULL, 

	--/ <summary>Final bj magnitude without extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[bjg] [real] NOT NULL, 

	--/ <summary>Final bj magnitude with extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[bjsel] [real] NOT NULL, 

	--/ <summary>Original bj magnitude without extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[bjg_old] [real] NOT NULL, 

	--/ <summary>Original bj magnitude with extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[bjselold] [real] NOT NULL, 

	--/ <summary>Galactic extinction value</summary>
	--/ <quantity></quantity>
	[galext] [real] NOT NULL, 

	--/ <summary>SuperCosmos bj magnitude without extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[sb_bj] [real] NOT NULL, 

	--/ <summary>SuperCosmos R magnitude without extinction correction</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[sr_r] [real] NOT NULL, 

	--/ <summary>Best redshift (observed)</summary>
	--/ <quantity></quantity>
	[z] [real] NOT NULL, 

	--/ <summary>Best redshift (heliocentric)</summary>
	--/ <quantity></quantity>
	[z_helio] [real] NOT NULL, 

	--/ <summary>Observation run of best spectrum</summary>
	--/ <quantity></quantity>
	[obsrun] [varchar](5) NOT NULL, 

	--/ <summary>Redshift quality parameter for best spectrum; reliable redshifts have >=3</summary>
	--/ <quantity></quantity>
	[quality] [smallint] NOT NULL, 

	--/ <summary>Redshift type (abs=1, emi=2, man=3)</summary>
	--/ <quantity></quantity>
	[abemma] [smallint] NOT NULL, 

	--/ <summary>Cross-correlation redshift from best spectrum</summary>
	--/ <quantity></quantity>
	[z_abs] [real] NOT NULL, 

	--/ <summary>Cross-correlation template from best spectrum</summary>
	--/ <quantity></quantity>
	[kbestr] [smallint] NOT NULL, 

	--/ <summary>Cross-correlation R value from best spectrum</summary>
	--/ <quantity></quantity>
	[r_crcor] [real] NOT NULL, 

	--/ <summary>Emission redshift from best spectrum</summary>
	--/ <quantity></quantity>
	[z_emi] [real] NOT NULL, 

	--/ <summary>Number of emission lines for Z_EMI from best spectrum</summary>
	--/ <quantity></quantity>
	[nmbest] [smallint] NOT NULL, 

	--/ <summary>Median S/N per pixel from best spectrum</summary>
	--/ <quantity></quantity>
	[snr] [real] NOT NULL, 

	--/ <summary>Eta spectral type parameter from best spectrum (-99.9 if none)</summary>
	--/ <quantity></quantity>
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

