-- CREATE Obs TABLE
CREATE TABLE dbo.Obs
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

	--/ <summary> Sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> WMAP identifier (constructed from truncated RA and Dec) </summary>
	[WMAP] char(10) NOT NULL,

	--/ <summary> [1/208] Source identifier (from WMAP 1st-yr, Cat. J/ApJS/148/97; &lt;WMAP NNN&gt; in Simbad) </summary>
	[WMAP1] int NOT NULL,

	--/ <summary> [0/24.2] WMAP K band (22.5GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_K] real NOT NULL,

	--/ <summary> Uncertainty in S(K) </summary>
	--/ <unit> Jy </unit>
	[e_S_K] real NOT NULL,

	--/ <summary> [0.1/22.1] WMAP Ka band (32.8GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_Ka] real NOT NULL,

	--/ <summary> Uncertainty in S(Ka) </summary>
	--/ <unit> Jy </unit>
	[e_S_Ka] real NOT NULL,

	--/ <summary> [0.1/20.9] WMAP Q band (40.4GHz) flux density  </summary>
	--/ <unit> Jy </unit>
	[S_Q] real NOT NULL,

	--/ <summary>  Uncertainty in S(Q) </summary>
	--/ <unit> Jy </unit>
	[e_S_Q] real NOT NULL,

	--/ <summary> [0.2/18.6] WMAP V band (60.2GHz) flux densit </summary>
	--/ <unit> Jy </unit>
	[S_V] real NOT NULL,

	--/ <summary> Uncertainty in S(V)  </summary>
	--/ <unit> Jy </unit>
	[e_S_V] real NOT NULL,

	--/ <summary> [0.4/15.2] WMAP W band (93.0GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_W] real NOT NULL,

	--/ <summary> Uncertainty in S(W)  </summary>
	--/ <unit> Jy </unit>
	[e_S_W] real NOT NULL,

	--/ <summary> [-3.1/2.1] WMAP spectral index &alpha; (S&nu;&prop;&nu;&alpha;)  </summary>
	[alf] real NOT NULL,

	--/ <summary> Uncertainty in spectral index alf </summary>
	[e_alf] real NOT NULL,

	--/ <summary> The 5 GHz source identifier </summary>
	[fiveGHzID] char(15) NOT NULL,

	--/ <summary> [abcd] Individual notes. Flag as follows:
	--/ a=	Indicates the source has multiple possible identifications.
	--/ b=	Source J0322-3711 (Fornax A) is extended, and the fluxes listed were obtained by aperture photometry.
	--/ c=	Source J1356+7644 is outside of the declination range of the GB6 and PMN catalogs. It was identified as QSO 
	--/ by Trushkin (2006, private communication).
	--/ d=	Source J1632+8227 is outside of the declination range of the GB6 and PMN catalogs. It was identified as NGC 6251 by 
	--/ S.A. (2003BSAO...55...90T). </summary>
	[f_5GHzID] char(1) NOT NULL,

	CONSTRAINT [PK_Obs] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

---------------------------------------------------------------
-- CREATE ObsCMBFree TABLE
CREATE TABLE dbo.ObsCMBFree
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

	--/ <summary> Sequential ID </summary>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> WMAP identifier (constructed from truncated RA and Dec) </summary>
	[WMAP] char(10) NOT NULL,

	--/ <summary>  [1/208] Source identifier (from WMAP 1st-yr, Cat. J/ApJS/148/97; &lt;WMAP NNN&gt; in Simbad) </summary>
	[WMAP1] int NOT NULL,

	--/ <summary> [-0.1/18.7] WMAP Q band (40.4GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_Q] real NOT NULL,

	--/ <summary> Uncertainty in S(Q) </summary>
	--/ <unit> Jy </unit>
	[e_S_Q] real NOT NULL,

	--/ <summary> [-0.4/17] WMAP V band (60.2GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_V] real NOT NULL,

	--/ <summary> Uncertainty in S(V) </summary>
	--/ <unit> Jy </unit>
	[e_S_V] real NOT NULL,

	--/ <summary> [-1/13.1] WMAP W band (93.0GHz) flux density </summary>
	--/ <unit> Jy </unit>
	[S_W] real NOT NULL,

	--/ <summary> Uncertainty in S(W) </summary>
	--/ <unit> Jy </unit>
	[e_S_W] real NOT NULL,

	--/ <summary> The 5 GHz source identifier </summary>
	[fiveGHzID] char(15) NOT NULL,

	--/ <summary> [abcd] Multiple possible identifications. Flag as follows:
	--/ a=	Indicates the source has multiple possible identifications.
	--/ b=	Source J0322-3711 (Fornax A) is extended, and the fluxes listed were obtained by aperture photometry.
	--/ c=	Source J1356+7644 is outside of the declination range of the GB6 and PMN catalogs. It was identified as QSO 
	--/ by Trushkin (2006, private communication).
	--/ d=	Source J1632+8227 is outside of the declination range of the GB6 and PMN catalogs. It was identified as NGC 6251 by 
	--/ S.A. (2003BSAO...55...90T). </summary>
	[f_5GHzID] char(1) NOT NULL,

	CONSTRAINT [PK_ObsCMBFree] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

