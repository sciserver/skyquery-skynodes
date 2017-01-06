-- CREATE PhotoObj TABLE

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Numerical ID. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Catalina Surveys identification (coded from the star's RA_2000 and DEC_2000 in the format: CSS_Jhhmmss.s+ddmmss). </summary>
	[csID] char(20) NOT NULL,

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <unit>deg J2000</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] [float] NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> Magnitude in V band. </summary>
	--/ <unit> mag </unit>
	[V]  real NOT NULL,

	--/ <summary>  Period in days. </summary>
	--/ <unit> days </unit>
	[Period] float NOT NULL,

	--/ <summary>  Amplitude of the variation. </summary>
	[Amplitude] real NOT NULL,

	--/ <summary> Number of observations. </summary>
	[NumberObs] real NOT NULL,

	--/ <summary> Variable type. </summary>
	[Type] char(10) NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

