--/ <dataset>
--/ <summary> The Large Sky Area Multi-Object Fiber Spectroscopic Telescope - Data Release 1 </summary>
--/ <remarks>
--/  the LAMOST general catalog. It includes 717,469 objects obtained from the LAMOST pilot survey, which 
--/  contains 648,746 stars, 2,723 galaxies, 621 quasars and 65,406 unknown objects, and 1,487,200 
--/  objects obtained from the LAMOST general survey, which contains 1,295,583 stars, 9,359 galaxies, 
--/  4,396 quasars and 177,862 unknown objects, so this catalog totally includes 2,204,696 objects 
--/  including 1,944,329 stars, 12,082 galaxies, 5,017 quasars and 243,268 unknown objects. In this 
--/  catalog, there are 1,186,132 objects with SNR of g band larger than 10, 1,680,794 objects with SNR
--/   of i band larger than 10, and 1,746,202 objects with SNR of g band larger than 10 and SNR of i 
--/  band larger than 10.
--/ </remarks>
--/ <url>http://dr1.lamost.org/</url>
--/ <icon>lamostdr1.png</icon>
--/ <docpage>lamostdr1.html</docpage>
--/ </dataset>
 GO

-- CREATE SpecObj TABLE

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.SpecObj
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
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.zone; pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Unique Spectra ID </summary>
	--/ <quantity>meta.id;spect</quantity>
	[obsid] bigint NOT NULL,

	--/ <summary> Target Designation </summary>
	--/ <quantity>meta.id</quantity>
	[designation] char(19) NOT NULL,

	--/ <summary> Target Observation Date </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[obsdate] char(10) NOT NULL,

	--/ <summary> Local Modified Julian Day </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[lmjd] float NOT NULL,

	--/ <summary> Plan Name </summary>
	--/ <quantity>meta.id;instr</quantity>
	[planid] char(20) NOT NULL,

	--/ <summary> Spectrograph ID </summary>
	--/ <quantity>meta.id;instr</quantity>
	[spid] int NOT NULL,

	--/ <summary> Fiber ID </summary>
	--/ <quantity>meta.id;instr</quantity>
	[fiberid] int NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[ra] float NOT NULL,

	--/ <summary> Declination </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[dec] float NOT NULL,

	--/ <summary> Signal Noise Ratio of u filter </summary>
	--/ <quantity>stat.snr;em.opt.SDSS.u</quantity>
	[snru] real NOT NULL,

	--/ <summary> Signal Noise Ratio of g filter </summary>
	--/ <quantity>stat.snr;em.opt.SDSS.g</quantity>
	[snrg] real NOT NULL,

	--/ <summary> Signal Noise Ratio of r filter </summary>
	--/ <quantity>stat.snr;em.opt.SDSS.r</quantity>
	[snrr] real NOT NULL,

	--/ <summary> Signal Noise Ratio of i filter </summary>
	--/ <quantity>stat.snr;em.opt.SDSS.i</quantity>
	[snri] real NOT NULL,

	--/ <summary> Signal Noise Ratio of z filter </summary>
	--/ <quantity>stat.snr;em.opt.SDSS.z</quantity>
	[snrz] real NOT NULL,

	--/ <summary> Object Type </summary>
	--/ <quantity></quantity>
	[objtype] char(10) NOT NULL,

	--/ <summary> Spectra Type </summary>
	--/ <quantity>instr.param</quantity>
	[class] char(7) NOT NULL,

	--/ <summary> Stellar Sub-Class </summary>
	--/ <quantity>src.class</quantity>
	[subclass] char(12) NOT NULL,

	--/ <summary> Target Magnitude Type </summary>
	--/ <quantity>meta.note;phot.mag</quantity>
	[magtype] char(10) NOT NULL,

	--/ <summary> Associated Magnitude 1 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag1] real NOT NULL,

	--/ <summary> Associated Magnitude 2 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag2] real NOT NULL,

	--/ <summary> Associated Magnitude 3 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag3] real NOT NULL,

	--/ <summary> Associated Magnitude 4 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag4] real NOT NULL,

	--/ <summary> Associated Magnitude 5 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag5] real NOT NULL,

	--/ <summary> Associated Magnitude 6 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag6] real NOT NULL,

	--/ <summary> Associated Magnitude 7 </summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit> mag </unit>
	[mag7] real NOT NULL,

	--/ <summary> Organization or person who submits input catalog </summary>
	--/ <quantity>meta.note</quantity>
	[tsource] char(10) NOT NULL,

	--/ <summary> Fiber Type of target [Obj, Sky, F-std, Unused, PosErr, Dead] </summary>
	--/ <quantity>meta.code;instr</quantity>
	[fibertype] char(5) NOT NULL,

	--/ <summary> Input catalog submitted by an organization or a person determined by the tsource </summary>
	--/ <quantity>meta.table</quantity>
	[tfrom] char(18) NOT NULL,

	--/ <summary> Target ID from SDSS, UCAC4, PANSTAR and other catalogue </summary>
	--/ <quantity>meta.id.cross</quantity>
	[t_info] char(23) NOT NULL,

	--/ <summary> Heliocentric Radial Velocity </summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit> km s-1 </unit>
	[rv] real NOT NULL,

	--/ <summary> Redshift </summary>
	--/ <quantity>src.redshif</quantity>
	[z] real NOT NULL,

	--/ <summary> Redshift Uncertainty </summary>
	--/ <quantity>stat.error;src.redshif</quantity>
	[z_err] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[obsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

