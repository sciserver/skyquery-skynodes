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

	--/ <summary> RA offset (West is positive), B1950. </summary>
	--/ <unit> arcsec </unit>
	[oRA] real NOT NULL,

	--/ <summary> DE offset (North is positive), B1950 </summary>
	--/ <unit> arcsec </unit>
	[oDE] real NOT NULL,

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

