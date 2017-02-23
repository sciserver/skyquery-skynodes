USE [Graywulf_Temp]
GO

IF OBJECT_ID ('dbo.SpecObjRAW', 'U') IS NOT NULL
    DROP TABLE dbo.SpecObjRAW;
GO

-- CREATE SpecObjRAW TABLE

CREATE TABLE dbo.SpecObjRAW
(
	[objID] bigint NOT NULL,
	[CNOC2sp] char(6) NOT NULL,
	[ra] float NOT NULL,
	[dec] float NOT NULL,
	[z]  float NOT NULL,
	[e_z]  int NOT NULL,
	[Rval]  real NOT NULL,
	[Sc]  smallint NOT NULL,
	[w_z]  real NOT NULL,
	[Imag]  real NOT NULL,
	[e_Imag]  real NOT NULL,
	[Ice]  real NOT NULL,
	[w_Imag]  real NOT NULL,
	[IWc]  real NOT NULL,
	[IWxy]  real NOT NULL,
	[Rmag]  real NOT NULL,
	[e_Rmag]  real NOT NULL,
	[Rce]  real NOT NULL,
	[w_Rmag]  real NOT NULL,
	[RWc]  real NOT NULL,
	[RWxy]  real NOT NULL,
	[Vmag]  real NOT NULL,
	[e_Vmag]  real NOT NULL,
	[Vce]  real NOT NULL,
	[w_Vmag]  real NOT NULL,
	[VWc]  real NOT NULL,
	[VWxy]  real NOT NULL,
	[Bmag]  real NOT NULL,
	[e_Bmag]  real NOT NULL,
	[Bce]  real NOT NULL,
	[w_Bmag]  real NOT NULL,
	[BWc]  real NOT NULL,
	[BWxy]  real NOT NULL,
	[Umag]  real NOT NULL,
	[e_Umag]  real NOT NULL,
	[Uce]  real NOT NULL,
	[w_Umag]  real NOT NULL,
	[UWc]  real NOT NULL,
	[UWxy]  real NOT NULL,
	[Pcl]  tinyint NOT NULL,
	[Rkcor]  real NOT NULL,
	[xpos]  real NOT NULL,
	[ypos]  real NOT NULL,

	
 CONSTRAINT [PK_SpecObjRAW] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA

BULK INSERT 
   SpecObjRAW
      FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\CNOC2\cnoc2.bin' 
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
	--/ <summary> ID number in PPP (Picture-Processing Package) catalog. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> CNOC2 spectrum number. Spectrum name. The last 4 characters denote mask number, 
	--/ (A,B,C) and spectrum number (e.g. A034), the first 2 numbers denote field numbers (same as 
	--/ (1)). Note that for objects with multiple observations only one of the spectrum IDs is listed 
	--/ (usually the one with the highest redshift reliability (Rval) value). </summary>
	[CNOC2sp] char(6) NOT NULL,

	--/ <summary> 	Right Ascension 1950. </summary>
	--/ <unit>deg J1950</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination 1950. </summary>
	--/ <unit>deg J1950</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> Redshift  </summary>
	[z]  float NOT NULL,

	--/ <summary> Redshift error </summary>
	--/ <unit> 10^-5 </unit>
	[e_z]  int NOT NULL,

	--/ <summary> Redshift reliability value </summary>
	[Rval]  real NOT NULL,

	--/ <summary> Spectral class. Spectroscopic classification: 
	--/ 0 = object not targeted for spectroscopy 
	--/ 2 = elliptical spectrum 
	--/ 4 = intermediate-type spectrum 
	--/ 5 = emission-line spectrum 
	--/ 6 = active galactic nuclei 
	--/ 77 = star 
	--/ 88 = unknown 
	--/ 99 = slit but no spectrum (object too faint) </summary>
	[Sc]  smallint NOT NULL,

	--/ <summary> Redshift weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[w_z]  real NOT NULL,

	--/ <summary> Cousins I magnitude </summary>
	--/ <unit> mag </unit>
	[Imag]  real NOT NULL,

	--/ <summary> Cousins I magnitude error </summary>
	--/ <unit> mag </unit>
	[e_Imag]  real NOT NULL,

	--/ <summary> Cousins I color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>
	--/ <unit> mag </unit>
	[Ice]  real NOT NULL,

	--/ <summary> Cousins I magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter.  </summary>
	[w_Imag]  real NOT NULL,

	--/ <summary> Cousins I color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[IWc]  real NOT NULL,

	--/ <summary> Cousins I positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[IWxy]  real NOT NULL,

	--/ <summary> Cousins R magnitude </summary>
	--/ <unit> mag </unit>
	[Rmag]  real NOT NULL,

	--/ <summary> Cousins R magnitude error </summary>
	--/ <unit> mag </unit>
	[e_Rmag]  real NOT NULL,

	--/ <summary> Rmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>
	--/ <unit> mag </unit>
	[Rce]  real NOT NULL,

	--/ <summary> Cousins R magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[w_Rmag]  real NOT NULL,

	--/ <summary> Cousins R color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[RWc]  real NOT NULL,

	--/ <summary> Cousins R positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[RWxy]  real NOT NULL,

	--/ <summary> Johnson V magnitude </summary>
	--/ <unit> mag </unit>
	[Vmag]  real NOT NULL,

	--/ <summary> Johnson V magnitude error </summary>
	--/ <unit> mag </unit>
	[e_Vmag]  real NOT NULL,

	--/ <summary> Vmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>
	--/ <unit> mag </unit>
	[Vce]  real NOT NULL,

	--/ <summary> Vmag magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[w_Vmag]  real NOT NULL,

	--/ <summary> Johnson V color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[VWc]  real NOT NULL,

	--/ <summary> Johnson V positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[VWxy]  real NOT NULL,

	--/ <summary> Johnson B magnitude </summary>
	--/ <unit> mag </unit>
	[Bmag]  real NOT NULL,

	--/ <summary> Johnson B magnitude error </summary>
	--/ <unit> mag </unit>
	[e_Bmag]  real NOT NULL,

	--/ <summary> Bmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature.</summary>
	--/ <unit> mag </unit>
	[Bce]  real NOT NULL,

	--/ <summary> Johnson B magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[w_Bmag]  real NOT NULL,

	--/ <summary> Johnson B color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[BWc]  real NOT NULL,

	--/ <summary> Johnson B positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[BWxy]  real NOT NULL,

	--/ <summary> Johnson U magnitude </summary>
	--/ <unit> mag </unit>
	[Umag]  real NOT NULL,

	--/ <summary> Johnson U magnitude error </summary>
	--/ <unit> mag </unit>
	[e_Umag]  real NOT NULL,

	--/ <summary> Umag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>
	--/ <unit> mag </unit>
	[Uce]  real NOT NULL,

	--/ <summary> Johnson U magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[w_Umag]  real NOT NULL,

	--/ <summary> Johnson U color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[UWc]  real NOT NULL,

	--/ <summary> Johnson U positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>
	[UWxy]  real NOT NULL,

	--/ <summary> [0,4] PPP morphological class </summary>
	[Pcl]  tinyint NOT NULL,

	--/ <summary> R-band k-correction </summary>
	--/ <unit> mag </unit>
	[Rkcor]  real NOT NULL,

	--/ <summary> Original CCD x coordinate </summary>
	--/ <unit> pix </unit>
	[xpos]  real NOT NULL,

	--/ <summary> Original CCD y coordinate </summary>
	--/ <unit> pix </unit>
	[ypos]  real NOT NULL,

 CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ

INSERT dbo.SpecObj WITH (TABLOCKX)
(objID, CNOC2sp, ra, dec, cx,cy,cz,htmid, zoneId, SpecObj.z, e_z, Rval, Sc, w_z, Imag, e_Imag, Ice, w_Imag, IWc, IWxy, 
Rmag, e_Rmag, Rce, w_Rmag, RWc, RWxy, Vmag, e_Vmag, Vce, w_Vmag, VWc, VWxy, Bmag, e_Bmag, Bce, w_Bmag, 
BWc, BWxy, Umag, e_Umag, Uce, w_Umag, UWc, UWxy, Pcl, Rkcor, xpos, ypos )
SELECT objID, CNOC2sp, ra, dec, c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, SpecObjRAW.z, e_z, Rval, Sc, w_z, 
Imag, e_Imag, Ice, w_Imag, IWc, IWxy, Rmag, e_Rmag, Rce, w_Rmag, RWc, RWxy, Vmag, e_Vmag, Vce, 
w_Vmag, VWc, VWxy, Bmag, e_Bmag, Bce, w_Bmag, BWc, BWxy, Umag, e_Umag, Uce, w_Umag, UWc, UWxy, Pcl, Rkcor, xpos, ypos

FROM dbo.SpecObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c
GO

-- DROP RAW TABLE
DROP TABLE SpecObjRAW;

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