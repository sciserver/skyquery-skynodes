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

	--/ <summary> K20 identification number, CDFS_NNNNN or q0055_NNNNN </summary>
	--/ <quantity>meta.id</quantity>
	[Seq] char(11) NOT NULL,

	--/ <summary> Right ascension (J2000.0) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000.0) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Total (SExtractor BEST) Ks-band magnitude </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit> mag </unit>
	[Ksmag] real NOT NULL,

	--/ <summary> R-K colour index, measured in a 2"-diameter aperture corrected to total </summary>
	--/ <quantity>phot.color;em.opt.R;em.IR.K</quantity>
	[R_K] real NOT NULL,

	--/ <summary> Spectroscopic redshift </summary>
	--/ <quantity>src.redshift;spect</quantity>
	--/ <unit> mag </unit>
	[z] real NOT NULL,

	--/ <summary> [-1/1] Quality flag on redshfit. Quality flag on redshfit as follows:
	--/ 1=	solid redshift determination;
	--/ 0=	tentative redshift determination;
	--/ -1=	no redshfit determination. </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z] smallint NOT NULL,

	--/ <summary> Spectroscopic classes code. Spectroscopic classes as follows:
	--/ 0=	objects classified as stars;
	--/ 1=	red passive early-type galaxies;
	--/ 2=	blue emission-line galaxies;
	--/ 1.5=	intermediate galaxies with emission lines but red continuum indices;
	--/ 3=	galaxies which are not included in one of the three previous classes;
	--/ 4=	broad-line AGN. We remind that objects with only a tentative redshift (q_z=0) are not classified. </summary>
	--/ <quantity>meta.code;src.class.luminosity</quantity>
	[Class] char(3) NOT NULL,

	--/ <summary> Spectra file name in "sp" subdirectory </summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[FileName] char(17) NOT NULL,

	--/ <summary> Comment </summary>
	--/ <quantity>meta.note</quantity>
	[Com] char(12) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

