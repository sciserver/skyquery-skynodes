--/ <dataset>
--/ <summary> The Canadian Network for Observational Cosmology (CNOC2) Field Galaxy Redshift Survey </summary>
--/ <remarks>
--/ The Canadian Network for Observational Cosmology (CNOC2) Field Galaxy Redshift Survey is a spectroscopic/photometric survey of faint galaxies over 1.5 deg2 of sky with a nominal spectroscopic limit of RC~21.5 mag. The survey area contains four widely separated patches on the sky with a total sample of over 6000 redshifts, representing a sampling rate of about 45%. In addition, five-color photometry (in IC, RC, V, B, and U) for a complete sample of approximately 40,000 galaxies to RC~23.0 mag is also available. 
--/ </remarks>
--/ <url>http://www.astro.utoronto.ca/~cnoc/cnoc2.html</url>
--/ <icon>cnoc2.png</icon>
--/ <docpage>cnoc2.html</docpage>
--/ </dataset>
 GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.SpecObj 
(
	--/ <summary> ID number in PPP (Picture-Processing Package) catalog. </summary>	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> CNOC2 spectrum number. Spectrum name. The last 4 characters denote mask number, 
	--/ (A,B,C) and spectrum number (e.g. A034), the first 2 numbers denote field numbers (same as 
	--/ (1)). Note that for objects with multiple observations only one of the spectrum IDs is listed 
	--/ (usually the one with the highest redshift reliability (Rval) value). </summary>	--/ <quantity>meta.id</quantity>
	[CNOC2sp] char(6) NOT NULL,

	--/ <summary> Right Ascension </summary>	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.eq.zone; pos.frame=J2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Redshift  </summary>	--/ <quantity>src.redshift</quantity>
	[z]  float NOT NULL,

	--/ <summary> Redshift error </summary>	--/ <quantity>stat.error; src.redshift</quantity>
	--/ <unit> 1e-5 </unit>
	[e_z]  int NOT NULL,

	--/ <summary> Redshift reliability value </summary>	--/ <quantity>stat.value; src.redshift</quantity>
	[Rval]  real NOT NULL,

	--/ <summary> Spectral class. Spectroscopic classification: 
	--/ 0 = object not targeted for spectroscopy 
	--/ 2 = elliptical spectrum 
	--/ 4 = intermediate-type spectrum 
	--/ 5 = emission-line spectrum 
	--/ 6 = active galactic nuclei 
	--/ 77 = star 
	--/ 88 = unknown 
	--/ 99 = slit but no spectrum (object too faint) </summary>	--/ <quantity>meta.code; src.class</quantity>
	[Sc]  smallint NOT NULL,

	--/ <summary> Redshift weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight; src.redshift</quantity>
	[w_z]  real NOT NULL,

	--/ <summary> Cousins I magnitude </summary>	--/ <quantity>phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[Imag]  real NOT NULL,

	--/ <summary> Cousins I magnitude error </summary>	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[e_Imag]  real NOT NULL,

	--/ <summary> Cousins I color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[Ice]  real NOT NULL,

	--/ <summary> Cousins I magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter.  </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.I</quantity>
	[w_Imag]  real NOT NULL,

	--/ <summary> Cousins I color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.I</quantity>
	[IWc]  real NOT NULL,

	--/ <summary> Cousins I positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.I</quantity>
	[IWxy]  real NOT NULL,

	--/ <summary> Cousins R magnitude </summary>	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[Rmag]  real NOT NULL,

	--/ <summary> Cousins R magnitude error </summary>	--/ <quantity>stat.error;phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[e_Rmag]  real NOT NULL,

	--/ <summary> Rmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>	--/ <quantity>stat.error;phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[Rce]  real NOT NULL,

	--/ <summary> Cousins R magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.R</quantity>
	[w_Rmag]  real NOT NULL,

	--/ <summary> Cousins R color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weigt;phot.mag;em.opt.R</quantity>
	[RWc]  real NOT NULL,

	--/ <summary> Cousins R positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.R</quantity>
	[RWxy]  real NOT NULL,

	--/ <summary> Johnson V magnitude </summary>	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[Vmag]  real NOT NULL,

	--/ <summary> Johnson V magnitude error </summary>	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[e_Vmag]  real NOT NULL,

	--/ <summary> Vmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[Vce]  real NOT NULL,

	--/ <summary> Vmag magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.V</quantity>
	[w_Vmag]  real NOT NULL,

	--/ <summary> Johnson V color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.V</quantity>
	[VWc]  real NOT NULL,

	--/ <summary> Johnson V positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.V</quantity>
	[VWxy]  real NOT NULL,

	--/ <summary> Johnson B magnitude </summary>	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmag]  real NOT NULL,

	--/ <summary> Johnson B magnitude error </summary>	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[e_Bmag]  real NOT NULL,

	--/ <summary> Bmag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature.</summary>	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bce]  real NOT NULL,

	--/ <summary> Johnson B magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.B</quantity>
	[w_Bmag]  real NOT NULL,

	--/ <summary> Johnson B color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.B</quantity>
	[BWc]  real NOT NULL,

	--/ <summary> Johnson B positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.B</quantity>
	[BWxy]  real NOT NULL,

	--/ <summary> Johnson U magnitude </summary>	--/ <quantity>phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[Umag]  real NOT NULL,

	--/ <summary> Johnson U magnitude error </summary>	--/ <quantity>stat.error;phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[e_Umag]  real NOT NULL,

	--/ <summary> Umag color aperture magnitude error. Color aperture magnitude error. This is the magnitude 
	--/ error within the aperture used to determine the color of the object. An approximate uncertainty in the 
	--/ color between any two filters can be derived by adding the two color aperture errors in quadrature. </summary>	--/ <quantity>stat.error;phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[Uce]  real NOT NULL,

	--/ <summary> Johnson U magnitude weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.U</quantity>
	[w_Umag]  real NOT NULL,

	--/ <summary> Johnson U color weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.U</quantity>
	[UWc]  real NOT NULL,

	--/ <summary> Johnson U positional weight. An important feature of the catalog is the various weights computed to 
	--/ allow the sample to be used as a complete sample. A detailed description of the weights are given 
	--/ in the paper. The primary weight is the magnitude weight Wm (prefixed w_ in the table). The subsidiary 
	--/ weights modify the magnitude weight Wm as follows: 
	--/ W(tot) = Wm * Wxy * Wc * Wz,
	--/ where Wxy=geometric weight, Wc=color weight, and Wz=redshift weight. Note that each filter has its own 
	--/ Wm, Wxy and Wc. However, Wz, which is model dependent, is determined only for the R filter. </summary>	--/ <quantity>stat.weight;phot.mag;em.opt.U</quantity>
	[UWxy]  real NOT NULL,

	--/ <summary> [0,4] PPP morphological class </summary>	--/ <quantity>src.class.struct</quantity>
	[Pcl]  tinyint NOT NULL,

	--/ <summary> R-band k-correction </summary>	--/ <quantity>phot.mag;arith.diff</quantity>
	--/ <unit> mag </unit>
	[Rkcor]  real NOT NULL,

	--/ <summary> Original CCD x coordinate </summary>	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit> pix </unit>
	[xpos]  real NOT NULL,

	--/ <summary> Original CCD y coordinate </summary>	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit> pix </unit>
	[ypos]  real NOT NULL,

 CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

