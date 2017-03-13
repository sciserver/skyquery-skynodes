--/ <summary> The main photometry table for the USNOB1.0 catalog </summary>
--/ <remarks> We created a bigint objid that is concatenated from  zone and seqNo, with zone in the upper 4 bytes of objid.  The table has been loaded by the ROE group, and has been  genereously shared with the JHU group. </remarks>
CREATE TABLE [dbo].[PhotoObj](
		
	--/ <summary>Main unique object identifier</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objid] [bigint] NOT NULL, 

	--/ <summary>The catalog is arranged in zones of 0.1deg in Dec, from 0 in South Pole to 1799 in North Pole</summary>
	--/ <quantity>meta.code</quantity>
	[zone] [smallint] NOT NULL, 

	--/ <summary>Sequence number of objects ordered by Right Ascension in the zone.</summary>
	--/ <quantity>meta.record</quantity>
	[seqNo] [int] NOT NULL, 

	--/ <summary>J2000 Celestial Right Ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 Celestial Declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM index, 20 digits, for co-ordinate</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL, 

	--/ <summary>ZoneID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL, 

	--/ <summary>Proper motion in RA (relative to YS4.0)</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmRA] [real] NOT NULL, 

	--/ <summary>Proper motion in DEC (relative to YS4.0)</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmDEC] [real] NOT NULL, 

	--/ <summary>Total Proper Motion probability</summary>
	--/ <quantity>stat.probability;pos.pm</quantity>
	[pmPr] [real] NOT NULL, 

	--/ <summary>Motion catalogue flag, 0=no, 1=yes</summary>
	--/ <quantity>meta.code</quantity>
	[mcFlag] [tinyint] NOT NULL, 

	--/ <summary>Mean error on pmRA</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[e_pmRA] [real] NOT NULL, 

	--/ <summary>Mean error on pmDEC</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[e_pmDEC] [real] NOT NULL, 

	--/ <summary>Mean error on RA fit</summary>
	--/ <quantity>stat.error;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[e_RAfit] [real] NOT NULL, 

	--/ <summary>Mean error on DEC fit</summary>
	--/ <quantity>stat.eror;pos.eq.ra</quantity>
	--/ <unit>arcsec</unit>
	[e_DECfit] [real] NOT NULL, 

	--/ <summary>Number of detections</summary>
	--/ <quantity>meta.number;obs</quantity>
	[Ndet] [tinyint] NOT NULL, 

	--/ <summary>Diffraction spike flag, 0=no, 1=yes</summary>
	--/ <quantity>meta.code</quantity>
	[difSp] [tinyint] NOT NULL, 

	--/ <summary>Mean error on ra*cos(dec) at Epoch</summary>
	--/ <quantity>stat.error;pos.eq.ra</quantity>
	--/ <unit>mas</unit>
	[e_RA] [real] NOT NULL, 

	--/ <summary>Mean error on dec at Epoch</summary>
	--/ <quantity>stat.error;pos.eq.dec</quantity>
	--/ <unit>mas</unit>
	[e_DEC] [real] NOT NULL, 

	--/ <summary>Mean epoch of observation</summary>
	--/ <quantity>time.epoch;stat.mean</quantity>
	--/ <unit>yr</unit>
	[Epoch] [real] NOT NULL, 

	--/ <summary>YS4.0 correlation flag, 0=no, 1=yes</summary>
	--/ <quantity>meta.code</quantity>
	[ys40] [tinyint] NOT NULL, 

	--/ <summary>First blue magnitude</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[B1Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	--/ <quantity>meta.ref;instr.calib</quantity>
	[B1C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	--/ <quantity>meta.id</quantity>
	[B1S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[B1F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[B1S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[B1Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[B1Eta] [real] NOT NULL, 

	--/ <summary>First red magnitude</summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[R1Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	--/ <quantity>meta.ref;instr.calib</quantity>
	[R1C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	--/ <quantity>meta.id</quantity>
	[R1S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[R1F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[R1S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[R1Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[R1Eta] [real] NOT NULL, 

	--/ <summary>Second blue magnitude</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[B2Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	--/ <quantity>meta.ref;instr.calib</quantity>
	[B2C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	--/ <quantity>meta.id</quantity>
	[B2S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	--/ <quantity>meta.id;obs</quantity>
	[B2F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[B2S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[B2Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[B2Eta] [real] NOT NULL, 

	--/ <summary>Second red magnitude</summary>
	--/ <quantity>phot.mag;em.opt.R</quantity>
	--/ <unit>mag</unit>
	[R2Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	--/ <quantity>meta.ref;instr.calib</quantity>
	[R2C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	--/ <quantity>meta.id</quantity>
	[R2S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[R2F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[R2S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[R2Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[R2Eta] [real] NOT NULL, 

	--/ <summary>Infrared (N) magnitude</summary>
	--/ <quantity>phot.mag;em.IR</quantity>
	--/ <unit>mag</unit>
	[NMag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	--/ <quantity>meta.ref;instr.calib</quantity>
	[NC] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	--/ <quantity>meta.id</quantity>
	[NS] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[NF] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[NS_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[NXi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <quantity>stat.fit.residual;pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[NEta] [real] NOT NULL, 

	--/ <summary>First blue look-back index into PMM scan file</summary>
	--/ <quantity>meta.code</quantity>
	[lbIdxB1] [int] NOT NULL, 

	--/ <summary>First red look-back index into PMM scan file</summary>
	--/ <quantity>meta.code</quantity>
	[lbIdxR1] [int] NOT NULL, 

	--/ <summary>Second blue look-back index into PMM scan file</summary>
	--/ <quantity>meta.code</quantity>
	[lbIdxB2] [int] NOT NULL, 

	--/ <summary>Second red look-back index into PMM scan file</summary>
	--/ <quantity>meta.code</quantity>
	[lbIdxR2] [int] NOT NULL, 

	--/ <summary>N look-back index into PMM scan file</summary>
	--/ <quantity>meta.code</quantity>
	[lbIdxN] [int] NOT NULL 

) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT [PK_PhotoObj] PRIMARY KEY
(
	[objid] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO
