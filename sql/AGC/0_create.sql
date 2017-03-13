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
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>Dec (J2000)</summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian x</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian y</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian z</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>the htmid of the object</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=J2000</quantity>
	[htmID] [bigint] NOT NULL, 

	--/ <summary>the zoneid of the object</summary>
	--/ <quantity>pos.zone; pos.eq; pos.frame=J2000</quantity>
	[zoneID] [bigint] NOT NULL, 

	--/ <summary>Major axis</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcmin</unit>
	[a] [real] NOT NULL, 

	--/ <summary>Minor axis</summary>
	--/ <quantity>phys.angSize.sminAxis</quantity>
	--/ <unit>arcmin</unit>
	[b] [real] NOT NULL, 

	--/ <summary>B magnitude</summary>
	--/ <quantity>phot.mag; em.opt.B</quantity>
	--/ <unit>mag</unit>
	[Bmag] [real] NOT NULL, 

	--/ <summary>Position angle</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[angle] [real] NOT NULL, 

	--/ <summary>Morphological type</summary>
	--/ <quantity>src.morph.type</quantity>
	[type] [varchar](8) NULL, 

	--/ <summary>Burstein morph type (enum)</summary>
	--/ <quantity>src.morph.tpye</quantity>
	[btype] [int] NOT NULL, 

	--/ <summary>Optical velocity</summary>
	--/ <quantity>spect.dopplerVeloc.opt</quantity>
	--/ <unit>km s-1</unit>
	[velocity] [real] NOT NULL, 

	--/ <summary>Error of optical velocity</summary>
	--/ <quantity>stat.error; spect.dopplerVeloc.opt</quantity>
	--/ <unit>km s-1</unit>
	[velocityError] [real] NOT NULL, 

	--/ <summary>Object name</summary>
	--/ <quantity>meta.id</quantity>
	[objname] [varchar](64) NULL, 

	--/ <summary>HI flux</summary>
	--/ <quantity>phot.flux; em.line.HI</quantity>
	--/ <unit>Jy km s-1</unit>
	[fluxHI] [real] NOT NULL, 

	--/ <summary>Noise HI rms</summary>
	--/ <quantity>stat.error; phot.flux; em.line.HI</quantity>
	--/ <unit>Jy km s-1</unit>
	[fluxHInoise] [real] NOT NULL, 

	--/ <summary>HI center velocity</summary>
	--/ <quantity>spect.dopplerVeloc; em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[centerVelocity] [real] NOT NULL, 

	--/ <summary>Velocity width</summary>
	--/ <quantity>spec.line.width</quantity>
	--/ <unit>km s-1</unit>
	[velocityWidth] [real] NOT NULL, 

	--/ <summary>Error of velocity width</summary>
	--/ <quantity>stat.error; spec.line.width</quantity>
	--/ <unit>km s-1</unit>
	[velocityWidthError] [real] NOT NULL, 

	--/ <summary>Telescope code</summary>
	--/ <quantity>meta.code; instr.tel</quantity>
	[telescopeCode] [char](1) NULL, 

	--/ <summary>HI detection code</summary>
	--/ <quantity>meta.code; obs</quantity>
	[HIdetectionCode] [tinyint] NOT NULL, 

	--/ <summary>HI signal-to-noise ratio</summary>
	--/ <quantity>stat.snr; em.line.HI</quantity>
	[HIsnr] [smallint] NOT NULL, 

	--/ <summary>I band quality index</summary>
	--/ <quantity>meta.code.qual; em.opt.I</quantity>
	[IbandQ] [tinyint] NOT NULL, 

	--/ <summary>Indicator of galaxy is part of RC3 catalog</summary>
	--/ <quantity>meta.code.member</quantity>
	[RC3flag] [tinyint] NOT NULL, 

	--/ <summary>Flag for rotation curve database</summary>
	--/ <quantity>meta.code.member</quantity>
	[IrotCat] [tinyint] NOT NULL, 
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
