USE [SkyNode_Test]
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogA]') IS NOT NULL)
DROP TABLE [dbo].[CatalogA]

GO

CREATE TABLE [dbo].[CatalogA](
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
	zoneId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, htmID
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
	zoneId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, htmID
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
	zoneId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, htmID
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
	zoneId
)
INCLUDE
(
	ra, dec, cx, cy, cz, astroErr, htmID
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

