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

