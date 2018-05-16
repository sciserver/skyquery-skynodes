--/ <dataset>
--/ <summary>This is a test dataset</summary>
--/ <remarks>These are the remarks</remarks>
--/ <url>http://test.org/</url>
--/ <icon>test.png</icon>
--/ <docpage>test.html</docpage>
--/ </dataset>

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[CatalogA]') IS NOT NULL)
DROP TABLE [dbo].[CatalogA]

GO

--/ <summary>This is a table of the test catalog</summary>
--/ <remarks>Some remarks about this catalog</remarks>
--/ <example>
--/ Here's an example query
--/ with two lines of comment.
--/ <query>SELECT * FROM CatalogA</query>
--/ </example>
CREATE TABLE [dbo].[CatalogA](
	--/ <summary></summary>
	--/ <quantity>meta.id</quantity>
	[objId] [bigint] NOT NULL,

	--/ <summary>Right ascension (J2000)</summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>stat.error; pos.eq</quantity>
	--/ <unit>deg</unit>
	[astroErr] [float] NOT NULL,

	--/ <summary>Equatorial cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Equatiorial cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,
	
	--/ <summary>Equatorial cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>Equatorial HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmId] [bigint] NOT NULL,

	--/ <summary>Equatorial Zone ID (J2000)</summary>
	--/ <quantity>pos.eq.zone; pos.frome=j2000</quantity>
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

IF (OBJECT_ID('[dbo].[GalexPhotoObjAll]') IS NOT NULL)
DROP TABLE [dbo].[GalexPhotoObjAll]

GO


CREATE TABLE [dbo].[GalexPhotoObjAll]
(
	[objId] [bigint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[nuv_mag] [real] NOT NULL,
	[fuv_mag] [real] NOT NULL,
	CONSTRAINT [PK_GalexPhotoObjAll] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)

GO



---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[SDSSDR7PhotoObjAll]') IS NOT NULL)
DROP TABLE [dbo].[SDSSDR7PhotoObjAll]

GO


CREATE TABLE [dbo].[SDSSDR7PhotoObjAll]
(
	[objId] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[type] [smallint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[raErr] [float] NOT NULL,
	[decErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[u] [real] NOT NULL,
	[g] [real] NOT NULL,
	[r] [real] NOT NULL,
	[i] [real] NOT NULL,
	[z] [real] NOT NULL,
	CONSTRAINT [PK_SDSSDR7PhotoObjAll] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[SDSSDR7PhotoObjAll]') IS NOT NULL)
DROP TABLE [dbo].[SDSSDR7PhotoObjAll]

GO


CREATE TABLE [dbo].[SDSSDR7PhotoObjAll]
(
	[objId] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[type] [smallint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[raErr] [float] NOT NULL,
	[decErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[u] [real] NOT NULL,
	[g] [real] NOT NULL,
	[r] [real] NOT NULL,
	[i] [real] NOT NULL,
	[z] [real] NOT NULL,
	CONSTRAINT [PK_SDSSDR7PhotoObjAll] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[SDSSDR7PhotoObjAll_NoHTM]') IS NOT NULL)
DROP TABLE [dbo].[SDSSDR7PhotoObjAll_NoHTM]

GO


CREATE TABLE [dbo].[SDSSDR7PhotoObjAll_NoHTM]
(
	[objId] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[type] [smallint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[raErr] [float] NOT NULL,
	[decErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[u] [real] NOT NULL,
	[g] [real] NOT NULL,
	[r] [real] NOT NULL,
	[i] [real] NOT NULL,
	[z] [real] NOT NULL,
	CONSTRAINT [PK_SDSSDR7PhotoObjAll_NoHTM] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[SDSSDR7PhotoObjAll_NoZone]') IS NOT NULL)
DROP TABLE [dbo].[SDSSDR7PhotoObjAll_NoZone]

GO


CREATE TABLE [dbo].[SDSSDR7PhotoObjAll_NoZone]
(
	[objId] [bigint] NOT NULL,
	[skyVersion] [tinyint] NOT NULL,
	[run] [smallint] NOT NULL,
	[rerun] [smallint] NOT NULL,
	[camcol] [tinyint] NOT NULL,
	[field] [smallint] NOT NULL,
	[obj] [smallint] NOT NULL,
	[mode] [tinyint] NOT NULL,
	[type] [smallint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[raErr] [float] NOT NULL,
	[decErr] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[u] [real] NOT NULL,
	[g] [real] NOT NULL,
	[r] [real] NOT NULL,
	[i] [real] NOT NULL,
	[z] [real] NOT NULL,
	CONSTRAINT [PK_SDSSDR7PhotoObjAll_NoZone] PRIMARY KEY CLUSTERED 
	(
		[objId] ASC
	)
)
GO

---------------------------------------------------------------

IF (OBJECT_ID('[dbo].[WisePhotoObj]') IS NOT NULL)
DROP TABLE [dbo].[WisePhotoObj]

GO


CREATE TABLE [dbo].[WisePhotoObj]
(
	[cntr] [bigint] NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[sigra] [float] NOT NULL,
	[sigdec] [float] NOT NULL,
	[sigradec] [float] NOT NULL,
	[htmId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[w1mpro] [real] NOT NULL,
	[w2mpro] [real] NOT NULL,
	[w3mpro] [real] NOT NULL,
	[w4mpro] [real] NOT NULL,
	CONSTRAINT [PK_WisePhotoObj] PRIMARY KEY CLUSTERED 
	(
		[cntr] ASC
	)
)
GO

