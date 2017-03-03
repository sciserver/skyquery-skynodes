-- CREATE VLA TABLE
CREATE TABLE dbo.GOODSN
(

	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential id </summary>
	--/ <quantity>meta.record</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> Catalog Source Number </summary>
	--/ <quantity>meta.id</quantity>
	[Name] char(5) NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Error in the Right Ascension </summary>
	--/ <quantity>stat.errorpos.eq.ra;pos.frame=j2000;</quantity>
	--/ <unit> arcsec</unit>
	[e_RAs] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg  </unit>
	[DEC] float NOT NULL,

	--/ <summary> Error in the Declination </summary>
	--/ <quantity>stat.error;pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>  arcsec </unit>
	[e_DECs] float NOT NULL,

	--/ <summary> Peak Signal/Noise Ratio </summary>
	--/ <quantity>stat.snr</quantity>
	[SN] real NOT NULL,

	--/ <summary> Observed peak brightness. In units of microJanskeys/beam and 
	--/ uncorrected for primary beam or bandwidth smearing. </summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit> uJy </unit>
	[Peak] real NOT NULL,

	--/ <summary> Error in Observed peak brightness  </summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit> uJy </unit>
	[e_Peak] real NOT NULL,

	--/ <summary> Total Flux Density </summary>
	--/ <quantity>phot.flux.density</quantity>
	--/ <unit> uJy </unit>
	[Total] real NOT NULL,

	--/ <summary> Error in Total Flux Density </summary>
	--/ <quantity>stat.error;phot.flux.density</quantity>
	--/ <unit> uJy </unit>
	[e_Total] real NOT NULL,

	--/ <summary> Fitted Gaussian Major Axis FWHM </summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit> arcsec </unit>
	[bmaj] real NOT NULL,

	--/ <summary> Fitted Gaussian Minor Axis FWHM </summary>
	--/ <quantity>phys.angSize.sminAxis</quantity>
	--/ <unit> arcsec </unit>
	[bmin] real NOT NULL,

	--/ <summary> Fitted Position Angle </summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit> deg </unit>
	[PA] int NOT NULL,

	--/ <summary> bmaj-upper limit if bmaj=0.0. Or maximum size for very resolved sources. </summary>
	--/ <quantity>phys.angSize.sminAxis;stat.max</quantity>
	--/ <unit> arcsec </unit>
	[ulim] real NOT NULL,

	--/ <summary> map beam size </summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit> arcsec </unit>
	[beam] real NOT NULL,

	CONSTRAINT [PK_VLA] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

