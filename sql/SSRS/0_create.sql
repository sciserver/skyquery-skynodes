-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> f for galaxies fainter than the limit mSSRS2=15.5 </summary>
	[n_GSC] char(1) NOT NULL,

	--/ <summary> GSC (Cat. I/220) number of the galaxy  </summary>
	[GSC] char(9) NOT NULL,

	--/ <summary> [NSEW] Multiplicity index on GSC </summary>
	[m_GSC] char(1) NOT NULL,

	--/ <summary> ESO (Cat. VII/34) or MCG (Cat. VII/100) name </summary>
	[ESO_MCG] char(10) NOT NULL,

	--/ <summary> )Right ascension (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (ICRS) (computed by VizieR, not part of the original data)  </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Right ascension (B1950.0) </summary>
	--/ <unit> deg (B1950) </unit>
	[RA_1950] float NOT NULL,

	--/ <summary> Declination (B1950.0) </summary>
	--/ <unit> deg (B1950) </unit>
	[DEC_1950] float NOT NULL,

	--/ <summary> SSRS2 magnitude. m(SSRS2) = 0.59m(GSC) + 8.42 </summary>
	--/ <unit> mag </unit>
	[mSSR] real NOT NULL,

	--/ <summary> Radial velocity </summary>
	--/ <unit> km/s </unit>
	[RV] int NOT NULL,

	--/ <summary> rms uncertainty on RV </summary>
	--/ <unit> km/s </unit>
	[e_RV] int NOT NULL,

	--/ <summary> de Vaucouleurs' galaxy morphology (T-types) </summary>
	[TT] smallint NOT NULL,

	--/ <summary> Source for the radial velocity in refs.dat file  </summary>
	[r_RV] tinyint NOT NULL,

	--/ <summary> Note </summary>
	[Note] char(4) NOT NULL,

	--/ <summary> NGC or IC (Cat. VII/118) name </summary>
	[NGC_IC] char(10) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

