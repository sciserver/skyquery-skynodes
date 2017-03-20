-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(

	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM;pos.eq;pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone;pos.eq;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Identification number in the FDF  </summary>
	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000). Taken from Heidt et al., 2003, Cat. J/A+A/398/49, if FDF&lt;9000. </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000). Taken from Heidt et al., 2003, Cat. J/A+A/398/49, if FDF&lt;9000. </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Total Bessel B magnitude. Taken from Heidt et al., 2003, Cat. J/A+A/398/49, if FDF&lt;9000. </summary>
	--/ <quantity>phot.mag;em.opt.Bessel.B</quantity>
	--/ <unit> mag </unit>
	[BTmag] real NOT NULL,

	--/ <summary> Total Bessel I magnitude. Taken from Heidt et al., 2003, Cat. J/A+A/398/49, if FDF&lt;9000. </summary>
	--/ <quantity>phot.mag;em.opt.Bessel.I</quantity>
	--/ <unit> mag </unit>
	[ITmag] real NOT NULL,

	--/ <summary> Total exposure time </summary>
	--/ <quantity>obvs.exposure</quantity>
	--/ <unit> m </unit>
	[Texp] int NOT NULL,

	--/ <summary> Slit throughput. Effective ratio between the flux which passed through the slit and the actual 
	--/ object flux in %. Low f/f0 usually correspond to large object extensions. Typical values for point-like 
	--/ objects are around 0.7. Large values (&gt; 0.8) can be caused by systematic spectral errors and/or inaccurate 
	--/ photometry due to very low fluxes or object crowding. </summary>
	--/ <quantity>phot.flux; arith.ratio </quantity>
	[ff0] int NOT NULL,

	--/ <summary> S/N per resolution element. S/N is the average signal-to-noise ratio per resolution element in 
	--/ the filter band given in n_S/N (B, g, R, I). In each case the band with the highest S/N was selected. The 
	--/ S/N as a function of wavelength was calculated by dividing the object spectrum by its error function. </summary>
	--/ <quantity>stat.snr</quantity>
	[SN] real NOT NULL,

	--/ <summary> [BgRI] Filter band for S/N measurement. S/N is the average signal-to-noise ratio per resolution element in 
	--/ the filter band given in n_S/N (B, g, R, I). In each case the band with the highest S/N was selected. The 
	--/ S/N as a function of wavelength was calculated by dividing the object spectrum by its error function.  </summary>
	--/ <quantity>stat.snr</quantity>
	[n_SN] char(1) NOT NULL,

	--/ <summary> Quality of the spectrum. Flag indicating systematic errors in the spectrum. Qs=1 refers to 
	--/ distorted spectra, Qs=2 to local defects.</summary>
	--/ <quantity>meta.code.qual</quantity>
	[Qs] tinyint NOT NULL,

	--/ <summary> [1/8] Object type. Object type: The classes 1 to 6 represent galaxies, 7 indicates QSOs, and 8 refers to stars. 
	--/ For the galaxy types the ratio of the UV to the optical flux in the rest frame increases from 1 to 5/6 corresponding 
	--/ to a sequence from early-type to extreme starburst galaxies. Special class 6 represents starburst galaxies with 
	--/ strong Ly_alpha emission. In case the continuum could be measured suitably, it turned out that the class 6 galaxies also 
	--/ belong to type 5. </summary>
	--/ <quantity>src.class</quantity>
	[Type] tinyint NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <quantity>src.redshift;spect</quantity>
	[z] real NOT NULL,

	--/ <summary> Mean error of redshift </summary>
	--/ <quantity>stat.error;src.redshift;spec</quantity>
	[e_z] real NOT NULL,

	--/ <summary> Uncertainty of Type. Relative rms deviation between spectrum and the optimal template in % of the average spectral flux. </summary>
	--/ <quantity>stat.error</quantity>
	--/ <unit> % </unit>
	[e_Type] int NOT NULL,

	--/ <summary> Quality of redshift. q_z=1 indicates objects with secure redshifts and qz=2 with probable redshifts (90% confidence level). 
	--/ The presented catalogue does not contain objects with uncertain redshifts.</summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z] tinyint NOT NULL,

	--/ <summary> Notes. Further information on the object. For stars a rough spectral type is given. 
	--/ Quasars and strong Ly_alpha emission galaxies are indicated by the entries "QSO" and "LAB" (Ly_alpha bright, 
	--/ i.e. Ly_alpha emission EW &#8805; 20 Angstrom), respectively. "600R" indicates galaxies whose redshift and object type 
	--/ were verified by means of the medium resolution spectra of Ziegler et al. (2002ApJ...564L..69Z). </summary>
	--/ <quantity>meta.note</quantity>
	[Notes] char(20) NOT NULL,

	--/ <summary> File name in sub-directory fdfss/. Blanks indicate that the spectrum has not been made 
	--/ available due to strong systematic errors or very low S/N.</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[FileName] char(7) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

