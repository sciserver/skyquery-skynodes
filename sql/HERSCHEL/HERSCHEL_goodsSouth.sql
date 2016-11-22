USE [SkyNode_HERSCHEL]

GO

-- CREATE goodsSouth TABLE
CREATE TABLE dbo.goodsSouth
(

	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Sequential id </summary>
	[objID] bigint NOT NULL,

	--/ <summary> Zone ID (J2000)</summary>
	[zoneid] int NOT NULL,

	--/ <summary> GOODS IAU coded object identifier </summary>
	[IAU_name] char(25) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] float NOT NULL,

	--/ <summary> IRAC 3.6 um flux density </summary>
	--/ <unit> uJy </unit>
	[f3p6] real NOT NULL,

	--/ <summary> Error on IRAC 3.6 um flux density </summary>
	--/ <unit> uJy </unit>
	[err3p6] real NOT NULL,

	--/ <summary> IRAC 3.6 um source extraction flag. The IRAC source extraction flag come from the IRAC flag maps as described in
	--/ the GOODS project DR1 documentation. It's a composite flag based on the values
	--/ from the table below.

	--/   Flag value   Condition
	--/   ------------ -------------------------------------------
	--/   0            &gt; 50% of the modal exposure time
 	--/   1            &lt; 50% of the modal exposure time
	--/   2			   &lt; 20% of the modal exposure time
	--/   16           Region with significant residual muxbleed
	--/   64           No data (zero retained exposure time)

	--/ These values will often appear in combination. For example, regions with &lt; 20%
	--/ of the modal exposure time (flag value 2) also have &lt; 50% of the modal
	--/ exposure time (flag value 1). Therefore, those sources will have flag values
	--/ of 2 + 1 = 3. Regions with no data will have flag values 64 + 2 + 1 = 67.
	--/ Regions with residual muxbleed (flag 16) and also &lt; 50% modal exposure time	--/ 
	--/ (flag 1) will have flag 16 + 1 = 17. </summary>
	[flag3p6] int NOT NULL,

	--/ <summary> IRAC 4.5 um flux density </summary>
	--/ <unit> uJy </unit>
	[f4p5] real NOT NULL,

	--/ <summary> IRAC 4.5 um flux density </summary>
	--/ <unit> uJy </unit>
	[err4p5] real NOT NULL,

	--/ <summary> IRAC 4.5 um source extraction flag. For example, regions with &lt; 20%
	--/ of the modal exposure time (flag value 2) also have &lt; 50% of the modal
	--/ exposure time (flag value 1). Therefore, those sources will have flag values
	--/ of 2 + 1 = 3. Regions with no data will have flag values 64 + 2 + 1 = 67.
	--/ Regions with residual muxbleed (flag 16) and also &lt; 50% modal exposure time	--/ 
	--/ (flag 1) will have flag 16 + 1 = 17. </summary>
	[flag4p5] int NOT NULL,

	--/ <summary> IRAC 5.8 um flux density </summary>
	--/ <unit> uJy </unit>
	[f5p8] real NOT NULL,

	--/ <summary> Error on IRAC 5.8 um flux density </summary>
	--/ <unit> uJy </unit>
	[err5p8] real NOT NULL,

	--/ <summary> IRAC 5.8 um source extraction flag. For example, regions with &lt; 20%
	--/ of the modal exposure time (flag value 2) also have &lt; 50% of the modal
	--/ exposure time (flag value 1). Therefore, those sources will have flag values
	--/ of 2 + 1 = 3. Regions with no data will have flag values 64 + 2 + 1 = 67.
	--/ Regions with residual muxbleed (flag 16) and also &lt; 50% modal exposure time	--/ 
	--/ (flag 1) will have flag 16 + 1 = 17. </summary>
	[flag5p8] int NOT NULL,

	--/ <summary> IRAC 8.0 um flux density </summary>
	--/ <unit> uJy </unit>
	[f8p0] real NOT NULL,

	--/ <summary> Error on IRAC 8.0 um flux density </summary>
	--/ <unit> uJy </unit>
	[err8p0] real NOT NULL,

	--/ <summary> IRAC 8.0 um source extraction flag. For example, regions with &lt; 20%
	--/ of the modal exposure time (flag value 2) also have &lt; 50% of the modal
	--/ exposure time (flag value 1). Therefore, those sources will have flag values
	--/ of 2 + 1 = 3. Regions with no data will have flag values 64 + 2 + 1 = 67.
	--/ Regions with residual muxbleed (flag 16) and also &lt; 50% modal exposure time	--/ 
	--/ (flag 1) will have flag 16 + 1 = 17. </summary>
	[flag8p0] int NOT NULL,

	--/ <summary> MIPS 24 um flux density </summary>
	--/ <unit> uJy </unit>
	[f24] real NOT NULL,

	--/ <summary> MIPS 24 um flux error on residual map.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err24_ima] real NOT NULL,

	--/ <summary> MIPS 24 um flux error on Monte-Carlo simulations.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err24_sim] real NOT NULL,

	--/ <summary> MIPS 24 um coverage map value (equal to sec/pixel) </summary>
	[cov24] real NOT NULL,

	--/ <summary>  MIPS 70 um flux density </summary>
	--/ <unit> uJy </unit>
	[f70] real NOT NULL,

	--/ <summary> MIPS 70 um flux error on residual map.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err70_ima] real NOT NULL,

	--/ <summary> MIPS 70 um flux error on Monte-Carlo simulations.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err70_sim] real NOT NULL,

	--/ <summary> MIPS 70 um coverage map value (equal to sec/pixel) </summary>
	[cov70] real NOT NULL,

	--/ <summary> PACS 100 um flux density </summary>
	--/ <unit> uJy </unit>
	[f100] real NOT NULL,

	--/ <summary> PACS 100 um flux error on residual map.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err100_ima] real NOT NULL,

	--/ <summary> PACS 100 um flux error on Monte-Carlo simulations.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err100_sim] real NOT NULL,

	--/ <summary> PACS 100 um coverage map value (proportional to sec/pixel) </summary>
	[cov100] real NOT NULL,

	--/ <summary> PACS 160 um flux density </summary>
	--/ <unit> uJy </unit>
	[f160] real NOT NULL,

	--/ <summary> PACS 160 um flux error on residual map </summary>
	--/ <unit> uJy </unit>
	[err160_ima] real NOT NULL,

	--/ <summary> PACS 160 um flux error on Monte-Carlo simulations.
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	--/ <unit> uJy </unit>
	[err160_sim] real NOT NULL,

	--/ <summary> PACS 160 um coverage map value (proportional to sec/pixel).
	--/ Please, read the GOODS Herschel release document for a complete description of
	--/ the two noise estimations: errNNN_ima based on the residual map and errNNN_sim
	--/ based on Monte-Carlo simulations. In particular, to be conservative, users
	--/ should always use the highest uncertainty but not the quadratic combination of
	--/ both since they are not independent. Also, the Monte-Carlo simulations were
	--/ made on regions with relatively homogeneous exposure time; therefore,
	--/ uncertainties derived from these simulations are not suitable and hence not
	--/ provided for sources situated outside these homogeneous exposure time regions. </summary>
	[cov160] real NOT NULL,

	--/ <summary> Index measuring flux contamination from nearby sources. 
	--/ The clean_index measures the flux contamination by nearby sources. It is
	--/ computed as follows:

	--/ clean_index =
	--/     Neib24 + Neib100 x 10 + Neib160 � 100 + Neib250 x 1.000 + Neib350 x
 	--/    10.000 + Neib500 x 100.000

	--/ Where Neib24 (resp. Neib100, Neib160�) is the number of bright neighbours (see
	--/ the GOODS Herschel release document) at 24 um (resp. 100 um 160 um...). On
	--/ GOODS-South, it is assumed that Neib250 = Neib350 = Neib500 = 0. </summary>
	[clean_index] int NOT NULL,

	CONSTRAINT [PK.goodsSouth] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_goodsSouth_Zone] ON [dbo].[goodsSouth] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_goodsSouth_ZoneID] ON [dbo].[goodsSouth] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_goodsSouth_HtmID] ON [dbo].[goodsSouth] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO
