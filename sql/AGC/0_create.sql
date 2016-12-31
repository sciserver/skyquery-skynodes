--------------------------------------------------------------------------------
--/ <summary>Arecibo Galaxy Catalog</summary>
--/ <remarks>Objects from the Arecibo Galaxy Catalog, which provide 
--/ HI measurements of about 100,000 bright galaxies. Galaxy redshifts 
--/ are in km/s</remarks>
--------------------------------------------------------------------------------
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>Unique object identifier</summary>
	[objid] [bigint] NOT NULL, 

	--/ <summary>RA (J2000)</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>Dec (J2000)</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian x</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian y</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian z</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>the htmid of the object</summary>
	[htmID] [bigint] NOT NULL, 

	--/ <summary>the zoneid of the object</summary>
	[zoneID] [bigint] NOT NULL, 

	--/ <summary>Major axis</summary>
	--/ <unit>arcmin</unit>
	[a] [real] NOT NULL, 

	--/ <summary>Major axis</summary>
	--/ <unit>arcmin</unit>
	[b] [real] NOT NULL, 

	--/ <summary>B magnitude</summary>
	--/ <unit>mag</unit>
	[Bmag] [real] NOT NULL, 

	--/ <summary>Position angle</summary>
	--/ <unit>deg</unit>
	[angle] [real] NOT NULL, 

	--/ <summary>Morphological type</summary>
	[type] [varchar](8) NULL, 

	--/ <summary>Burstein morph type (enum)</summary>
	[btype] [int] NOT NULL, 

	--/ <summary>Optical velocity</summary>
	--/ <unit>km/s</unit>
	[velocity] [real] NOT NULL, 

	--/ <summary>Error of optical velocity</summary>
	--/ <unit>km/s</unit>
	[velocityError] [real] NOT NULL, 

	--/ <summary>Object name</summary>
	[objname] [varchar](64) NULL, 

	--/ <summary>HI flux</summary>
	--/ <unit>Jy*km/s</unit>
	[fluxHI] [real] NOT NULL, 

	--/ <summary>Noise HI rms</summary>
	--/ <unit>Jy*km/s</unit>
	[fluxHInoise] [real] NOT NULL, 

	--/ <summary>HI center velocity</summary>
	--/ <unit>km/s</unit>
	[centerVelocity] [real] NOT NULL, 

	--/ <summary>Velocity width</summary>
	--/ <unit>km/s</unit>
	[velocityWidth] [real] NOT NULL, 

	--/ <summary>Error of velocity width</summary>
	--/ <unit>km/s</unit>
	[velocityWidthError] [real] NOT NULL, 

	--/ <summary>Telescope code</summary>
	[telescopeCode] [char](1) NULL, 

	--/ <summary>HI detection code</summary>
	[HIdetectionCode] [tinyint] NOT NULL, 

	--/ <summary>HI signal-to-noise ratio</summary>
	[HIsnr] [smallint] NOT NULL, 

	--/ <summary>I band quality index</summary>
	[IbandQ] [tinyint] NOT NULL, 

	--/ <summary>Indicator of galaxy is part of RC3 catalog</summary>
	[RC3flag] [tinyint] NOT NULL, 

	--/ <summary>Flag for rotation curve database</summary>
	[IrotCat] [tinyint] NOT NULL, 
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
