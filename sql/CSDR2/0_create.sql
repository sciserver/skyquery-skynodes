-- CREATE PhotoObj TABLE

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Numerical ID. </summary>	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Catalina Surveys identification (coded from the star's RA_2000 and DEC_2000 in the format: CSS_Jhhmmss.s+ddmmss). </summary>	--/ <quantity>meta.id</quantity>
	[csID] char(20) NOT NULL,

	--/ <summary> Right ascension in decimal degrees. </summary>	--/ <quantity>pos.eq.ra;</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees. </summary>	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X</summary>	--/ <quantity>pos.cartesian.x;pos.eq</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y</summary>	--/ <quantity>pos.cartesian.y;pos.eq</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z</summary>	--/ <quantity>pos.cartesian.z;pos.eq</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID</summary>	--/ <quantity>pos.HTM;pos.eq</quantity>
	[htmid] [float] NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.zone;pos.eq</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Magnitude in V band. </summary>	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit> mag </unit>
	[V]  real NOT NULL,

	--/ <summary>  Period in days. </summary>	--/ <quantity>time.period;src.var</quantity>
	--/ <unit> d </unit>
	[Period] float NOT NULL,

	--/ <summary>  Amplitude of the variation. </summary>	--/ <quantity>src.var.amplitude</quantity>
	[Amplitude] real NOT NULL,

	--/ <summary> Number of observations. </summary>	--/ <quantity>meta.number;obs</quantity>
	[NumberObs] real NOT NULL,

	--/ <summary> Variable type. </summary>	--/ <quantity>src.var.type</quantity>
	[Type] char(10) NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

