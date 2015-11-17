USE [zCOSMOS]
GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObjRAW;
GO


-- CREATE PhotoObjRAW TABLE



CREATE TABLE dbo.PhotoObjRAW
(
	[objID] bigint NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[z]  real NOT NULL,
	[CC] real NOT NULL,
	[Imag] real NOT NULL,

 CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   PhotoObjRAW
      FROM 'C:\Data\ebanyai\project\Skyquery-data\zCOSMOS\zCOSMOS.bin' 
     WITH 
    ( 
   DATAFILETYPE = 'native',
   TABLOCK 
    )
GO

-- CREATE PhotoObj TABLE

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
    DROP TABLE dbo.PhotoObj;
GO

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> zCOSMOS identification number.</summary>
	[objID] bigint NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[dec] float NOT NULL,

	--/ <summary>Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary>HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Redshift. </summary>
	[z]  real NOT NULL,

	--/ <summary> Confidence Class indicating reliability. 
	--/ Confidence Class (CC) defined as 3 digits (ab.c).
	--/ Unit digit (b in ab.c) represents the confidence class:
	--/      --------------------------------------------------------------------
	--/      CC Description            Spectroscopic     Photo-z consistency
	--/                                 verification      within dz=0.08(1+z)
	--/      --------------------------------------------------------------------
	--/      4  Very secure redshift,
	--/          beautiful redshift    &gt;99.5%             97%
	--/      3  Secure redshift        &gt;99.5%             97%
	--/      9  One line redshift      95%                84%-95%  (after
	--/          (best guess)          (after correction) correction with photo-z)
	--/      2  Probable redshift      92%                93%
	--/      1  Insecure redshift      70%                72%
	--/      0  Unidentified spectrum
	--/      --------------------------------------------------------------------

	--/  the decimal (.c) represents the Spectroscopic/photometric consistency:
	--/      --------------------------------------------------------------------
	--/      .5   Spectroscopic redshift consistent within 0.08(1+z) of the
	--/           photometric redshift, both for galaxies, stars and AGN.
	--/      .4   No photometric redshift available, includes all spectroscopic
	--/           AGN and stars
	--/      .3   Special case for Class 18 and 9: Consistent with photo-z only
	--/           after the redshift changed to the alternate redshift,
	--/           a switch which is then applied
	--/      .1   Spectroscopic and photometric redshifts are not consistent at
	--/           the level of 0.08(1+z)
	--/      --------------------------------------------------------------------
	--/ 
	--/  the tens (a in ab.c) is
	--/       ---------------------------
	--/       0       = Galaxies and stars
	--/       1 (+10) = Broad line AGN
	--/       2 (+20) = Secondary targets
	--/       ---------------------------</summary>
	[CC] real NOT NULL,

	--/ <summary> Selection magnitude F814W, in AB system </summary>
	--/ <unit>mag</unit>
	[Imag] real NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.PhotoObj WITH (TABLOCKX)
(objID,ra, dec, cx,cy,cz,htmid, z, CC, Imag)
SELECT objID, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, Spherical.htm.FromXyz(c.x,c.y,c.z) AS htmid, PhotoObjRAW.z, CC, Imag
FROM dbo.PhotoObjRAW
CROSS APPLY Spherical.point.ConvertEqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE
DROP TABLE PhotoObjRAW

GO

-- HTM index

CREATE NONCLUSTERED INDEX [IX_PhotoObj_htmid] ON [dbo].[PhotoObj]
(
	[htmid] ASC
)
GO
