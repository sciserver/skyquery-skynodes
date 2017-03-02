-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (ICRS)</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=icrs</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (ICRS)</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=icrs</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (ICRS)</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=icrs</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (ICRS)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=icrs</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[seqID] bigint NOT NULL,

	--/ <summary> f for galaxies fainter than the limit mSSRS2=15.5 </summary>
	--/ <quantity>meta.code</quantity>
	[n_GSC] char(1) NOT NULL,

	--/ <summary> GSC (Cat. I/220) number of the galaxy  </summary>
	--/ <quantity>meta.id</quantity>
	[GSC] char(9) NOT NULL,

	--/ <summary> [NSEW] Multiplicity index on GSC </summary>
	--/ <quantity>meta.code.multip</quantity>
	[m_GSC] char(1) NOT NULL,

	--/ <summary> ESO (Cat. VII/34) or MCG (Cat. VII/100) name </summary>
	--/ <quantity></quantity>
	[ESO_MCG] char(10) NOT NULL,

	--/ <summary> )Right ascension (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <quantity>pos.eq.ra;pos.frame=icrs</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <quantity>pos.eq.dec;pos.frame=icrs</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Right ascension (B1950.0) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=b1950</quantity>
	--/ <unit> deg </unit>
	[RA_1950] float NOT NULL,

	--/ <summary> Declination (B1950.0) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=b1950</quantity>
	--/ <unit> deg </unit>
	[DEC_1950] float NOT NULL,

	--/ <summary> SSRS2 magnitude. m(SSRS2) = 0.59m(GSC) + 8.42 </summary>
	--/ <quantity>phot.mag;em.opt</quantity>
	--/ <unit> mag </unit>
	[mSSR] real NOT NULL,

	--/ <summary> Radial velocity </summary>
	--/ <quantity>spect.dopplerVelocity;pos.heliocentric</quantity>
	--/ <unit> km s-1 </unit>
	[RV] int NOT NULL,

	--/ <summary> rms uncertainty on RV </summary>
	--/ <quantity>stat.error;spect.dopplerVelocity;pos.heliocentric</quantity>
	--/ <unit> km s-1 </unit>
	[e_RV] int NOT NULL,

	--/ <summary> de Vaucouleurs' galaxy morphology (T-types) </summary>
	--/ <quantity>src.morp.type</quantity>
	[TT] smallint NOT NULL,

	--/ <summary> Source for the radial velocity in refs.dat file  </summary>
	--/ <quantity>meta.ref;spect.dopplerVelocity</quantity>
	[r_RV] tinyint NOT NULL,

	--/ <summary> Note </summary>
	--/ <quantity>meta.note</quantity>
	[Note] char(4) NOT NULL,

	--/ <summary> NGC or IC (Cat. VII/118) name </summary>
	--/ <quantity>meta.id.cross</quantity>
	[NGC_IC] char(10) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

