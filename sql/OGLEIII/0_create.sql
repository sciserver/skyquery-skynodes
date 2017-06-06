--/ <dataset>
--/ <summary> OGLE-III Catalog of Variable Stars </summary>
--/ <remarks>
--/ The catalog data include basic parameters of the stars (coordinates, periods, mean magnitudes, 
--/ amplitudes, parameters of the Fourier light curve decompositions), VI multi-epoch photometry 
--/ collected since 2001, and for some stars supplemented with the OGLE-II photometry obtained between 
--/ 1997 and 2000, finding charts and cross-identifications with previously published catalogs.
--/ </remarks>
--/ <url>http://ogledb.astrouw.edu.pl/~ogle/CVS/</url>
--/ <icon>ogleiii.png</icon>
--/ <docpage>ogleiii.html</docpage>
--/ </dataset>
 GO

-- CREATE VariableStars TABLE

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.VariableStars
(
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> OGLE-III ID </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[ID] char(20) NOT NULL,

	--/ <summary> Field Name </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[Field] char(8) NOT NULL,

	--/ <summary> Star ID </summary>
	--/ <quantity>meta.id</quantity>
	[StarID] bigint NOT NULL,

	--/ <summary> Type </summary>
	--/ <quantity>src.class</quantity>
	[Type] char(5) NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>src.class</quantity>
	[Subtype] char(9) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> OGLE-II ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID_OGLE_II] char(16) NOT NULL,

	--/ <summary> MACHO ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID_MACHO] char(14) NOT NULL,

	--/ <summary> ASAS ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID_ASAS] char(13) NOT NULL,

	--/ <summary> GCVS ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID_GCVS] char(6) NOT NULL,

	--/ <summary> OTHER ID </summary>
	--/ <quantity>meta.id.cross</quantity>
	[ID_OTHER] char(21) NOT NULL,

	--/ <summary> Mean I-band magnitude </summary>
	--/ <quantity>phot.mag;em.opt.I;stat.mean</quantity>
	--/ <unit> mag </unit>
	[I] real NOT NULL,

	--/ <summary> Mean V-band magnitude </summary>
	--/ <quantity>phot.mag;em.opt.V;stat.mean</quantity>
	--/ <unit> mag </unit>
	[V] real NOT NULL,

	--/ <summary> Period </summary>
	--/ <quantity>time.period</quantity>
	--/ <unit>d</unit>
	[P_1] real NOT NULL,

	--/ <summary> I-band amplitude </summary>
	--/ <quantity>src.var.amplitude;em.opt.I</quantity>
	[dP_1] float NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[T0_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[A_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R21_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi21_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R31_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi31_1] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>time.period</quantity>
	[P_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>src.var.amplitude</quantity>
	[dP_2] float NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[T0_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[A_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R21_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi21_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R31_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi31_2] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>time.period</quantity>
	[P_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity>src.var.amplitude</quantity>
	[dP_3] float NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[T0_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[A_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R21_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi21_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[R31_3] real NOT NULL,

	--/ <summary>  </summary>
	--/ <quantity></quantity>
	[phi31_3] real NOT NULL,

	--/ <summary> Remarks </summary>
	--/ <quantity>meta.note</quantity>
	[Remarks] char(85) NOT NULL,

	CONSTRAINT [PK_VariableStars] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

