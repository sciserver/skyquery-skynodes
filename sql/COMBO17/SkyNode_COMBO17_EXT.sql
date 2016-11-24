USE [Graywulf_Temp]

GO

IF OBJECT_ID ('dbo.PhotoObjRAW', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObjRAW;

GO

-- CREATE PhotoObjRAW TABLE
CREATE TABLE dbo.PhotoObjRAW
(	[objID] bigint NOT NULL,
	[RA] float NOT NULL,
	[DEC] float NOT NULL,
	[x_pos] float NOT NULL,
	[y_pos] float NOT NULL,
	[Rmag] real NOT NULL,
	[e_Rmag] real NOT NULL,
	[Ap_Rmag] real NOT NULL,
	[ApD_Rmag] real NOT NULL,
	[mu_max] real NOT NULL,
	[MajAxis] real NOT NULL,
	[MinAxis] real NOT NULL,
	[PA] real NOT NULL,
	[phot_flag] int NOT NULL,
	[var_flag] tinyint NOT NULL,
	[stellarity] real NOT NULL,
	[MC_class] char(15) NOT NULL,
	[MC_z] real NOT NULL,
	[e_MC_z] real NOT NULL,
	[MC_z2] real NOT NULL,
	[e_MC_z2] real NOT NULL,
	[MC_z_ml] real NOT NULL,
	[dl] real NOT NULL,
	[chi2red] real NOT NULL,
	[UjMag] real NOT NULL,
	[e_UjMag] real NOT NULL,
	[BjMag] real NOT NULL,
	[e_BjMag] real NOT NULL,
	[VjMag] real NOT NULL,
	[e_VjMag] real NOT NULL,
	[usMag] real NOT NULL,
	[e_usMag] real NOT NULL,
	[gsMag] real NOT NULL,
	[e_gsMag] real NOT NULL,
	[rsMag] real NOT NULL,
	[e_rsMag] real NOT NULL,
	[UbMag] real NOT NULL,
	[e_UbMag] real NOT NULL,
	[BbMag] real NOT NULL,
	[e_BbMag] real NOT NULL,
	[VbMag] real NOT NULL,
	[e_VbMag] real NOT NULL,
	[S280Mag] real NOT NULL,
	[e_S280Mag] real NOT NULL,
	[S145Mag] real NOT NULL,
	[e_S145Mag] real NOT NULL,
	[W420F_E] float NOT NULL,
	[e_W420F_E] float NOT NULL,
	[W462F_E] float NOT NULL,
	[e_W462F_E] float NOT NULL,
	[W485F_D] float NOT NULL,
	[e_W485F_D] float NOT NULL,
	[W518F_E] float NOT NULL,
	[e_W518F_E] float NOT NULL,
	[W571F_D] float NOT NULL,
	[e_W571F_D] float NOT NULL,
	[W571F_E] float NOT NULL,
	[e_W571F_E] float NOT NULL,
	[W571F_S] float NOT NULL,
	[e_W571F_S] float NOT NULL,
	[W604F_E] float NOT NULL,
	[e_W604F_E] float NOT NULL,
	[W646F_D] float NOT NULL,
	[e_W646F_D] float NOT NULL,
	[W696F_E] float NOT NULL,
	[e_W696F_E] float NOT NULL,
	[W753F_E] float NOT NULL,
	[e_W753F_E] float NOT NULL,
	[W815F_E] float NOT NULL,
	[e_W815F_E] float NOT NULL,
	[W815F_G] float NOT NULL,
	[e_W815F_G] float NOT NULL,
	[W815F_S] float NOT NULL,
	[e_W815F_S] float NOT NULL,
	[W856F_D] float NOT NULL,
	[e_W856F_D] float NOT NULL,
	[W914F_D] float NOT NULL,
	[e_W914F_D] float NOT NULL,
	[W914F_E] float NOT NULL,
	[e_W914F_E] float NOT NULL,
	[UF_F] float NOT NULL,
	[e_UF_F] float NOT NULL,
	[UF_G] float NOT NULL,
	[e_UF_G] float NOT NULL,
	[UF_S] float NOT NULL,
	[e_UF_S] float NOT NULL,
	[BF_D] float NOT NULL,
	[e_BF_D] float NOT NULL,
	[BF_F] float NOT NULL,
	[e_BF_F] float NOT NULL,
	[BF_S] float NOT NULL,
	[e_BF_S] float NOT NULL,
	[VF_D] float NOT NULL,
	[e_VF_D] float NOT NULL,
	[RF_D] float NOT NULL,
	[e_RF_D] float NOT NULL,
	[RF_E] float NOT NULL,
	[e_RF_E] float NOT NULL,
	[RF_F] float NOT NULL,
	[e_RF_F] float NOT NULL,
	[RF_G] float NOT NULL,
	[e_RF_G] float NOT NULL,
	[RF_S] float NOT NULL,
	[e_RF_S] float NOT NULL,
	[IF_D] float NOT NULL,
	[e_IF_D] float NOT NULL,

	CONSTRAINT [PK_PhotoObjRAW] PRIMARY KEY CLUSTERED
(
	[objID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- BULK INSERT DATA
BULK INSERT
	PhotoObjRAW
	FROM '\\SKYQUERY01\Data\temp0\data0\ebanyai\COMBO17\combo17.bin'
	WITH
	(
		DATAFILETYPE = 'native',
		TABLOCK
	)

GO

IF OBJECT_ID ('dbo.PhotoObj', 'U') IS NOT NULL
	DROP TABLE dbo.PhotoObj;

GO
-- CREATE PhotoObj TABLE
CREATE TABLE dbo.PhotoObj
(

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

	--/ <summary> Sequential number (unique object ID) </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000) Internal accuracy 0.15" </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000) Internal accuracy 0.15" </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> x-coordinate on image cdfs_r.fit </summary>
	--/ <unit> pix </unit>
	[x_pos] float NOT NULL,

	--/ <summary> y-coordinate on image cdfs_r.fit </summary>
	--/ <unit> pix </unit>
	[y_pos] float NOT NULL,

	--/ <summary> total magnitude in R </summary>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of Rmag </summary>
	--/ <unit> mag </unit>
	[e_Rmag] real NOT NULL,

	--/ <summary> aperture magnitude in R </summary>
	--/ <unit> mag </unit>
	[Ap_Rmag] real NOT NULL,

	--/ <summary> aperture difference of Rmag Aperture difference on Rmag (=Rmag-Ap_Rmag, zero for point sources) </summary>
	--/ <unit> mag </unit>
	[ApD_Rmag] real NOT NULL,

	--/ <summary> central surface brightness in Rmag </summary>
	--/ <unit> mag </unit>
	[mu_max] real NOT NULL,

	--/ <summary> major axis as observed in 1" seeing </summary>
	--/ <unit> arcsec </unit>
	[MajAxis] real NOT NULL,

	--/ <summary> minor axis as observed in 1" seeing </summary>
	--/ <unit> arcsec </unit>
	[MinAxis] real NOT NULL,

	--/ <summary> position angle, measured West to North </summary>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> flags on photometry. Bit 0-7 (corresponding to values 0-128) are original SExtractor 
	--/ flags, bit 9-11 set by COMBO-17 photometry, bit 9 indicates only 
	--/ potential problem from bright neighbours or reflexes from the 
	--/ optics (check images), bit 10 indicates uncorrected hot pixels,
	--/ bit 11 is set interactively when photometry is erroneous  </summary>
	[phot_flag] int NOT NULL,

	--/ <summary> variability flag (0=not variable). flag only set for objects which are detected with high S/N and 
	--/ which show clear variability between different observing runs 
	--/ (magnitude difference greater 0.15 mag, at least one magnitude 
	--/ has to be measured with 10 sigma, difference has to be at least 
	--/ 6 sigma) </summary>
	[var_flag] tinyint NOT NULL,

	--/ <summary> stellarity index from SExtractor </summary>
	[stellarity] real NOT NULL,

	--/ <summary> multi-colour class. Definition of classes: 
	--/ "Star           "=stars (colour of star, stellar shape),
	--/ "WDwarf         "=WD/BHB/sdB star (colour of WD/BHB/sdB, stellar 
	--/                   shape),
	--/ "Galaxy         "=galaxies (colour of galaxy, shape irrelevant),
	--/ "Galaxy  (Star?)"=most likely galaxy at z&lt;0.15 (but overlap in
	--/                   colour space with stars), 
	--/ "Galaxy  (Uncl!)"=colour undecided (statistically almost always 
	--/                   a galaxy), 
	--/ "QSO            "=QSOs (colour of QSO, stellar shape), 
	--/ "QSO     (Gal?) "=colour of QSOs, extended shape (usually 
	--/                   Seyfert 1), 
	--/ "Strange Objects"=very strange spectrum (very unusual intrinsic
	--/                   spectrum or strong photometric artifacts or
	--/                   uncorrected strong variability) </summary>
	[MC_class] char(15) NOT NULL,

	--/ <summary> mean redshift in distribution of p(z) </summary>
	[MC_z] real NOT NULL,

	--/ <summary> mean error (1-sigma) of MC_z </summary>
	[e_MC_z] real NOT NULL,

	--/ <summary> alternative redshift if p(z) bimodal </summary>
	[MC_z2] real NOT NULL,

	--/ <summary> mean error (1-sigma) of MC_z2 </summary>
	[e_MC_z2] real NOT NULL,

	--/ <summary> peak of redshift distribution p(z) </summary>
	[MC_z_ml] real NOT NULL,

	--/ <summary> luminosity distance of MC_z. H0=100km/s/Mpc, Omega_m=0.3, Omega_Lambda=0.7 </summary>
	--/ <unit> Mpc </unit>
	[dl] real NOT NULL,

	--/ <summary> reduced Chi^2 of best-fitting template </summary>
	[chi2red] real NOT NULL,

	--/ <summary> Absolute Magnitude in Johnson U. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[UjMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of UjMag </summary>
	--/ <unit> mag </unit>
	[e_UjMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in Johnson B. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[BjMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of BjMag </summary>
	--/ <unit> mag </unit>
	[e_BjMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in Johnson V. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[VjMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of VjMag </summary>
	--/ <unit> mag </unit>
	[e_VjMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in SDSS u. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[usMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of usMag </summary>
	--/ <unit> mag </unit>
	[e_usMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in SDSS g. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[gsMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of gsMag </summary>
	--/ <unit> mag </unit>
	[e_gsMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in SDSS r. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[rsMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of rsMag </summary>
	--/ <unit> mag </unit>
	[e_rsMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in Bessell U. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[UbMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of UbMag </summary>
	--/ <unit> mag </unit>
	[e_UbMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in Bessell B. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[BbMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of BbMag </summary>
	--/ <unit> mag </unit>
	[e_BbMag] real NOT NULL,

	--/ <summary> Absolute Magnitude in Bessell V. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. </summary>
	--/ <unit> mag </unit>
	[VbMag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of VbMag </summary>
	--/ <unit> mag </unit>
	[e_VbMag] real NOT NULL,

	--/ <summary> Absolute Magnitue in 280/40. Absolute restframe magnitude calculated from redshifted best_fit 
	--/ template, depending on redshift and filter extrapolation outside
	--/ the COMBO-17 filter set can be necessary, only calculated for
	--/ objects classified as galaxies. Synthetic UV continuum rectangular passband at 260-300 nm. </summary>
	--/ <unit> mag </unit>
	[S280Mag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of S280Mag </summary>
	--/ <unit> mag </unit>
	[e_S280Mag] real NOT NULL,

	--/ <summary> Absolute Magnitude in 145/10. 
	--/ Absolute restframe magnitude in a synthetic narrow rectangular 
	--/ passband at 140-150 nm calculated from redshifted best_fit 
	--/ template, only calculated for objects classified as quasars </summary>
	--/ <unit> mag </unit>
	[S145Mag] real NOT NULL,

	--/ <summary> mean error (1-sigma) of S145Mag </summary>
	--/ <unit> mag </unit>
	[e_S145Mag] real NOT NULL,

	--/ <summary> flux in filter 420/30 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W420F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W420F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W420F_E] float NOT NULL,

	--/ <summary> flux in filter 462/14 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W462F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W462F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W462F_E] float NOT NULL,

	--/ <summary> flux in filter 485/31 in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W485F_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W485F_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W485F_D] float NOT NULL,

	--/ <summary> flux in filter 518/16 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W518F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W518F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W518F_E] float NOT NULL,

	--/ <summary> flux in filter 571/25 in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W571F_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W571F_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W571F_D] float NOT NULL,

	--/ <summary> flux in filter 571/25 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W571F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W571F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W571F_E] float NOT NULL,

	--/ <summary> combined flux in filter 571/25. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. Only applied to objects without variability flag. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W571F_S] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W571F_S </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W571F_S] float NOT NULL,

	--/ <summary> flux in filter 604/21 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W604F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W604F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W604F_E] float NOT NULL,

	--/ <summary> flux in filter 646/27 in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit>ct/m^2/s/nm  </unit>
	[W646F_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W646F_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W646F_D] float NOT NULL,

	--/ <summary> flux in filter 696/20 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W696F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W696F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W696F_E] float NOT NULL,

	--/ <summary> flux in filter 753/18 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W753F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W753F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W753F_E] float NOT NULL,

	--/ <summary> flux in filter 815/20 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W815F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W815F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W815F_E] float NOT NULL,

	--/ <summary> flux in filter 815/20 in run G. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W815F_G] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W815F_G </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W815F_G] float NOT NULL,

	--/ <summary> combined flux in filter 815/20. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. Only applied to objects without variability flag. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W815F_S] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W815F_S </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W815F_S] float NOT NULL,

	--/ <summary> flux in filter 856/14 in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W856F_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W856F_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W856F_D] float NOT NULL,

	--/ <summary> flux in filter 914/27 in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W914F_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W914F_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W914F_D] float NOT NULL,

	--/ <summary> flux in filter 914/27 in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[W914F_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of W914F_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_W914F_E] float NOT NULL,

	--/ <summary> flux in filter U in run F. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[UF_F] float NOT NULL,

	--/ <summary> mean error (1-sigma) of UF_F </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_UF_F] float NOT NULL,

	--/ <summary> flux in filter U in run G. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[UF_G] float NOT NULL,

	--/ <summary> mean error (1-sigma) of UF_G </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_UF_G] float NOT NULL,

	--/ <summary> combined flux in filter U. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. Only applied to objects without variability flag. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[UF_S] float NOT NULL,

	--/ <summary> mean error (1-sigma) of UF_S </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_UF_S] float NOT NULL,

	--/ <summary> flux in filter B in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[BF_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of BF_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_BF_D] float NOT NULL,

	--/ <summary> flux in filter B in run F. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[BF_F] float NOT NULL,

	--/ <summary> mean error (1-sigma) of BF_F </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_BF_F] float NOT NULL,

	--/ <summary> combined flux in filter B . Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. Only applied to objects without variability flag. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[BF_S] float NOT NULL,

	--/ <summary> mean error (1-sigma) of BF_S </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_BF_S] float NOT NULL,

	--/ <summary> flux in filter V in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[VF_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of VF_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_VF_D] float NOT NULL,

	--/ <summary> flux in filter R in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[RF_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of RF_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_RF_D] float NOT NULL,

	--/ <summary> flux in filter R in run E. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[RF_E] float NOT NULL,

	--/ <summary> mean error (1-sigma) of RF_E </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_RF_E] float NOT NULL,

	--/ <summary> flux in filter R in run F. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[RF_F] float NOT NULL,

	--/ <summary> mean error (1-sigma) of RF_F </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_RF_F] float NOT NULL,

	--/ <summary> flux in filter R in run G. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[RF_G] float NOT NULL,

	--/ <summary> mean error (1-sigma) of RF_G </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_RF_G] float NOT NULL,

	--/ <summary> combined flux in filter R. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. (12) </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[RF_S] float NOT NULL,

	--/ <summary> mean error (1-sigma) of RF_S </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_RF_S] float NOT NULL,

	--/ <summary> flux in filter I in run D. Coding of observing runs:
	--/ D = 07.10.-22.10.1999
	--/ E = 28.01.-11.02.2000
	--/ F = 21.09.-30.09.2000
	--/ G = 19.01.-20.01.2001
	--/ medium-band filters at the WFI are denoted by 
	--/ (central wavelength/FWHM), the unit of the flux is photons per 
	--/ unit area, second and wavelength interval, it is already corrected
	--/ for the gain of the CCD. </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[IF_D] float NOT NULL,

	--/ <summary> mean error (1-sigma) of IF_D </summary>
	--/ <unit> ct/m^2/s/nm </unit>
	[e_IF_D] float NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- INSERT DATA + CREATE HTMID, CX, CY, CZ
INSERT dbo.PhotoObj WITH (TABLOCKX)
( cx, cy, cz, htmid, zoneid, objID, RA, DEC, x_pos, y_pos, Rmag, e_Rmag, Ap_Rmag, ApD_Rmag, mu_max, MajAxis, MinAxis, PA, phot_flag, var_flag, stellarity, MC_class, MC_z, e_MC_z, MC_z2, e_MC_z2, MC_z_ml, dl, chi2red, UjMag, e_UjMag, BjMag, e_BjMag, VjMag, e_VjMag, usMag, e_usMag, gsMag, e_gsMag, rsMag, e_rsMag, UbMag, e_UbMag, BbMag, e_BbMag, VbMag, e_VbMag, S280Mag, e_S280Mag, S145Mag, e_S145Mag, W420F_E, e_W420F_E, W462F_E, e_W462F_E, W485F_D, e_W485F_D, W518F_E, e_W518F_E, W571F_D, e_W571F_D, W571F_E, e_W571F_E, W571F_S, e_W571F_S, W604F_E, e_W604F_E, W646F_D, e_W646F_D, W696F_E, e_W696F_E, W753F_E, e_W753F_E, W815F_E, e_W815F_E, W815F_G, e_W815F_G, W815F_S, e_W815F_S, W856F_D, e_W856F_D, W914F_D, e_W914F_D, W914F_E, e_W914F_E, UF_F, e_UF_F, UF_G, e_UF_G, UF_S, e_UF_S, BF_D, e_BF_D, BF_F, e_BF_F, BF_S, e_BF_S, VF_D, e_VF_D, RF_D, e_RF_D, RF_E, e_RF_E, RF_F, e_RF_F, RF_G, e_RF_G, RF_S, e_RF_S, IF_D, e_IF_D)
SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, 
SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid,
objID, RA, DEC, x_pos, y_pos, Rmag, e_Rmag, Ap_Rmag, ApD_Rmag, mu_max, MajAxis, MinAxis, PA, phot_flag, var_flag, stellarity, MC_class, MC_z, e_MC_z, MC_z2, e_MC_z2, MC_z_ml, dl, chi2red, UjMag, e_UjMag, BjMag, e_BjMag, VjMag, e_VjMag, usMag, e_usMag, gsMag, e_gsMag, rsMag, e_rsMag, UbMag, e_UbMag, BbMag, e_BbMag, VbMag, e_VbMag, S280Mag, e_S280Mag, S145Mag, e_S145Mag, W420F_E, e_W420F_E, W462F_E, e_W462F_E, W485F_D, e_W485F_D, W518F_E, e_W518F_E, W571F_D, e_W571F_D, W571F_E, e_W571F_E, W571F_S, e_W571F_S, W604F_E, e_W604F_E, W646F_D, e_W646F_D, W696F_E, e_W696F_E, W753F_E, e_W753F_E, W815F_E, e_W815F_E, W815F_G, e_W815F_G, W815F_S, e_W815F_S, W856F_D, e_W856F_D, W914F_D, e_W914F_D, W914F_E, e_W914F_E, UF_F, e_UF_F, UF_G, e_UF_G, UF_S, e_UF_S, BF_D, e_BF_D, BF_F, e_BF_F, BF_S, e_BF_S, VF_D, e_VF_D, RF_D, e_RF_D, RF_E, e_RF_E, RF_F, e_RF_F, RF_G, e_RF_G, RF_S, e_RF_S, IF_D, e_IF_D
FROM dbo.PhotoObjRAW
CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c

GO

-- DROP RAW TABLE
DROP TABLE PhotoObjRAW;

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
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

CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
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
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID] ON [dbo].[PhotoObj] 
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