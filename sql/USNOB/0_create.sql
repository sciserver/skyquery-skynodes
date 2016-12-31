--/ <summary> The main photometry table for the USNOB1.0 catalog </summary>
--/ <remarks> We created a bigint objid that is concatenated from  zone and seqNo, with zone in the upper 4 bytes of objid.  The table has been loaded by the ROE group, and has been  genereously shared with the JHU group. </remarks>
CREATE TABLE [dbo].[PhotoObj](
		
	--/ <summary>Main unique object identifier</summary>
	[objid] [bigint] NOT NULL, 

	--/ <summary>The catalog is arranged in zones of 0.1deg in Dec, from 0 in South Pole to 1799 in North Pole</summary>
	[zone] [smallint] NOT NULL, 

	--/ <summary>Sequence number of objects ordered by Right Ascension in the zone.</summary>
	--/ <unit>deg (J2000)</unit>
	[seqNo] [int] NOT NULL, 

	--/ <summary>J2000 Celestial Right Ascension</summary>
	--/ <unit>deg (J2000)</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 Celestial Declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>unit vector of spherical co-ordinate</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM index, 20 digits, for co-ordinate</summary>
	[htmID] [bigint] NOT NULL, 

	--/ <summary>ZoneID</summary>
	[zoneID] [bigint] NOT NULL, 

	--/ <summary>Proper motion in RA (relative to YS4.0)</summary>
	--/ <unit>mas/yr</unit>
	[pmRA] [real] NOT NULL, 

	--/ <summary>Proper motion in DEC (relative to YS4.0)</summary>
	--/ <unit>mas/yr</unit>
	[pmDEC] [real] NOT NULL, 

	--/ <summary>Total Proper Motion probability</summary>
	[pmPr] [real] NOT NULL, 

	--/ <summary>Motion catalogue flag, 0=no, 1=yes</summary>
	[mcFlag] [tinyint] NOT NULL, 

	--/ <summary>Mean error on pmRA</summary>
	--/ <unit>myas/yr</unit>
	[e_pmRA] [real] NOT NULL, 

	--/ <summary>Mean error on pmDEC</summary>
	--/ <unit>mas/yr</unit>
	[e_pmDEC] [real] NOT NULL, 

	--/ <summary>Mean error on RA fit</summary>
	--/ <unit>arcsec</unit>
	[e_RAfit] [real] NOT NULL, 

	--/ <summary>Mean error on DEC fit</summary>
	--/ <unit>arcsec</unit>
	[e_DECfit] [real] NOT NULL, 

	--/ <summary>Number of detections</summary>
	[Ndet] [tinyint] NOT NULL, 

	--/ <summary>Diffraction spike flag, 0=no, 1=yes</summary>
	[difSp] [tinyint] NOT NULL, 

	--/ <summary>Mean error on ra*cos(dec) at Epoch</summary>
	--/ <unit>mas</unit>
	[e_RA] [real] NOT NULL, 

	--/ <summary>Mean error on dec at Epoch</summary>
	--/ <unit>mas</unit>
	[e_DEC] [real] NOT NULL, 

	--/ <summary>Mean epoch of observation</summary>
	--/ <unit>yr</unit>
	[Epoch] [real] NOT NULL, 

	--/ <summary>YS4.0 correlation flag, 0=no, 1=yes</summary>
	[ys40] [tinyint] NOT NULL, 

	--/ <summary>First blue magnitude</summary>
	--/ <unit>mag</unit>
	[B1Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	[B1C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	[B1S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	[B1F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	[B1S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <unit>arcsec</unit>
	[B1Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <unit>arcsec</unit>
	[B1Eta] [real] NOT NULL, 

	--/ <summary>First red magnitude</summary>
	--/ <unit>mag</unit>
	[R1Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	[R1C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	[R1S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	[R1F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	[R1S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <unit>arcsec</unit>
	[R1Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <unit>arcsec</unit>
	[R1Eta] [real] NOT NULL, 

	--/ <summary>Second blue magnitude</summary>
	--/ <unit>mag</unit>
	[B2Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	[B2C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	[B2S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	[B2F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	[B2S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <unit>arcsec</unit>
	[B2Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <unit>arcsec</unit>
	[B2Eta] [real] NOT NULL, 

	--/ <summary>Second red magnitude</summary>
	--/ <unit>mag</unit>
	[R2Mag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	[R2C] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	[R2S] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	[R2F] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	[R2S_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <unit>arcsec</unit>
	[R2Xi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <unit>arcsec</unit>
	[R2Eta] [real] NOT NULL, 

	--/ <summary>Infrared (N) magnitude</summary>
	--/ <unit>mag</unit>
	[NMag] [real] NOT NULL, 

	--/ <summary>source of photometric calibration</summary>
	[NC] [tinyint] NOT NULL, 

	--/ <summary>Survey number</summary>
	[NS] [tinyint] NOT NULL, 

	--/ <summary>Field number in survey</summary>
	[NF] [smallint] NOT NULL, 

	--/ <summary>Star-galaxy separation</summary>
	[NS_G] [tinyint] NOT NULL, 

	--/ <summary>Residual in X direction</summary>
	--/ <unit>arcsec</unit>
	[NXi] [real] NOT NULL, 

	--/ <summary>Residual in Y direction</summary>
	--/ <unit>arcsec</unit>
	[NEta] [real] NOT NULL, 

	--/ <summary>First blue look-back index into PMM scan file</summary>
	[lbIdxB1] [int] NOT NULL, 

	--/ <summary>First red look-back index into PMM scan file</summary>
	[lbIdxR1] [int] NOT NULL, 

	--/ <summary>Second blue look-back index into PMM scan file</summary>
	[lbIdxB2] [int] NOT NULL, 

	--/ <summary>Second red look-back index into PMM scan file</summary>
	[lbIdxR2] [int] NOT NULL, 

	--/ <summary>N look-back index into PMM scan file</summary>
	[lbIdxN] [int] NOT NULL 

) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PhotoObj]
ADD CONSTRAINT [PK_PhotoObj] PRIMARY KEY
(
	[objid] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO
