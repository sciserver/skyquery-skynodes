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

	--/ <summary> K20 identification number, CDFS_NNNNN or q0055_NNNNN </summary>
	[Seq] char(11) NOT NULL,

	--/ <summary> Right ascension (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000.0) </summary>
	--/ <unit> deg (J2000) </unit>
	[DEC] float NOT NULL,

	--/ <summary> Total (SExtractor BEST) Ks-band magnitude </summary>
	--/ <unit> mag </unit>
	[Ksmag] real NOT NULL,

	--/ <summary> R-K colour index, measured in a 2"-diameter aperture corrected to total </summary>
	--/ <unit> mag </unit>
	[R_K] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> [-1/1] Quality flag on redshfit. Quality flag on redshfit as follows:
	--/ 1=	solid redshift determination;
	--/ 0=	tentative redshift determination;
	--/ -1=	no redshfit determination. </summary>
	[q_z] smallint NOT NULL,

	--/ <summary> Spectroscopic classes code. Spectroscopic classes as follows:
	--/ 0=	objects classified as stars;
	--/ 1=	red passive early-type galaxies;
	--/ 2=	blue emission-line galaxies;
	--/ 1.5=	intermediate galaxies with emission lines but red continuum indices;
	--/ 3=	galaxies which are not included in one of the three previous classes;
	--/ 4=	broad-line AGN. We remind that objects with only a tentative redshift (q_z=0) are not classified. </summary>
	[Class] char(3) NOT NULL,

	--/ <summary> Spectra file name in "sp" subdirectory </summary>
	[FileName] char(17) NOT NULL,

	--/ <summary> Comment </summary>
	[Com] char(12) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

