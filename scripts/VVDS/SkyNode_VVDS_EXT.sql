USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObjRAW;

GO

-- CREATE SpecObjRAW TABLE
CREATE TABLE dbo.SpecObjRAW
(	[ID] bigint NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[Jname] char(19) NOT NULL,
	[z] real NOT NULL,
	[q_z] smallint NOT NULL,
	[phf] tinyint NOT NULL,
	[UEmag] real NOT NULL,
	[e_UEmag] real NOT NULL,
	[ULmag] real NOT NULL,
	[e_ULmag] real NOT NULL,
	[Bmag] real NOT NULL,
	[e_Bmag] real NOT NULL,
	[Vmag] real NOT NULL,
	[e_Vmag] real NOT NULL,
	[Rmag] real NOT NULL,
	[e_Rmag] real NOT NULL,
	[Imag] real NOT NULL,
	[e_Imag] real NOT NULL,
	[Jmag] real NOT NULL,
	[e_Jmag] real NOT NULL,
	[Kmag] real NOT NULL,
	[e_Kmag] real NOT NULL,

	CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED
(
	[ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	SpecObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\VVDS\vvds.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.SpecObj', 'U') IS NOT NULL
	DROP TABLE dbo.SpecObj;

GO

-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
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

	--/ <summary> Observation identification </summary>
	[ID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Name based on J2000 position </summary>
	[Jname] char(19) NOT NULL,

	--/ <summary> Redshift (Z) </summary>
	[z] real NOT NULL,

	--/ <summary> [1,219] Redshift quality. The last (rightmost) digit characterises the quality of the redshift: 
	--/ 0=	No redshift could be assigned to the 1D spectrum.
	--/ 1=	50% confidence in the redshift.
	--/ 2=	75% confidence in the redshift.
	--/ 3=	95% confidence.
	--/ 4=	100% confidence.
	--/ 9=	Single isolated emission line spectraendTABULAR A value less than 10 indicates the quality of primary targets, 
	--/ objects which have been targeted in the VIMOS spectral slit. To this quality value, the following number may be added:
	--/ +10=	a primary QSO target
	--/ +20=	a secondary identified target, i.e. an object which is present by chance in the spectral slit in addition of the 
	--/ target; thus the secondary object is not ensured to be fully centered within the slit.
	--/ +210=	secondary QSO identified target </summary>
	[q_z] smallint NOT NULL,

	--/ <summary> [0,1] Photometry is 0=questionable, 1=OK </summary>
	[phf] tinyint NOT NULL,

	--/ <summary>  AB magnitude in ESO U/360 filter. the two U filters differ slightly: 
	--/ –the ESO U filter has a central wavelength of 340nm and a 
	--/ FWHM of 73nm, has his highest wavelength close to 400nm. 
	--/ –the Loiano U filter has a central wavelength of 362nm and a 
	--/ FWHM of 53nm; it also presents a red leak around 720nm </summary>
	--/ <unit> mag </unit>
	[UEmag] real NOT NULL,

	--/ <summary> Mean error on UEmag </summary>
	--/ <unit> mag </unit>
	[e_UEmag] real NOT NULL,

	--/ <summary> AB magnitude in Loiano U filter.  the two U filters differ slightly: 
	--/ –the ESO U filter has a central wavelength of 340nm and a 
	--/ FWHM of 73nm, has his highest wavelength close to 400nm. 
	--/ –the Loiano U filter has a central wavelength of 362nm and a 
	--/ FWHM of 53nm; it also presents a red leak around 720nm </summary>
	--/ <unit> mag </unit>
	[ULmag] real NOT NULL,

	--/ <summary> Mean error on ULmag </summary>
	--/ <unit> mag </unit>
	[e_ULmag] real NOT NULL,

	--/ <summary> AB magnitude in B filter </summary>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> Mean error on Bmag </summary>
	--/ <unit> mag </unit>
	[e_Bmag] real NOT NULL,

	--/ <summary> AB magnitude in V filter </summary>
	--/ <unit> mag </unit>
	[Vmag] real NOT NULL,

	--/ <summary> Mean error on Vmag </summary>
	--/ <unit> mag </unit>
	[e_Vmag] real NOT NULL,

	--/ <summary> AB magnitude in R filter  </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> Mean error on Rmag </summary>
	--/ <unit> mag </unit>
	[e_Rmag] real NOT NULL,

	--/ <summary> AB magnitude in I filter </summary>
	--/ <unit> mag </unit>
	[Imag] real NOT NULL,

	--/ <summary> Mean error on Imag  </summary>
	--/ <unit> mag </unit>
	[e_Imag] real NOT NULL,

	--/ <summary> AB magnitude in J filter </summary>
	--/ <unit> mag </unit>
	[Jmag] real NOT NULL,

	--/ <summary> Mean error on Jmag </summary>
	--/ <unit> mag </unit>
	[e_Jmag] real NOT NULL,

	--/ <summary> AB magnitude in K filter </summary>
	--/ <unit> mag </unit>
	[Kmag] real NOT NULL,

	--/ <summary> Mean error on Kmag </summary>
	--/ <unit> mag </unit>
	[e_Kmag] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.SpecObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, ID, RA, DEC, Jname, z, q_z, phf, UEmag, e_UEmag, ULmag, e_ULmag, Bmag, e_Bmag, Vmag, e_Vmag, Rmag, e_Rmag, Imag, e_Imag, Jmag, e_Jmag, Kmag, e_Kmag)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
ID, RA, DEC, Jname, SpecObjRAW.z, q_z, phf, UEmag, e_UEmag, ULmag, e_ULmag, Bmag, e_Bmag, Vmag, e_Vmag, Rmag, e_Rmag, Imag, e_Imag, Jmag, e_Jmag, Kmag, e_Kmag
FROM dbo.SpecObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE SpecObjRAW

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_SpecObj_Zone] ON [dbo].[SpecObj] 
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
