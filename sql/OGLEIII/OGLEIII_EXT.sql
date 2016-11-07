USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.VariableStarsRAW', 'U') IS NOT NULL
	DROP TABLE dbo.VariableStarsRAW;

GO

-- CREATE VariableStarsRAW TABLE
CREATE TABLE dbo.VariableStarsRAW
(	[ID] char(20) NOT NULL,
	[Field] char(8) NOT NULL,
	[StarID] bigint NOT NULL,
	[Type] char(5) NOT NULL,
	[Subtype] char(9) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[ID_OGLE_II] char(16) NOT NULL,
	[ID_MACHO] char(14) NOT NULL,
	[ID_ASAS] char(13) NOT NULL,
	[ID_GCVS] char(6) NOT NULL,
	[ID_OTHER] char(21) NOT NULL,
	[I] real NOT NULL,
	[V] real NOT NULL,
	[P_1] real NOT NULL,
	[dP_1] float NOT NULL,
	[T0_1] real NOT NULL,
	[A_1] real NOT NULL,
	[R21_1] real NOT NULL,
	[phi21_1] real NOT NULL,
	[R31_1] real NOT NULL,
	[phi31_1] real NOT NULL,
	[P_2] real NOT NULL,
	[dP_2] float NOT NULL,
	[T0_2] real NOT NULL,
	[A_2] real NOT NULL,
	[R21_2] real NOT NULL,
	[phi21_2] real NOT NULL,
	[R31_2] real NOT NULL,
	[phi31_2] real NOT NULL,
	[P_3] real NOT NULL,
	[dP_3] float NOT NULL,
	[T0_3] real NOT NULL,
	[A_3] real NOT NULL,
	[R21_3] real NOT NULL,
	[phi21_3] real NOT NULL,
	[R31_3] real NOT NULL,
	[phi31_3] real NOT NULL,
	[Remarks] char(85) NOT NULL,

	CONSTRAINT [PK_VariableStarsRAW] PRIMARY KEY CLUSTERED
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	VariableStarsRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\OGLEIII\ogleIII_VariableStars.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.VariableStars', 'U') IS NOT NULL
	DROP TABLE dbo.VariableStars;

GO
-- CREATE VariableStars TABLE
CREATE TABLE dbo.VariableStars
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> OGLE-III ID </summary>
	[ID] char(20) NOT NULL,

	--/ <summary> Field Name </summary>
	[Field] char(8) NOT NULL,

	--/ <summary>  </summary>
	[StarID] bigint NOT NULL,

	--/ <summary> Type </summary>
	[Type] char(5) NOT NULL,

	--/ <summary>  </summary>
	[Subtype] char(9) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> OGLE-II ID </summary>
	[ID_OGLE_II] char(16) NOT NULL,

	--/ <summary> MACHO ID </summary>
	--/ <unit> ASAS ID </unit>
	[ID_MACHO] char(14) NOT NULL,

	--/ <summary> GCVS ID </summary>
	--/ <unit> OTHER ID </unit>
	[ID_ASAS] char(13) NOT NULL,

	--/ <summary> GCVS ID </summary>
	[ID_GCVS] char(6) NOT NULL,

	--/ <summary> OTHER ID </summary>
	[ID_OTHER] char(21) NOT NULL,

	--/ <summary> Mean I-band magnitude </summary>
	--/ <unit> mag </unit>
	[I] real NOT NULL,

	--/ <summary> Mean V-band magnitude </summary>
	--/ <unit> mag </unit>
	[V] real NOT NULL,

	--/ <summary> Period </summary>
	--/ <unit> I-band amplitude </unit>
	[P_1] real NOT NULL,

	--/ <summary>  </summary>
	[dP_1] float NOT NULL,

	--/ <summary>  </summary>
	[T0_1] real NOT NULL,

	--/ <summary>  </summary>
	[A_1] real NOT NULL,

	--/ <summary>  </summary>
	[R21_1] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_1] real NOT NULL,

	--/ <summary>  </summary>
	[R31_1] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_1] real NOT NULL,

	--/ <summary>  </summary>
	[P_2] real NOT NULL,

	--/ <summary>  </summary>
	[dP_2] float NOT NULL,

	--/ <summary>  </summary>
	[T0_2] real NOT NULL,

	--/ <summary>  </summary>
	[A_2] real NOT NULL,

	--/ <summary>  </summary>
	[R21_2] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_2] real NOT NULL,

	--/ <summary>  </summary>
	[R31_2] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_2] real NOT NULL,

	--/ <summary>  </summary>
	[P_3] real NOT NULL,

	--/ <summary>  </summary>
	[dP_3] float NOT NULL,

	--/ <summary>  </summary>
	[T0_3] real NOT NULL,

	--/ <summary>  </summary>
	[A_3] real NOT NULL,

	--/ <summary>  </summary>
	[R21_3] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_3] real NOT NULL,

	--/ <summary>  </summary>
	[R31_3] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_3] real NOT NULL,

	--/ <summary>  </summary>
	[Remarks] char(85) NOT NULL,

	CONSTRAINT [PK_VariableStars] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.VariableStars WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, ID, Field, StarID, Type, Subtype, ra, dec, ID_OGLE_II, ID_MACHO, ID_ASAS, ID_GCVS, ID_OTHER, I, V, P_1, dP_1, T0_1, A_1, R21_1, phi21_1, R31_1, phi31_1, P_2, dP_2, T0_2, A_2, R21_2, phi21_2, R31_2, phi31_2, P_3, dP_3, T0_3, A_3, R21_3, phi21_3, R31_3, phi31_3, Remarks)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid,
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
ID, Field, StarID, Type, Subtype, ra, dec, ID_OGLE_II, ID_MACHO, ID_ASAS, ID_GCVS, ID_OTHER, VariableStarsRAW.I, V, P_1, dP_1, T0_1, A_1, R21_1, phi21_1, R31_1, phi31_1, P_2, dP_2, T0_2, A_2, R21_2, phi21_2, R31_2, phi31_2, P_3, dP_3, T0_3, A_3, R21_3, phi21_3, R31_3, phi31_3, Remarks
FROM dbo.VariableStarsRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE VariableStarsRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_VariableStars_Zone] ON [dbo].[VariableStars] 
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

CREATE NONCLUSTERED INDEX [IX_VariableStars_ZoneID] ON [dbo].[VariableStars] 
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
CREATE NONCLUSTERED INDEX [IX_VariableStars_HtmID] ON [dbo].[VariableStars] 
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
