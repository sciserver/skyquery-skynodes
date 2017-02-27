-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(

	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone; pos.eq; pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential Number </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> GDDS object identification (HH-NNNN) </summary>
	--/ <quantity>meta.id</quantity>
	[GDDS] char(7) NOT NULL,

	--/ <summary> right ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Degree of declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z] float NOT NULL,

	--/ <summary> Redshift confidence. Redshift confidence classes as follows:
	--/ 0 =	Failures. No redshift determined. If a redshift is given in table4.dat it should be taken as an educated guess.
	--/ 1 =	Failures. Confidence &lt;50%. Very insecure
	--/ 2 =	Redshift Inferred from Multiple Features. Confidence &gt;75%. Reasonably secure. Two or more matching lines/features.
	--/ 3 =	Redshift Inferred from Multiple Features. Confidence = 95%. Secure. Two or more matching lines/features + supporting continuum.
	--/ 4 =	Redshift Inferred from Multiple Features. Confidence: Certain. Unquestionably correct.
	--/ 8 =	Single-Line Redshift. Single emission line. Continuum suggests line is [O II] lambda3727.
	--/ 9 =	Single-Line Redshift. Single emission line.
	--/ 14 =	AGN Redshift. Class 4 as above, but with AGN characteristics. </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[Conf] smallint NOT NULL,

	--/ <summary> Slit geometry/collision class. Classification of spectrum overlaps take the following numbers:
	--/ 0 =	Both A and B channels uncontaminated (at most very minor masking needed).
	--/ 1 =	Single channel overlap. Offending channel not used (at most very minor masking needed).
	--/ 2 =	A contaminating zeroth-order line has been masked. Remaining continuum is trustworthy.
	--/ 3 =	Two channel collision. Major masking used in extraction. Continuum in blue should not be trusted.
	--/ 4 =	Two channel collision. Major masking used in extraction. Continuum in red should not be trusted.
	--/ 5 =	Extreme measures needed to try to recover a spectrum. Continuum should not be trusted.</summary>
	--/ <quantity>meta.code.class;spect</quantity>
	[Ovlap] char(3) NOT NULL,

	--/ <summary> Sampling weight. The practical upshot of our general mask design strategy is graphically
	--/ summarized in the bottom left panel of Figure 6. This panel is a two-dimensional histogram showing the 
	--/ number of independent slits assigned each cell of color-magnitude space. For the reasons just described 
	--/ heavy emphasis is given to the (22 &lt; I&lt; 24.5, 3&lt; I-Ks &lt;5) region of color-magnitude space. The relative number 
	--/ of slits as a function of the average population in each cell expected in a wide-area survey can be computed 
	--/ by dividing the bottom left panel of the figure by the top left panel. The values computed using this 
	--/ procedure are shown in the bottom right panel and correspond to sampling weights. These weights will 
	--/ prove important in the computation of the luminosity and mass functions in future papers in this series. </summary>
	--/ <quantity>stat.weight</quantity>
	[Weight] float NOT NULL,

	--/ <summary> B-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> [s] s for 2-sigma detection limit in Bmag. </summary>
	--/ <quantity>instr.sensitivity;em.opt.B</quantity>
	[n_Bmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Bmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[e_Bmag] real NOT NULL,

	--/ <summary> V-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[Vmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Vmag. </summary>
	--/ <quantity>instr.sensitivity;em.opt.V</quantity>
	[n_Vmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Vmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.mag</quantity>
	--/ <unit> mag </unit>
	[e_Vmag] real NOT NULL,

	--/ <summary> Cousins R-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.opt.Cousins.R</quantity>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary>  s for 2-sigma detection limit in Rmag. </summary>
	--/ <quantity>instr.sensitivity;em.opt.Cousins.R</quantity>
	[n_Rmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Rmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.Cousins.R</quantity>
	--/ <unit> mag </unit>
	[e_Rmag] real NOT NULL,

	--/ <summary> Cousins I-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.opt.Cousins.I</quantity>
	--/ <unit> mag </unit>
	[Icmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Icmag </summary>
	--/ <quantity>instr.sensitivity;em.opt.Cousins.I</quantity>
	[n_Icmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Icmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.Cousins.I</quantity>
	--/ <unit> mag </unit>
	[e_Icmag] real NOT NULL,

	--/ <summary> z'-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.opt.z</quantity>
	--/ <unit> mag </unit>
	[z_mag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in z'mag </summary>
	--/ <quantity>instr.sensitivity;em.opt.z</quantity>
	[n_z_mag] char(1) NOT NULL,

	--/ <summary> Uncertainty in z'mag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.z</quantity>
	--/ <unit> mag </unit>
	[e_z_mag] real NOT NULL,

	--/ <summary> H-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[Hmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Hmag </summary>
	--/ <quantity>instr.sensitivity;em.IR.H</quantity>
	[n_Hmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Hmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit> mag </unit>
	[e_Hmag] real NOT NULL,

	--/ <summary> Ks-band magnitude. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Ksmag] real NOT NULL,

	--/ <summary> s for 2-sigma detection limit in Ksmag </summary>
	--/ <quantity>instr.sensitivity;em.IR.K</quantity>
	[n_Ksmag] char(1) NOT NULL,

	--/ <summary> Uncertainty in Ksmag. Non-detections have been placed at the formal 2-sigma detection 
	--/ limit of the filter and magnitude error set to blank. </summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[e_Ksmag] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- CREATE SpectralFeatures TABLE
CREATE TABLE dbo.SpectralFeatures
(
	--/ <summary> GDDS object identification (HH-NNNN). 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.id</quantity>
	[GDDS] char(7) NOT NULL,

	--/ <summary> Indicative of AGN activity. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code</quantity>
	[AGN] tinyint NOT NULL,

	--/ <summary> Is [O II] (3727 Angstrom) present?
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[OII] tinyint NOT NULL,

	--/ <summary> Is [O III] (5007 Angstrom) present?
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line.OIII</quantity>
	[OIII] tinyint NOT NULL,

	--/ <summary> Are Balmer lines bluer than Hbeta present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[HiBal] tinyint NOT NULL,

	--/ <summary> Is Halpha and/or Hbeta present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line.Halpha;em.line.Hbeta</quantity>
	[LoBal] tinyint NOT NULL,

	--/ <summary> Is Fe II (2375 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[Fe2375] tinyint NOT NULL,

	--/ <summary> Is Fe II (2600 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra.  </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[Fe2600] tinyint NOT NULL,

	--/ <summary> Is Mg II (2800 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[Mg2800] tinyint NOT NULL,

	--/ <summary>  Is Mg II (2852 Angstrom) present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[Mg2852] tinyint NOT NULL,

	--/ <summary> Are Ca II H and K lines present? 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code;em.line</quantity>
	[HandK] tinyint NOT NULL,

	--/ <summary> Is the Balmer decrement present?. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code</quantity>
	[Balmer] tinyint NOT NULL,

	--/ <summary>  Is the D4000 feature present?. 
	--/ Flag is: 0=No, 1=Yes 2=Feature did not fall within the wavelength range of our spectra. </summary>
	--/ <quantity>meta.code</quantity>
	[D4000] tinyint NOT NULL,

	--/ <summary> Redshift template code. Redshift template code as follows:
	--/ 1 =	Comparison against a reference template was used to obtain the redshift
	--/ 2 =	No template needed to obtain the redshift </summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[Temp] tinyint NOT NULL,

	--/ <summary> Spectral class. Classes use the following numbers:
	--/ 001 =	Objects showing pure, or nearly pure, signatures of an evolved stellar population (e.g., D4000, H	K, or template matches)
	--/ 100 =	Objects that are dominated by the flat-UV continuum and strong emission-lines characteristic of star- forming systems
	--/ 010 =	those showing signatures of intermediate ages (e.g., strong Balmer absorption). 
	--/ Many objects show characteristics of more than one type and so are assigned classes that are the sum of old (001), intermediates (010), 
	--/ and young (100) populations. Example: Objects listed as "101" may show strong H	K absorption and 4000 Angstrom breaks and yet have a flat-UV 
	--/ continuum tail indicative of a low level of ongoing star formation. </summary>
	--/ <quantity>src.spType</quantity>
	[Class] int NOT NULL,

	--/ <summary> Confidence code. Redshift confidence classes as follows:
	--/ 0 =	Failures. No redshift determined. If a redshift is given in table4.dat it should be taken as an educated guess.
	--/ 1 =	Failures. Confidence &lt;50%. Very insecure
	--/ 2 =	Redshift Inferred from Multiple Features. Confidence &gt;75%. Reasonably secure. Two or more matching lines/features.
	--/ 3 =	Redshift Inferred from Multiple Features. Confidence = 95%. Secure. Two or more matching lines/features + supporting continuum.
	--/ 4 =	Redshift Inferred from Multiple Features. Confidence: Certain. Unquestionably correct.
	--/ 8 =	Single-Line Redshift. Single emission line. Continuum suggests line is [O II] lambda3727.
	--/ 9 =	Single-Line Redshift. Single emission line.
	--/ 14 =	AGN Redshift. Class 4 as above, but with AGN characteristics. </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[Conf] smallint NOT NULL,

	--/ <summary> Redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[z] real NOT NULL,

	CONSTRAINT [PK_SpectralFeatures] PRIMARY KEY CLUSTERED
(
	[GDDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

