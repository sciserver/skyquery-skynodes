-- CREATE VariableStars TABLE
CREATE TABLE dbo.VariableStars
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

	--/ <summary> OGLE-III ID </summary>
	[ID] char(20) NOT NULL,

	--/ <summary> Field Name </summary>
	[Field] char(8) NOT NULL,

	--/ <summary>  </summary>
	[StarID] bigint NOT NULL,

	--/ <summary> Type </summary>
	[Type] char(5) NOT NULL,

	--/ <summary>  </summary>
	[Subtype] char(9) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> OGLE-II ID </summary>
	[ID_OGLE_II] char(16) NOT NULL,

	--/ <summary> MACHO ID </summary>
	--/ <unit> ASAS ID </unit>
	[ID_MACHO] char(14) NOT NULL,

	--/ <summary> GCVS ID </summary>
	--/ <unit> OTHER ID </unit>
	[ID_ASAS] char(13) NOT NULL,

	--/ <summary> GCVS ID </summary>
	[ID_GCVS] char(6) NOT NULL,

	--/ <summary> OTHER ID </summary>
	[ID_OTHER] char(21) NOT NULL,

	--/ <summary> Mean I-band magnitude </summary>
	--/ <unit> mag </unit>
	[I] real NOT NULL,

	--/ <summary> Mean V-band magnitude </summary>
	--/ <unit> mag </unit>
	[V] real NOT NULL,

	--/ <summary> Period </summary>
	--/ <unit>d</unit>
	[P_1] real NOT NULL,

	--/ <summary> I-band amplitude </summary>
	[dP_1] float NOT NULL,

	--/ <summary>  </summary>
	[T0_1] real NOT NULL,

	--/ <summary>  </summary>
	[A_1] real NOT NULL,

	--/ <summary>  </summary>
	[R21_1] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_1] real NOT NULL,

	--/ <summary>  </summary>
	[R31_1] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_1] real NOT NULL,

	--/ <summary>  </summary>
	[P_2] real NOT NULL,

	--/ <summary>  </summary>
	[dP_2] float NOT NULL,

	--/ <summary>  </summary>
	[T0_2] real NOT NULL,

	--/ <summary>  </summary>
	[A_2] real NOT NULL,

	--/ <summary>  </summary>
	[R21_2] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_2] real NOT NULL,

	--/ <summary>  </summary>
	[R31_2] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_2] real NOT NULL,

	--/ <summary>  </summary>
	[P_3] real NOT NULL,

	--/ <summary>  </summary>
	[dP_3] float NOT NULL,

	--/ <summary>  </summary>
	[T0_3] real NOT NULL,

	--/ <summary>  </summary>
	[A_3] real NOT NULL,

	--/ <summary>  </summary>
	[R21_3] real NOT NULL,

	--/ <summary>  </summary>
	[phi21_3] real NOT NULL,

	--/ <summary>  </summary>
	[R31_3] real NOT NULL,

	--/ <summary>  </summary>
	[phi31_3] real NOT NULL,

	--/ <summary>  </summary>
	[Remarks] char(85) NOT NULL,

	CONSTRAINT [PK_VariableStars] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

