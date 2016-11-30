USE [SkyNode_NVSS]
GO

--/ <summary>The main PhotoObj table for the NVSS catalog</summary>
--/ <remarks>The main PhotoObj table for the NVSS catalog</remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object identifier</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>htmid for spatial searches</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>htmid for spatial searches</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Estimate of J2000 right ascension standard deviation</summary>
	--/ <unit>deg</unit>
	[raErr] [float] NOT NULL, 

	--/ <summary>Estimate of J2000 declination standard deviation</summary>
	--/ <unit>deg</unit>
	[decErr] [float] NOT NULL, 

	--/ <summary>Strength of the source</summary>
	--/ <unit>mJy</unit>
	[flux] [real] NOT NULL, 

	--/ <summary>Standard deviation estimate of the flux</summary>
	--/ <unit>mJy</unit>
	[fluxErr] [real] NOT NULL, 

	--/ <summary>Major axis size of the source</summary>
	[major] [real] NOT NULL, 

	--/ <summary>Estimated standard deviation of the major axis size (nulls allowed)</summary>
	[majorErr] [real] NULL, 

	--/ <summary>Minor axis size of the source</summary>
	[minor] [real] NOT NULL, 

	--/ <summary>Estimated standard deviation of the minor axis size (nulls allowed)</summary>
	[minorErr] [real] NULL, 

	--/ <summary>Orientation of the major axis on the sky (from N through E) (nulls allowed)</summary>
	--/ <unit>deg</unit>
	[pa] [real] NULL, 

	--/ <summary>Standard deviation estimate of Pa</summary>
	--/ <unit>deg</unit>
	[paErr] [real] NULL, 

	--/ <summary>Code indicating structure more complex than can be fitted by the Gaussian model(P=peak, R=RMS, S=integrated) (nulls allowed)</summary>
	[res] [varchar](1) NULL, 

	--/ <summary>offending value (nulls allowed)</summary>
	--/ <unit>100s of mJy</unit>
	[resOff] [smallint] NULL, 

	--/ <summary>Integrated linearly polarized flux density (nulls allowed)</summary>
	--/ <unit>mJy</unit>
	[p_flux] [real] NULL, 

	--/ <summary>Standard deviation estimate of the integrated linearly polarized flux density (nulls allowed)</summary>
	--/ <unit>mJy</unit>
	[p_fluxErr] [real] NULL, 

	--/ <summary>Position angle of the "E" vectors on the sky if the source was detected in linear polarization (nulls allowed)</summary>
	--/ <unit>deg</unit>
	[p_ang] [real] NULL, 

	--/ <summary>Standard deviation estimate of p_ang (nulls allowed)</summary>
	--/ <unit>deg</unit>
	[p_angErr] [real] NULL, 

	--/ <summary>Name of the original survey image field</summary>
	[field] [varchar](8) NOT NULL, 

	--/ <summary>X(Ra) pixel numbers of the center of the component</summary>
	[x_pix] [real] NOT NULL, 

	--/ <summary>Y(Dec) pixel numbers of the center of the component</summary>
	[y_pix] [real] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT [pk_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO


-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
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
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID]
ON [dbo].[PhotoObj] 
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