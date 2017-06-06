--/ <dataset>
--/ <summary> The NRAO VLA Sky Survey </summary>
--/ <remarks>
--/ The NRAO VLA Sky Survey (NVSS) is a 1.4 GHz continuum survey covering the entire sky north of -40 deg declination.
--/ </remarks>
--/ <url>http://www.cv.nrao.edu/nvss/</url>
--/ <icon>nvss.png</icon>
--/ <docpage>nvss.html</docpage>
--/ </dataset>
 GO

--/ <summary>The main PhotoObj table for the NVSS catalog</summary>
--/ <remarks>The main PhotoObj table for the NVSS catalog</remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object identifier</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>cartesian x coordinate</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>cartesian y coordinate</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>cartesian z coordinate</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>htmid for spatial searches</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary> Zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>Estimate of J2000 right ascension standard deviation</summary>
	--/ <quantity>stat.stdev;pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[raErr] [float] NOT NULL, 

	--/ <summary>Estimate of J2000 declination standard deviation</summary>
	--/ <quantity>stat.stdev;pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[decErr] [float] NOT NULL, 

	--/ <summary>Strength of the source</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>mJy</unit>
	[flux] [real] NOT NULL, 

	--/ <summary>Standard deviation estimate of the flux</summary>
	--/ <quantity>stat.stdev;phot.flux</quantity>
	--/ <unit>mJy</unit>
	[fluxErr] [real] NOT NULL, 

	--/ <summary>Major axis size of the source</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	[major] [real] NOT NULL, 

	--/ <summary>Estimated standard deviation of the major axis size (nulls allowed)</summary>
	--/ <quantity>stat.stdev;phys.angSize.smajAxis</quantity>
	[majorErr] [real] NULL, 

	--/ <summary>Minor axis size of the source</summary>
	--/ <quantity>phys.angSize.sminAxis</quantity>
	[minor] [real] NOT NULL, 

	--/ <summary>Estimated standard deviation of the minor axis size (nulls allowed)</summary>
	--/ <quantity>stat.stdev;phys.angSize.sminAxis</quantity>
	[minorErr] [real] NULL, 

	--/ <summary>Orientation of the major axis on the sky (from N through E) (nulls allowed)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[pa] [real] NULL, 

	--/ <summary>Standard deviation estimate of Pa</summary>
	--/ <quantity>stat.stdev;pos.posAng</quantity>
	--/ <unit>deg</unit>
	[paErr] [real] NULL, 

	--/ <summary>Code indicating structure more complex than can be fitted by the Gaussian model(P=peak, R=RMS, S=integrated) (nulls allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[res] [varchar](1) NULL, 

	--/ <summary>offending value (nulls allowed)</summary>
	--/ <quantity></quantity>
	--/ <unit>1e2 mJy</unit>
	[resOff] [smallint] NULL, 

	--/ <summary>Integrated linearly polarized flux density (nulls allowed)</summary>
	--/ <quantity>phot.flux.density</quantity>
	--/ <unit>mJy</unit>
	[p_flux] [real] NULL, 

	--/ <summary>Standard deviation estimate of the integrated linearly polarized flux density (nulls allowed)</summary>
	--/ <quantity>stat.stdev;phot.flux.density</quantity>
	--/ <unit>mJy</unit>
	[p_fluxErr] [real] NULL, 

	--/ <summary>Position angle of the "E" vectors on the sky if the source was detected in linear polarization (nulls allowed)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[p_ang] [real] NULL, 

	--/ <summary>Standard deviation estimate of p_ang (nulls allowed)</summary>
	--/ <quantity>stat.stdev;pos.posAng</quantity>
	--/ <unit>deg</unit>
	[p_angErr] [real] NULL, 

	--/ <summary>Name of the original survey image field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [varchar](8) NOT NULL, 

	--/ <summary>X(Ra) pixel numbers of the center of the component</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	[x_pix] [real] NOT NULL, 

	--/ <summary>Y(Dec) pixel numbers of the center of the component</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
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
