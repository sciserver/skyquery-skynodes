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
	--/ <quantity>pos.cartesian.t; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> WiggleZ name (ANNJHHMMSSsss+DDMMSSss). "ANN" represent the regions, where "NN" represents the hour of right 
	--/ 00, 01, 03 and 22 for the South Galactic Pole; 09, 11 and 15 for the North Galactic Pole. </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[ID] char(22) NOT NULL,

	--/ <summary> Right ascension in decimal degrees </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> [-0.02/6.1] Redshift </summary>
	--/ <quantity>src.redshift</quantity>
	[Redshift] real NOT NULL,

	--/ <summary> [3/5]Redshift quality flag, 5=best. Redshift Quality Definitions:
	--/ 1=	No redshift was possible; highly noisy spectra.
	--/ 2=	An uncertain redshift was assigned.
	--/ 3=	A reasonably confident redshift; if based on [OII] alone, then the doublet is resolved or partially resolved.
	--/ 4=	A redshift that has multiple (obvious) emission lines all in agreement.
	--/ 5=	An excellent redshift with high S/N that may be suitable as a template.
	--/ 6=	Reserved for Galactic stars used as calibration sources. </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[Qop] tinyint NOT NULL,

	--/ <summary> SDSS u magnitude.  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit> mag </unit>
	[u_SDSS] real NOT NULL,

	--/ <summary> SDSS g magnitude.  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g_SDSS] real NOT NULL,

	--/ <summary> SDSS r magnitude. </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r_SDSS] real NOT NULL,

	--/ <summary> SDSS i magnitude.  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit> mag </unit>
	[i_SDSS] real NOT NULL,

	--/ <summary> SDSS z magnitude.  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z_SDSS] real NOT NULL,

	--/ <summary> RCS2 g magnitude </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit> mag </unit>
	[g_RCS2] real NOT NULL,

	--/ <summary> RCS2 r magnitude.  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit> mag </unit>
	[r_RCS2] real NOT NULL,

	--/ <summary> RCS2 z magnitude  </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit> mag </unit>
	[z_RCS2] real NOT NULL,

	--/ <summary> GALEX NUV magnitude  </summary>
	--/ <quantity>phot.mag;em.UV</quantity>
	--/ <unit> mag </unit>
	[NUV] real NOT NULL,

	--/ <summary>  GALEX FUV magnitude </summary>
	--/ <quantity>phot.mag;em.UV.FUV</quantity>
	--/ <unit> mag </unit>
	[FUV] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

