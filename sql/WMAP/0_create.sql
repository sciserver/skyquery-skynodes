-- CREATE Obs TABLE
CREATE TABLE dbo.Obs
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

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> WMAP identifier (constructed from truncated RA and Dec) </summary>
	--/ <quantity>meta.id</quantity>
	[WMAP] char(10) NOT NULL,

	--/ <summary> [1/208] Source identifier (from WMAP 1st-yr, Cat. J/ApJS/148/97; &lt;WMAP NNN&gt; in Simbad) </summary>
	--/ <quantity>meta.id</quantity>
	[WMAP1] int NOT NULL,

	--/ <summary> [0/24.2] WMAP K band (22.5GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.radio.12-30GHz</quantity>
	--/ <unit> Jy </unit>
	[S_K] real NOT NULL,

	--/ <summary> Uncertainty in S(K) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.radio.12-30GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_K] real NOT NULL,

	--/ <summary> [0.1/22.1] WMAP Ka band (32.8GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[S_Ka] real NOT NULL,

	--/ <summary> Uncertainty in S(Ka) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_Ka] real NOT NULL,

	--/ <summary> [0.1/20.9] WMAP Q band (40.4GHz) flux density  </summary>
	--/ <quantity>phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[S_Q] real NOT NULL,

	--/ <summary>  Uncertainty in S(Q) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_Q] real NOT NULL,

	--/ <summary> [0.2/18.6] WMAP V band (60.2GHz) flux densit </summary>
	--/ <quantity>phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[S_V] real NOT NULL,

	--/ <summary> Uncertainty in S(V)  </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_V] real NOT NULL,

	--/ <summary> [0.4/15.2] WMAP W band (93.0GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[S_W] real NOT NULL,

	--/ <summary> Uncertainty in S(W)  </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_W] real NOT NULL,

	--/ <summary> [-3.1/2.1] WMAP spectral index &alpha; (S&nu;&prop;&nu;&alpha;)  </summary>
	--/ <quantity>spect.index</quantity>
	[alf] real NOT NULL,

	--/ <summary> Uncertainty in spectral index alf </summary>
	--/ <quantity>stat.error;spect.index</quantity>
	[e_alf] real NOT NULL,

	--/ <summary> The 5 GHz source identifier </summary>
	--/ <quantity>meta.id.cross</quantity>
	[fiveGHzID] char(15) NOT NULL,

	--/ <summary> [abcd] Individual notes. Flag as follows:
	--/ a=	Indicates the source has multiple possible identifications.
	--/ b=	Source J0322-3711 (Fornax A) is extended, and the fluxes listed were obtained by aperture photometry.
	--/ c=	Source J1356+7644 is outside of the declination range of the GB6 and PMN catalogs. It was identified as QSO 
	--/ by Trushkin (2006, private communication).
	--/ d=	Source J1632+8227 is outside of the declination range of the GB6 and PMN catalogs. It was identified as NGC 6251 by 
	--/ S.A. (2003BSAO...55...90T). </summary>
	--/ <quantity>meta.code</quantity>
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

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity></quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (FK5, Equinox=J2000.0) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> WMAP identifier (constructed from truncated RA and Dec) </summary>
	--/ <quantity>meta.id</quantity>
	[WMAP] char(10) NOT NULL,

	--/ <summary>  [1/208] Source identifier (from WMAP 1st-yr, Cat. J/ApJS/148/97; &lt;WMAP NNN&gt; in Simbad) </summary>
	--/ <quantity>meta.id</quantity>
	[WMAP1] int NOT NULL,

	--/ <summary> [-0.1/18.7] WMAP Q band (40.4GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[S_Q] real NOT NULL,

	--/ <summary> Uncertainty in S(Q) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.30-50GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_Q] real NOT NULL,

	--/ <summary> [-0.4/17] WMAP V band (60.2GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[S_V] real NOT NULL,

	--/ <summary> Uncertainty in S(V) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_V] real NOT NULL,

	--/ <summary> [-1/13.1] WMAP W band (93.0GHz) flux density </summary>
	--/ <quantity>phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[S_W] real NOT NULL,

	--/ <summary> Uncertainty in S(W) </summary>
	--/ <quantity>stat.error;phot.flux.density;em.mm.50-100GHz</quantity>
	--/ <unit> Jy </unit>
	[e_S_W] real NOT NULL,

	--/ <summary> The 5 GHz source identifier </summary>
	--/ <quantity>meta.id.cross</quantity>
	[fiveGHzID] char(15) NOT NULL,

	--/ <summary> [abcd] Multiple possible identifications. Flag as follows:
	--/ a=	Indicates the source has multiple possible identifications.
	--/ b=	Source J0322-3711 (Fornax A) is extended, and the fluxes listed were obtained by aperture photometry.
	--/ c=	Source J1356+7644 is outside of the declination range of the GB6 and PMN catalogs. It was identified as QSO 
	--/ by Trushkin (2006, private communication).
	--/ d=	Source J1632+8227 is outside of the declination range of the GB6 and PMN catalogs. It was identified as NGC 6251 by 
	--/ S.A. (2003BSAO...55...90T). </summary>
	--/ <quantity>meta.code</quantity>
	[f_5GHzID] char(1) NOT NULL,

	CONSTRAINT [PK_ObsCMBFree] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

