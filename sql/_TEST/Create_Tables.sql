USE [SkyNode_Test]
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogA]') IS NOT NULL)
DROP TABLE [dbo].[CatalogA]

GO

--/ <summary>This is a test catalog</summary>
--/ <remarks>Some remarks about this catalog</remarks>
--/ <example>
--/ Here's an example query
--/ <query>
--/ SELECT * FROM CatalogA
--/ </query>
--/ </example>
CREATE TABLE [dbo].[CatalogA](
	--/ <summary></summary>
	--/ <quantity>meta.id</quantity>
	[objId] [bigint] NOT NULL,

	--/ <summary>Right ascension (J2000)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq, stat.error</quantity>
	--/ <unit>deg</unit>
	[astroErr] [float] NOT NULL,

	--/ <summary>Equatorial cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Equatiorial cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,
	
	--/ <summary>Equatorial cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>Equatorial HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.htm</quantity>
	[htmId] [bigint] NOT NULL,

	--/ <summary>Equatorial Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneId] [bigint] NOT NULL,

	--/ <summary>Magnitude 1</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[mag_1] [real] NOT NULL,

	--/ <summary>Magnitude 2</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[mag_2] [real] NOT NULL,

	--/ <summary>Magnitude 3</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[mag_3] [real] NOT NULL,

	CONSTRAINT [PK_CatalogA] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)

CREATE INDEX IX_CatalogA_HtmID ON CatalogA
(
	htmId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, zoneID
)

CREATE INDEX IX_CatalogA_ZoneID ON CatalogA
(
	zoneId, ra
)
INCLUDE
(
	dec, cx, cy, cz, astroErr, htmID
)

GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogB]') IS NOT NULL)
DROP TABLE [dbo].[CatalogB]

GO

CREATE TABLE [dbo].[CatalogB](
	[objId] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[astroErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[mag_1] [real] NOT NULL,
	[mag_2] [real] NOT NULL,
	[mag_3] [real] NOT NULL,

	CONSTRAINT [PK_CatalogB] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)

CREATE INDEX IX_CatalogB_HtmID ON CatalogB
(
	htmId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, zoneID
)

CREATE INDEX IX_CatalogB_ZoneID ON CatalogB
(
	zoneId, ra
)
INCLUDE
(
	dec, cx, cy, cz, astroErr, htmID
)

GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogC]') IS NOT NULL)
DROP TABLE [dbo].[CatalogC]

GO

CREATE TABLE [dbo].[CatalogC](
	[objId] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[astroErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[mag_1] [real] NOT NULL,
	[mag_2] [real] NOT NULL,
	[mag_3] [real] NOT NULL,

	CONSTRAINT [PK_CatalogC] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)

CREATE INDEX IX_CatalogC_HtmID ON CatalogC
(
	htmId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, zoneID
)

CREATE INDEX IX_CatalogC_ZoneID ON CatalogC
(
	zoneId, ra
)
INCLUDE
(
	dec, cx, cy, cz, astroErr, htmID
)

GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogD]') IS NOT NULL)
DROP TABLE [dbo].[CatalogD]

GO

CREATE TABLE [dbo].[CatalogD](
	[objId] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[astroErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[mag_1] [real] NOT NULL,
	[mag_2] [real] NOT NULL,
	[mag_3] [real] NOT NULL,

	CONSTRAINT [PK_CatalogD] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)

CREATE INDEX IX_CatalogD_HtmID ON CatalogD
(
	htmId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, zoneID
)

CREATE INDEX IX_CatalogD_ZoneID ON CatalogD
(
	zoneId, ra
)
INCLUDE
(
	dec, cx, cy, cz, astroErr, htmID
)

GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogWithNoPrimaryKey]') IS NOT NULL)
DROP TABLE [dbo].[CatalogWithNoPrimaryKey]

GO


CREATE TABLE [dbo].[CatalogWithNoPrimaryKey]
(
	[objId] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[astroErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[mag_1] [real] NOT NULL,
	[mag_2] [real] NOT NULL,
	[mag_3] [real] NOT NULL,
)

---------------------------------------------------------------

