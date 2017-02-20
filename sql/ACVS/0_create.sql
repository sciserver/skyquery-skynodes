-- CREATE PhotoObj TABLE

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary> Unique ID. </summary>
	[objID] bigint NOT NULL,

	--/ <summary> ASAS identification (coded from the star's RA_2000 and DEC_2000 in the format: hhmmss+ddmm.m). </summary>
	[objName] char(13) NOT NULL,

	--/ <summary> Right ascension in decimal degrees </summary>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees </summary>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

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

	--/ <summary> Period in days (or characteristic time scale of variation for irregular objects). </summary>
	--/ <unit> d </unit>
	[PER]  real NOT NULL,

	--/ <summary> Epoch of minimum (for eclipsing) or maximum (for pulsating) brightness. </summary>
	[HJD0] float NOT NULL,

	--/ <summary> Brightness at maximum. </summary>
	--/ <unit> mag </unit>
	[VMAX] real NOT NULL,

	--/ <summary> Amplitude of variation. </summary>
	--/ <unit> mag </unit>
	[VAMP] real NOT NULL,

	--/ <summary> One of the predefined classes: DSCT, RRC, RRAB, DCEP_FU, DCEP_FO, CW, ACV, BCEP, MIRA and MISC, or its combination. </summary>
	[TYPE] char(27) NOT NULL,

	--/ <summary> GCVS name. </summary>
	[GCVS_ID] char(19) NOT NULL,

	--/ <summary> GCVS variability type. </summary>
	[GCVS_TYPE] char(13) NOT NULL,

	--/ <summary> IRAS flux at 12 microns (listed as -2.5 log flux). </summary>
	--/ <unit> Jy </unit>
	[IR12]  real NOT NULL,

	--/ <summary>  IRAS flux at 25 microns. </summary>
	--/ <unit> Jy </unit>
	[IR25] real NOT NULL,

	--/ <summary>  IRAS flux at 60 microns. </summary>
	--/ <unit> Jy </unit>
	[IR60] real NOT NULL,

	--/ <summary>  IRAS flux at 100 microns. </summary>
	--/ <unit> Jy </unit>
	[IR100] real NOT NULL,

	--/ <summary> 2MASS J photometry. </summary>
	--/ <unit> mag </unit>
	[J] real NOT NULL,

	--/ <summary> 2MASS H photometry. </summary>
	--/ <unit> mag </unit>
	[H] real NOT NULL,

	--/ <summary> 2MASS K photometry. </summary>
	--/ <unit> mag </unit>
	[K]  real NOT NULL,

	--/ <summary> V-IR12 color index. </summary>
	--/ <unit> mag </unit>
	[V_IR12] real NOT NULL,

	--/ <summary> V-J color index. </summary>
	--/ <unit> mag </unit>
	[V_J] real NOT NULL,

	--/ <summary> V-H color index. </summary>
	--/ <unit> mag </unit>
	[V_H] real NOT NULL,

	--/ <summary> V-K color index. </summary>
	--/ <unit> mag </unit>
	[V_K] real NOT NULL,

	--/ <summary> J-H color index. </summary>
	--/ <unit> mag </unit>
	[J_H] real NOT NULL,

	--/ <summary> H-K color index. </summary>
	--/ <unit> mag </unit>
	[H_K]  real NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
