--/ <dataset>
--/ <summary>ASAS Catalog of Variable Stars </summary>
--/ <remarks>
--/ The ASAS-3 Catalog of Variable Stars contains over 10,000 eclipsing binaries, 
--/ almost 8,000 periodic pulsating and over 31,000 irregular stars found among 
--/ 15,000,000 stars on the sky south of the declination +28 (512 fields). 
--/ </remarks>
--/ <url>http://www.astrouw.edu.pl/asas/?page=main</url>
--/ <icon>acvs.png</icon>
--/ <docpage>acvs.html</docpage>
--/ </dataset>
 GO

--/ <summary> ASAS-3 Catalog of Variable Stars </summary>
--/ <remarks> All exposures were made using 'I ' band and 'V ' band filters, and were transformed into the standard 'I ' and 'V ' system using Landolt and Hipparcos. In most cases photometry is accurate to about 0.05 mag, but in many cases (due to problems with flatfielding and lack of colour information) errors could be 0.1 mag or larger. Positions are very inaccurate. </remarks>
--/ <icon>acvs.png</icon>
CREATE TABLE dbo.PhotoObj
(
	--/ <summary> Unique ID. </summary>	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> ASAS identification (coded from the star's RA_2000 and DEC_2000 in the format: hhmmss+ddmm.m). </summary>	--/ <quantity>meta.id</quantity>
	[objName] char(13) NOT NULL,

	--/ <summary> Right ascension in decimal degrees </summary>	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Declination in decimal degrees </summary>	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>	--/ <quantity>pos.eq.zone;;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Period in days (or characteristic time scale of variation for irregular objects). </summary>	--/ <quantity>time.period; src.var</quantity>
	--/ <unit> d </unit>
	[PER]  real NOT NULL,

	--/ <summary> Epoch of minimum (for eclipsing) or maximum (for pulsating) brightness. </summary>	--/ <quantity>time.epoch</quantity>
	[HJD0] float NOT NULL,

	--/ <summary> Brightness at maximum. </summary>	--/ <quantity>phot.mag; stat.max</quantity>
	--/ <unit> mag </unit>
	[VMAX] real NOT NULL,

	--/ <summary> Amplitude of variation. </summary>	--/ <quantity>src.var.amplitude</quantity>
	--/ <unit> mag </unit>
	[VAMP] real NOT NULL,

	--/ <summary> One of the predefined classes: DSCT, RRC, RRAB, DCEP_FU, DCEP_FO, CW, ACV, BCEP, MIRA and MISC, or its combination. </summary>	--/ <quantity>src.var.type</quantity>
	[TYPE] char(27) NOT NULL,

	--/ <summary> GCVS name. </summary>	--/ <quantity>meta.id.cross</quantity>
	[GCVS_ID] char(19) NOT NULL,

	--/ <summary> GCVS variability type. </summary>	--/ <quantity>src.var.type</quantity>
	[GCVS_TYPE] char(13) NOT NULL,

	--/ <summary> IRAS flux at 12 microns (listed as -2.5 log flux). </summary>	--/ <quantity>phot.flux; em.IR.IRAS.12</quantity>
	--/ <unit> Jy </unit>
	[IR12]  real NOT NULL,

	--/ <summary>  IRAS flux at 25 microns. </summary>	--/ <quantity>phot.flux; em.IR.IRAS.25</quantity>
	--/ <unit> Jy </unit>
	[IR25] real NOT NULL,

	--/ <summary>  IRAS flux at 60 microns. </summary>	--/ <quantity>phot.flux; em.IR.IRAS.60</quantity>
	--/ <unit> Jy </unit>
	[IR60] real NOT NULL,

	--/ <summary>  IRAS flux at 100 microns. </summary>	--/ <quantity>phot.flux; em.IR.IRAS.100</quantity>
	--/ <unit> Jy </unit>
	[IR100] real NOT NULL,

	--/ <summary> 2MASS J photometry. </summary>	--/ <quantity>phot.mag; em.IR.J</quantity>
	--/ <unit> mag </unit>
	[J] real NOT NULL,

	--/ <summary> 2MASS H photometry. </summary>	--/ <quantity>phot.mag; em.IR.H</quantity>
	--/ <unit> mag </unit>
	[H] real NOT NULL,

	--/ <summary> 2MASS K photometry. </summary>	--/ <quantity>phot.mag; em.IR.K</quantity>
	--/ <unit> mag </unit>
	[K]  real NOT NULL,

	--/ <summary> V-IR12 color index. </summary>	--/ <quantity>phot.color; em.opt.V; em.IR.IRAS.12</quantity>
	--/ <unit> mag </unit>
	[V_IR12] real NOT NULL,

	--/ <summary> V-J color index. </summary>	--/ <quantity>phot.color; em.opt.V; em.IR.J</quantity>
	--/ <unit> mag </unit>
	[V_J] real NOT NULL,

	--/ <summary> V-H color index. </summary>	--/ <quantity>phot.color; em.opt.V; em.IR.H</quantity>
	--/ <unit> mag </unit>
	[V_H] real NOT NULL,

	--/ <summary> V-K color index. </summary>	--/ <quantity>phot.color; em.opt.V; em.IR.K</quantity>
	--/ <unit> mag </unit>
	[V_K] real NOT NULL,

	--/ <summary> J-H color index. </summary>	--/ <quantity>phot.color; em.IR.J; em.IR.H</quantity>
	--/ <unit> mag </unit>
	[J_H] real NOT NULL,

	--/ <summary> H-K color index. </summary>	--/ <quantity>phot.color; em.IR.H; em.IR.K</quantity>
	--/ <unit> mag </unit>
	[H_K]  real NOT NULL,

 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

