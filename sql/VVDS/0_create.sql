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
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Observation identification </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[ID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Name based on J2000 position </summary>
	--/ <quantity>meta.id</quantity>
	[Jname] char(19) NOT NULL,

	--/ <summary> Redshift (Z) </summary>
	--/ <quantity>src.redshift</quantity>
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
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z] smallint NOT NULL,

	--/ <summary> [0,1] Photometry is 0=questionable, 1=OK </summary>
	--/ <quantity>meta.code.qual;phot</quantity>
	[phf] tinyint NOT NULL,

	--/ <summary>  AB magnitude in ESO U/360 filter. the two U filters differ slightly: 
	--/ –the ESO U filter has a central wavelength of 340nm and a 
	--/ FWHM of 73nm, has his highest wavelength close to 400nm. 
	--/ –the Loiano U filter has a central wavelength of 362nm and a 
	--/ FWHM of 53nm; it also presents a red leak around 720nm </summary>
	--/ <quantity>phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[UEmag] real NOT NULL,

	--/ <summary> Mean error on UEmag </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[e_UEmag] real NOT NULL,

	--/ <summary> AB magnitude in Loiano U filter.  the two U filters differ slightly: 
	--/ –the ESO U filter has a central wavelength of 340nm and a 
	--/ FWHM of 73nm, has his highest wavelength close to 400nm. 
	--/ –the Loiano U filter has a central wavelength of 362nm and a 
	--/ FWHM of 53nm; it also presents a red leak around 720nm </summary>
	--/ <quantity>phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[ULmag] real NOT NULL,

	--/ <summary> Mean error on ULmag </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.U</quantity>
	--/ <unit> mag </unit>
	[e_ULmag] real NOT NULL,

	--/ <summary> AB magnitude in B filter </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> Mean error on Bmag </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[e_Bmag] real NOT NULL,

	--/ <summary> AB magnitude in V filter </summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[Vmag] real NOT NULL,

	--/ <summary> Mean error on Vmag </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[e_Vmag] real NOT NULL,

	--/ <summary> AB magnitude in R filter  </summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> Mean error on Rmag </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.R</quantity>
	--/ <unit> mag </unit>
	[e_Rmag] real NOT NULL,

	--/ <summary> AB magnitude in I filter </summary>
	--/ <quantity>phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[Imag] real NOT NULL,

	--/ <summary> Mean error on Imag  </summary>
	--/ <quantity>stat.error;phot.mag;em.opt.I</quantity>
	--/ <unit> mag </unit>
	[e_Imag] real NOT NULL,

	--/ <summary> AB magnitude in J filter </summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[Jmag] real NOT NULL,

	--/ <summary> Mean error on Jmag </summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit> mag </unit>
	[e_Jmag] real NOT NULL,

	--/ <summary> AB magnitude in K filter </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Kmag] real NOT NULL,

	--/ <summary> Mean error on Kmag </summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[e_Kmag] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

