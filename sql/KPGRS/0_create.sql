-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X </summary>
	--/ <quantity>pos.eq.x; pos.frame=icrs</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y </summary>
	--/ <quantity>pos.eq.y; pos.frame=icrs</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z </summary>
	--/ <quantity>pos.eq.z; pos.frame=icrs</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID </summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=icrs</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone; pos.eq; pos.frame=icrs</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Identifying serial number. Objects in fields SA57, SA68, Her1, and Lynx2 begin with the digit 1, 2, 3, and 4, respectively.</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[MKK97] bigint NOT NULL,

	--/ <summary> Right ascension (ICRS) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=icrs</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (ICRS) (computed by VizieR, not part of the original data) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=icrs</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> Total RF (RF approx. (V+R)/2) magnitude. In SA57 and SA68, this means the magnitude within a circular aperture of radius 2*r1.
	--/ In Her1 and Lynx2, this means the FOCAS total magnitude (magnitude within an area at least twice the size of that contained within the 
	--/ detection isophote). </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[RFmag] real NOT NULL,

	--/ <summary> U-BJohnson color. In SA57 and SA68, the colors are derived from magnitudes measured in a circular aperture of radius 2*r1. 
	--/ In Her1 and Lynx2, the colors are derived from magnitudes measured in a circular aperture of radius 2 arcsec. 
	--/ The 5 off-scale values (MKK97= 103357, 103341, 213807, 217739, 316656) reflect the fact that the photometry for individual objects 
	--/ can be wrong due to plate defects or whatever. They clearly indicate that the photometry in at least one band for that object is questionable. </summary>
	--/ <quantity>phot.color;em.opt.Johnson.U;em.opt.Johnson.B</quantity>
	[U_BJ] real NOT NULL,

	--/ <summary> BJohnson-RF color. </summary>
	--/ <quantity>phot.color;em.opt.Johnson.B</quantity>
	[BJ_RF] real NOT NULL,

	--/ <summary> RF-IN color (IN approx. Kron-Cousins I).  </summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit> mag </unit>
	[RF_IN] real NOT NULL,

	--/ <summary> Redshift. Objects with a redshift of 0.0000 were morphologically classified as galaxies, but spectroscopically found to be stars. </summary>
	--/ <quantity>src.redshift</quantity>
	[z] real NOT NULL,

	--/ <summary> Redshift quality. q = min[6, min(1, Ndef) + 2 Ndef + Nprob], where Ndef and Nprob are the number of definite and probable features, respectively. </summary>
	--/ <quantity>meta.code.qual;src.redshift</quantity>
	[q_z] tinyint NOT NULL,

	--/ <summary> The sources of the redshift. (A—OO): multi-hole or multi-slit spectrum from the specified mask (cross-reference to column 1 in Table 5) 
	--/ (a—z): long-slit or multi-fiber spectrum from the specified observing run (cross-reference to column 1 in Table 3) 
	--/ (1) Spinrad, 1980, private communication; 
	--/ (2) Turner, 1980, private communication; 
	--/ (3) Based on observations obtained at the W. M. Keck Observatory, which is operated jointly by the California Institute of Technology and the 
	--/ University of California. </summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[r_z] char(9) NOT NULL,

	--/ <summary> The number of galaxies, brighter than this galaxy in RF and within the field-of-view of this galaxy's primary mask, for which no 
	--/ spectra were ever obtained and no other redshifts exist. </summary>
	--/ <quantity>meta.number;src</quantity>
	[Ns] smallint NOT NULL,

	--/ <summary> The number of galaxies, brighter than this galaxy in RF and part of the statistical sample defined by this galaxy's primary mask, 
	--/ which have been observed spectroscopically, but which lack definite redshifts (q&gt;2).  If this value is -1, then all galaxies brighter than 
	--/ this galaxy in F which are within the field-of-view of this galaxy's primary mask have q&gt;2 redshifts. </summary>
	--/ <quantity>meta.number;src</quantity>
	[Nb] smallint NOT NULL,

	--/ <summary> Notes. 
	--/ B: special target of the mask, selected as a bright galaxy; 
	--/ C: special target of the mask, selected as a member of a cluster of galaxies; 
	--/ J: special target of the mask, selected as a member of a faint J-selected sample; 
	--/ N: special target of the mask, selected as a candidate NELG; 
	--/ R: special target of the mask, selected as a radio source; 
	--/ U: special target of the mask, selected as a UV-excess source; 
	--/ X: not targeted by the mask, but accidentally fell within a slitlet or slit targeted at a different object. </summary>
	--/ <quantity>meta.note</quantity>
	[Note] char(1) NOT NULL,

	--/ <summary> Right ascension (1950) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=b1950</quantity>
	--/ <unit> h:m:s </unit>
	[RA1950] char(11) NOT NULL,

	--/ <summary> Declination (1950) </summary>
	--/ <quantity>pos.eq.dec.ra;pos.frame=b1950</quantity>
	--/ <unit> d:m:s </unit>
	[DE1950] char(11) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[MKK97] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

