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

	--/ <summary> WiggleZ name (ANNJHHMMSSsss+DDMMSSss). "ANN" represent the regions, where "NN" represents the hour of right 
	--/ 00, 01, 03 and 22 for the South Galactic Pole; 09, 11 and 15 for the North Galactic Pole. </summary>
	[ID] char(22) NOT NULL,

	--/ <summary> Right ascension in decimal degrees </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination in decimal degrees </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> [-0.02/6.1] Redshift </summary>
	[Redshift] real NOT NULL,

	--/ <summary> [3/5]Redshift quality flag, 5=best. Redshift Quality Definitions:
	--/ 1=	No redshift was possible; highly noisy spectra.
	--/ 2=	An uncertain redshift was assigned.
	--/ 3=	A reasonably confident redshift; if based on [OII] alone, then the doublet is resolved or partially resolved.
	--/ 4=	A redshift that has multiple (obvious) emission lines all in agreement.
	--/ 5=	An excellent redshift with high S/N that may be suitable as a template.
	--/ 6=	Reserved for Galactic stars used as calibration sources. </summary>
	[Qop] tinyint NOT NULL,

	--/ <summary> SDSS u magnitude.  </summary>
	--/ <unit> mag </unit>
	[u_SDSS] real NOT NULL,

	--/ <summary> SDSS g magnitude.  </summary>
	--/ <unit> mag </unit>
	[g_SDSS] real NOT NULL,

	--/ <summary> SDSS r magnitude. </summary>
	--/ <unit> mag </unit>
	[r_SDSS] real NOT NULL,

	--/ <summary> SDSS i magnitude.  </summary>
	--/ <unit> mag </unit>
	[i_SDSS] real NOT NULL,

	--/ <summary> SDSSz magnitude.  </summary>
	--/ <unit> mag </unit>
	[z_SDSS] real NOT NULL,

	--/ <summary> RCS2 g magnitude </summary>
	--/ <unit> mag </unit>
	[g_RCS2] real NOT NULL,

	--/ <summary> RCS2 r magnitude.  </summary>
	--/ <unit> mag </unit>
	[r_RCS2] real NOT NULL,

	--/ <summary> RCS2 z magnitude  </summary>
	--/ <unit> mag </unit>
	[z_RCS2] real NOT NULL,

	--/ <summary> GALEX NUV magnitude  </summary>
	--/ <unit> mag </unit>
	[NUV] real NOT NULL,

	--/ <summary>  GALEX FUV magnitude </summary>
	--/ <unit> mag </unit>
	[FUV] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

