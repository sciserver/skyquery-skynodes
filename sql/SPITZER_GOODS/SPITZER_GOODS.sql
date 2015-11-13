USE [SpitzerGOODS]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
(	[objID] bigint NOT NULL,
	[srcid] int NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[ra_irac] float NOT NULL,
	[dec_irac] float NOT NULL,
	[s_24] real NOT NULL,
	[s_24_err] real NOT NULL,
	[irac_tag] tinyint NOT NULL,
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM 'C:\Data\ebanyai\project\Skyquery-data\Spitzer_GOODS\\spitzer_goods.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObj;

GO
-- CREATE Spitzer TABLE
CREATE TABLE dbo.PhotoObj
(

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Sequential id </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Source Number </summary>
	[srcid] int NOT NULL,

	--/ <summary> RA J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Dec J2000 of MIPS 24 micron source </summary>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> RA J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg </unit>
	[ra_irac] float NOT NULL,

	--/ <summary> Dec J2000 of IRAC prior source (-1 if no prior) </summary>
	--/ <unit> deg </unit>
	[dec_irac] float NOT NULL,

	--/ <summary> Flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24] real NOT NULL,

	--/ <summary> Undertainty in flux density of MIPS 24 micron source </summary>
	--/ <unit> microJy </unit>
	[s_24_err] real NOT NULL,

	--/ <summary> Set to 1 if there is IRAC coverage </summary>
	[irac_tag] tinyint NOT NULL,

	--/ <summary> Set to 1 if source is extended at 24 microns </summary>
	[extended_tag] tinyint NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, objID, srcid, ra, dec, ra_irac, dec_irac, s_24, s_24_err, irac_tag, extended_tag)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, Spherical.htm.FromXyz(c.x,c.y,c.z) AS htmid, objID, srcid, ra, dec, ra_irac, dec_irac, s_24, s_24_err, irac_tag, extended_tag
FROM dbo.PhotoObjRAW
CROSS APPLY Spherical.point.ConvertEqToXyz(ra, dec) AS c

GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_htmid] ON [dbo].[PhotoObj]
(
	[htmid] ASC
)

GO
