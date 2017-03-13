USE [SkyNode_SDSSDR13]
GO
/****** Object:  Table [dbo].[apogeeDesign]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the plate design information for APOGEE plates. </summary>
--/ <remarks> This table contains all the design parameters used in designing plates  for APOGEE spectra. </remarks>
CREATE TABLE [dbo].[apogeeDesign](

	--/ <summary>Design ID from plate design (Primary key)</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[designid] [varchar](64) NOT NULL,

	--/ <summary>Right ascension, J2000, of plate center</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000, of plate center</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Location ID (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Utilized radius of plate</summary>
	--/ <quantity>phys.angSize;inst.det</quantity>
	--/ <unit>deg</unit>
	[radius] [real] NOT NULL,

	--/ <summary>If set to 1, a plate shared with another survey (0 if not)</summary>
	--/ <quantity>meta.code</quantity>
	[shared] [tinyint] NOT NULL,

	--/ <summary>Additional comments on design</summary>
	--/ <quantity>meta.note</quantity>
	[comments] [varchar](200) NOT NULL,

	--/ <summary>Which of this field's short cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[short_cohort_version] [int] NOT NULL,

	--/ <summary>Which of this field's medium cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[medium_cohort_version] [int] NOT NULL,

	--/ <summary>Which of this field's long cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[long_cohort_version] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to short cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_short_fibers] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to medium cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_medium_fibers] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to long cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_long_fibers] [int] NOT NULL,

	--/ <summary>Minimum H mag of short cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[short_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of short cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[short_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum H mag of medium cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[medium_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of medium cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[medium_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum H mag of long cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[long_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of long cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[long_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum (J-Ks)o for this design; -1 if no color cut applied</summary>
	--/ <quantity>phot.color;em.IR.J;em.IR.H;stat.min</quantity>
	[dereddened_min_j_ks_color] [real] NOT NULL,

	--/ <summary>Total number of visits intended for this design</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_visits] [int] NOT NULL,

	--/ <summary>Number of hot star tellurics on this design (tellurics/science targets may overlap)</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_tellurics] [int] NOT NULL,

	--/ <summary>Number of sky targets on this design</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_sky] [int] NOT NULL,

	--/ <summary>Number of science targets on this design (tellurics/science targets may overlap)</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_science] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeField]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the basic information for an APOGEE field. </summary>
--/ <remarks> This table contains the name, location and number of visits expected  for an APOGEE field. </remarks>
CREATE TABLE [dbo].[apogeeField](

	--/ <summary>Name of field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field_name] [varchar](100) NOT NULL,

	--/ <summary>Location ID (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension of field center (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of field center (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,
	
	--/ <summary>Expected number of visits for this field (not necessarily the number of visits actually achieved)</summary>
	--/ <quantity>meta.number</quantity>
	[expected_no_of_visits] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeObject]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the targeting information for an APOGEE object. </summary>
--/ <remarks> This table contains all the parameters that went into targeting objects  for APOGEE spectra. </remarks>
CREATE TABLE [dbo].[apogeeObject](

	--/ <summary>ID identifying this target object</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](64) NOT NULL,

	--/ <summary>Unique targeting ID identifying this target object (of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>Alternate name for non-2MASS objects</summary>
	--/ <quantity>meta.id</quantity>
	[alt_id] [varchar](64) NOT NULL,

	--/ <summary>Location ID</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>2MASS J-band magnitude</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j] [real] NOT NULL,

	--/ <summary>2MASS J-band magnitude error</summary>
	--/ <quantity>stat;error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_err] [real] NOT NULL,

	--/ <summary>H-band magnitude</summary>
	--/ <quantity>error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h] [real] NOT NULL,

	--/ <summary>Source of H magnitude</summary>
	--/ <quantity>meta.ref;error;phot.mag;em.IR.H</quantity>
	[src_h] [varchar](100) NOT NULL,

	--/ <summary>H-band magnitude error</summary>
	--/ <quantity>stat.error;error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_err] [real] NOT NULL,

	--/ <summary>2MASS Ks-band magnitude</summary>
	--/ <quantity>error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k] [real] NOT NULL,

	--/ <summary>2MASS Ks-band magnitude error</summary>
	--/ <quantity>stat.error;error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_err] [real] NOT NULL,

	--/ <summary>IRAC 3.6 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC36</quantity>
	--/ <unit>mag</unit>
	[irac_3_6] [real] NOT NULL,

	--/ <summary>IRAC 3.6 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC36</quantity>
	--/ <unit>mag</unit>
	[irac_3_6_err] [real] NOT NULL,

	--/ <summary>IRAC 4.5 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_4_5] [real] NOT NULL,

	--/ <summary>IRAC 4.5 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_4_5_err] [real] NOT NULL,

	--/ <summary>source of 4.5 micron magnitude used for targeting</summary>
	--/ <quantity>meta.ref</quantity>
	[src_4_5] [varchar](100) NOT NULL,

	--/ <summary>IRAC 5.4 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC54</quantity>
	--/ <unit>mag</unit>
	[irac_5_8] [real] NOT NULL,

	--/ <summary>IRAC 5.4 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_5_8_err] [real] NOT NULL,

	--/ <summary>IRAC 8.0 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC80</quantity>
	--/ <unit>mag</unit>
	[irac_8_0] [real] NOT NULL,

	--/ <summary>IRAC 8.0 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC80</quantity>
	--/ <unit>mag</unit>
	[irac_8_0_err] [real] NOT NULL,

	--/ <summary>WISE allWISE release 4.5 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[wise_4_5] [real] NOT NULL,

	--/ <summary>WISE allWISE release 4.5 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[wise_4_5_err] [real] NOT NULL,

	--/ <summary>Ks-band extinction based on WISE allWISE release photometry</summary>
	--/ <quantity>phys.absorption.galactic;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[ak_wise] [real] NOT NULL,
	
	--/ <summary>E(B-V) at object's position in Schlegel, Finkbeiner, &amp; David (1998) maps</summary>
	--/ <quantity>phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[sfd_ebv] [real] NOT NULL,

	--/ <summary>Washington M magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_m] [real] NOT NULL,

	--/ <summary>Washington M magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_m_err] [real] NOT NULL,

	--/ <summary>Washington T2 magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_t2] [real] NOT NULL,

	--/ <summary>Washington T2 magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_t2_err] [real] NOT NULL,

	--/ <summary>DDO51 magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[DDO51] [real] NOT NULL,

	--/ <summary>DDO51 magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[DDO51_err] [real] NOT NULL,

	--/ <summary>Luminosity class classification derived from Wash+DDO51 data (1 = giant, 0 = dwarf, -1 = no data)</summary>
	--/ <quantity>meta.code;src.class.luminosity</quantity>
	[wash_ddo51_giant_flag] [int] NOT NULL,

	--/ <summary>Stellar classification based on Washington+DDO51 data (0=extended, 1=star-like or no data)</summary>
	--/ <quantity>meta.code;src.class.starGalaxy</quantity>
	[wash_ddo51_star_flag] [int] NOT NULL,

	--/ <summary>4.5 micron magnitude used for targeting</summary>
	--/ <quantity>phot.mag;em.IR.4-8um</quantity>
	--/ <unit>mag</unit>
	[targ_4_5] [real] NOT NULL,

	--/ <summary>Error in 4.5 micron magnitude used for targeting</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.4-8um</quantity>
	--/ <unit>mag</unit>
	[targ_4_5_err] [real] NOT NULL,

	--/ <summary>Ks-band extinction used for target selection</summary>
	--/ <quantity>phys.absorption.gal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[ak_targ] [real] NOT NULL,

	--/ <summary>Method to calculate Ks-band extinction used for target selection (RJCE_IRAC, RJCE_WISE_ALLSKY, RJCE_WISE_PARTSKY, RJCE_WISE_OPS2, RJCE_WISE_OPS, SFD_EBV, NONE)</summary>
	--/ <quantity>meta.note;</quantity>
	[ak_targ_method] [varchar](32) NOT NULL,

	--/ <summary>Proper motion in RA</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas/yr</unit>
	[pmra] [real] NOT NULL,

	--/ <summary>Uncertainty in proper motion in RA</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas/yr</unit>
	[pmra_err] [real] NOT NULL,

	--/ <summary>Proper motion in Dec</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas/yr</unit>
	[pmdec] [real] NOT NULL,

	--/ <summary>Uncertainty in proper motion in Dec</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas/yr</unit>
	[pmdec_err] [real] NOT NULL,

	--/ <summary>Source of proper motion data</summary>
	--/ <quantity>meta.ref;pos.pm</quantity>
	[pm_src] [varchar](100) NOT NULL,

	--/ <summary>Source of 2MASS optical counterpart</summary>
	--/ <quantity>meta.ref</quantity>
	[tmass_a] [varchar](32) NOT NULL,

	--/ <summary>Position angle of 2MASS optical counterpart (East of North)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[tmass_pxpa] [real] NOT NULL,

	--/ <summary>Proximity of 2MASS nearest neighbor</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[tmass_prox] [real] NOT NULL,

	--/ <summary>2MASS ph_qual flag</summary>
	--/ <quantity>meta.code.qual</quantity>
	[tmass_phqual] [varchar](32) NOT NULL,

	--/ <summary>2MASS read_flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_rdflg] [varchar](32) NOT NULL,

	--/ <summary>2MASS contamination flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_ccflg] [varchar](32) NOT NULL,

	--/ <summary>2MASS Extended Source Catalog ID of associated source</summary>
	--/ <quantity>meta.id.assoc</quantity>
	[tmass_extkey] [bigint] NOT NULL,

	--/ <summary>2MASS galaxy contamination flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_gal_contam] [varchar](32) NOT NULL,
 CONSTRAINT [pk_apogeeObject_target_id] PRIMARY KEY CLUSTERED 
(
	[target_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeePlate]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains all the information associated with an APOGEE plate. </summary>
--/ <remarks> This table contains the parameters for an APOGEE spectral plate </remarks>
CREATE TABLE [dbo].[apogeePlate](

	--/ <summary>Unique ID for plate visit, of form apogee.[telescope].[cs].plate.mjd (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[plate_visit_id] [varchar](64) NOT NULL,

	--/ <summary>Location ID (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Plate of this visit</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [varchar](32) NOT NULL,

	--/ <summary>MJD of this visit</summary>
	--/ <quantity>time.epoch</quantity>
	[mjd] [bigint] NOT NULL,

	--/ <summary>Visit reduction pipeline version</summary>
	--/ <quantity>meta.version</quantity>
	[apred_version] [varchar](32) NOT NULL,

	--/ <summary>Name of location that this plate belongs to</summary>
	--/ <quantity>met.id</quantity>
	[name] [varchar](64) NOT NULL,

	--/ <summary>Right ascension, J2000, of plate center</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[racen] [float] NOT NULL,

	--/ <summary>Declination, J2000, of plate center</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[deccen] [float] NOT NULL,

	--/ <summary>Utilized radius of plate</summary>
	--/ <quantity>phys.angSize;instr.det</quantity>
	--/ <unit>deg</unit>
	[radius] [real] NOT NULL,

	--/ <summary>If set to 1, a plate shared with another survey (0 if not)</summary>
	--/ <quantity>meta.code</quantity>
	[shared] [tinyint] NOT NULL,

	--/ <summary>Type of field</summary>
	--/ <quantity>meta.code;obs.field</quantity>
	[field_type] [tinyint] NOT NULL,

	--/ <summary>Survey name</summary>
	--/ <quantity>meta.id</quantity>
	[survey] [varchar](64) NOT NULL,

	--/ <summary>Program name within survey</summary>
	--/ <quantity>meta.id</quantity>
	[programname] [varchar](64) NOT NULL,

	--/ <summary>Plate run in which plate was drilled</summary>
	--/ <quantity>meta.note;instr.det</quantity>
	[platerun] [varchar](64) NOT NULL,

	--/ <summary>Design ID associated with plate  (Foreign key)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[designid] [bigint] NOT NULL,

	--/ <summary>Number of standard stars on plate</summary>
	--/ <quantity>meta.number;src</quantity>
	[nStandard] [bigint] NOT NULL,

	--/ <summary>Number of science stars on plate</summary>
	--/ <quantity>meta.number;src</quantity>
	[nScience] [bigint] NOT NULL,

	--/ <summary>Number of sky fibers on plate</summary>
	--/ <quantity>meta.number;instr.param</quantity>
	[nSky] [bigint] NOT NULL,

	--/ <summary>Version of platedesign used to create plate design</summary>
	--/ <quantity>meta.version</quantity>
	[platedesign_version] [varchar](10) NOT NULL,
 CONSTRAINT [pk_apogeePlate_plate_visit_id] PRIMARY KEY CLUSTERED 
(
	[plate_visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for an APOGEE star combined spectrum. </summary>
--/ <remarks> This table contains the data in the combined spectrum for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[apogeeStar](

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>ID star identification used within reductions</summary>
	--/ <quantity>meta.id</quantity>
	[reduction_id] [varchar](32) NOT NULL,

	--/ <summary>File base name with combined star spectrum</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[file] [varchar](128) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>emeta.id</quantity>
	[apogee_id] [varchar](32) NOT NULL,

	--/ <summary>Telescope where data was taken</summary>
	--/ <quantity>pos;instr.tel</quantity>
	[telescope] [varchar](32) NOT NULL,

	--/ <summary>Location ID for the field this visit is in (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Name of field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [varchar](100) NOT NULL,

	--/ <summary>Right ascension, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

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
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary> Zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL,

	--/ <summary>APOGEE target flag (first 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target1] [bigint] NOT NULL,

	--/ <summary>APOGEE target flag (second 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target2] [bigint] NOT NULL,

	--/ <summary>Shorthand flag to denote not a main survey object</summary>
	--/ <quantity>meta.code</quantity>
	[extratarg] [bigint] NOT NULL,

	--/ <summary>Number of visits contributing to the combined spectrum</summary>
	--/ <quantity>meta.number</quantity>
	[nvisits] [bigint] NOT NULL,

	--/ <summary>Set to 1 if this is commissioning data</summary>
	--/ <quantity>meta.code</quantity>
	[commiss] [bigint] NOT NULL,

	--/ <summary>Median signal-to-noise ratio per pixel</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[snr] [real] NOT NULL,

	--/ <summary>Bit mask with APOGEE star flags; each bit is set here if it is set in any visit</summary>
	--/ <quantity>meta.code</quantity>
	[starflag] [bigint] NOT NULL,

	--/ <summary>AND of visit bit mask with APOGEE star flags; each bit is set if set in all visits</summary>
	--/ <quantity>meta.code</quantity>
	[andflag] [bigint] NOT NULL,

	--/ <summary>Signal-to-noise weighted average of heliocentric radial velocity, as determined relative to combined spectrum, with zeropoint from xcorr of combined spectrum with best-fitting template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vhelio_avg] [real] NOT NULL,

	--/ <summary>Standard deviation of scatter of individual visit RVs around average</summary>
	--/ <quantity>stat.stdev;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vscatter] [real] NOT NULL,

	--/ <summary>Weighted error of heliocentric RV</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[verr] [real] NOT NULL,

	--/ <summary>Median of individual visit RV errors</summary>
	--/ <quantity>spect.dopplerVeloc;stat.median</quantity>
	--/ <unit>km s-1</unit>
	[verr_med] [real] NOT NULL,

	--/ <summary>Signal-to-noise weighted average of heliocentric radial velocity relative to single best-fit synthetic template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvhelio_avg] [real] NOT NULL,

	--/ <summary>Standard deviation of scatter of visit radial velocities determined from combined spectrum and best-fit synthetic template</summary>
	--/ <quantity>stat.stdev;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvscatter] [real] NOT NULL,

	--/ <summary>Error in signal-to-noise weighted average of heliocentric radial velocity relative to single best-fit synthetic template</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthverr] [real] NOT NULL,

	--/ <summary>Median of individual visit synthetic RV errors</summary>
	--/ <quantity>spect.dopplerVeloc;stat.median</quantity>
	--/ <unit>km s-1</unit>
	[synthverr_med] [real] NOT NULL,

	--/ <summary>effective temperature from RV template match</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[rv_teff] [real] NOT NULL,

	--/ <summary>log g from RV template match</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[rv_logg] [real] NOT NULL,

	--/ <summary>[Fe/H] from RV template match</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[rv_feh] [real] NOT NULL,

	--/ <summary>FWHM of cross-correlation peak from combined vs best-match synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[rv_ccfwhm] [real] NOT NULL,

	--/ <summary>FWHM of auto-correlation of best-match synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[rv_autofwhm] [real] NOT NULL,

	--/ <summary>scatter between RV using combined spectrum and RV using synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[synthscatter] [real] NOT NULL,

	--/ <summary>Chi-squared of RV distribution under assumption of a stable single-valued RV; perhaps not currently useful because of issues with understanding RV errors</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[stablerv_chi2] [real] NOT NULL,

	--/ <summary>Reduced chi^2 of RV distribution</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[stablerv_rchi2] [real] NOT NULL,

	--/ <summary>Threshold chi^2 for possible binary determination (not currently valid)</summary>
	--/ <quantity>stat.value;stat.fit.chi2</quantity>
	[chi2_threshold] [real] NOT NULL,

	--/ <summary>Probability of obtaining observed chi^2 under assumption of stable RV</summary>
	--/ <quantity>stat.probability</quantity>
	[stablerv_chi2_prob] [real] NOT NULL,

	--/ <summary>Reduction version of spectrum combination</summary>
	--/ <quantity>meta.version</quantity>
	[apstar_version] [varchar](32) NOT NULL
 CONSTRAINT [pk_apogeeStar_apstar_id] PRIMARY KEY CLUSTERED 
(
	[apstar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStarAllVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Links an APOGEE combined star spectrum with all visits for that star. </summary>
--/ <remarks> This is a linking table that links an APOGEE combined star spectrum  with all the visits for that star, including good, bad, commsssioning,  not, etc. </remarks>
CREATE TABLE [dbo].[apogeeStarAllVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,
 CONSTRAINT [pk_apogeeStarAllVisit_visit_id_a] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC,
	[apstar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStarVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the ApogeeStarFlag flag values from DataConstants as binary(4). </summary>
--/ <remarks> Please see the APOGEE_STARFLAG entry in Algorithms under Bitmasks  for further information. </remarks>
CREATE TABLE [dbo].[apogeeStarVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,
 CONSTRAINT [pk_apogeeStarVisit_visit_id] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a particular APOGEE spectrum visit. </summary>
--/ <remarks> This table corresponds to the data in a single spectrum visit in APOGEE  </remarks>
CREATE TABLE [dbo].[apogeeVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Visit reduction pipeline version (e.g. "r3")</summary>
	--/ <quantity>meta.version</quantity>
	[apred_version] [varchar](32) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>ID star identification used within reductions</summary>
	--/ <quantity>meta.id</quantity>
	[reduction_id] [varchar](32) NOT NULL,

	--/ <summary>File base name with visit spectrum and catalog information</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[file] [varchar](128) NOT NULL,

	--/ <summary>Telescope where data was taken</summary>
	--/ <quantity>pos;instr.tel</quantity>
	[telescope] [varchar](32) NOT NULL,

	--/ <summary>Fiber ID for this visit</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberid] [bigint] NOT NULL,

	--/ <summary>Plate of this visit</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [varchar](32) NOT NULL,

	--/ <summary>MJD of this visit</summary>
	--/ <quantity>time.epcoh</quantity>
	[mjd] [bigint] NOT NULL,

	--/ <summary>Location ID for the field this visit is in (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL,

	--/ <summary>APOGEE target flag (first 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target1] [bigint] NOT NULL,

	--/ <summary>APOGEE target flag (second 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target2] [bigint] NOT NULL,

	--/ <summary>Shorthand flag to denote not a main survey object</summary>
	--/ <quantity>meta.code</quantity>
	[extratarg] [bigint] NOT NULL,

	--/ <summary>Median signal-to-noise ratio per pixel</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[snr] [real] NOT NULL,

	--/ <summary>Bit mask with APOGEE star flags</summary>
	--/ <quantity>meta.code</quantity>
	[starflag] [bigint] NOT NULL,

	--/ <summary>Date of observation (YYYY-MM-DDTHH:MM:SS.SSS)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[dateobs] [varchar](100) NOT NULL,

	--/ <summary>Julian date of observation</summary>
	--/ <quantity>time.epcoh;obs</quantity>
	[jd] [float] NOT NULL,

	--/ <summary>Barycentric correction (VHELIO - VREL)</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[bc] [real] NOT NULL,

	--/ <summary>Radial velocity method (1 = chi-squared, 2 = cross-correlation, 3 = refined cross-correlation)</summary>
	--/ <quantity>meta.code;spect.dopplerVeloc</quantity>
	[vtype] [real] NOT NULL,

	--/ <summary>Derived radial velocity</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vrel] [real] NOT NULL,

	--/ <summary>Derived radial velocity error</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vrelerr] [real] NOT NULL,

	--/ <summary>Derived heliocentric radial velocity</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vhelio] [real] NOT NULL,
	
	--/ <summary>Chi-squared of match to TV template</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>[Fe/H] of radial velocity template</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[rv_feh] [real] NOT NULL,

	--/ <summary>Effective temperature of radial velocity template</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[rv_teff] [real] NOT NULL,

	--/ <summary>Log gravity of radial velocity template</summary>
	--/ <quantity>phys.grav</quantity>
	--/ <unit>dex</unit>
	[rv_logg] [real] NOT NULL,

	--/ <summary>[alpha/M] alpha-element abundance</summary>
	--/ <quantity>phys.abund</quantity>
	[rv_alpha] [real] NOT NULL,

	--/ <summary>[C/H] carbon abundance</summary>
	--/ <quantity>phys.abund</quantity>
	[rv_carb] [real] NOT NULL,

	--/ <summary>File name of synthetic grid</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[synthfile] [varchar](100) NOT NULL,

	--/ <summary>Initial radial velocity method for individual visit RV estimate (1 = chi-squared, 2 = cross-correlation)</summary>
	--/ <quantity>meta.code;spect.dopplerVeloc</quantity>
	[estvtype] [bigint] NOT NULL,

	--/ <summary>Initial radial velocity for individual visit RV estimate</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvrel] [real] NOT NULL,

	--/ <summary>Error in initial radial velocity for individual visit RV estimate</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvrelerr] [real] NOT NULL,

	--/ <summary>Initial heliocentric radial velocity for individual visit RV estimate</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvhelio] [real] NOT NULL,

	--/ <summary>Radial velocity from cross-correlation of individual visit against final template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvrel] [real] NOT NULL,

	--/ <summary>Radial velocity error from cross-correlation of individual visit against final template</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvrelerr] [real] NOT NULL,

	--/ <summary>Heliocentric radial velocity from cross-correlation of individual visit against final template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvhelio] [real] NOT NULL,
 CONSTRAINT [pk_apogeeVisit_visit_id] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[aspcapStar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for an APOGEE star ASPCAP entry. </summary>
--/ <remarks> This table contains the data in the ASPCAP entry for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[aspcapStar](

	--/ <summary>Unique ID of combined star spectrum on which these results are based (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for ASPCAP results of form apogee.[telescope].[cs].results_version.location_id.star (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_id] [varchar](64) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](32) NOT NULL,

	--/ <summary>reduction version of ASPCAP</summary>
	--/ <quantity>meta.version;obs.param</quantity>
	[aspcap_version] [varchar](32) NOT NULL,

	--/ <summary>reduction version of for post-processing</summary>
	--/ <quantity>meta.vers1d;obs.param</quantity>
	[results_version] [varchar](32) NOT NULL,

	--/ <summary>Empirically calibrated temperature from ASPCAP</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[teff] [real] NOT NULL,

	--/ <summary>external uncertainty estimate for calibrated temperature from ASPCAP</summary>
	--/ <quantity>stat.error;phys.temperature</quantity>
	--/ <unit>K</unit>
	[teff_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for effective temperature</summary>
	--/ <quantity>meta.code;phys.temperature</quantity>
	[teff_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated log gravity from ASPCAP</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[logg] [real] NOT NULL,

	--/ <summary>external uncertainty estimate for log gravity from ASPCAP</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[logg_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for log g</summary>
	--/ <quantity>meta.code;phys.gravity</quantity>
	[logg_flag] [int] NOT NULL,

	--/ <summary>chi^2 of ASPCAP fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[aspcap_chi2] [real] NOT NULL,

	--/ <summary>Temperature class of best-fitting spectrum</summary>
	--/ <quantity>phys.temperature</quantity>
	[aspcap_class] [varchar](100) NOT NULL,

	--/ <summary>Bitmask flag relating results of ASPCAP</summary>
	--/ <quantity>meta.code</quantity>
	[aspcapflag] [bigint] NOT NULL,

	--/ <summary>original fit temperature</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>deg K</unit>
	[fparam_teff] [real] NOT NULL,

	--/ <summary>original fit log g from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[fparam_logg] [real] NOT NULL,

	--/ <summary>log10 of the fit microturbulent velocity in km/s from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.veloc.microTurb</quantity>
	[fparam_logvmicro] [real] NOT NULL,

	--/ <summary>original fit [M/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[fparam_m_h] [real] NOT NULL,

	--/ <summary>original fit [C/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_c_m] [real] NOT NULL,

	--/ <summary>original fit [N/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_n_m] [real] NOT NULL,

	--/ <summary>original fit [alpha/M] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_alpha_m] [real] NOT NULL,

	--/ <summary>Empirically calibrated temperature from ASPCAP</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>deg K</unit>
	[param_teff] [real] NOT NULL,

	--/ <summary>Empirically calibrated surface gravity from ASPCAP</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[param_logg] [real] NOT NULL,

	--/ <summary>log10 of the empirically calibrated microturbulent velocity in km/s from ASPCAP</summary>
	--/ <quantity>phys.veloc.microTurb</quantity>
	--/ <unit>dex</unit>
	[param_logvmicro] [real] NOT NULL,

	--/ <summary>PARAMFLAG microturbulent velocity</summary>
	--/ <quantity>meta.code;phys.veloc.microTurb</quantity>
	[param_logvmicro_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated metal abundances [M/H] from ASPCAP</summary>
	--/ <quantity>phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[param_m_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated metal abundances [M/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[param_m_h_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [M/H]</summary>
	--/ <quantity>meta.code;phys.abund.Fe</quantity>
	[param_m_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [C/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_c_m] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [C/M]</summary>
	--/ <quantity>phys.abund</quantity>
	[param_c_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [N/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_n_m] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [N/M]</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[param_n_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [alpha/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_alpha_m] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [alpha/M] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_alpha_m_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [alpha/M]</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[param_alpha_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Al/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[al_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Al/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[al_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Al</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[al_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [C/H] from ASPCAP; [C/H] is calculated as (ASPCAP [C/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[c_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [C/H] from ASPCAP</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	--/ <unit>dex</unit>
	[c_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for C</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[c_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ca/H] from ASPCAP ; [Ca/H] is calculated as (ASPCAP [Ca/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ca_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ca/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ca_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ca</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ca_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Fe/H] from ASPCAP</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[fe_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Fe/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[fe_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Fe</summary>
	--/ <quantity>meta.code;phys.abund.Fe</quantity>
	[fe_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [K/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[k_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [K/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[k_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for K</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[k_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Mg/H] from ASPCAP; [Mg/H] is calculated as (ASPCAP [Mg/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[mg_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Mg/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[mg_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Mg</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[mg_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Mn/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[mn_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Mn/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[mn_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Mn</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[mn_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Na/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[na_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Na/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[na_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Na</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[na_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ni/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ni_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ni/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ni_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ni</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ni_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [N/H] from ASPCAP; [N/H] is calculated as (ASPCAP [N/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[n_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [N/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[n_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for N</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[n_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [O/H] from ASPCAP; [O/H] is calculated as (ASPCAP [O/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[o_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [O/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[o_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for O</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[o_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Si/H] from ASPCAP; [Si/H] is calculated as (ASPCAP [Si/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[si_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Si/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[si_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Si</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[si_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [S/H] from ASPCAP; [S/H] is calculated as (ASPCAP [S/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[s_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [S/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[s_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for S</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[s_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ti/H] from ASPCAP; [Ti/H] is calculated as (ASPCAP [Ti/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ti_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ti/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ti_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ti</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ti_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [V/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[v_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [V/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[v_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for V</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[v_h_flag] [int] NOT NULL,

	--/ <summary>original fit [Al/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_al_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Al/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_al_h_err] [real] NOT NULL,

	--/ <summary>original fit [C/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_c_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [C/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_c_m_err] [real] NOT NULL,

	--/ <summary>original fit [Ca/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ca_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ca/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ca_m_err] [real] NOT NULL,

	--/ <summary>original fit [Fe/H]</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[felem_fe_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Fe/H]</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[felem_fe_h_err] [real] NOT NULL,

	--/ <summary>original fit [K/H]</summary>
	--/ <quantity>phys.abund</quantity>
	[felem_k_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [K/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_k_h_err] [real] NOT NULL,

	--/ <summary>original fit [Mg/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mg_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Mg/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mg_m_err] [real] NOT NULL,

	--/ <summary>original fit [Mn/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mn_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Mn/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mn_h_err] [real] NOT NULL,

	--/ <summary>original fit [Na/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_na_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Na/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_na_h_err] [real] NOT NULL,

	--/ <summary>original fit [Ni/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ni_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ni/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ni_h_err] [real] NOT NULL,

	--/ <summary>original fit [N/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_n_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [N/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_n_m_err] [real] NOT NULL,

	--/ <summary>original fit [O/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_o_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [O/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_o_m_err] [real] NOT NULL,

	--/ <summary>original fit [Si/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_si_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Si/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_si_m_err] [real] NOT NULL,

	--/ <summary>original fit [S/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_s_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [S/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_s_m_err] [real] NOT NULL,

	--/ <summary>original fit [Ti/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ti_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ti/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ti_m_err] [real] NOT NULL,

	--/ <summary>original fit [V/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_v_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [V/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_v_h_err] [real] NOT NULL,
 CONSTRAINT [pk_aspcapStar_aspcap_id] PRIMARY KEY CLUSTERED 
(
	[aspcap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[aspcapStarCovar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the covariance information for an APOGEE star ASPCAP entry. </summary>
--/ <remarks> This table contains selected covariance matrix fields for the ASPCAP   entry for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[aspcapStarCovar](

	--/ <summary>Unique ID for this covariance matrix element of form apogee.[telescope].[cs].results_version.location_id.star.param_1.param_2 (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_covar_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for ASPCAP results of form apogee.[telescope].[cs].results_version.location_id.star</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_id] [varchar](64) NOT NULL,

	--/ <summary>Parameter #1 in covariance (0..6, corresponding to Teff, log(g), log(vmicro), [M/H], [C/M], [N/M], [alpha/M])</summary>
	--/ <quantity>stat.param</quantity>
	[param_1] [tinyint] NOT NULL,

	--/ <summary>Parameter #2 in covariance (0..6, corresponding to Teff, log(g), log(vmicro), [M/H], [C/M], [N/M], [alpha/M])</summary>
	--/ <quantity>stat.param</quantity>
	[param_2] [tinyint] NOT NULL,

	--/ <summary>Covariance between two parameters for this star (external estimate)</summary>
	--/ <quantity>stat.covar</quantity>
	[covar] [real] NOT NULL,

	--/ <summary>Covariance between two parameters for this star (internal estimate for original fit values)</summary>
	--/ <quantity>stat.covar</quantity>
	[fit_covar] [real] NOT NULL,
 CONSTRAINT [pk_aspcapStarCovar_aspcap_covar_] PRIMARY KEY CLUSTERED 
(
	[aspcap_covar_id] ASC,
	[aspcap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DataConstants]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> The table stores the values of various enumerated and bitmask columns. </summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[DataConstants](

	--/ <summary>Field Name</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [varchar](128) NOT NULL,

	--/ <summary>Constant Name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](128) NOT NULL,

	--/ <summary>Type value</summary>
	--/ <quantity>meta.code</quantity>
	[value] [binary](8) NOT NULL,

	--/ <summary>Short description</summary>
	--/ <quantity>meta.note</quantity>
	[description] [varchar](2000) NOT NULL,
 CONSTRAINT [pk_DataConstants_field_name] PRIMARY KEY CLUSTERED 
(
	[field] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[detectionIndex]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Full list of all detections, with associated 'thing' assignment. </summary>
--/ <remarks> Each row in this table corresponds to a single catalog entry,  or 'detection' in the SDSS imaging. For each one, this table  lists a 'thingId', which is common among all detections of   the same object in the catalog. </remarks>
CREATE TABLE [dbo].[detectionIndex](

	--/ <summary>thing ID number</summary>
	--/ <quantity>meta.id</quantity>
	[thingId] [bigint] NOT NULL,

	--/ <summary>object ID number (from run, camcol, field, id, rerun)</summary>
	--/ <quantity>meta.id</quantity>
	[objId] [bigint] NOT NULL,

	--/ <summary>1 if object is primary, 0 if not</summary>
	--/ <quantity>meta.code</quantity>
	[isPrimary] [tinyint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_detectionIndex_thingId_objID] PRIMARY KEY CLUSTERED 
(
	[thingId] ASC,
	[objId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[emissionLinesPort]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Emission line kinematics results for SDSS and BOSS galaxies using GANDALF </summary>
--/ <remarks> We fit galaxies using an adaptation of the publicly available Gas AND Absorption  Line Fitting (GANDALF, &lt;a href='http://adsabs.harvard.edu/abs/2006MNRAS.366.1151S'>Sarzi et al. 2006&lt;/a>)  and penalised PiXel Fitting (pPXF, &lt;a href='http://adsabs.harvard.edu/abs/2004PASP..116..138C'>Cappellari &amp; Emsellem 2004&lt;/a>).  Stellar population models for the continuum are from of &lt;a href='http://adsabs.harvard.edu/abs/2011MNRAS.418.2785M'>Maraston &amp; Str&ouml;mb&auml;ck (2011)&lt;/a> and  &lt;a href='http://adsabs.harvard.edu/abs/2011MNRAS.412.2183T'>Thomas, Maraston &amp; Johansson (2011)&lt;/a>. </remarks>
CREATE TABLE [dbo].[emissionLinesPort](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Index of chi^2 minimum corresponding to z_noqso</summary>
	--/ <quantity>meta.code;stat.fit.chi2</quantity>
	[zNum] [int] NOT NULL,

	--/ <summary>stellar velocity</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[velStars] [real] NOT NULL,

	--/ <summary>GANDALF-corrected redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[redshift] [real] NOT NULL,

	--/ <summary>Stellar velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigmaStars] [real] NOT NULL,

	--/ <summary>Error on measurement of stellar velocity dispersion</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigmaStarsErr] [real] NOT NULL,

	--/ <summary>chi-squared of best-fit template</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>Classification from Kauffmann et al. (2003), Kewley et al. (2001) and Schawinski et al. (2007) for objects with the emission lines H&amp;beta;, [OIII], H&amp;alpha;, [NII] [available] with A/N &gt; 1.5. Possible values: "BLANK" (if emission lines not available), "Star Forming", "Seyfert", "LINER", "Seyfert/LINER", "Composite"</summary>
	--/ <quantity>src.class</quantity>
	[bpt] [varchar](32) NOT NULL,

	--/ <summary>E(B-V) for internal reddening estimated from emission lines</summary>
	--/ <quantity>phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[ebmv] [real] NOT NULL,

	--/ <summary>Error in E(B-V)for internal reddening estimated from emission lines</summary>
	--/ <quantity>stat.error;phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[ebmv_err] [real] NOT NULL,

	--/ <summary>Set to 1 if error calculation failed (errors all set to zero in that case); otherwise, set to 0</summary>
	--/ <quantity>meta.code.error</quantity>
	[Error_Warning] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line HeII 3203</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeII 3203</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeII 3203</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeII 3203</summary>
	--/ <quantity>phot.flux;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeII 3203</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeII 3203</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeII_3203] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeII 3203</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeII_3203] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeV] 3345</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeV] 3345</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeV] 3345</summary>
	--/ <quantity>phot.flux;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeV] 3345</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeV_3345] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeV_3345] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeV] 3425</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeV] 3425</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeV] 3425</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeV] 3425</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeV_3425] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeV_3425] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OII] 3726</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3726] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OII] 3726</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3726] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3726] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OII] 3726</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3726] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3726] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OII] 3726</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3726] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OII_3726] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OII_3726] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OII] 3728</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3728] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OII] 3728</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3728] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3728] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OII] 3728</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3728] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3728] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OII] 3728</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3728] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OII_3728] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OII_3728] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeIII] 3868</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeIII] 3868</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeIII] 3868</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeIII] 3868</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeIII_3868] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeIII_3868] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeIII] 3967</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeIII] 3967</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeIII] 3967</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeIII] 3967</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeIII] 3967</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeIII] 3967</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeIII_3967] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeIII] 3967</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeIII_3967] [real] NOT NULL,

	--/ <summary>Velocity of emission line H5 3889</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_H5_3889] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line H5 3889</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line H5 3889</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_H5_3889] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line H5 3889</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line H5 3889</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_H5_3889] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line H5 3889</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line H5 3889</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_H5_3889] [real] NOT NULL,

	--/ <summary>Error in flux of emission line H5 3889</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line H5 3889</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_H5_3889] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line H5 3889</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line H5 3889</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_H5_3889] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line H5 3889</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_H5_3889] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line H5 3889</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_H5_3889] [real] NOT NULL,

	--/ <summary>Velocity of emission line He 3970</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_He_3970] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line He 3970</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_He_3970_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line He 3970</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_He_3970] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line He 3970</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_He_3970_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line He 3970</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_He_3970] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line He 3970</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_He_3970_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line He 3970</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_He_3970] [real] NOT NULL,

	--/ <summary>Error in flux of emission line He 3970</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_He_3970_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line He 3970</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_He_3970] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line He 3970</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_He_3970_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line He 3970</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_He_3970] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line He 3970</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_He_3970_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_He_3970] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line He 3970</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_He_3970] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hd 4101</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hd 4101</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hd 4101</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hd 4101</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hd 4101</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hd 4101</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hd 4101</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hd 4101</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hd_4101] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hd 4101</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hd_4101] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hg 4340</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hg 4340</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hg 4340</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hg 4340</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hg 4340</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hg 4340</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hg 4340</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hg 4340</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hg_4340] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hg 4340</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hg_4340] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 4363</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 4363</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 4363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 4363</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 4363</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 4363</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_4363] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OIII] 4363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OIII_4363] [real] NOT NULL,

	--/ <summary>Velocity of emission line HeII 4685</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeII 4685</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeII 4685</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeII 4685</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeII 4685</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeII 4685</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeII 4685</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeII 4685</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeII_4685] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeII 4685</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeII_4685] [real] NOT NULL,

	--/ <summary>Velocity of emission line [ArIV] 4711</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [ArIV] 4711</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [ArIV] 4711</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [ArIV] 4711</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_ArIV_4711] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_ArIV_4711] [real] NOT NULL,

	--/ <summary>Velocity of emission line [ArIV] 4740</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [ArIV] 4740</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [ArIV] 4740</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [ArIV] 4740</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_ArIV_4740] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_ArIV_4740] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hb 4861</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hb 4861</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hb 4861</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hb 4861</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hb 4861</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hb 4861</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hb 4861</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hb 4861</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hb_4861] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hb 4861</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hb_4861] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 4958</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 4958</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 4958</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 4958</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 4958</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 4958</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_4958] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 5006</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 5006</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 5006</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 5006</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_5006] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OIII_5006] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NI] 5197</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5197] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NI] 5197</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5197] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5197] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NI] 5197</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5197] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5197] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NI] 5197</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5197] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NI_5197] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NI_5197] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NI] 5200</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5200] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NI] 5200</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5200] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5200] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NI] 5200</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5200] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5200] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NI] 5200</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5200] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NI_5200] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NI_5200] [real] NOT NULL,

	--/ <summary>Velocity of emission line HeI 5875</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeI 5875</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeI 5875</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeI 5875</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeI 5875</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeI 5875</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeI 5875</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeI 5875</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeI_5875] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeI 5875</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeI_5875] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OI] 6300</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6300] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OI] 6300</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6300] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6300] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OI] 6300</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6300] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6300] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OI] 6300</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6300] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OI_6300] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OI_6300] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OI] 6363</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6363] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OI] 6363</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6363] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6363] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OI] 6363</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6363] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6363] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OI] 6363</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6363] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OI_6363] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OI_6363] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NII] 6547</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6547] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NII] 6547</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6547] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NII] 6547</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6547] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NII] 6547</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6547] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NII] 6547</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6547] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NII] 6547</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6547] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NII_6547] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line Ha 6562</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Ha 6562</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Ha 6562</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Ha 6562</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Ha 6562</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Ha 6562</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Ha 6562</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Ha 6562</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Ha_6562] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Ha 6562</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Ha_6562] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NII] 6583</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6583] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NII] 6583</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6583] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6583] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NII] 6583</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6583] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6583] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NII] 6583</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6583] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NII_6583] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NII_6583] [real] NOT NULL,

	--/ <summary>Velocity of emission line [SII] 6716</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6716] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [SII] 6716</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6716] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6716] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [SII] 6716</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6716] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6716] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [SII] 6716</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6716] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_SII_6716] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_SII_6716] [real] NOT NULL,

	--/ <summary>Velocity of emission line [SII] 6730</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6730] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [SII] 6730</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6730] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6730] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [SII] 6730</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6730] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6730] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [SII] 6730</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6730] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_SII_6730] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_SII_6730] [real] NOT NULL,
 CONSTRAINT [pk_emissionLinesPort_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Field]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> All the measured parameters and calibrations of a photometric field </summary>
--/ <remarks> A field is a 2048x1489 pixel section of a camera column.   This table contains summary results of the photometric   and calibration pipelines for each field. </remarks>
CREATE TABLE [dbo].[Field](

	--/ <summary>Unique SDSS identifier composed from [skyVersion,rerun,run,camcol,field].</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Layer of catalog (currently only one layer, 0; 0-15 available)</summary>
	--/ <quantity>meta.version</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>Number of total objects in the field</summary>
	--/ <quantity>meta.number;src</quantity>
	[nTotal] [smallint] NOT NULL,

	--/ <summary>Number of non-bright objects in the field</summary>
	--/ <quantity>meta.number;src</quantity>
	[nObjects] [smallint] NOT NULL,

	--/ <summary>Number of "child" objects in the field</summary>
	--/ <quantity>meta.number</quantity>
	[nChild] [smallint] NOT NULL,

	--/ <summary>Number of objects classified as "galaxy"</summary>
	--/ <quantity>meta.number;src</quantity>
	[nGalaxy] [smallint] NOT NULL,

	--/ <summary>Number of objects classified as "star"</summary>
	--/ <quantity>meta.number;src</quantity>
	[nStars] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nCR_u] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nCR_g] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nCR_r] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nCR_i] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nCR_z] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nBrightObj_u] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nBrightObj_g] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nBrightObj_r] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nBrightObj_i] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nBrightObj_z] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nFaintObj_u] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nFaintObj_g] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nFaintObj_r] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nFaintObj_i] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nFaintObj_z] [smallint] NOT NULL,

	--/ <summary>Quality of field</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	[quality] [int] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of u-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	[mjd_u] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of g-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	[mjd_g] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of r-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	[mjd_r] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of i-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	[mjd_i] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of z-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	[mjd_z] [float] NOT NULL,

	--/ <summary>a term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[a_u] [float] NOT NULL,

	--/ <summary>a term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[a_g] [float] NOT NULL,

	--/ <summary>a term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[a_r] [float] NOT NULL,

	--/ <summary>a term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[a_i] [float] NOT NULL,

	--/ <summary>a term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[a_z] [float] NOT NULL,

	--/ <summary>b term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[b_u] [float] NOT NULL,

	--/ <summary>b term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[b_g] [float] NOT NULL,

	--/ <summary>b term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[b_r] [float] NOT NULL,

	--/ <summary>b term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[b_i] [float] NOT NULL,

	--/ <summary>b term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[b_z] [float] NOT NULL,

	--/ <summary>c term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[c_u] [float] NOT NULL,

	--/ <summary>c term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[c_g] [float] NOT NULL,

	--/ <summary>c term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[c_r] [float] NOT NULL,

	--/ <summary>c term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[c_i] [float] NOT NULL,

	--/ <summary>c term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[c_z] [float] NOT NULL,

	--/ <summary>d term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[d_u] [float] NOT NULL,

	--/ <summary>d term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[d_g] [float] NOT NULL,

	--/ <summary>d term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[d_r] [float] NOT NULL,

	--/ <summary>d term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[d_i] [float] NOT NULL,

	--/ <summary>d term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[d_z] [float] NOT NULL,

	--/ <summary>e term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[e_u] [float] NOT NULL,

	--/ <summary>e term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[e_g] [float] NOT NULL,

	--/ <summary>e term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[e_r] [float] NOT NULL,

	--/ <summary>e term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[e_i] [float] NOT NULL,

	--/ <summary>e term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[e_z] [float] NOT NULL,

	--/ <summary>f term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[f_u] [float] NOT NULL,

	--/ <summary>f term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[f_g] [float] NOT NULL,

	--/ <summary>f term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[f_r] [float] NOT NULL,

	--/ <summary>f term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[f_i] [float] NOT NULL,

	--/ <summary>f term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[f_z] [float] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow0_u] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow0_g] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow0_r] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow0_i] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow0_z] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow1_u] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow1_g] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow1_r] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow1_i] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow1_z] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow2_u] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow2_g] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow2_r] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow2_i] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow2_z] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow3_u] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow3_g] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow3_r] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow3_i] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow3_z] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol0_u] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol0_g] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol0_r] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol0_i] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol0_z] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol1_u] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol1_g] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol1_r] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol1_i] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol1_z] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol2_u] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol2_g] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol2_r] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol2_i] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol2_z] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol3_u] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol3_g] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol3_r] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol3_i] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol3_z] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[csRow_u] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[csRow_g] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[csRow_r] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[csRow_i] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[csRow_z] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[csCol_u] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[csCol_g] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[csCol_r] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[csCol_i] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[csCol_z] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[ccRow_u] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[ccRow_g] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[ccRow_r] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[ccRow_i] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[ccRow_z] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[ccCol_u] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[ccCol_g] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[ccCol_r] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[ccCol_i] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[ccCol_z] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for u-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[riCut_u] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for g-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[riCut_g] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for r-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[riCut_r] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for i-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[riCut_i] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for z-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[riCut_z] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through u-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[airmass_u] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through g-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[airmass_g] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through r-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[airmass_r] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through i-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[airmass_i] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through z-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[airmass_z] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for u-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[muErr_u] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for g-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[muErr_g] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for r-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[muErr_r] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for i-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[muErr_i] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for z-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[muErr_z] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for u-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_u] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for g-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_g] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for r-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_r] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for i-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_i] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for z-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_z] [real] NOT NULL,

	--/ <summary>Center RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Center Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Minimum RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.min</quantity>
	--/ <unit>deg</unit>
	[raMin] [float] NOT NULL,

	--/ <summary>Maximum RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.max</quantity>
	--/ <unit>deg</unit>
	[raMax] [float] NOT NULL,

	--/ <summary>Minimum Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.min</quantity>
	--/ <unit>deg</unit>
	[decMin] [float] NOT NULL,

	--/ <summary>Maximum Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.max</quantity>
	--/ <unit>deg</unit>
	[decMax] [float] NOT NULL,

	--/ <summary>Mean size of pixel (r-band)</summary>
	--/ <quantity>phys.angSize;instr.pixel</quantity>
	--/ <unit>arcsec pix-1</unit>
	[pixScale] [float] NOT NULL,

	--/ <summary>Area covered by primary part of field</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[primaryArea] [float] NOT NULL,

	--/ <summary>Frames processing status bitmask</summary>
	--/ <quantity>meta.code.status</quantity>
	[photoStatus] [int] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (u-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[rowOffset_u] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (g-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[rowOffset_g] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (r-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[rowOffset_r] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (i-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[rowOffset_i] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (z-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[rowOffset_z] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (u-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[colOffset_u] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (g-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[colOffset_g] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (r-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[colOffset_r] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (i-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[colOffset_i] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (z-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[colOffset_z] [real] NOT NULL,

	--/ <summary>Saturation level in u-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[saturationLevel_u] [int] NOT NULL,

	--/ <summary>Saturation level in g-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[saturationLevel_g] [int] NOT NULL,

	--/ <summary>Saturation level in r-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[saturationLevel_r] [int] NOT NULL,

	--/ <summary>Saturation level in i-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[saturationLevel_i] [int] NOT NULL,

	--/ <summary>Saturation level in z-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[saturationLevel_z] [int] NOT NULL,

	--/ <summary>Effective area of PSF (u-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_u] [real] NOT NULL,

	--/ <summary>Effective area of PSF (g-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_g] [real] NOT NULL,

	--/ <summary>Effective area of PSF (r-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_r] [real] NOT NULL,

	--/ <summary>Effective area of PSF (i-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_i] [real] NOT NULL,

	--/ <summary>Effective area of PSF (z-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_z] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (u-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyPsp_u] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (g-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyPsp_g] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (r-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyPsp_r] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (i-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyPsp_i] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (z-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyPsp_z] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFrames_u] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFrames_g] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFrames_r] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFrames_i] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFrames_z] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFramesSub_u] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFramesSub_g] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFramesSub_r] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFramesSub_i] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyFramesSub_z] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in u-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sigPix_u] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in g-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sigPix_g] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in r-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sigPix_r] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in i-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sigPix_i] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in z-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sigPix_z] [real] NOT NULL,

	--/ <summary>deV aperture correction (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[devApCorrection_u] [real] NOT NULL,

	--/ <summary>deV aperture correction (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[devApCorrection_g] [real] NOT NULL,

	--/ <summary>deV aperture correction (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[devApCorrection_r] [real] NOT NULL,

	--/ <summary>deV aperture correction (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[devApCorrection_i] [real] NOT NULL,

	--/ <summary>deV aperture correction (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[devApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[devApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[devApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[devApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[devApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[devApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>exponential aperture correction (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[expApCorrection_u] [real] NOT NULL,

	--/ <summary>exponential aperture correction (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[expApCorrection_g] [real] NOT NULL,

	--/ <summary>exponential aperture correction (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[expApCorrection_r] [real] NOT NULL,

	--/ <summary>exponential aperture correction (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[expApCorrection_i] [real] NOT NULL,

	--/ <summary>exponential aperture correction (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[expApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[expApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[expApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[expApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[expApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[expApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[devModelApCorrection_u] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[devModelApCorrection_g] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[devModelApCorrection_r] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[devModelApCorrection_i] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[devModelApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[devModelApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[devModelApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[devModelApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[devModelApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[devModelApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[expModelApCorrection_u] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[expModelApCorrection_g] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[expModelApCorrection_r] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[expModelApCorrection_i] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[expModelApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[expModelApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[expModelApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[expModelApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[expModelApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[expModelApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (u-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.u</quantity>
	[medianFiberColor_u] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (g-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.g</quantity>
	[medianFiberColor_g] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (r-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.r</quantity>
	[medianFiberColor_r] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (i-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.i</quantity>
	[medianFiberColor_i] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (z-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.z</quantity>
	[medianFiberColor_z] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (u-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.u</quantity>
	[medianPsfColor_u] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (g-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.g</quantity>
	[medianPsfColor_g] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (r-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.r</quantity>
	[medianPsfColor_r] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (i-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.i</quantity>
	[medianPsfColor_i] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (z-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.z</quantity>
	[medianPsfColor_z] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in u-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[q_u] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in g-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.g</quantity>
	[q_g] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in r-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.r</quantity>
	[q_r] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in i-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.i</quantity>
	[q_i] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in z-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.z</quantity>
	[q_z] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in u-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[u_u] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in g-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.g</quantity>
	[u_g] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in r-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.r</quantity>
	[u_r] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in i-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[u_i] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in z-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.z</quantity>
	[u_z] [real] NOT NULL,

	--/ <summary>Maximum value of PSP (Postage Stamp Pipeline) status over all 5 filters</summary>
	--/ <quantity>meta.code.status;stat.max</quantity>
	[pspStatus] [smallint] NOT NULL,

	--/ <summary>PSP estimate of sky in u-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sky_u] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in g-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sky_g] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in r-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sky_r] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in i-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sky_i] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in z-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[sky_z] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[skySig_u] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSg</quantity>
	--/ <unit>mag</unit>
	[skySig_g] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSr</quantity>
	--/ <unit>mag</unit>
	[skySig_r] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSi</quantity>
	--/ <unit>mag</unit>
	[skySig_i] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSz</quantity>
	--/ <unit>mag</unit>
	[skySig_z] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in u-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyErr_u] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in g-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyErr_g] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in r-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyErr_r] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in i-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyErr_i] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in z-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2</unit>
	[skyErr_z] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (u-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy arcsec-2 field-1</unit>
	[skySlope_u] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (g-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy arcsec-2 field-1</unit>
	[skySlope_g] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (r-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy arcsec-2 field-1</unit>
	[skySlope_r] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (i-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy arcsec-2 field-1</unit>
	[skySlope_i] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (z-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy arcsec-2 field-1</unit>
	[skySlope_z] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (u-band)		XXX make sure to apply DSCALE, counts or ADU?</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>adu</unit>
	[lbias_u] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (g-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>adu</unit>
	[lbias_g] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (r-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>adu</unit>
	[lbias_r] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (i-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>adu</unit>
	[lbias_i] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (z-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>adu</unit>
	[lbias_z] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (u-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>adu</unit>
	[rbias_u] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (g-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>adu</unit>
	[rbias_g] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (r-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>adu</unit>
	[rbias_r] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (i-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>adu</unit>
	[rbias_i] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (z-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>adu</unit>
	[rbias_z] [real] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nProf_u] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nProf_g] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.numberf;em.opt.SDSS.r</quantity>
	[nProf_r] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nProf_i] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nProf_z] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (u-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[psfNStar_u] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (g-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[psfNStar_g] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (r-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[psfNStar_r] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (i-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[psfNStar_i] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (z-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[psfNStar_z] [int] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (u-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (g-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (r-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (i-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (z-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_u] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_g] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_r] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_i] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_z] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_u] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_g] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_r] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_i] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_z] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.u</quantity>
	[psfB_u] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.g</quantity>
	[psfB_g] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.r</quantity>
	[psfB_r] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.i</quantity>
	[psfB_i] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.z</quantity>
	[psfB_z] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfP0_u] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfP0_g] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfP0_r] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfP0_i] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfP0_z] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfBeta_u] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfBeta_g] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfBeta_r] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfBeta_i] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfBeta_z] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfSigmaP_u] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfSigmaP_g] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfSigmaP_r] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfSigmaP_i] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfSigmaP_z] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_u] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_g] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_r] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_i] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_z] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (u-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_u] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (g-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_g] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (r-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_r] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (i-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_i] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (z-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_z] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_u] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_g] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_r] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_i] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_z] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_u] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_g] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_r] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_i] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_z] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.u</quantity>
	[psf2GB_u] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.g</quantity>
	[psf2GB_g] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.r</quantity>
	[psf2GB_r] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.i</quantity>
	[psf2GB_i] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.z</quantity>
	[psf2GB_z] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[psfCounts_u] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[psfCounts_g] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[psfCounts_r] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[psfCounts_i] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[psfCounts_z] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_u] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_g] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_r] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_i] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_z] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	[darkVariance_u] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	[darkVariance_g] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	[darkVariance_r] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	[darkVariance_i] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	[darkVariance_z] [real] NOT NULL,

	--/ <summary>Quality of field (0-1)</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	[score] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy count-1</unit>
	[aterm_u] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy count-1</unit>
	[aterm_g] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy count-1</unit>
	[aterm_r] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy count-1</unit>
	[aterm_i] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy count-1</unit>
	[aterm_z] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.u</quantity>
	[kterm_u] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.g</quantity>
	[kterm_g] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.r</quantity>
	[kterm_r] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.i</quantity>
	[kterm_i] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.z</quantity>
	[kterm_z] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.u</quantity>
	--/ <unit>s-1</unit>
	[kdot_u] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.g</quantity>
	--/ <unit>s-1</unit>
	[kdot_g] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.r</quantity>
	--/ <unit>s-1</unit>
	[kdot_r] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.i</quantity>
	--/ <unit>s-1</unit>
	[kdot_i] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.z</quantity>
	--/ <unit>s-1</unit>
	[kdot_z] [real] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	--/ <unit>s</unit>
	[reftai_u] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	--/ <unit>s</unit>
	[reftai_g] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	--/ <unit>s</unit>
	[reftai_r] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	--/ <unit>s</unit>
	[reftai_i] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	--/ <unit>s</unit>
	[reftai_z] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	--/ <unit>s</unit>
	[tai_u] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	--/ <unit>s</unit>
	[tai_g] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	--/ <unit>s</unit>
	[tai_r] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	--/ <unit>s</unit>
	[tai_i] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	--/ <unit>s</unit>
	[tai_z] [float] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.u</quantity>
	[nStarsOffset_u] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.g</quantity>
	[nStarsOffset_g] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.r</quantity>
	[nStarsOffset_r] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.i</quantity>
	[nStarsOffset_i] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.z</quantity>
	[nStarsOffset_z] [int] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_u] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_g] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_r] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_i] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_z] [real] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.u</quantity>
	[calibStatus_u] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.g</quantity>
	[calibStatus_g] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.r</quantity>
	[calibStatus_r] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.i</quantity>
	[calibStatus_i] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.z</quantity>
	[calibStatus_z] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.u</quantity>
	[imageStatus_u] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.g</quantity>
	[imageStatus_g] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.r</quantity>
	[imageStatus_r] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.i</quantity>
	[imageStatus_i] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.z</quantity>
	[imageStatus_z] [int] NOT NULL,

	--/ <summary>nanomaggies per count in u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy count-1</unit>
	[ngmyPerCount_u] [real] NOT NULL,

	--/ <summary>nanomaggies per count in g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy count-1</unit>
	[ngmyPerCount_g] [real] NOT NULL,

	--/ <summary>nanomaggies per count in r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy count-1</unit>
	[ngmyPerCount_r] [real] NOT NULL,

	--/ <summary>nanomaggies per count in i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy count-1</unit>
	[ngmyPerCount_i] [real] NOT NULL,

	--/ <summary>nanomaggies per count in z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy count-1</unit>
	[ngmyPerCount_z] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in u-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.u</quantity>
	--/ <unit>ngmy-2 count+2</unit>
	[ngmyPerCountIvar_u] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in g-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.g</quantity>
	--/ <unit>ngmy-2 count+2</unit>
	[ngmyPerCountIvar_g] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in r-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.r</quantity>
	--/ <unit>ngmy-2 count+2</unit>
	[ngmyPerCountIvar_r] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in i-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.i</quantity>
	--/ <unit>ngmy-2 count+2</unit>
	[ngmyPerCountIvar_i] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in z-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.z</quantity>
	--/ <unit>ngmy-2 count+2</unit>
	[ngmyPerCountIvar_z] [real] NOT NULL,

	--/ <summary>field id used by resolve pipeline</summary>
	--/ <quantity>meta.id;obs;field</quantity>
	[ifield] [int] NOT NULL,

	--/ <summary>start of field in stripe coords (parallel to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[muStart] [float] NOT NULL,

	--/ <summary>end of field in stripe coords (parallel to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[muEnd] [float] NOT NULL,

	--/ <summary>start of field in stripe coords (perpendicular to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[nuStart] [float] NOT NULL,

	--/ <summary>end of field in stripe coords (perpendicular to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[nuEnd] [float] NOT NULL,

	--/ <summary>first entry for this field in the "findx" table matching fields and balkans</summary>
	--/ <quantity>meta.id</quantity>
	[ifindx] [int] NOT NULL,

	--/ <summary>number of balkans contained in this field (and corresponding number of entries in the "findx" table)</summary>
	--/ <quantity>meta.number</quantity>
	[nBalkans] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_Field_fieldID] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldProfile]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The mean PSF profile for the field as determined from bright stars. </summary>
--/ <remarks> For the profile radii, see the ProfileDefs table. </remarks>
CREATE TABLE [dbo].[FieldProfile](
	--/ <summary>bin number (0..14)</summary>
	--/ <quantity>meta.code</quantity>
	[bin] [tinyint] NOT NULL,

	--/ <summary>u,g,r,i,z (0..4)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[band] [tinyint] NOT NULL,

	--/ <summary>Mean pixel flux in annulus</summary>
	--/ <quantity>phot.flux;stat.mean</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profMean] [real] NOT NULL,

	--/ <summary>Median profile</summary>
	--/ <quantity>phot.flux;stat.median</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profMed] [real] NOT NULL,

	--/ <summary>Sigma of profile</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profSig] [real] NOT NULL,

	--/ <summary>links to the field object</summary>
	--/ <quantity>meta.id</quantity>
	[fieldID] [bigint] NOT NULL,
 CONSTRAINT [pk_FieldProfile_fieldID_bin_band] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC,
	[bin] ASC,
	[band] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Frame]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains JPEG images of fields at various zoom factors, and their astrometry. </summary>
--/ <remarks> The frame is the basic image unit. The table contains   false color JPEG images of the fields, and their most  relevant parameters, in particular the coefficients of  the astrometric transformation, and position info.   The images are stored at several zoom levels. </remarks>
CREATE TABLE [dbo].[Frame](

	--/ <summary>Link to the field table</summary>
	--/ <quantity>meta.id</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Zoom level 2^(zoom/10)</summary>
	--/ <quantity>obs.param</quantity>
	[zoom] [int] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [int] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [int] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [int] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [int] NOT NULL,

	--/ <summary>Stripe number</summary>
	--/ <quantity>meta.id;obs.param</quantity>
	[stripe] [int] NOT NULL,

	--/ <summary>Strip number (N or S)</summary>
	--/ <quantity>meta.id;obs.param</quantity>
	[strip] [varchar](32) NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[a] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[b] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[c] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[d] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[e] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[f] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[node] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[incl] [float] NOT NULL,

	--/ <summary>Min of ra</summary>
	--/ <quantity>pos.eq.ra;stat.min</quantity>
	--/ <unit>deg</unit>
	[raMin] [float] NOT NULL,

	--/ <summary>Max of ra</summary>
	--/ <quantity>pos.eq.ra;stat.max</quantity>
	--/ <unit>deg</unit>
	[raMax] [float] NOT NULL,

	--/ <summary>Min of dec</summary>
	--/ <quantity>pos.eq.dec;stat.min</quantity>
	--/ <unit>deg</unit>
	[decMin] [float] NOT NULL,

	--/ <summary>Max of dec</summary>
	--/ <quantity>pos.eq.dec;stat.max</quantity>
	--/ <unit>deg</unit>
	[decMax] [float] NOT NULL,

	--/ <summary>Survey mu of frame center</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[mu] [float] NOT NULL,

	--/ <summary>Survey nu of frame center</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[nu] [float] NOT NULL,

	--/ <summary>Ra of frame center</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Dec of frame center</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Cartesian x of frame center</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian y of frame center</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian z of frame center</summary>
	--/ <quantity>pos.eq.r</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>The htmID for point at frame center</summary>
	--/ <quantity>pos.HTM;pos.eq</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL,
	
	--[img] [varbinary](max) NOT NULL DEFAULT (0x1111),
 CONSTRAINT [pk_Frame_fieldID_zoom] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC,
	[zoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
--TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[galSpecExtra]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated physical parameters for all galaxies in the MPA-JHU spectroscopic catalogue. </summary>
--/ <remarks> These parameters give the probability distribution of each parameter in terms  of its percent quantiles. These estimates are derived in the manner described  in Brinchmann et al. 2004 </remarks>
CREATE TABLE [dbo].[galSpecExtra](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Emission line classification based on the BPT diagram using the methodology described in Brinchmann et al (2004). -1 means unclassifiable, 1 is star-forming, 2 means low S/N star-forming, 3 is composite, 4 AGN (excluding liners) and 5 is a low S/N LINER.</summary>
	--/ <quantity>src.class;spect.line</quantity>
	[bptclass] [smallint] NOT NULL,

	--/ <summary>The 2.5 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p2p5] [real] NOT NULL,

	--/ <summary>The 16 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund;stat.median</quantity>
	[oh_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of 12 + Log O/H</summary>
	--/ <quantity>phys.entropy</quantity>
	[oh_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p97p5] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p97p5] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the total SFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[sfr_tot_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the fiber SFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[sfr_fib_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the total SPECSFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[specsfr_tot_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the fiber SPECSFR</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	[specsfr_fib_entropy] [real] NOT NULL,
 CONSTRAINT [pk_galSpecExtra_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[galSpecIndx]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Index measurements of spectra from the MPA-JHU spectroscopic catalogue. </summary>
--/ <remarks> For each index, we give our estimate and error bar.  Measurements  performed as described in Brinchmann et al. 2004. </remarks>
CREATE TABLE [dbo].[galSpecIndx](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4227] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4227_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4227_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4227_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4227_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_g4300] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_g4300_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_g4300_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_g4300_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_g4300_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4383] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4383_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4383_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4383_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4383_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4455] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4455_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4455_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4455_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_ca4455_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4531] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4531_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4531_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4531_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe4531_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_c4668] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_c4668_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_c4668_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_c4668_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_c4668_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5015] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5015_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5015_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5015_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5015_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_mgb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_mgb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_mgb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_mgb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_mgb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5270] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5270_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5270_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5270_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5270_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5335] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5335_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5335_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5335_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5335_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5406] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5406_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5406_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5406_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>A</unit>
	[lick_fe5406_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5709] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5709_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5709_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5709_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5709_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5782] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5782_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5782_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5782_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_fe5782_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_nad] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_nad_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_nad_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_nad_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>A</unit>
	[lick_nad_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_a] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_a_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_a_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_a_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_a_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_a] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_a_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_a_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_a_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_a_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_f] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_f_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_f_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_f_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hd_f_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_f] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_f_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_f_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_f_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[lick_hg_f_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8498] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8498_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8498_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8498_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8498_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8542] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8542_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8542_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8542_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8542_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8662] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8662_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8662_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8662_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_caii8662_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_mgi8807] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>spect.index;stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_mgi8807_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_mgi8807_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_mgi8807_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>A</unit>
	[dtt_mgi8807_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_sub_err] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Bruzual (1983) definition</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_err] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition measured off best-fit CB08 model</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_model] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition after correction for emission lines</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_sub] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Bruzual (1983) definition after correction for emission lines</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_sub_err] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Balogh et al (1999) definition</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_n_err] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition measured off best-fit CB08 model</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n_model] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition after correction for emission lines</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n_sub] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Balogh et al (1999) definition after correction for emission lines</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_n_sub_err] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Bruzual (1983) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Bruzual (1983) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Balogh et al (1999) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Balogh et al (1999) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Bruzual (1983) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_sub_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Bruzual (1983) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_sub_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Balogh et al (1999) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_sub_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Balogh et al (1999)q definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_sub_blue] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_040] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_040] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_040] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_080] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_080] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_080] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_170] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_170] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_170] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_400] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_400] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_400] [real] NOT NULL,

	--/ <summary>Metallicity of best fitting (min chisq) model Z = 0.004 / 0.017 / 0.050 (0.2 1.0, 2.5 x solar)</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[best_model_z] [real] NOT NULL,

	--/ <summary>V-band optical depth (TauV = A_V / 1.086) affecting the stars from best fit model (best of 4 Z's)</summary>
	--/ <quantity>phys.absorption.opticalDepth;em.opt.V</quantity>
	[tauv_cont] [real] NOT NULL,

	--/ <summary>Coeficients of best fit model (best of 4 Z's)</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of best fit model (best of 4 Z's)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq] [real] NOT NULL,
 CONSTRAINT [pk_galSpecIndx_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[galSpecInfo]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> General information for the MPA-JHU spectroscopic re-analysis </summary>
--/ <remarks> This table contains one entry per spectroscopic observation  It may be joined with the other galSpec tables with the  measurements, or to specObjAll, using specObjId.  Numbers  given here are for the version of data used by the MPA-JHU  and may not be in perfect agreement with specObjAll. </remarks>
CREATE TABLE [dbo].[galSpecInfo](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id</quantity>
	[plateid] [smallint] NOT NULL,

	--/ <summary>Modified Julian Date of plate observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[mjd] [int] NOT NULL,

	--/ <summary>Fiber number (1 - 640)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberid] [smallint] NOT NULL,

	--/ <summary>Right Ascention of drilled fiber position</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>degrees</unit>
	[ra] [real] NOT NULL,

	--/ <summary>Declination of drilled fiber position</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>degrees</unit>
	[dec] [real] NOT NULL,

	--/ <summary>Primary Target Flag (MAIN galaxy = 64)</summary>
	--/ <quantity>meta.code</quantity>
	[primtarget] [smallint] NOT NULL,

	--/ <summary>Secondary Target Flag (QA = 8)</summary>
	--/ <quantity>meta.code</quantity>
	[sectarget] [smallint] NOT NULL,

	--/ <summary>Text version of primary target (GALAXY/QA/QSO/ROSAT_D)</summary>
	--/ <quantity>meta.note</quantity>
	[targettype] [varchar](32) NOT NULL,

	--/ <summary>Schlegel classification of spectrum ... code is only run where this is set to "GALAXY"</summary>
	--/ <quantity>src.class</quantity>
	[spectrotype] [varchar](32) NOT NULL,

	--/ <summary>Schlegel subclass from PCA analysis -- not alwasy correct!! AGN/BROADLINE/STARBURST/STARFORMING</summary>
	--/ <quantity>src.class</quantity>
	[subclass] [varchar](32) NOT NULL,

	--/ <summary>Redshift from Schlegel</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Redshift error</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NOT NULL,

	--/ <summary>Bad redshift if this is non-zero -- see Schlegel data model</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[z_warning] [smallint] NOT NULL,

	--/ <summary>Velocity dispersion from Schlegel</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[v_disp] [real] NOT NULL,

	--/ <summary>Velocity dispersion error (negative for invalid fit)</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[v_disp_err] [real] NOT NULL,

	--/ <summary>Median S/N per pixel of the whole spectrum</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[sn_median] [real] NOT NULL,

	--/ <summary>E(B-V) of foreground reddening from SFD maps</summary>
	--/ <quantity>phot.color.excess</quantity>
	[e_bv_sfd] [real] NOT NULL,

	--/ <summary>Data Release (dr1/dr2/dr3/dr4)</summary>
	--/ <quantity>meta.version</quantity>
	[release] [varchar](32) NOT NULL,

	--/ <summary>has "reliable" line measurements and physical parameters</summary>
	--/ <quantity>meta.code</quantity>
	[reliable] [smallint] NOT NULL,
 CONSTRAINT [pk_galSpecInfo_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[galSpecLine]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Emission line measurements from MPA-JHU spectroscopic reanalysis </summary>
--/ <remarks> The table contains one entry per spectroscopic observation derived as   described in Tremonti et al (2004) and Brinchmann et al (2004). </remarks>
CREATE TABLE [dbo].[galSpecLine](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Velocity dispersion (sigma not FWHM) measured simultaneously in all of the Balmer lines</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_balmer] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_balmer_err] [real] NOT NULL,

	--/ <summary>Velocity dispersion (sigma not FWHM) measured simultaneously in all the forbidden lines</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_forbidden] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_forbidden_err] [real] NOT NULL,

	--/ <summary>Velocity offset of the Balmer lines from the measured redshift</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_balmer] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_balmer_err] [real] NOT NULL,

	--/ <summary>Velocity offset of the forbidden lines from the measured redshift</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_forbidden] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_forbidden_err] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3726_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3726_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3726_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3726_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oii_3726_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_3726_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3729_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3729_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3729_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3729_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oii_3729_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_3729_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[neiii_3869_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[neiii_3869_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[neiii_3869_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[neiii_3869_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[neiii_3869_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[neiii_3869_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_delta_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_delta_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_delta_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_delta_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_delta_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_delta_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_gamma_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_gamma_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_gamma_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_gamma_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_gamma_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_gamma_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4363_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4363_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4363_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4363_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_4363_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_4363_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_beta_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_beta_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_beta_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_beta_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_beta_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_beta_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4959_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4959_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4959_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4959_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_4959_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_4959_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_5007_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_5007_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_5007_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_5007_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_5007_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_5007_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[hei_5876_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[hei_5876_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[hei_5876_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[hei_5876_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[hei_5876_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[hei_5876_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oi_6300_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oi_6300_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oi_6300_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oi_6300_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oi_6300_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oi_6300_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6548_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6548_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6548_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6548_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[nii_6548_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[nii_6548_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_alpha_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_alpha_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_alpha_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_alpha_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_alpha_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_alpha_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6584_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6584_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6584_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6584_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[nii_6584_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[nii_6584_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6717_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6717_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6717_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6717_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[sii_6717_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[sii_6717_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6731_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6731_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6731_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6731_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[sii_6731_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[sii_6731_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[ariii7135_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[ariii7135_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[ariii7135_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[ariii7135_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[ariii7135_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[ariii7135_chisq] [real] NOT NULL,

	--/ <summary>The width of the [O II] line in a free fit (ie. not tied to other emission lines)</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[oii_sigma] [real] NOT NULL,

	--/ <summary>The flux of the [O II] doublet from a free fit.</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_flux] [real] NOT NULL,

	--/ <summary>The estimated uncertainty on OII_FLUX</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_flux_err] [real] NOT NULL,

	--/ <summary>The velocity offset of the [O II] doublet from a free fit</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[oii_voff] [real] NOT NULL,

	--/ <summary>chi^2 of the fit to the [O II] line in free fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_chi2] [real] NOT NULL,

	--/ <summary>The width of the [O III]5007 line in a free fit (ie. not tied to other emission lines)</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[oiii_sigma] [real] NOT NULL,

	--/ <summary>The flux of the [O III]5007 line from a free fit.</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_flux] [real] NOT NULL,

	--/ <summary>The estimated uncertainty on OIII_FLUX</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_flux_err] [real] NOT NULL,

	--/ <summary>The velocity offset of the [O III]5007 line from a free fit</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[oiii_voff] [real] NOT NULL,

	--/ <summary>chi^2 of the fit to the [O III]5007 line in free fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_chi2] [real] NOT NULL,

	--/ <summary>The multiplicative scale factor applied to the original flux and error spectra prior to measurement of the emission lines to improve the spectrophotometric accuracy.  The rescaling insures that a synthetic r-band magnitude computed from the spectrum matches the r-band fiber magnitude measured by the photometric pipeline.</summary>
	--/ <quantity>obs.param;phot.flux</quantity>
 CONSTRAINT [pk_galSpecLine_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HalfSpace]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The constraints for boundaries of the the different regions </summary>
--/ <remarks> Boundaries are represented as the equation of a 3D plane,  intersecting the unit sphere. These intersections are  great and small circles. THe representation is in terms  of a 4-vector, (x,y,z,c), where (x,y,z) are the components  of a 3D normal vector pointing along the normal of the plane  into the half-scape inside our boundary, and c is the shift  of the plane along the normal from the origin. Thus, c=0  constraints represent great circles. If c&lt;0, the small circle  contains more than half of the sky.  See also the Region and RegionConvex tables </remarks>
CREATE TABLE [dbo].[HalfSpace](

	--/ <summary>id for the constraint</summary>
	--/ <quantity>meta.id</quantity>
	[constraintid] [bigint] NOT NULL,

	--/ <summary>pointer to RegionDefs</summary>
	--/ <quantity>meta.id</quantity>
	[regionid] [bigint] NOT NULL,

	--/ <summary>unique id for the convex</summary>
	--/ <quantity>meta.id</quantity>
	[convexid] [bigint] NOT NULL,

	--/ <summary>x component of normal</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[x] [float] NOT NULL,

	--/ <summary>y component of normal</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[y] [float] NOT NULL,

	--/ <summary>z component of normal</summary>
	--/ <quantity>pos.cartesian.z</quantity>
	[z] [float] NOT NULL,

	--/ <summary>offset from center along normal</summary>
	--/ <quantity>pos.distance</quantity>
	[c] [float] NOT NULL,
 CONSTRAINT [pk_HalfSpace_constraintid] PRIMARY KEY CLUSTERED 
(
	[constraintid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marvelsStar]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a MARVELS star. </summary>
--/ <remarks> This table corresponds to the data for a star whose velocity curve is  measured in MARVELS.  </remarks>
CREATE TABLE [dbo].[marvelsStar](

	--/ <summary>The primary name of the star (STARNAME)</summary>
	--/ <quantity>meta.id</quantity>
	[STARNAME] [varchar](64) NOT NULL,

	--/ <summary>2MASS Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[TWOMASS_NAME] [varchar](64) NOT NULL,

	--/ <summary>Plate Name</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[Plate] [varchar](32) NOT NULL,

	--/ <summary>Guide Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[GSC_Name] [varchar](64) NOT NULL,

	--/ <summary>Tycho Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[TYC_Name] [varchar](64) NOT NULL,

	--/ <summary>Hipparcos Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[HIP_Name] [varchar](62) NOT NULL,

	--/ <summary>Star Right Ascension (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_Final] [float] NOT NULL,

	--/ <summary>Star Declination (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_Final] [float] NOT NULL,

	--/ <summary>GSC B Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[GSC_B] [float] NOT NULL,

	--/ <summary>GSC V Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[GSC_V] [float] NOT NULL,

	--/ <summary>2MASS J Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_J] [real] NOT NULL,

	--/ <summary>2MASS H Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_H] [real] NOT NULL,

	--/ <summary>2MASS K Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_K] [real] NOT NULL,

	--/ <summary>Hipparcos Spectral type 1</summary>
	--/ <quantity>src.spType</quantity>
	[SP1] [varchar](16) NOT NULL,

	--/ <summary>Hipparcos Spectral type 2</summary>
	--/ <quantity>src.spType</quantity>
	[SP2] [varchar](16) NOT NULL,

	--/ <summary>Luminosity Class from SSPP* (Mainseq/Giant/Refstar) Refstar means it is a known planet host (different method used for year34 - see docs)</summary>
	--/ <quantity>src.class.luminosity</quantity>
	[RPM_LOG_g] [varchar](32) NOT NULL,

	--/ <summary>SSPP* effective temperature (in Kelvin) (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	[Teff] [real] NOT NULL,

	--/ <summary>SSPP* Surface gravity (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.gravity</quantity>
	[log_g] [real] NOT NULL,

	--/ <summary>SSPP* Metallicity (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[FeH] [real] NOT NULL,

	--/ <summary>Error in GSC B Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[GSC_B_E] [real] NOT NULL,

	--/ <summary>Error in GSC V Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit></unit>
	[GSC_V_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS J Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_J_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS H Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_H_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS K Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_K_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* effective temperature (in Kelvin)</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[Teff_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* Surface gravity (different method used for year34 - see docs) (different method used for year34 - see docs)</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	[log_g_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* Metallicity (different method used for year34 - see docs)</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	[FeH_E] [real] NOT NULL,

	--/ <summary>Epoch 0</summary>
	--/ <quantity>time.epoch</quantity>
	[Epoch_0] [real] NOT NULL,

	--/ <summary>Right Ascension at Epoch 0 (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_0] [float] NOT NULL,

	--/ <summary>Declination at Epoch 0 (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_0] [float] NOT NULL,

	--/ <summary>2MASS Right Ascension (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_TWOMASS] [float] NOT NULL,

	--/ <summary>2MASS Declination (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_TWOMASS] [float] NOT NULL,

	--/ <summary>GSC Proper Motion in RA pmra * cos(dec) (in mas)</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_RA] [float] NOT NULL,

	--/ <summary>GSC Proper Motion in DEC (in mas)</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_DEC] [float] NOT NULL,

	--/ <summary>Error in GSC Proper Motion in RA pmra * cos(dec) (in mas)</summary>
	--/ <unit></unit>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	[GSC_PM_RA_E] [float] NOT NULL,

	--/ <summary>Error in GSC Proper MOtion in DEC (in mas)</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_DEC_E] [float] NOT NULL,

	--/ <summary>Tycho B Magnitude (in mag)</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit></unit>
	[TYC_B] [real] NOT NULL,

	--/ <summary>Error in Tycho B Magnitude (in mag)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[TYC_B_E] [real] NOT NULL,

	--/ <summary>Tycho V Magnitude (in mag)</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[TYC_V] [real] NOT NULL,

	--/ <summary>Error in Tycho V Magnitude (in mag)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit></unit>
	[TYC_V_E] [real] NOT NULL,

	--/ <summary>Hipparcos Parallax (in mas)</summary>
	--/ <quantity>pos.parallax</quantity>
	--/ <unit>mas</unit>
	[HIP_PLX] [real] NOT NULL,

	--/ <summary>Error in Hipparcos Parallax (in mas)</summary>
	--/ <quantity>stat.error;pos.parallax</quantity>
	--/ <unit>mas</unit>
	[HIP_PLX_E] [real] NOT NULL,

	--/ <summary>Hipparcos Spectral Type</summary>
	--/ <quantity>src.spType</quantity>
	[HIP_SPTYPE] [varchar](32) NOT NULL,
 CONSTRAINT [pk_marvelsStar_STARNAME_PLATE] PRIMARY KEY CLUSTERED 
(
	[STARNAME] ASC,
	[Plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[marvelsVelocityCurveUF1D]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a particular MARVELS velocity curve using UF1D technique. </summary>
--/ <remarks> This table corresponds to the data in a single velocity curve measurement </remarks>
CREATE TABLE [dbo].[marvelsVelocityCurveUF1D](

	--/ <summary>The primary name of the star (STARNAME)</summary>
	--/ <quantity>meta.id;</quantity>
	[STARNAME] [varchar](64) NOT NULL,

	--/ <summary>The flux centered Julian Date</summary>
	--/ <quantity>time.epoch</quantity>
	[FCJD] [float] NOT NULL,

	--/ <summary>The fully corrected radial velocity measurement</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	[RV] [float] NOT NULL,

	--/ <summary>Photon limit of observation</summary>
	--/ <quantity>stat.error</quantity>
	[PHOTONERR] [float] NOT NULL,

	--/ <summary>Observed Precision in the measurement of the RV data point</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	[STATERROR] [float] NOT NULL,

	--/ <summary>Expected RV error for each order</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	[OFFSETERROR] [float] NOT NULL,

	--/ <summary>Good or rejected measurement</summary>
	--/ <quantity>meta.code</quantity>
	[Keep] [float] NOT NULL,

	--/ <summary>Sum of the photons</summary>
	--/ <quantity>meta.number</quantity>
	[TOTALPHOTONS] [bigint] NOT NULL,

	--/ <summary>The calculated barycentric velocity (m/s)</summary>
	--/ <quantity>phys.veloc;pos.barycenter</quantity>
	--/ <unit>m s-1</unit>
	[BARYCENTRICVEL] [float] NOT NULL,

	--/ <summary>Spectrum number (1 is bottom; 120 is top)</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SPECNO] [smallint] NOT NULL,

	--/ <summary>Name of the aggregated file for this epoch</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[EPOCHFILE] [varchar](256) NOT NULL,

	--/ <summary>Number of the MJD that was used as the template</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[TEMPLATEFILE] [varchar](256) NOT NULL,

	--/ <summary>Plate Name composed from RA and DEC (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[RADECID] [varchar](32) NOT NULL,

	--/ <summary>Plate Name (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[OBJECT] [varchar](32) NOT NULL,

	--/ <summary>Exposure Type (Valid values include STAR/TIO/THAR etc.) (From image header)</summary>
	--/ <quantity>meta.note;obs.exposure</quantity>
	[EXPTYPE] [varchar](32) NOT NULL,

	--/ <summary>Plate Name (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[PLATEID] [varchar](32) NOT NULL,

	--/ <summary>Id of the cartridge used for this image (From image header)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[CARTID] [int] NOT NULL,

	--/ <summary>Exposure time in seconds (From image header)</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	[EXPTIME] [int] NOT NULL,

	--/ <summary>UT of observation Format is YYYY-MM-DDThh:mm:ss.ss (From image header)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[DATE-OBS] [varchar](64) NOT NULL,

	--/ <summary>Start &amp; Stop of Exposure (From image header)</summary>
	--/ <quantity>time.start;time.end</quantity>
	[TIME] [varchar](64) NOT NULL,

	--/ <summary>UTC of Start of Exposure (From image header)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[UTC-OBS] [varchar](32) NOT NULL,

	--/ <summary>LST of Start of Exposure (From image header)</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[LST-OBS] [varchar](32) NOT NULL,

	--/ <summary>Julian date at start of observation (From image header)</summary>
	--/ <quantity>time.start;obs</quantity>
	[JD] [real] NOT NULL,

	--/ <summary>Flux centered Julian date (From image header)</summary>
	--/ <quantity>time.epoch</quantity>
	[FCJD_IMG] [real] NOT NULL,

	--/ <summary>Modified Julian date at start of observation (From image header)</summary>
	--/ <quantity>time.start</quantity>
	[MJD] [real] NOT NULL,

	--/ <summary>RA of tel. boresight (in degrees) (From image header)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL,

	--/ <summary>DEC of tel. boresight (in degrees) (From image header)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL,

	--/ <summary>Epoch of Coordinates (From image header)</summary>
	--/ <quantity>time.epoch</quantity>
	[EPOCH] [int] NOT NULL,

	--/ <summary>Altitude (encoder) of telescope (From image header)</summary>
	--/ <quantity>pos.az.alt;instr.tel</quantity>
	[ALT] [real] NOT NULL,

	--/ <summary>Azimuth (encoder) of telescope (From image header)</summary>
	--/ <quantity>pos.az.azi;instr.tel</quantity>
	[AZ] [real] NOT NULL,

	--/ <summary>Average PMT (rough flux over whole plate) during observation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.mean</quantity>
	--/ <unit>count</unit>	
	[PMTAVG] [real] NOT NULL,

	--/ <summary>RMS deviation of PMT counts during obs (in counts) (From image header)</summary>
	--/ <quantity>stat.error;phot.count</quantity>
	--/ <unit>count</unit>	
	[PMTRMS] [real] NOT NULL,

	--/ <summary>Minimum PMT counts during obsservation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.min</quantity>
	--/ <unit>count</unit>	
	[PMTMIN] [real] NOT NULL,

	--/ <summary>Maximum PMT counts during observation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.max</quantity>
	--/ <unit>count</unit>	
	[PMTMAX] [real] NOT NULL,

	--/ <summary>Exp. Quality Flag (OK/UNSURE/JUNK) (From image header)</summary>
	--/ <quantity>meta.code.qual;obs</quantity>
	[OBSFLAG] [varchar](16) NOT NULL,

	--/ <summary>Average counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.mean</quantity>
	--/ <unit>count</unit>	
	[IMGAVG] [real] NOT NULL,

	--/ <summary>Maximum counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.max</quantity>
	--/ <unit>count</unit>	
	[IMGMAX] [real] NOT NULL,

	--/ <summary>Minimum counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.min</quantity>
	--/ <unit>count</unit>	
	[IMGMIN] [real] NOT NULL,

	--/ <summary>Maximum signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.max</quantity>
	[SNRMAX] [real] NOT NULL,

	--/ <summary>Median signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[SNRMEDN] [real] NOT NULL,

	--/ <summary>Minimum signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[SNRMIN] [real] NOT NULL,

	--/ <summary>Average signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.mean</quantity>
	[SNRAVG] [real] NOT NULL,

	--/ <summary>RMS deviation signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.stdev</quantity>
	[SNRSTDEV] [real] NOT NULL,

	--/ <summary>Average seeing during the exposure (in arcsec) (From image header)</summary>
	--/ <quantity>instr.obsty;seeing;stat.mean</quantity>
	--/ <unit>arcsec</unit>
	[SEEING] [real] NOT NULL,

	--/ <summary>CCD Chip Temp. in Deg. Celsius (approx -106 normal) (From image header)</summary>
	--/ <quantity>phys.temperature;instr.det</quantity>
	--/ <unit>Celsius</unit>
	[CCDTEMP] [real] NOT NULL,

	--/ <summary>CCD Dewar Pressure in Torr (below &lt; 0.001) normal (From image header)</summary>
	--/ <quantity>phys.pressure;instr.det</quantity>
	[CCDPRES] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Regulator (From image header)</summary>
	--/ <quantity>phys.pressure;stat.mean</quantity>
	[P1] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Regulator (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure</quantity>
	[P1RMS] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Chamber (From image header)</summary>
	--/ <quantity>phys.pressure;stat.mean</quantity>
	[P2] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Chamber (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure</quantity>
	[P2RMS] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Atmosphere (From image header)</summary>
	--/ <quantity>phys.pressure;obs.atmos</quantity>
	[P3] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Atmosphere (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure;obs.atmos</quantity>
	[P3RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of North Chamber wall in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T1] [real] NOT NULL,

	--/ <summary>RMS Temp. of North Chamber wall in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T1RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of South Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T2] [real] NOT NULL,

	--/ <summary>RMS Temp. of South Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T2RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of East Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T3] [real] NOT NULL,

	--/ <summary>RMS Temp. of East Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T3RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of West Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T4] [real] NOT NULL,

	--/ <summary>RMS Temp. of West Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T4RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Top Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T5] [real] NOT NULL,

	--/ <summary>RMS Temp. of Top Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T5RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Bottom Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T6] [real] NOT NULL,

	--/ <summary>RMS Temp. of Bottom Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T6RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of CCD skin in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T7] [real] NOT NULL,

	--/ <summary>RMS Temp. of CCD skin in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T7RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of CCD house in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T8] [real] NOT NULL,

	--/ <summary>RMS Temp. of CCD house in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T8RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Iodine_Cell in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T9] [real] NOT NULL,

	--/ <summary>RMS Temp. of Iodine_Cell in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T9RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of CCD Air in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T10] [real] NOT NULL,

	--/ <summary>RMS Temp of CCD Air in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T10RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Interferometer top in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T11] [real] NOT NULL,

	--/ <summary>RMS Temp of Interferometer top in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T11RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Chamber Center in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T12] [real] NOT NULL,

	--/ <summary>RMSTemp of Chamber Center in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T12RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Grating in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T13] [real] NOT NULL,

	--/ <summary>RMSTemp of Grating in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T13RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of CCD area in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T14] [real] NOT NULL,

	--/ <summary>RMSTemp of CCD area in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T14RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Chamber input in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T15] [real] NOT NULL,

	--/ <summary>RMS Temp of Chamber input in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T15RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Ambient in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T16] [real] NOT NULL,

	--/ <summary>RMS Temp of Ambient in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T16RMS] [real] NOT NULL,

	--/ <summary>Beam ID (1 or 2)</summary>
	--/ <quantity>meta.id</quantity>
	[BEAM] [tinyint] NOT NULL,

	--/ <summary>Indicates survey phase ('year12' or 'year34')</summary>
	--/ <quantity>meta.note;time</quantity>
	[SURVEY] [varchar](16) NOT NULL,
 CONSTRAINT [pk_marvelsVelocityCurveUF1D_STAR] PRIMARY KEY CLUSTERED 
(
	[STARNAME] ASC,
	[BEAM] ASC,
	[RADECID] ASC,
	[FCJD] ASC,
	[LST-OBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Mask]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains a record describing the each mask object </summary>
--/ <remarks> </remarks>
CREATE TABLE [dbo].[Mask](

	--/ <summary>Unique Id number, composed of skyversion, rerun, run, camcol, field, filter, mask</summary>
	--/ <quantity></quantity>
	[maskID] [bigint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity></quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity></quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity></quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity></quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity></quantity>
	[mask] [smallint] NOT NULL,

	--/ <summary>The enumerated filter [0..4]</summary>
	--/ <quantity></quantity>
	[filter] [tinyint] NOT NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>the radius of the bounding circle</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[radius] [float] NOT NULL,

	--/ <summary>Area descriptor for the mask object</summary>
	--/ <quantity></quantity>
	[area] [varchar](4096) NOT NULL,

	--/ <summary>enumerated type of mask</summary>
	--/ <quantity></quantity>
	[type] [int] NOT NULL,

	--/ <summary>seeing width</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsecs</unit>
	[seeing] [real] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.HTM; pos.eq</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL,
 CONSTRAINT [pk_Mask_maskID] PRIMARY KEY CLUSTERED 
(
	[maskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[MaskedObject]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the objects inside a specific mask </summary>
--/ <remarks> This is a list of all masked objects. Each object may appear  multiple times, if it is masked for multiple reasons. </remarks>
CREATE TABLE [dbo].[MaskedObject](

	--/ <summary>pointer to a PhotoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Unique maskid</summary>
	--/ <quantity>meta.id</quantity>
	[maskID] [bigint] NOT NULL,

	--/ <summary>enumerated type of mask</summary>
	--/ <quantity>meta.code</quantity>
	[maskType] [int] NOT NULL,
 CONSTRAINT [pk_MaskedObject_objid_maskid] PRIMARY KEY CLUSTERED 
(
	[objid] ASC,
	[maskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotoObjDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the spatial cross-match between DR8 photoobj and DR7 photoobj. </summary>
--/ <remarks> This is a unique match between a DR8 photoobj and a DR7 photoobj,   and matches are restricted to the same run/camcol/field.	The match radius is 1 arcsec, and within this radius preference is  given to a photoprimary match over a secondary.  If no primary match  exists, the nearest secondary match is chosen.  If more than one  match of a given mode exists, the nearest one is chosen.  The table  contains the DR8 and DR7 objids and modes, the distance between them,   and the DR7 phototag quantities. </remarks>
CREATE TABLE [dbo].[PhotoObjDR7](

	--/ <summary>Unique DR7 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Unique DR8 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>Distance in arcmin between the DR7 and DR8 positions</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcmin</unit>
	[distance] [float] NOT NULL,

	--/ <summary>DR7 mode, 1: primary, 2: secondary, 3: family object.</summary>
	--/ <quantity>meta.code</quantity>
	[modeDR7] [tinyint] NOT NULL,

	--/ <summary>DR8 mode, 1: primary, 2: secondary, 3: family object.</summary>
	--/ <quantity>meta.code</quantity>
	[modeDR8] [tinyint] NOT NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.code</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NOT NULL,

	--/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.id</quantity>
	[nChild] [smallint] NOT NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.class;src.morph</quantity>
	[type] [smallint] NOT NULL,

	--/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[probPSF] [real] NOT NULL,

	--/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	[insideMask] [tinyint] NOT NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NOT NULL,

	--/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR50_r] [real] NOT NULL,

	--/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR90_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NOT NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>obs.param</quantity>
	[mRrCc_r] [real] NOT NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;obs.param</quantity>
	[mRrCcErr_r] [real] NOT NULL,

	--/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLStar_r] [real] NOT NULL,

	--/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLExp_r] [real] NOT NULL,

	--/ <summary>DeVaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLDeV_r] [real] NOT NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NOT NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone.id</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NOT NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NOT NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Pointer to the spectrum of object, if exists, else 0</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SpecObjID] [bigint] NOT NULL,

	--/ <summary>computed: =SQRT(mRrCc_r/2.0)</summary>
	--/ <quantity>obs.param</quantity>
	[size] [real] NOT NULL,
 CONSTRAINT [pk_PhotoOBJDR7_DR8OBJID] PRIMARY KEY CLUSTERED 
(
	[dr8objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotoPrimaryDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/ <summary> Contains the spatial cross-match between DR8 primaries and DR7 primaries. </summary>
--/ <remarks> This is a unique match between a DR8 photoprimary and a DR7 photoprimary,   and matches between different run/camcol/field are allowed.  The match  radius is 1 arcsec.  The table contains the DR8 and DR7 objids, the  distance between them and the DR7 phototag quantities. </remarks>
CREATE TABLE [dbo].[PhotoPrimaryDR7](

	--/ <summary>Unique DR7 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Unique DR8 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>Distance in arcmin between the DR7 and DR8 positions</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcmin</unit>
	[distance] [float] NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.code</quantity>
	[skyVersion] [tinyint] NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NULL,

	--/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.id</quantity>
	[nChild] [smallint] NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.class;src.morph</quantity>
	[type] [smallint] NULL,

	--/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[probPSF] [real] NULL,

	--/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	[insideMask] [tinyint] NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NULL,

	--/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR50_r] [real] NULL,

	--/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR90_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>obs.param</quantity>
	[mRrCc_r] [real] NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;obs.param</quantity>
	[mRrCcErr_r] [real] NULL,

	--/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLStar_r] [real] NULL,

	--/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLExp_r] [real] NULL,

	--/ <summary>DeVaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLDeV_r] [real] NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmID] [bigint] NULL,

	--/ <summary>zone.id</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NULL,

	--/ <summary>Pointer to the spectrum of object, if exists, else 0</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SpecObjID] [bigint] NULL,

	--/ <summary>computed: =SQRT(mRrCc_r/2.0)</summary>
	--/ <quantity>obs.param</quantity>
	[size] [real] NULL,
 CONSTRAINT [pk_PhotoPrimaryDR7_DR8OBJID] PRIMARY KEY CLUSTERED 
(
	[dr8objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photoz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The photometrically estimated redshifts for all objects in the GalaxyTag view. </summary>
--/ <remarks> Estimation is based on a robust fit on spectroscopically observed objects  with similar colors and r magnitude.&lt;br>  Please see the &lt;b>Photometric Redshifts&lt;/b> entry in Algorithms for more  information about this table. &lt;br>  &lt;i>NOTE: This table may be empty initially because the values  are computed in a separate calculation after the main data release.&lt;/i> </remarks>
CREATE TABLE [dbo].[Photoz](

	--/ <summary>unique ID pointing to GalaxyTag table</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>photometric redshift; estimated by robust fit to nearest neighbors in a reference set</summary>
	--/ <quantity>src.redshift;phot</quantity>
	[z] [real] NOT NULL,

	--/ <summary>estimated error of the photometric redshift; if zErr=-9999, the fit failed, but the neighbors' average redshift might still be available</summary>
	--/ <quantity>stat.error;src.redshift;phot</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>number of nearest neighbors after excluding the outliers; maximal value is 100, a much smaller value indicates a poor estimate</summary>
	--/ <quantity>meta.number</quantity>
	[nnCount] [smallint] NOT NULL,

	--/ <summary>gives the color space bounding volume of the nnCount nearest neighbors; a large value indicates a poor estimate</summary>
	--/ <quantity></quantity>
	[nnVol] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nnIsInside] [smallint] NOT NULL,

	--/ <summary>objID of the (first) nearest neighbor</summary>
	--/ <quantity>meta.id</quantity>
	[nnObjID] [bigint] NOT NULL,

	--/ <summary>spectroscopic redshift	of the (first) nearest neighbor</summary>
	--/ <quantity>src.redshift</quantity>
	[nnSpecz] [real] NOT NULL,

	--/ <summary>objID of the farthest neighbor</summary>
	--/ <quantity>meta.id</quantity>
	[nnFarObjID] [bigint] NOT NULL,

	--/ <summary>average redshift of the nearest neighbors; if significantly different from z, this might be a better estimate than z</summary>
	--/ <quantity>src.redshift;stat.mean</quantity>
	[nnAvgZ] [real] NOT NULL,

	--/ <summary>the distance modulus for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	[distMod] [real] NOT NULL,

	--/ <summary>the luminosity distance in Mpc for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>pos.distance.lum</quantity>
	[lumDist] [real] NOT NULL,

	--/ <summary>the chi-square value for the minimum chi-square template fit (non-reduced, 4 degrees of freedom)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>the residual Euclidean norm value for the minimum chi-square template fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[rnorm] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nTemplates] [int] NOT NULL,

	--/ <summary>synthetic u' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[synthU] [real] NOT NULL,

	--/ <summary>synthetic g' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[synthG] [real] NOT NULL,

	--/ <summary>synthetic r' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[synthR] [real] NOT NULL,

	--/ <summary>synthetic i' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[synthI] [real] NOT NULL,

	--/ <summary>synthetic z' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[synthZ] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ01] [real] NOT NULL,

	--/ <summary>rest frame u' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[absMagU] [real] NOT NULL,

	--/ <summary>rest frame g' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[absMagG] [real] NOT NULL,

	--/ <summary>rest frame r' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[absMagR] [real] NOT NULL,

	--/ <summary>rest frame i' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[absMagI] [real] NOT NULL,

	--/ <summary>rest frame z' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[absMagZ] [real] NOT NULL,
 CONSTRAINT [pk_Photoz_objID] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozRF]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotozRF](

	--/ <summary>unique ID pointing to GalaxyTag table</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>photometric redshift; estimated by robust fit to nearest neighbors in a reference set</summary>
	--/ <quantity>src.redshift;phot</quantity>
	[z] [real] NOT NULL,

	--/ <summary>estimated error of the photometric redshift; if zErr=-9999, the fit failed, but the neighbors' average redshift might still be available</summary>
	--/ <quantity>stat.error;src.redshift;phot</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>the distance modulus for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	[distMod] [real] NOT NULL,

	--/ <summary>the luminosity distance in Mpc for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>pos.distance.lum</quantity>
	[lumDist] [real] NOT NULL,

	--/ <summary>the chi-square value for the minimum chi-square template fit (non-reduced, 4 degrees of freedom)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>the residual Euclidean norm value for the minimum chi-square template fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[rnorm] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nTemplates] [int] NOT NULL,

	--/ <summary>synthetic u' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[synthU] [real] NOT NULL,

	--/ <summary>synthetic g' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[synthG] [real] NOT NULL,

	--/ <summary>synthetic r' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[synthR] [real] NOT NULL,

	--/ <summary>synthetic i' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[synthI] [real] NOT NULL,

	--/ <summary>synthetic z' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[synthZ] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ01] [real] NOT NULL,

	--/ <summary>rest frame u' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[absMagU] [real] NOT NULL,

	--/ <summary>rest frame g' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[absMagG] [real] NOT NULL,

	--/ <summary>rest frame r' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[absMagR] [real] NOT NULL,

	--/ <summary>rest frame i' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[absMagI] [real] NOT NULL,

	--/ <summary>rest frame z' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[absMagZ] [real] NOT NULL,
 CONSTRAINT [pk_PhotozRF_objID] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozRFTemplateCoeff]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotozRFTemplateCoeff](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>template id</summary>
	--/ <quantity>meta.id</quantity>
	[templateID] [int] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[coeff] [real] NOT NULL,
 CONSTRAINT [pk_PhotozRFTemplateCoeff_objID_t] PRIMARY KEY CLUSTERED 
(
	[objID] ASC,
	[templateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozTemplateCoeff]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotozTemplateCoeff](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>template ID</summary>
	--/ <quantity>meta.id</quantity>
	[templateID] [int] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[coeff] [real] NOT NULL,
 CONSTRAINT [pk_PhotozTemplateCoeff_objID_tem] PRIMARY KEY CLUSTERED 
(
	[objID] ASC,
	[templateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plate2Target]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Which objects are in the coverage area of which plates? </summary>
--/ <remarks> This table has an entry for each case of a target from the   sppTargets table having been targetable by a given plate.  Can be joined with plateX on the PLATEID column, and with  sppTargets on the OBJID column. Some plates are included  that were never observed; the PLATEID values for these   will not match any entries in the plateX table. </remarks>
CREATE TABLE [dbo].[Plate2Target](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[plate2targetid] [int] NOT NULL,

	--/ <summary>plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [int] NOT NULL,

	--/ <summary>plate identification number in plateX</summary>
	--/ <quantity></quantity>
	[plateid] [bigint] NOT NULL,

	--/ <summary>object identification number in sppTargets</summary>
	--/ <quantity>meta.id.cross</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlateX]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data from a given plate used for spectroscopic observations. </summary>
--/ <remarks> Each SDSS spectrograph plate has 640 observed spectra, whereas each BOSS   spectrograph plate has 1000 observed spectra.  </remarks>
CREATE TABLE [dbo].[PlateX](

	--/ <summary>Unique ID, composite of plate number and MJD</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[plateID] [bigint] NOT NULL,

	--/ <summary>Name of release that this plate/mjd/rerun was first distributed in</summary>
	--/ <quantity>meta.id</quantity>
	[firstRelease] [varchar](32) NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>MJD of observation (last)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>List of contributing MJDs [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[mjdList] [varchar](512) NOT NULL,

	--/ <summary>Name of survey [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[survey] [varchar](32) NOT NULL,

	--/ <summary>Name of program [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[programName] [varchar](32) NOT NULL,

	--/ <summary>Instrument used (SDSS or BOSS spectrograph)</summary>
	--/ <quantity>instr</quantity>
	[instrument] [varchar](32) NOT NULL,

	--/ <summary>Name of tiling chunk  [from platelist product]</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[chunk] [varchar](32) NOT NULL,

	--/ <summary>Drilling run for plate [from platelist product]</summary>
	--/ <quantity>meta.note</quantity>
	[plateRun] [varchar](32) NOT NULL,

	--/ <summary>Comments on the plate design from plate plans [from platelist product]</summary>
	--/ <quantity>meta.note</quantity>
	[designComments] [varchar](128) NOT NULL,

	--/ <summary>Characterization of plate quality</summary>
	--/ <quantity>meta.code.qual</quantity>
	[plateQuality] [varchar](32) NOT NULL,

	--/ <summary>Comments on reason for plate quality</summary>
	--/ <quantity>meta.note</quantity>
	[qualityComments] [varchar](100) NOT NULL,

	--/ <summary>Overall signal to noise measure for plate (only set for SDSS plates)</summary>
	--/ <quantity>stat.snr</quantity>
	[plateSN2] [real] NOT NULL,

	--/ <summary>Dereddened overall signal to noise measure for plate (only set for BOSS plates)</summary>
	--/ <quantity>stat.snr</quantity>
	[deredSN2] [real] NOT NULL,

	--/ <summary>RA, J2000 [from spPlate header]</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Dec, J2000 [from spPlate header]</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>2D reduction rerun of plate</summary>
	--/ <quantity>meta.note</quantity>
	[run2d] [varchar](32) NOT NULL,

	--/ <summary>1D reduction rerun of plate</summary>
	--/ <quantity>meta.note</quantity>
	[run1d] [varchar](32) NOT NULL,

	--/ <summary>SSPP reduction rerun of plate  ("none" if not run)</summary>
	--/ <quantity>meta.note</quantity>
	[runsspp] [varchar](32) NOT NULL,

	--/ <summary>Tile number for SDSS-I, -II plates (-1 for SDSS-III) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [smallint] NOT NULL,

	--/ <summary>Design number number for SDSS-III plates (-1 for SDSS-I, -II) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[designID] [int] NOT NULL,

	--/ <summary>Location number number for SDSS-III plates (-1 for SDSS-I, -II) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[locationID] [int] NOT NULL,

	--/ <summary>IOP Version [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[iopVersion] [varchar](64) NOT NULL,

	--/ <summary>Camera code version  [from spPlate header]</summary>
	--/ <quantity>meta.version;instr.det</quantity>
	[camVersion] [varchar](64) NOT NULL,

	--/ <summary>Time in string format [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[taiHMS] [varchar](64) NOT NULL,

	--/ <summary>Date of 1st row [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[dateObs] [varchar](32) NOT NULL,

	--/ <summary>Time System [from spPlate header]</summary>
	--/ <quantity>meta.code</quantity>
	[timeSys] [varchar](8) NOT NULL,

	--/ <summary>x of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>ID of cartridge used for the observation [from spPlate header]</summary>
	--/ <quantity>meta.id</quantity>
	[cartridgeID] [smallint] NOT NULL,

	--/ <summary>Mean time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.epoch;obs;stat.mean</quantity>
	--/ <unit>s</unit>
	[tai] [float] NOT NULL,

	--/ <summary>Beginning time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.start</quantity>
	--/ <unit>s</unit>
	[taiBegin] [float] NOT NULL,

	--/ <summary>Ending time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.end</quantity>
	--/ <unit>s</unit>
	[taiEnd] [float] NOT NULL,

	--/ <summary>Airmass at central TAI time [from spPlate header]</summary>
	--/ <quantity>obs.airmass</quantity>
	[airmass] [real] NOT NULL,

	--/ <summary>Map MJD [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mapMjd] [int] NOT NULL,

	--/ <summary>ID of mapping file [from spPlate header]</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[mapName] [varchar](32) NOT NULL,

	--/ <summary>Full name of mapping file [from spPlate header]</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[plugFile] [varchar](32) NOT NULL,

	--/ <summary>Total Exposure time [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTime] [real] NOT NULL,

	--/ <summary>exposure time in B1 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeB1] [real] NOT NULL,

	--/ <summary>exposure time in B2 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeB2] [real] NOT NULL,

	--/ <summary>exposure time in R1 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeR1] [real] NOT NULL,

	--/ <summary>exposure time in R2 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeR2] [real] NOT NULL,

	--/ <summary>idlspec2d version used during 2d reduction [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[vers2d] [varchar](32) NOT NULL,

	--/ <summary>idlspec2d version used during combination of multiple exposures [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[verscomb] [varchar](32) NOT NULL,

	--/ <summary>idlspec2d version used during redshift fitting [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[vers1d] [varchar](32) NOT NULL,

	--/ <summary>Signal to noise measure for MS turnoff stars on plate (-9999 if not appropriate)</summary>
	--/ <quantity>stat.snr</quantity>
	[snturnoff] [real] NOT NULL,

	--/ <summary>Number of MS turnoff stars on plate</summary>
	--/ <quantity>meta.number</quantity>
	[nturnoff] [real] NOT NULL,

	--/ <summary>Number of exposures total [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExp] [smallint] NOT NULL,

	--/ <summary>Number of exposures in B1 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpB1] [smallint] NOT NULL,

	--/ <summary>Number of exposures in B2 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpB2] [smallint] NOT NULL,

	--/ <summary>Number of exposures in R1 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpR1] [smallint] NOT NULL,

	--/ <summary>Number of exposures in R2 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpR2] [smallint] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn1_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn1_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn1_i] [real] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn2_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn2_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn2_i] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at g=20.20 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[dered_sn1_g] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at r=20.25 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[dered_sn1_r] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at i=19.90 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[dered_sn1_i] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at g=20.20 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[dered_sn2_g] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at r=20.25 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[dered_sn2_r] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at i=19.90 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[dered_sn2_i] [real] NOT NULL,

	--/ <summary>Heliocentric velocity correction [from spPlate header]</summary>
	--/ <quantity>spect.dopplerVeloc;pos.heliocentric</quantity>
	--/ <unit>km s-1</unit>
	[helioRV] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gRMSStd] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rRMSStd] [real] NOT NULL,

	--/ <summary>Mean i-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of i-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iRMSStd] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grRMSStd] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riRMSStd] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gRMSGal] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rRMSGal] [real] NOT NULL,

	--/ <summary>Mean i-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of i-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iRMSGal] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grRMSGal] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riRMSGal] [real] NOT NULL,

	--/ <summary>Number of guider camera frames taken during the exposure [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nGuide] [int] NOT NULL,

	--/ <summary>20th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing20] [real] NOT NULL,

	--/ <summary>50th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing50] [real] NOT NULL,

	--/ <summary>80th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing80] [real] NOT NULL,

	--/ <summary>20th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff20] [real] NOT NULL,

	--/ <summary>50th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff50] [real] NOT NULL,

	--/ <summary>80th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff80] [real] NOT NULL,

	--/ <summary>Air temperature in the dome [from spPlate header]</summary>
	--/ <quantity>phys.temperature;instr</quantity>
	--/ <unit>Celsius</unit>
	[airtemp] [real] NOT NULL,

	--/ <summary>Were the SFD dust maps applied to the output spectrum? (0 = no, 1 = yes)</summary>
	--/ <quantity>meta.code</quantity>
	[sfd_used] [tinyint] NOT NULL,

	--/ <summary>sigma of gaussian fit to spatial profile[from spPlate header]</summary>
	--/ <quantity>stat.error;stat.fit</quantity>
	[xSigma] [real] NOT NULL,

	--/ <summary>minimum of xSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.min</quantity>
	[xSigMin] [real] NOT NULL,

	--/ <summary>maximum of xSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.max</quantity>
	[xSigMax] [real] NOT NULL,

	--/ <summary>sigma of gaussian fit to arc-line profiles in wavelength direction [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.fit</quantity>
	[wSigma] [real] NOT NULL,

	--/ <summary>minimum of wSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.min</quantity>
	[wSigMin] [real] NOT NULL,

	--/ <summary>maximum of wSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.max</quantity>
	[wSigMax] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[xChi2] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.min</quantity>
	[xChi2Min] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.max</quantity>
	[xChi2Max] [real] NOT NULL,

	--/ <summary>average chi-squared from sky subtraction from all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.mean</quantity>
	[skyChi2] [real] NOT NULL,

	--/ <summary>minimum skyChi2 over all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.min</quantity>
	[skyChi2Min] [real] NOT NULL,

	--/ <summary>maximum skyChi2 over all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.max</quantity>
	[skyChi2Max] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (total) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (spectrograph #1) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix1] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (spectrograph #2) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix2] [real] NOT NULL,

	--/ <summary>Status of 2D extraction</summary>
	--/ <quantity>meta.code.status</quantity>
	[status2d] [varchar](32) NOT NULL,

	--/ <summary>Status of combination of multiple MJDs</summary>
	--/ <quantity>meta.code.status</quantity>
	[statuscombine] [varchar](32) NOT NULL,

	--/ <summary>Status of 1D reductions</summary>
	--/ <quantity>meta.code.status</quantity>
	[status1d] [varchar](32) NOT NULL,

	--/ <summary>Number of objects total [calculated from spZbest file]</summary>
	--/ <quantity>meta.code.status</quantity>
	[nTotal] [int] NOT NULL,

	--/ <summary>Number of objects classified as galaxy [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nGalaxy] [int] NOT NULL,

	--/ <summary>Number of objects classified as QSO [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nQSO] [int] NOT NULL,

	--/ <summary>Number of objects classified as Star [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nStar] [int] NOT NULL,

	--/ <summary>Number of sky objects  [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nSky] [int] NOT NULL,

	--/ <summary>Number of objects with zWarning set non-zero (such objects still classified as star, galaxy or QSO) [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nUnknown] [int] NOT NULL,

	--/ <summary>is this plateX entry the best observation of the plate</summary>
	--/ <quantity>meta.code</quantity>
	[isBest] [tinyint] NOT NULL,

	--/ <summary>is this plateX entry both good and the best observation of the plate</summary>
	--/ <quantity>meta.code</quantity>
	[isPrimary] [tinyint] NOT NULL,

	--/ <summary>is this plate the best representative  of its tile (only set for "legacy" program plates)</summary>
	--/ <quantity>meta.code</quantity>
	[isTile] [tinyint] NOT NULL,

	--/ <summary>hour angle of design [from plPlugMapM file]</summary>
	--/ <quantity>pos.eq.ha</quantity>
	--/ <unit>deg</unit>
	[ha] [real] NOT NULL,

	--/ <summary>MJD designed for [from plPlugMapM file]</summary>
	--/ <quantity>time.epoch</quantity>
	[mjdDesign] [int] NOT NULL,

	--/ <summary>cartridge position angle [from plPlugMapM file]</summary>
	--/ <quantity>pos.posAng</quantity>
	[theta] [real] NOT NULL,

	--/ <summary>version of fiber scanning software [from plPlugMapM file]</summary>
	--/ <quantity>meta.version</quantity>
	[fscanVersion] [varchar](32) NOT NULL,

	--/ <summary>version of fiber mapping software [from plPlugMapM file]</summary>
	--/ <quantity>meta.version</quantity>
	[fmapVersion] [varchar](32) NOT NULL,

	--/ <summary>'slow', 'fast', or 'extreme' [from plPlugMapM file]</summary>
	--/ <quantity>meta.note</quantity>
	[fscanMode] [varchar](32) NOT NULL,

	--/ <summary>speed of scan [from plPlugMapM file]</summary>
	--/ <quantity>obs.param</quantity>
	[fscanSpeed] [int] NOT NULL,

	--/ <summary>20 deep Hierarchical Triangular Mesh ID</summary>
	--/ <quantity>pos.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_PlateX_plateID] PRIMARY KEY CLUSTERED 
(
	[plateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ProperMotions]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Proper motions combining SDSS and recalibrated USNO-B astrometry. </summary>
--/ <remarks> These results are based on the technique described in  Munn et al. 2004, AJ, 127, 3034 </remarks>
CREATE TABLE [dbo].[ProperMotions](

	--/ <summary>Distance between this object and the nearest matching USNO-B object.</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[delta] [real] NOT NULL,

	--/ <summary>Number of objects in USNO-B which matched this object within a 1 arcsec radius.  If negative, then the nearest matching USNO-B object itself matched more than 1 SDSS object.</summary>
	--/ <quantity>meta.number</quantity>
	[match] [int] NOT NULL,

	--/ <summary>Proper motion in galactic longitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lon</quantity>
	--/ <unit>mas year-1</unit>
	[pmL] [real] NOT NULL,

	--/ <summary>Proper motion in galactic latitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lat</quantity>
	--/ <unit>mas year-1</unit>
	[pmB] [real] NOT NULL,

	--/ <summary>Proper motion in right ascension.</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas year-1</unit>
	[pmRa] [real] NOT NULL,

	--/ <summary>Proper motion in declination.</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas year-1</unit>
	[pmDec] [real] NOT NULL,

	--/ <summary>Error in proper motion in right ascension.</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas year-1</unit>
	[pmRaErr] [real] NOT NULL,

	--/ <summary>Error in proper motion in declination.</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas year-1</unit>
	[pmDecErr] [real] NOT NULL,

	--/ <summary>RMS residual for the proper motion fit in r.a.</summary>
	--/ <quantity>stat.fit.residual</quantity>
	--/ <unit>mas</unit>
	[sigRa] [real] NOT NULL,

	--/ <summary>RMS residual for the proper motion fit in dec.</summary>
	--/ <quantity>stat.error;stat.fit.residual</quantity>
	--/ <unit>mas</unit>
	[sigDec] [real] NOT NULL,

	--/ <summary>Number of detections used in the fit including the SDSS detection (thus, the number of plates the object was detected on in USNO-B plus one).</summary>
	--/ <quantity>meta.nubmer</quantity>
	[nFit] [int] NOT NULL,

	--/ <summary>Recalibrated USNO-B O magnitude,  recalibrated to SDSS g</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[O] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B E magnitude,  recalibrated to SDSS r</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[E] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B J magnitude,  recalibrated to SDSS g</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[J] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B F magnitude,  recalibrated to SDSS r</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[F] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B N magnitude,  recalibrated to SDSS i</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[N] [real] NOT NULL,

	--/ <summary>Distance to the nearest neighbor with g &lt; 20</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[dist20] [real] NOT NULL,

	--/ <summary>Distance to the nearest neighbor with g &lt; 22</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[dist22] [real] NOT NULL,

	--/ <summary>unique id, points to photoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,
 CONSTRAINT [pk_ProperMotions_objID] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](

	[regionid] [bigint] NOT NULL,

	[id] [bigint] NOT NULL,

	[type] [varchar](16) NOT NULL,

	[comment] [varchar](1024) NOT NULL,
	[ismask] [tinyint] NOT NULL DEFAULT ((0)),
	[area] [float] NOT NULL DEFAULT ((0)),
	[regionString] [varchar](max) NULL DEFAULT (''),
	[regionBinary] [varbinary](max) NULL DEFAULT (0x00),
 CONSTRAINT [pk_Region_regionId] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] [TEXTIMAGE_ON] PRIMARY

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Region2Box]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region2Box](

	[regionType] [varchar](16) NOT NULL,

	[id] [bigint] NOT NULL,

	[boxType] [varchar](16) NOT NULL,
	[boxid] [bigint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RegionArcs]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionArcs](

	[arcid] [int]  NOT NULL,

	[regionid] [bigint] NOT NULL,

	[convexid] [bigint] NOT NULL,

	[constraintid] [bigint] NOT NULL,

	[patch] [int] NOT NULL,

	[state] [int] NOT NULL,

	[draw] [int] NOT NULL,

	[ra1] [float] NOT NULL,

	[dec1] [float] NOT NULL,

	[ra2] [float] NOT NULL,

	[dec2] [float] NOT NULL,

	[x] [float] NOT NULL,

	[y] [float] NOT NULL,

	[z] [float] NOT NULL,

	[c] [float] NOT NULL,
	[length] [float] NOT NULL DEFAULT ((0.0)),
 CONSTRAINT [pk_RegionArcs_regionId_convexid_] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC,
	[convexid] ASC,
	[arcid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegionPatch]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegionPatch](

	[regionid] [bigint] NOT NULL,

	[convexid] [bigint] NOT NULL,

	[patchid] [int] NOT NULL,

	[type] [varchar](16) NOT NULL,
	[radius] [float] NOT NULL DEFAULT ((0)),
	[ra] [float] NOT NULL DEFAULT ((0)),
	[dec] [float] NOT NULL DEFAULT ((0)),
	[x] [float] NOT NULL DEFAULT ((0)),
	[y] [float] NOT NULL DEFAULT ((0)),
	[z] [float] NOT NULL DEFAULT ((0)),
	[c] [float] NOT NULL DEFAULT ((0)),
	[htmid] [bigint] NOT NULL DEFAULT ((0)),
	[zoneid] [bigint] NOT NULL DEFAULT ((0)),
	[area] [float] NOT NULL DEFAULT ((0)),
	[convexString] [varchar](max) NULL DEFAULT (''),
 CONSTRAINT [pk_RegionPatch_regionid_convexid] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC,
	[convexid] ASC,
	[patchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RegionTypes]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegionTypes](

	[type] [varchar](16) NOT NULL,
	[radius] [float] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Rmatrix]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rmatrix](

	[mode] [varchar](16) NOT NULL,

	[row] [smallint] NOT NULL,

	[x] [float] NOT NULL,

	[y] [float] NOT NULL,

	[z] [float] NOT NULL,
 CONSTRAINT [pk_RMatrix_mode_row] PRIMARY KEY CLUSTERED 
(
	[mode] ASC,
	[row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Run]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Run](

	[skyVersion] [tinyint] NOT NULL,

	[run] [smallint] NOT NULL,

	[rerun] [smallint] NOT NULL,

	[mjd] [int] NOT NULL,

	[datestring] [varchar](32) NOT NULL,

	[stripe] [int] NOT NULL,

	[strip] [varchar](32) NOT NULL,

	[xBore] [float] NOT NULL,

	[fieldRef] [int] NOT NULL,

	[lastField] [int] NOT NULL,

	[flavor] [varchar](32) NOT NULL,

	[xBin] [int] NOT NULL,

	[yBin] [int] NOT NULL,

	[nRow] [int] NOT NULL,

	[mjdRef] [float] NOT NULL,

	[muRef] [float] NOT NULL,

	[lineStart] [int] NOT NULL,

	[tracking] [float] NOT NULL,

	[node] [float] NOT NULL,

	[incl] [float] NOT NULL,

	[comments] [varchar](128) NOT NULL,

	[qterm] [real] NOT NULL,

	[maxMuResid] [real] NOT NULL,

	[maxNuResid] [real] NOT NULL,

	[startField] [int] NOT NULL,

	[endField] [int] NOT NULL,

	[photoVersion] [varchar](32) NOT NULL,

	[dervishVersion] [varchar](32) NOT NULL,

	[astromVersion] [varchar](32) NOT NULL,
	[sasVersion] [varchar](32) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RunShift]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunShift](

	[run] [int] NOT NULL,

	[shift] [float] NOT NULL,
 CONSTRAINT [pk_RunShift_run] PRIMARY KEY CLUSTERED 
(
	[run] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssBestTarget2Sector]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssBestTarget2Sector](

	[objID] [bigint] NOT NULL,

	[regionID] [bigint] NOT NULL,

	[status] [int] NOT NULL,

	[primTarget] [int] NOT NULL,

	[secTarget] [int] NOT NULL,

	[petroMag_r] [real] NOT NULL,
	[extinction_r] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SDSSConstants]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDSSConstants](

	[name] [varchar](32) NOT NULL,

	[value] [float] NOT NULL,

	[unit] [varchar](32) NOT NULL,

	[description] [varchar](2000) NOT NULL,
 CONSTRAINT [pk_SDSSConstants_name] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssImagingHalfSpaces]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssImagingHalfSpaces](

	[sdssPolygonID] [int] NOT NULL,

	[x] [float] NOT NULL,

	[y] [float] NOT NULL,

	[z] [float] NOT NULL,

	[c] [float] NOT NULL,

	[xMangle] [float] NOT NULL,

	[yMangle] [float] NOT NULL,

	[zMangle] [float] NOT NULL,

	[cMangle] [float] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssImagingHalfspaces_sdssPol] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC,
	[x] ASC,
	[y] ASC,
	[z] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssPolygon2Field]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssPolygon2Field](

	[sdssPolygonID] [int] NOT NULL,

	[fieldID] [bigint] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssPolygon2Field_sdssPolygon] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC,
	[fieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssPolygons]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssPolygons](

	[sdssPolygonID] [int] NOT NULL,

	[nField] [int] NOT NULL,

	[primaryFieldID] [bigint] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[area] [float] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssPolygons_sdssPolygonID] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssSector]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sdssSector](

	[regionID] [bigint] NOT NULL,

	[nTiles] [int] NOT NULL,

	[tiles] [varchar](256) NOT NULL,

	[targetVersion] [varchar](64) NOT NULL,
	[area] [real] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssSector2Tile]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sdssSector2Tile](

	[regionID] [bigint] NOT NULL,

	[type] [varchar](16) NOT NULL,

	[tile] [smallint] NOT NULL,
	[isMask] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTargetParam]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sdssTargetParam](

	[targetVersion] [varchar](32) NOT NULL,

	[paramFile] [varchar](32) NOT NULL,

	[name] [varchar](32) NOT NULL,

	[value] [varchar](512) NOT NULL,
 CONSTRAINT [pk_sdssTargetParam_targetVersion] PRIMARY KEY CLUSTERED 
(
	[targetVersion] ASC,
	[paramFile] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTileAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTileAll](

	[tile] [smallint] NOT NULL,

	[tileRun] [smallint] NOT NULL,

	[raCen] [float] NOT NULL,

	[decCen] [float] NOT NULL,

	[htmID] [bigint] NOT NULL,

	[zoneID] [bigint] NOT NULL,

	[cx] [float] NOT NULL,

	[cy] [float] NOT NULL,

	[cz] [float] NOT NULL,

	[untiled] [tinyint] NOT NULL,

	[nTargets] [int] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTileAll_tile] PRIMARY KEY CLUSTERED 
(
	[tile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTiledTargetAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTiledTargetAll](

	[targetID] [bigint] NOT NULL,

	[run] [smallint] NOT NULL,

	[rerun] [smallint] NOT NULL,

	[camcol] [smallint] NOT NULL,

	[field] [smallint] NOT NULL,

	[obj] [smallint] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[htmID] [bigint] NOT NULL,

	[zoneID] [bigint] NOT NULL,

	[cx] [float] NOT NULL,

	[cy] [float] NOT NULL,

	[cz] [float] NOT NULL,

	[primTarget] [int] NOT NULL,

	[secTarget] [int] NOT NULL,

	[tiPriority] [int] NOT NULL,

	[tileAll] [int] NOT NULL,

	[tiMaskAll] [smallint] NOT NULL,

	[collisionGroupAll] [int] NOT NULL,

	[photoObjID] [bigint] NOT NULL,

	[specObjID] [bigint] NOT NULL,

	[regionID] [int] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTiledTargetAll_targetID] PRIMARY KEY CLUSTERED 
(
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTilingGeometry]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sdssTilingGeometry](

	[tilingGeometryID] [int] NOT NULL,

	[tileRun] [smallint] NOT NULL,

	[stripe] [int] NOT NULL,

	[nsbx] [varchar](1) NOT NULL,

	[isMask] [tinyint] NOT NULL,

	[coordType] [int] NOT NULL,

	[lambdamu_0] [float] NOT NULL,

	[lambdamu_1] [float] NOT NULL,

	[etanu_0] [float] NOT NULL,

	[etanu_1] [float] NOT NULL,

	[lambdaLimit_0] [float] NOT NULL,

	[lambdaLimit_1] [float] NOT NULL,

	[targetVersion] [varchar](32) NOT NULL,

	[firstArea] [float] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingGeometry_tilingGeom] PRIMARY KEY CLUSTERED 
(
	[tilingGeometryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTilingInfo]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sdssTilingInfo](

	[targetID] [bigint] NOT NULL,

	[tileRun] [smallint] NOT NULL,

	[tid] [int] NOT NULL,

	[tiMask] [smallint] NOT NULL,

	[collisionGroup] [int] NOT NULL,

	[tile] [int] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingInfo_tileRun_target] PRIMARY KEY CLUSTERED 
(
	[tileRun] ASC,
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTilingRun]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sdssTilingRun](

	[tileRun] [smallint] NOT NULL,

	[ctileVersion] [varchar](32) NOT NULL,

	[tilepId] [varchar](32) NOT NULL,

	[programName] [varchar](32) NOT NULL,

	[primTargetMask] [int] NOT NULL,

	[secTargetMask] [int] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingRun_tileRun] PRIMARY KEY CLUSTERED 
(
	[tileRun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[segueTargetAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[segueTargetAll](

	[objid] [bigint] NOT NULL,

	[segue1_target1] [int] NOT NULL,

	[segue1_target2] [int] NOT NULL,

	[segue2_target1] [int] NOT NULL,

	[segue2_target2] [int] NOT NULL,

	[lcolor] [real] NOT NULL,

	[scolor] [real] NOT NULL,

	[p1s] [real] NOT NULL,

	[totalpm] [real] NOT NULL,

	[hg] [real] NOT NULL,

	[Mi] [real] NOT NULL,

	[disti] [real] NOT NULL,

	[Hr] [real] NOT NULL,

	[vmi_trans1] [real] NOT NULL,

	[vmi_trans2] [real] NOT NULL,

	[vmag_trans] [real] NOT NULL,

	[Mv_trans] [real] NOT NULL,

	[distv_kpc] [real] NOT NULL,

	[vtrans_galrest] [real] NOT NULL,

	[mutrans_galradrest] [real] NOT NULL,

	[murad_galradrest] [real] NOT NULL,

	[vtot_galradrest] [real] NOT NULL,

	[mg_tohv] [real] NOT NULL,

	[vtrans_tohv] [real] NOT NULL,

	[pm1sigma_tohv] [real] NOT NULL,

	[v1sigmaerr_tohv] [real] NOT NULL,
 CONSTRAINT [pk_segueTargetAll_objID] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecDR7](

	[specObjID] [bigint] NOT NULL,

	[dr7ObjID] [bigint] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[cx] [float] NOT NULL,

	[cy] [float] NOT NULL,

	[cz] [float] NOT NULL,

	[skyVersion] [tinyint] NOT NULL,

	[run] [smallint] NOT NULL,

	[rerun] [smallint] NOT NULL,

	[camcol] [tinyint] NOT NULL,

	[field] [smallint] NOT NULL,

	[obj] [smallint] NOT NULL,

	[nChild] [smallint] NOT NULL,

	[type] [smallint] NOT NULL,

	[probPSF] [real] NOT NULL,

	[insideMask] [tinyint] NOT NULL,

	[flags] [bigint] NOT NULL,

	[psfMag_u] [real] NOT NULL,

	[psfMag_g] [real] NOT NULL,

	[psfMag_r] [real] NOT NULL,

	[psfMag_i] [real] NOT NULL,

	[psfMag_z] [real] NOT NULL,

	[psfMagErr_u] [real] NOT NULL,

	[psfMagErr_g] [real] NOT NULL,

	[psfMagErr_r] [real] NOT NULL,

	[psfMagErr_i] [real] NOT NULL,

	[psfMagErr_z] [real] NOT NULL,

	[petroMag_u] [real] NOT NULL,

	[petroMag_g] [real] NOT NULL,

	[petroMag_r] [real] NOT NULL,

	[petroMag_i] [real] NOT NULL,

	[petroMag_z] [real] NOT NULL,

	[petroMagErr_u] [real] NOT NULL,

	[petroMagErr_g] [real] NOT NULL,

	[petroMagErr_r] [real] NOT NULL,

	[petroMagErr_i] [real] NOT NULL,

	[petroMagErr_z] [real] NOT NULL,

	[petroR50_r] [real] NOT NULL,

	[petroR90_r] [real] NOT NULL,

	[modelMag_u] [real] NOT NULL,

	[modelMag_g] [real] NOT NULL,

	[modelMag_r] [real] NOT NULL,

	[modelMag_i] [real] NOT NULL,

	[modelMag_z] [real] NOT NULL,

	[modelMagErr_u] [real] NOT NULL,

	[modelMagErr_g] [real] NOT NULL,

	[modelMagErr_r] [real] NOT NULL,

	[modelMagErr_i] [real] NOT NULL,

	[modelMagErr_z] [real] NOT NULL,

	[mRrCc_r] [real] NOT NULL,

	[mRrCcErr_r] [real] NOT NULL,

	[lnLStar_r] [real] NOT NULL,

	[lnLExp_r] [real] NOT NULL,

	[lnLDeV_r] [real] NOT NULL,

	[status] [int] NOT NULL,

	[primTarget] [int] NOT NULL,

	[secTarget] [int] NOT NULL,

	[extinction_u] [real] NOT NULL,

	[extinction_g] [real] NOT NULL,

	[extinction_r] [real] NOT NULL,

	[extinction_i] [real] NOT NULL,

	[extinction_z] [real] NOT NULL,

	[htmID] [bigint] NOT NULL,

	[zoneID] [bigint] NOT NULL,

	[fieldID] [bigint] NOT NULL,

	[size] [real] NOT NULL,

	[pmRa] [real] NOT NULL,

	[pmDec] [real] NOT NULL,

	[pmL] [real] NOT NULL,

	[pmB] [real] NOT NULL,

	[pmRaErr] [real] NOT NULL,

	[pmDecErr] [real] NOT NULL,

	[delta] [real] NOT NULL,

	[match] [int] NOT NULL,
 CONSTRAINT [pk_specDR7_SpecObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecObjAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpecObjAll](

	[specObjID] [bigint] NOT NULL,

	[bestObjID] [bigint] NOT NULL,

	[fluxObjID] [bigint] NOT NULL,

	[targetObjID] [bigint] NOT NULL,

	[plateID] [bigint] NOT NULL,

	[sciencePrimary] [smallint] NOT NULL,

	[legacyPrimary] [smallint] NOT NULL,

	[seguePrimary] [smallint] NOT NULL,

	[segue1Primary] [smallint] NOT NULL,

	[segue2Primary] [smallint] NOT NULL,

	[bossPrimary] [smallint] NOT NULL,

	[sdssPrimary] [smallint] NOT NULL,

	[bossSpecObjID] [int] NOT NULL,

	[firstRelease] [varchar](32) NOT NULL,

	[survey] [varchar](32) NOT NULL,

	[instrument] [varchar](32) NOT NULL,

	[programname] [varchar](32) NOT NULL,

	[chunk] [varchar](32) NOT NULL,

	[platerun] [varchar](32) NOT NULL,

	[mjd] [int] NOT NULL,

	[plate] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[run1d] [varchar](32) NOT NULL,

	[run2d] [varchar](32) NOT NULL,

	[tile] [int] NOT NULL,

	[designID] [int] NOT NULL,

	[legacy_target1] [bigint] NOT NULL,

	[legacy_target2] [bigint] NOT NULL,

	[special_target1] [bigint] NOT NULL,

	[special_target2] [bigint] NOT NULL,

	[segue1_target1] [bigint] NOT NULL,

	[segue1_target2] [bigint] NOT NULL,

	[segue2_target1] [bigint] NOT NULL,

	[segue2_target2] [bigint] NOT NULL,

	[boss_target1] [bigint] NOT NULL,

	[eboss_target0] [bigint] NOT NULL,

	[ancillary_target1] [bigint] NOT NULL,

	[ancillary_target2] [bigint] NOT NULL,

	[primTarget] [bigint] NOT NULL,

	[secTarget] [bigint] NOT NULL,

	[spectrographID] [smallint] NOT NULL,

	[sourceType] [varchar](128) NOT NULL,

	[targetType] [varchar](128) NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[cx] [float] NOT NULL,

	[cy] [float] NOT NULL,

	[cz] [float] NOT NULL,

	[xFocal] [real] NOT NULL,

	[yFocal] [real] NOT NULL,

	[lambdaEff] [real] NOT NULL,

	[blueFiber] [int] NOT NULL,

	[zOffset] [real] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[zWarning] [int] NOT NULL,

	[class] [varchar](32) NOT NULL,

	[subClass] [varchar](32) NOT NULL,

	[rChi2] [real] NOT NULL,

	[DOF] [real] NOT NULL,

	[rChi2Diff] [real] NOT NULL,

	[z_noqso] [real] NOT NULL,

	[zErr_noqso] [real] NOT NULL,

	[zWarning_noqso] [real] NOT NULL,

	[class_noqso] [varchar](32) NOT NULL,

	[subClass_noqso] [varchar](32) NOT NULL,

	[rChi2Diff_noqso] [real] NOT NULL,

	[z_person] [real] NOT NULL,

	[class_person] [varchar](32) NOT NULL,

	[comments_person] [varchar](200) NOT NULL,

	[tFile] [varchar](32) NOT NULL,

	[tColumn_0] [smallint] NOT NULL,

	[tColumn_1] [smallint] NOT NULL,

	[tColumn_2] [smallint] NOT NULL,

	[tColumn_3] [smallint] NOT NULL,

	[tColumn_4] [smallint] NOT NULL,

	[tColumn_5] [smallint] NOT NULL,

	[tColumn_6] [smallint] NOT NULL,

	[tColumn_7] [smallint] NOT NULL,

	[tColumn_8] [smallint] NOT NULL,

	[tColumn_9] [smallint] NOT NULL,

	[nPoly] [real] NOT NULL,

	[theta_0] [real] NOT NULL,

	[theta_1] [real] NOT NULL,

	[theta_2] [real] NOT NULL,

	[theta_3] [real] NOT NULL,

	[theta_4] [real] NOT NULL,

	[theta_5] [real] NOT NULL,

	[theta_6] [real] NOT NULL,

	[theta_7] [real] NOT NULL,

	[theta_8] [real] NOT NULL,

	[theta_9] [real] NOT NULL,

	[velDisp] [real] NOT NULL,

	[velDispErr] [real] NOT NULL,

	[velDispZ] [real] NOT NULL,

	[velDispZErr] [real] NOT NULL,

	[velDispChi2] [real] NOT NULL,

	[velDispNPix] [int] NOT NULL,

	[velDispDOF] [int] NOT NULL,

	[waveMin] [real] NOT NULL,

	[waveMax] [real] NOT NULL,

	[wCoverage] [real] NOT NULL,

	[snMedian_u] [real] NOT NULL,

	[snMedian_g] [real] NOT NULL,

	[snMedian_r] [real] NOT NULL,

	[snMedian_i] [real] NOT NULL,

	[snMedian_z] [real] NOT NULL,

	[snMedian] [real] NOT NULL,

	[chi68p] [real] NOT NULL,

	[fracNSigma_1] [real] NOT NULL,

	[fracNSigma_2] [real] NOT NULL,

	[fracNSigma_3] [real] NOT NULL,

	[fracNSigma_4] [real] NOT NULL,

	[fracNSigma_5] [real] NOT NULL,

	[fracNSigma_6] [real] NOT NULL,

	[fracNSigma_7] [real] NOT NULL,

	[fracNSigma_8] [real] NOT NULL,

	[fracNSigma_9] [real] NOT NULL,

	[fracNSigma_10] [real] NOT NULL,

	[fracNSigHi_1] [real] NOT NULL,

	[fracNSigHi_2] [real] NOT NULL,

	[fracNSigHi_3] [real] NOT NULL,

	[fracNSigHi_4] [real] NOT NULL,

	[fracNSigHi_5] [real] NOT NULL,

	[fracNSigHi_6] [real] NOT NULL,

	[fracNSigHi_7] [real] NOT NULL,

	[fracNSigHi_8] [real] NOT NULL,

	[fracNSigHi_9] [real] NOT NULL,

	[fracNSigHi_10] [real] NOT NULL,

	[fracNSigLo_1] [real] NOT NULL,

	[fracNSigLo_2] [real] NOT NULL,

	[fracNSigLo_3] [real] NOT NULL,

	[fracNSigLo_4] [real] NOT NULL,

	[fracNSigLo_5] [real] NOT NULL,

	[fracNSigLo_6] [real] NOT NULL,

	[fracNSigLo_7] [real] NOT NULL,

	[fracNSigLo_8] [real] NOT NULL,

	[fracNSigLo_9] [real] NOT NULL,

	[fracNSigLo_10] [real] NOT NULL,

	[spectroFlux_u] [real] NOT NULL,

	[spectroFlux_g] [real] NOT NULL,

	[spectroFlux_r] [real] NOT NULL,

	[spectroFlux_i] [real] NOT NULL,

	[spectroFlux_z] [real] NOT NULL,

	[spectroSynFlux_u] [real] NOT NULL,

	[spectroSynFlux_g] [real] NOT NULL,

	[spectroSynFlux_r] [real] NOT NULL,

	[spectroSynFlux_i] [real] NOT NULL,

	[spectroSynFlux_z] [real] NOT NULL,

	[spectroFluxIvar_u] [real] NOT NULL,

	[spectroFluxIvar_g] [real] NOT NULL,

	[spectroFluxIvar_r] [real] NOT NULL,

	[spectroFluxIvar_i] [real] NOT NULL,

	[spectroFluxIvar_z] [real] NOT NULL,

	[spectroSynFluxIvar_u] [real] NOT NULL,

	[spectroSynFluxIvar_g] [real] NOT NULL,

	[spectroSynFluxIvar_r] [real] NOT NULL,

	[spectroSynFluxIvar_i] [real] NOT NULL,

	[spectroSynFluxIvar_z] [real] NOT NULL,

	[spectroSkyFlux_u] [real] NOT NULL,

	[spectroSkyFlux_g] [real] NOT NULL,

	[spectroSkyFlux_r] [real] NOT NULL,

	[spectroSkyFlux_i] [real] NOT NULL,

	[spectroSkyFlux_z] [real] NOT NULL,

	[anyAndMask] [int] NOT NULL,

	[anyOrMask] [int] NOT NULL,

	[plateSN2] [real] NOT NULL,

	[deredSN2] [real] NOT NULL,

	[snTurnoff] [real] NOT NULL,

	[sn1_g] [real] NOT NULL,

	[sn1_r] [real] NOT NULL,

	[sn1_i] [real] NOT NULL,

	[sn2_g] [real] NOT NULL,

	[sn2_r] [real] NOT NULL,

	[sn2_i] [real] NOT NULL,

	[elodieFileName] [varchar](32) NOT NULL,

	[elodieObject] [varchar](32) NOT NULL,

	[elodieSpType] [varchar](32) NOT NULL,

	[elodieBV] [real] NOT NULL,

	[elodieTEff] [real] NOT NULL,

	[elodieLogG] [real] NOT NULL,

	[elodieFeH] [real] NOT NULL,

	[elodieZ] [real] NOT NULL,

	[elodieZErr] [real] NOT NULL,

	[elodieZModelErr] [real] NOT NULL,

	[elodieRChi2] [real] NOT NULL,

	[elodieDOF] [real] NOT NULL,

	[htmID] [bigint] NOT NULL,

	[zoneID] [bigint] NOT NULL,

	[loadVersion] [int] NOT NULL,
	--[img] [varbinary](max) NOT NULL DEFAULT (0x1111),
 CONSTRAINT [pk_SpecObjAll_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
-- TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[SpecPhotoAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpecPhotoAll](

	[specObjID] [bigint] NOT NULL,

	[mjd] [int] NOT NULL,

	[plate] [smallint] NOT NULL,

	[tile] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[class] [varchar](32) NOT NULL,

	[subClass] [varchar](32) NOT NULL,

	[zWarning] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[cx] [float] NOT NULL,

	[cy] [float] NOT NULL,

	[cz] [float] NOT NULL,

	[htmID] [bigint] NOT NULL,

	[zoneID] [bigint] NOT NULL,

	[sciencePrimary] [smallint] NOT NULL,

	[legacyPrimary] [smallint] NOT NULL,

	[seguePrimary] [smallint] NOT NULL,

	[segue1Primary] [smallint] NOT NULL,

	[segue2Primary] [smallint] NOT NULL,

	[bossPrimary] [smallint] NOT NULL,

	[sdssPrimary] [smallint] NOT NULL,

	[survey] [varchar](32) NOT NULL,

	[programname] [varchar](32) NOT NULL,

	[legacy_target1] [bigint] NOT NULL,

	[legacy_target2] [bigint] NOT NULL,

	[special_target1] [bigint] NOT NULL,

	[special_target2] [bigint] NOT NULL,

	[segue1_target1] [bigint] NOT NULL,

	[segue1_target2] [bigint] NOT NULL,

	[segue2_target1] [bigint] NOT NULL,

	[segue2_target2] [bigint] NOT NULL,

	[boss_target1] [bigint] NOT NULL,

	[ancillary_target1] [bigint] NOT NULL,

	[ancillary_target2] [bigint] NOT NULL,

	[plateID] [bigint] NOT NULL,

	[sourceType] [varchar](32) NOT NULL,

	[targetObjID] [bigint] NOT NULL,

	[objID] [bigint] NULL,

	[skyVersion] [int] NULL,

	[run] [int] NULL,

	[rerun] [int] NULL,

	[camcol] [int] NULL,

	[field] [int] NULL,

	[obj] [int] NULL,

	[mode] [int] NULL,

	[nChild] [int] NULL,

	[type] [int] NULL,

	[flags] [bigint] NULL,

	[psfMag_u] [real] NULL,

	[psfMag_g] [real] NULL,

	[psfMag_r] [real] NULL,

	[psfMag_i] [real] NULL,

	[psfMag_z] [real] NULL,

	[psfMagErr_u] [real] NULL,

	[psfMagErr_g] [real] NULL,

	[psfMagErr_r] [real] NULL,

	[psfMagErr_i] [real] NULL,

	[psfMagErr_z] [real] NULL,

	[fiberMag_u] [real] NULL,

	[fiberMag_g] [real] NULL,

	[fiberMag_r] [real] NULL,

	[fiberMag_i] [real] NULL,

	[fiberMag_z] [real] NULL,

	[fiberMagErr_u] [real] NULL,

	[fiberMagErr_g] [real] NULL,

	[fiberMagErr_r] [real] NULL,

	[fiberMagErr_i] [real] NULL,

	[fiberMagErr_z] [real] NULL,

	[petroMag_u] [real] NULL,

	[petroMag_g] [real] NULL,

	[petroMag_r] [real] NULL,

	[petroMag_i] [real] NULL,

	[petroMag_z] [real] NULL,

	[petroMagErr_u] [real] NULL,

	[petroMagErr_g] [real] NULL,

	[petroMagErr_r] [real] NULL,

	[petroMagErr_i] [real] NULL,

	[petroMagErr_z] [real] NULL,

	[modelMag_u] [real] NULL,

	[modelMag_g] [real] NULL,

	[modelMag_r] [real] NULL,

	[modelMag_i] [real] NULL,

	[modelMag_z] [real] NULL,

	[modelMagErr_u] [real] NULL,

	[modelMagErr_g] [real] NULL,

	[modelMagErr_r] [real] NULL,

	[modelMagErr_i] [real] NULL,

	[modelMagErr_z] [real] NULL,

	[cModelMag_u] [real] NULL,

	[cModelMag_g] [real] NULL,

	[cModelMag_r] [real] NULL,

	[cModelMag_i] [real] NULL,

	[cModelMag_z] [real] NULL,

	[cModelMagErr_u] [real] NULL,

	[cModelMagErr_g] [real] NULL,

	[cModelMagErr_r] [real] NULL,

	[cModelMagErr_i] [real] NULL,

	[cModelMagErr_z] [real] NULL,

	[mRrCc_r] [real] NULL,

	[mRrCcErr_r] [real] NULL,

	[score] [real] NULL,

	[resolveStatus] [int] NULL,

	[calibStatus_u] [int] NULL,

	[calibStatus_g] [int] NULL,

	[calibStatus_r] [int] NULL,

	[calibStatus_i] [int] NULL,

	[calibStatus_z] [int] NULL,

	[photoRa] [float] NULL,

	[photoDec] [float] NULL,

	[extinction_u] [real] NULL,

	[extinction_g] [real] NULL,

	[extinction_r] [real] NULL,

	[extinction_i] [real] NULL,

	[extinction_z] [real] NULL,

	[fieldID] [bigint] NULL,

	[dered_u] [real] NULL,

	[dered_g] [real] NULL,

	[dered_r] [real] NULL,

	[dered_i] [real] NULL,

	[dered_z] [real] NULL,
 CONSTRAINT [pk_SpecPhotoAll_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppLines]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sppLines](

	[SPECOBJID] [bigint] NOT NULL,

	[bestObjID] [bigint] NOT NULL,

	[TARGETOBJID] [bigint] NOT NULL,

	[sciencePrimary] [smallint] NOT NULL,

	[legacyPrimary] [smallint] NOT NULL,

	[seguePrimary] [smallint] NOT NULL,

	[PLATE] [bigint] NOT NULL,

	[MJD] [bigint] NOT NULL,

	[FIBER] [bigint] NOT NULL,

	[RUN2D] [varchar](32) NOT NULL,

	[RUN1D] [varchar](32) NOT NULL,

	[RUNSSPP] [varchar](32) NOT NULL,

	[H83side] [real] NOT NULL,

	[H83cont] [real] NOT NULL,

	[H83err] [real] NOT NULL,

	[H83mask] [tinyint] NOT NULL,

	[H812side] [real] NOT NULL,

	[H812cont] [real] NOT NULL,

	[H812err] [real] NOT NULL,

	[H812mask] [tinyint] NOT NULL,

	[H824side] [real] NOT NULL,

	[H824cont] [real] NOT NULL,

	[H824err] [real] NOT NULL,

	[H824mask] [tinyint] NOT NULL,

	[H848side] [real] NOT NULL,

	[H848cont] [real] NOT NULL,

	[H848err] [real] NOT NULL,

	[H848mask] [tinyint] NOT NULL,

	[KP12side] [real] NOT NULL,

	[KP12cont] [real] NOT NULL,

	[KP12err] [real] NOT NULL,

	[KP12mask] [tinyint] NOT NULL,

	[KP18side] [real] NOT NULL,

	[KP18cont] [real] NOT NULL,

	[KP18err] [real] NOT NULL,

	[KP18mask] [tinyint] NOT NULL,

	[KP6side] [real] NOT NULL,

	[KP6cont] [real] NOT NULL,

	[KP6err] [real] NOT NULL,

	[KP6mask] [tinyint] NOT NULL,

	[CaIIKside] [real] NOT NULL,

	[CaIIKcont] [real] NOT NULL,

	[CaIIKerr] [real] NOT NULL,

	[CaIIKmask] [tinyint] NOT NULL,

	[CaIIHKside] [real] NOT NULL,

	[CaIIHKcont] [real] NOT NULL,

	[CaIIHKerr] [real] NOT NULL,

	[CaIIHKmask] [tinyint] NOT NULL,

	[Hepsside] [real] NOT NULL,

	[Hepscont] [real] NOT NULL,

	[Hepserr] [real] NOT NULL,

	[Hepsmask] [tinyint] NOT NULL,

	[KP16side] [real] NOT NULL,

	[KP16cont] [real] NOT NULL,

	[KP16err] [real] NOT NULL,

	[KP16mask] [tinyint] NOT NULL,

	[SrII1side] [real] NOT NULL,

	[SrII1cont] [real] NOT NULL,

	[SrII1err] [real] NOT NULL,

	[SrII1mask] [tinyint] NOT NULL,

	[HeI121side] [real] NOT NULL,

	[HeI121cont] [real] NOT NULL,

	[HeI121err] [real] NOT NULL,

	[HeI121mask] [tinyint] NOT NULL,

	[Hdelta12side] [real] NOT NULL,

	[Hdelta12cont] [real] NOT NULL,

	[Hdelta12err] [real] NOT NULL,

	[Hdelta12mask] [tinyint] NOT NULL,

	[Hdelta24side] [real] NOT NULL,

	[Hdelta24cont] [real] NOT NULL,

	[Hdelta24err] [real] NOT NULL,

	[Hdelta24mask] [tinyint] NOT NULL,

	[Hdelta48side] [real] NOT NULL,

	[Hdelta48cont] [real] NOT NULL,

	[Hdelta48err] [real] NOT NULL,

	[Hdelta48mask] [tinyint] NOT NULL,

	[Hdeltaside] [real] NOT NULL,

	[Hdeltacont] [real] NOT NULL,

	[Hdeltaerr] [real] NOT NULL,

	[Hdeltamask] [tinyint] NOT NULL,

	[CaI4side] [real] NOT NULL,

	[CaI4cont] [real] NOT NULL,

	[CaI4err] [real] NOT NULL,

	[CaI4mask] [tinyint] NOT NULL,

	[CaI12side] [real] NOT NULL,

	[CaI12cont] [real] NOT NULL,

	[CaI12err] [real] NOT NULL,

	[CaI12mask] [tinyint] NOT NULL,

	[CaI24side] [real] NOT NULL,

	[CaI24cont] [real] NOT NULL,

	[CaI24err] [real] NOT NULL,

	[CaI24mask] [tinyint] NOT NULL,

	[CaI6side] [real] NOT NULL,

	[CaI6cont] [real] NOT NULL,

	[CaI6err] [real] NOT NULL,

	[CaI6mask] [tinyint] NOT NULL,

	[Gside] [real] NOT NULL,

	[Gcont] [real] NOT NULL,

	[Gerr] [real] NOT NULL,

	[Gmask] [tinyint] NOT NULL,

	[Hgamma12side] [real] NOT NULL,

	[Hgamma12cont] [real] NOT NULL,

	[Hgamma12err] [real] NOT NULL,

	[Hgamma12mask] [tinyint] NOT NULL,

	[Hgamma24side] [real] NOT NULL,

	[Hgamma24cont] [real] NOT NULL,

	[Hgamma24err] [real] NOT NULL,

	[Hgamma24mask] [tinyint] NOT NULL,

	[Hgamma48side] [real] NOT NULL,

	[Hgamma48cont] [real] NOT NULL,

	[Hgamma48err] [real] NOT NULL,

	[Hgamma48mask] [tinyint] NOT NULL,

	[Hgammaside] [real] NOT NULL,

	[Hgammacont] [real] NOT NULL,

	[Hgammaerr] [real] NOT NULL,

	[Hgammamask] [tinyint] NOT NULL,

	[HeI122side] [real] NOT NULL,

	[HeI122cont] [real] NOT NULL,

	[HeI122err] [real] NOT NULL,

	[HeI122mask] [tinyint] NOT NULL,

	[Gblueside] [real] NOT NULL,

	[Gbluecont] [real] NOT NULL,

	[Gblueerr] [real] NOT NULL,

	[Gbluemask] [tinyint] NOT NULL,

	[Gwholeside] [real] NOT NULL,

	[Gwholecont] [real] NOT NULL,

	[Gwholeerr] [real] NOT NULL,

	[Gwholemask] [tinyint] NOT NULL,

	[Baside] [real] NOT NULL,

	[Bacont] [real] NOT NULL,

	[Baerr] [real] NOT NULL,

	[Bamask] [tinyint] NOT NULL,

	[C12C13side] [real] NOT NULL,

	[C12C13cont] [real] NOT NULL,

	[C12C13err] [real] NOT NULL,

	[C12C13mask] [tinyint] NOT NULL,

	[CC12side] [real] NOT NULL,

	[CC12cont] [real] NOT NULL,

	[CC12err] [real] NOT NULL,

	[CC12mask] [tinyint] NOT NULL,

	[metal1side] [real] NOT NULL,

	[metal1cont] [real] NOT NULL,

	[metal1err] [real] NOT NULL,

	[metal1mask] [tinyint] NOT NULL,

	[Hbeta12side] [real] NOT NULL,

	[Hbeta12cont] [real] NOT NULL,

	[Hbeta12err] [real] NOT NULL,

	[Hbeta12mask] [tinyint] NOT NULL,

	[Hbeta24side] [real] NOT NULL,

	[Hbeta24cont] [real] NOT NULL,

	[Hbeta24err] [real] NOT NULL,

	[Hbeta24mask] [tinyint] NOT NULL,

	[Hbeta48side] [real] NOT NULL,

	[Hbeta48cont] [real] NOT NULL,

	[Hbeta48err] [real] NOT NULL,

	[Hbeta48mask] [tinyint] NOT NULL,

	[Hbetaside] [real] NOT NULL,

	[Hbetacont] [real] NOT NULL,

	[Hbetaerr] [real] NOT NULL,

	[Hbetamask] [tinyint] NOT NULL,

	[C2side] [real] NOT NULL,

	[C2cont] [real] NOT NULL,

	[C2err] [real] NOT NULL,

	[C2mask] [tinyint] NOT NULL,

	[C2MgIside] [real] NOT NULL,

	[C2MgIcont] [real] NOT NULL,

	[C2MgIerr] [real] NOT NULL,

	[C2MgImask] [tinyint] NOT NULL,

	[MgHMgIC2side] [real] NOT NULL,

	[MgHMgIC2cont] [real] NOT NULL,

	[MgHMgIC2err] [real] NOT NULL,

	[MgHMgIC2mask] [tinyint] NOT NULL,

	[MgHMgIside] [real] NOT NULL,

	[MgHMgIcont] [real] NOT NULL,

	[MgHMgIerr] [real] NOT NULL,

	[MgHMgImask] [tinyint] NOT NULL,

	[MgHside] [real] NOT NULL,

	[MgHcont] [real] NOT NULL,

	[MgHerr] [real] NOT NULL,

	[MgHmask] [tinyint] NOT NULL,

	[CrIside] [real] NOT NULL,

	[CrIcont] [real] NOT NULL,

	[CrIerr] [real] NOT NULL,

	[CrImask] [tinyint] NOT NULL,

	[MgIFeIIside] [real] NOT NULL,

	[MgIFeIIcont] [real] NOT NULL,

	[MgIFeIIerr] [real] NOT NULL,

	[MgIFeIImask] [tinyint] NOT NULL,

	[MgI2side] [real] NOT NULL,

	[MgI2cont] [real] NOT NULL,

	[MgI2err] [real] NOT NULL,

	[MgI2mask] [tinyint] NOT NULL,

	[MgI121side] [real] NOT NULL,

	[MgI121cont] [real] NOT NULL,

	[MgI121err] [real] NOT NULL,

	[MgI121mask] [tinyint] NOT NULL,

	[MgI24side] [real] NOT NULL,

	[MgI24cont] [real] NOT NULL,

	[MgI24err] [real] NOT NULL,

	[MgI24mask] [tinyint] NOT NULL,

	[MgI122side] [real] NOT NULL,

	[MgI122cont] [real] NOT NULL,

	[MgI122err] [real] NOT NULL,

	[MgI122mask] [tinyint] NOT NULL,

	[NaI20side] [real] NOT NULL,

	[NaI20cont] [real] NOT NULL,

	[NaI20err] [real] NOT NULL,

	[NaI20mask] [tinyint] NOT NULL,

	[Na12side] [real] NOT NULL,

	[Na12cont] [real] NOT NULL,

	[Na12err] [real] NOT NULL,

	[Na12mask] [tinyint] NOT NULL,

	[Na24side] [real] NOT NULL,

	[Na24cont] [real] NOT NULL,

	[Na24err] [real] NOT NULL,

	[Na24mask] [tinyint] NOT NULL,

	[Halpha12side] [real] NOT NULL,

	[Halpha12cont] [real] NOT NULL,

	[Halpha12err] [real] NOT NULL,

	[Halpha12mask] [tinyint] NOT NULL,

	[Halpha24side] [real] NOT NULL,

	[Halpha24cont] [real] NOT NULL,

	[Halpha24err] [real] NOT NULL,

	[Halpha24mask] [tinyint] NOT NULL,

	[Halpha48side] [real] NOT NULL,

	[Halpha48cont] [real] NOT NULL,

	[Halpha48err] [real] NOT NULL,

	[Halpha48mask] [tinyint] NOT NULL,

	[Halpha70side] [real] NOT NULL,

	[Halpha70cont] [real] NOT NULL,

	[Halpha70err] [real] NOT NULL,

	[Halpha70mask] [tinyint] NOT NULL,

	[CaHside] [real] NOT NULL,

	[CaHcont] [real] NOT NULL,

	[CaHerr] [real] NOT NULL,

	[CaHmask] [tinyint] NOT NULL,

	[TiOside] [real] NOT NULL,

	[TiOcont] [real] NOT NULL,

	[TiOerr] [real] NOT NULL,

	[TiOmask] [tinyint] NOT NULL,

	[CNside] [real] NOT NULL,

	[CNcont] [real] NOT NULL,

	[CNerr] [real] NOT NULL,

	[CNmask] [tinyint] NOT NULL,

	[OItripside] [real] NOT NULL,

	[OItripcont] [real] NOT NULL,

	[OItriperr] [real] NOT NULL,

	[OItripmask] [tinyint] NOT NULL,

	[KI34side] [real] NOT NULL,

	[KI34cont] [real] NOT NULL,

	[KI34err] [real] NOT NULL,

	[KI34mask] [tinyint] NOT NULL,

	[KI95side] [real] NOT NULL,

	[KI95cont] [real] NOT NULL,

	[KI95err] [real] NOT NULL,

	[KI95mask] [tinyint] NOT NULL,

	[NaI15side] [real] NOT NULL,

	[NaI15cont] [real] NOT NULL,

	[NaI15err] [real] NOT NULL,

	[NaI15mask] [tinyint] NOT NULL,

	[NaIredside] [real] NOT NULL,

	[NaIredcont] [real] NOT NULL,

	[NaIrederr] [real] NOT NULL,

	[NaIredmask] [tinyint] NOT NULL,

	[CaII26side] [real] NOT NULL,

	[CaII26cont] [real] NOT NULL,

	[CaII26err] [real] NOT NULL,

	[CaII26mask] [tinyint] NOT NULL,

	[Paschen13side] [real] NOT NULL,

	[Paschen13cont] [real] NOT NULL,

	[Paschen13err] [real] NOT NULL,

	[Paschen13mask] [tinyint] NOT NULL,

	[CaII29side] [real] NOT NULL,

	[CaII29cont] [real] NOT NULL,

	[CaII29err] [real] NOT NULL,

	[CaII29mask] [tinyint] NOT NULL,

	[CaII401side] [real] NOT NULL,

	[CaII401cont] [real] NOT NULL,

	[CaII401err] [real] NOT NULL,

	[CaII401mask] [tinyint] NOT NULL,

	[CaII161side] [real] NOT NULL,

	[CaII161cont] [real] NOT NULL,

	[CaII161err] [real] NOT NULL,

	[CaII161mask] [tinyint] NOT NULL,

	[Paschen421side] [real] NOT NULL,

	[Paschen421cont] [real] NOT NULL,

	[Paschen421err] [real] NOT NULL,

	[Paschen421mask] [tinyint] NOT NULL,

	[CaII162side] [real] NOT NULL,

	[CaII162cont] [real] NOT NULL,

	[CaII162err] [real] NOT NULL,

	[CaII162mask] [tinyint] NOT NULL,

	[CaII402side] [real] NOT NULL,

	[CaII402cont] [real] NOT NULL,

	[CaII402err] [real] NOT NULL,

	[CaII402mask] [tinyint] NOT NULL,

	[Paschen422side] [real] NOT NULL,

	[Paschen422cont] [real] NOT NULL,

	[Paschen422err] [real] NOT NULL,

	[Paschen422mask] [tinyint] NOT NULL,

	[TiO5side] [real] NOT NULL,

	[TiO5cont] [real] NOT NULL,

	[TiO5err] [real] NOT NULL,

	[TiO5mask] [tinyint] NOT NULL,

	[TiO8side] [real] NOT NULL,

	[TiO8cont] [real] NOT NULL,

	[TiO8err] [real] NOT NULL,

	[TiO8mask] [tinyint] NOT NULL,

	[CaH1side] [real] NOT NULL,

	[CaH1cont] [real] NOT NULL,

	[CaH1err] [real] NOT NULL,

	[CaH1mask] [tinyint] NOT NULL,

	[CaH2side] [real] NOT NULL,

	[CaH2cont] [real] NOT NULL,

	[CaH2err] [real] NOT NULL,

	[CaH2mask] [tinyint] NOT NULL,

	[CaH3side] [real] NOT NULL,

	[CaH3cont] [real] NOT NULL,

	[CaH3err] [real] NOT NULL,

	[CaH3mask] [tinyint] NOT NULL,

	[UVCNside] [real] NOT NULL,

	[UVCNcont] [real] NOT NULL,

	[UVCNerr] [real] NOT NULL,

	[UVCNmask] [tinyint] NOT NULL,

	[BLCNside] [real] NOT NULL,

	[BLCNcont] [real] NOT NULL,

	[BLCNerr] [real] NOT NULL,

	[BLCNmask] [tinyint] NOT NULL,

	[FEI1side] [real] NOT NULL,

	[FEI1cont] [real] NOT NULL,

	[FEI1err] [real] NOT NULL,

	[FEI1mask] [tinyint] NOT NULL,

	[FEI2side] [real] NOT NULL,

	[FEI2cont] [real] NOT NULL,

	[FEI2err] [real] NOT NULL,

	[FEI2mask] [tinyint] NOT NULL,

	[FEI3side] [real] NOT NULL,

	[FEI3cont] [real] NOT NULL,

	[FEI3err] [real] NOT NULL,

	[FEI3mask] [tinyint] NOT NULL,

	[SRII2side] [real] NOT NULL,

	[SRII2cont] [real] NOT NULL,

	[SRII2err] [real] NOT NULL,

	[SRII2mask] [tinyint] NOT NULL,

	[FEI4side] [real] NOT NULL,

	[FEI4cont] [real] NOT NULL,

	[FEI4err] [real] NOT NULL,

	[FEI4mask] [tinyint] NOT NULL,

	[FEI5side] [real] NOT NULL,

	[FEI5cont] [real] NOT NULL,

	[FEI5err] [real] NOT NULL,

	[FEI5mask] [tinyint] NOT NULL,
 CONSTRAINT [pk_sppLines_specObjID] PRIMARY KEY CLUSTERED 
(
	[SPECOBJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppParams]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sppParams](

	[SPECOBJID] [bigint] NOT NULL,

	[BESTOBJID] [bigint] NOT NULL,

	[FLUXOBJID] [bigint] NOT NULL,

	[TARGETOBJID] [bigint] NOT NULL,

	[PLATEID] [bigint] NOT NULL,

	[sciencePrimary] [smallint] NOT NULL,

	[legacyPrimary] [smallint] NOT NULL,

	[seguePrimary] [smallint] NOT NULL,

	[FIRSTRELEASE] [varchar](32) NOT NULL,

	[SURVEY] [varchar](32) NOT NULL,

	[PROGRAMNAME] [varchar](32) NOT NULL,

	[CHUNK] [varchar](32) NOT NULL,

	[PLATERUN] [varchar](32) NOT NULL,

	[MJD] [bigint] NOT NULL,

	[PLATE] [bigint] NOT NULL,

	[FIBERID] [bigint] NOT NULL,

	[RUN2D] [varchar](32) NOT NULL,

	[RUN1D] [varchar](32) NOT NULL,

	[RUNSSPP] [varchar](32) NOT NULL,

	[TARGETSTRING] [varchar](32) NOT NULL,

	[PRIMTARGET] [bigint] NOT NULL,

	[SECTARGET] [bigint] NOT NULL,

	[LEGACY_TARGET1] [bigint] NOT NULL,

	[LEGACY_TARGET2] [bigint] NOT NULL,

	[SPECIAL_TARGET1] [bigint] NOT NULL,

	[SPECIAL_TARGET2] [bigint] NOT NULL,

	[SEGUE1_TARGET1] [bigint] NOT NULL,

	[SEGUE1_TARGET2] [bigint] NOT NULL,

	[SEGUE2_TARGET1] [bigint] NOT NULL,

	[SEGUE2_TARGET2] [bigint] NOT NULL,

	[SPECTYPEHAMMER] [varchar](32) NOT NULL,

	[SPECTYPESUBCLASS] [varchar](32) NOT NULL,

	[FLAG] [varchar](32) NOT NULL,

	[TEFFADOP] [real] NOT NULL,

	[TEFFADOPN] [tinyint] NOT NULL,

	[TEFFADOPUNC] [real] NOT NULL,

	[TEFFHA24] [real] NOT NULL,

	[TEFFHD24] [real] NOT NULL,

	[TEFFNGS1] [real] NOT NULL,

	[TEFFANNSR] [real] NOT NULL,

	[TEFFANNRR] [real] NOT NULL,

	[TEFFWBG] [real] NOT NULL,

	[TEFFK24] [real] NOT NULL,

	[TEFFKI13] [real] NOT NULL,

	[TEFFHA24IND] [tinyint] NOT NULL,

	[TEFFHD24IND] [tinyint] NOT NULL,

	[TEFFNGS1IND] [tinyint] NOT NULL,

	[TEFFANNSRIND] [tinyint] NOT NULL,

	[TEFFANNRRIND] [tinyint] NOT NULL,

	[TEFFWBGIND] [tinyint] NOT NULL,

	[TEFFK24IND] [tinyint] NOT NULL,

	[TEFFKI13IND] [tinyint] NOT NULL,

	[TEFFHA24UNC] [real] NOT NULL,

	[TEFFHD24UNC] [real] NOT NULL,

	[TEFFNGS1UNC] [real] NOT NULL,

	[TEFFANNSRUNC] [real] NOT NULL,

	[TEFFANNRRUNC] [real] NOT NULL,

	[TEFFWBGUNC] [real] NOT NULL,

	[TEFFK24UNC] [real] NOT NULL,

	[TEFFKI13UNC] [real] NOT NULL,

	[LOGGADOP] [real] NOT NULL,

	[LOGGADOPN] [tinyint] NOT NULL,

	[LOGGADOPUNC] [real] NOT NULL,

	[LOGGNGS2] [real] NOT NULL,

	[LOGGNGS1] [real] NOT NULL,

	[LOGGANNSR] [real] NOT NULL,

	[LOGGANNRR] [real] NOT NULL,

	[LOGGCAI1] [real] NOT NULL,

	[LOGGWBG] [real] NOT NULL,

	[LOGGK24] [real] NOT NULL,

	[LOGGKI13] [real] NOT NULL,

	[LOGGNGS2IND] [tinyint] NOT NULL,

	[LOGGNGS1IND] [tinyint] NOT NULL,

	[LOGGANNSRIND] [tinyint] NOT NULL,

	[LOGGANNRRIND] [tinyint] NOT NULL,

	[LOGGCAI1IND] [tinyint] NOT NULL,

	[LOGGWBGIND] [tinyint] NOT NULL,

	[LOGGK24IND] [tinyint] NOT NULL,

	[LOGGKI13IND] [tinyint] NOT NULL,

	[LOGGNGS2UNC] [real] NOT NULL,

	[LOGGNGS1UNC] [real] NOT NULL,

	[LOGGANNSRUNC] [real] NOT NULL,

	[LOGGANNRRUNC] [real] NOT NULL,

	[LOGGCAI1UNC] [real] NOT NULL,

	[LOGGWBGUNC] [real] NOT NULL,

	[LOGGK24UNC] [real] NOT NULL,

	[LOGGKI13UNC] [real] NOT NULL,

	[FEHADOP] [real] NOT NULL,

	[FEHADOPN] [tinyint] NOT NULL,

	[FEHADOPUNC] [real] NOT NULL,

	[FEHNGS2] [real] NOT NULL,

	[FEHNGS1] [real] NOT NULL,

	[FEHANNSR] [real] NOT NULL,

	[FEHANNRR] [real] NOT NULL,

	[FEHCAIIK1] [real] NOT NULL,

	[FEHCAIIK2] [real] NOT NULL,

	[FEHCAIIK3] [real] NOT NULL,

	[FEHWBG] [real] NOT NULL,

	[FEHK24] [real] NOT NULL,

	[FEHKI13] [real] NOT NULL,

	[FEHNGS2IND] [tinyint] NOT NULL,

	[FEHNGS1IND] [tinyint] NOT NULL,

	[FEHANNSRIND] [tinyint] NOT NULL,

	[FEHANNRRIND] [tinyint] NOT NULL,

	[FEHCAIIK1IND] [tinyint] NOT NULL,

	[FEHCAIIK2IND] [tinyint] NOT NULL,

	[FEHCAIIK3IND] [tinyint] NOT NULL,

	[FEHWBGIND] [tinyint] NOT NULL,

	[FEHK24IND] [tinyint] NOT NULL,

	[FEHKI13IND] [tinyint] NOT NULL,

	[FEHNGS2UNC] [real] NOT NULL,

	[FEHNGS1UNC] [real] NOT NULL,

	[FEHANNSRUNC] [real] NOT NULL,

	[FEHANNRRUNC] [real] NOT NULL,

	[FEHCAIIK1UNC] [real] NOT NULL,

	[FEHCAIIK2UNC] [real] NOT NULL,

	[FEHCAIIK3UNC] [real] NOT NULL,

	[FEHWBGUNC] [real] NOT NULL,

	[FEHK24UNC] [real] NOT NULL,

	[FEHKI13UNC] [real] NOT NULL,

	[SNR] [real] NOT NULL,

	[QA] [tinyint] NOT NULL,

	[CCCAHK] [real] NOT NULL,

	[CCMGH] [real] NOT NULL,

	[TEFFSPEC] [real] NOT NULL,

	[TEFFSPECN] [tinyint] NOT NULL,

	[TEFFSPECUNC] [real] NOT NULL,

	[LOGGSPEC] [real] NOT NULL,

	[LOGGSPECN] [tinyint] NOT NULL,

	[LOGGSPECUNC] [real] NOT NULL,

	[FEHSPEC] [real] NOT NULL,

	[FEHSPECN] [tinyint] NOT NULL,

	[FEHSPECUNC] [real] NOT NULL,

	[ACF1] [real] NOT NULL,

	[ACF1SNR] [real] NOT NULL,

	[ACF2] [real] NOT NULL,

	[ACF2SNR] [real] NOT NULL,

	[INSPECT] [varchar](32) NOT NULL,

	[ELODIERVFINAL] [real] NOT NULL,

	[ELODIERVFINALERR] [real] NOT NULL,

	[ZWARNING] [bigint] NOT NULL,

	[TEFFIRFM] [real] NOT NULL,

	[TEFFIRFMIND] [tinyint] NOT NULL,

	[TEFFIRFMUNC] [real] NOT NULL,

	[LOGGNGS1IRFM] [real] NOT NULL,

	[LOGGNGS1IRFMIND] [tinyint] NOT NULL,

	[LOGGNGS1IRFMUNC] [real] NOT NULL,

	[FEHNGS1IRFM] [real] NOT NULL,

	[FEHNGS1IRFMIND] [tinyint] NOT NULL,

	[FEHNGS1IRFMUNC] [real] NOT NULL,

	[LOGGCAI1IRFM] [real] NOT NULL,

	[LOGGCAI1IRFMIND] [tinyint] NOT NULL,

	[LOGGCAI1IRFMUNC] [real] NOT NULL,

	[FEHCAIIK1IRFM] [real] NOT NULL,

	[FEHCAIIK1IRFMIND] [tinyint] NOT NULL,

	[FEHCAIIK1IRFMUNC] [real] NOT NULL,
 CONSTRAINT [pk_sppParams_specObjID] PRIMARY KEY CLUSTERED 
(
	[SPECOBJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppTargets]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sppTargets](

	[OBJID] [bigint] NOT NULL,

	[RUN] [bigint] NOT NULL,

	[RERUN] [bigint] NOT NULL,

	[CAMCOL] [bigint] NOT NULL,

	[FIELD] [bigint] NOT NULL,

	[OBJ] [bigint] NOT NULL,

	[RA] [float] NOT NULL,

	[DEC] [float] NOT NULL,

	[L] [float] NOT NULL,

	[B] [float] NOT NULL,

	[FIBERMAG_u] [real] NOT NULL,

	[FIBERMAG_g] [real] NOT NULL,

	[FIBERMAG_r] [real] NOT NULL,

	[FIBERMAG_i] [real] NOT NULL,

	[FIBERMAG_z] [real] NOT NULL,

	[PSFMAG_u] [real] NOT NULL,

	[PSFMAG_g] [real] NOT NULL,

	[PSFMAG_r] [real] NOT NULL,

	[PSFMAG_i] [real] NOT NULL,

	[PSFMAG_z] [real] NOT NULL,

	[EXTINCTION_u] [real] NOT NULL,

	[EXTINCTION_g] [real] NOT NULL,

	[EXTINCTION_r] [real] NOT NULL,

	[EXTINCTION_i] [real] NOT NULL,

	[EXTINCTION_z] [real] NOT NULL,

	[ROWC] [int] NOT NULL,

	[COLC] [int] NOT NULL,

	[TYPE] [int] NOT NULL,

	[FLAGS] [bigint] NOT NULL,

	[FLAGS_u] [bigint] NOT NULL,

	[FLAGS_g] [bigint] NOT NULL,

	[FLAGS_r] [bigint] NOT NULL,

	[FLAGS_i] [bigint] NOT NULL,

	[FLAGS_z] [bigint] NOT NULL,

	[PSFMAGERR_u] [real] NOT NULL,

	[PSFMAGERR_g] [real] NOT NULL,

	[PSFMAGERR_r] [real] NOT NULL,

	[PSFMAGERR_i] [real] NOT NULL,

	[PSFMAGERR_z] [real] NOT NULL,

	[PLATEID] [bigint] NOT NULL,

	[SPECOBJID] [bigint] NOT NULL,

	[PLATE] [bigint] NOT NULL,

	[MJD] [bigint] NOT NULL,

	[FIBERID] [bigint] NOT NULL,

	[ORIGINALPLATEID] [bigint] NOT NULL,

	[ORIGINALSPECOBJID] [bigint] NOT NULL,

	[ORIGINALPLATE] [bigint] NOT NULL,

	[ORIGINALMJD] [bigint] NOT NULL,

	[ORIGINALFIBERID] [bigint] NOT NULL,

	[BESTOBJID] [bigint] NOT NULL,

	[TARGETOBJID] [bigint] NOT NULL,

	[PRIMTARGET] [int] NOT NULL,

	[SECTARGET] [int] NOT NULL,

	[SEGUE1_TARGET1] [bigint] NOT NULL,

	[SEGUE1_TARGET2] [bigint] NOT NULL,

	[SEGUE2_TARGET1] [int] NOT NULL,

	[SEGUE2_TARGET2] [int] NOT NULL,

	[MATCH] [bigint] NOT NULL,

	[DELTA] [float] NOT NULL,

	[PML] [float] NOT NULL,

	[PMB] [float] NOT NULL,

	[PMRA] [float] NOT NULL,

	[PMDEC] [float] NOT NULL,

	[PMRAERR] [float] NOT NULL,

	[PMDECERR] [float] NOT NULL,

	[PMSIGRA] [float] NOT NULL,

	[PMSIGDEC] [float] NOT NULL,

	[NFIT] [int] NOT NULL,

	[DIST22] [float] NOT NULL,

	[DIST20] [float] NOT NULL,

	[uMAG0] [real] NOT NULL,

	[gMAG0] [real] NOT NULL,

	[rMAG0] [real] NOT NULL,

	[iMAG0] [real] NOT NULL,

	[zMAG0] [real] NOT NULL,

	[umg0] [real] NOT NULL,

	[gmr0] [real] NOT NULL,

	[rmi0] [real] NOT NULL,

	[imz0] [real] NOT NULL,

	[gmi0] [real] NOT NULL,

	[umgERR] [real] NOT NULL,

	[gmrERR] [real] NOT NULL,

	[rmiERR] [real] NOT NULL,

	[imzERR] [real] NOT NULL,

	[PSFMAG_umg] [real] NOT NULL,

	[PSFMAG_gmr] [real] NOT NULL,

	[PSFMAG_rmi] [real] NOT NULL,

	[PSFMAG_imz] [real] NOT NULL,

	[PSFMAG_gmi] [real] NOT NULL,

	[lcolor] [real] NOT NULL,

	[scolor] [real] NOT NULL,

	[p1s] [real] NOT NULL,

	[TOTALPM] [real] NOT NULL,

	[Hg] [real] NOT NULL,

	[Mi] [real] NOT NULL,

	[DISTi] [real] NOT NULL,

	[Hr] [real] NOT NULL,

	[VMI_TRANS1] [real] NOT NULL,

	[VMI_TRANS2] [real] NOT NULL,

	[VMAG_TRANS] [real] NOT NULL,

	[MV_TRANS] [real] NOT NULL,

	[DISTV_KPC] [real] NOT NULL,

	[VTRANS_GALREST] [real] NOT NULL,

	[MUTRANS_GALRADREST] [real] NOT NULL,

	[MURAD_GALRADREST] [real] NOT NULL,

	[VTOT_GALRADREST] [real] NOT NULL,

	[MG_TOHV] [real] NOT NULL,

	[VTRANS_TOHV] [real] NOT NULL,

	[PM1SIGMA_TOHV] [real] NOT NULL,

	[V1SIGMAERR_TOHV] [real] NOT NULL,
	[TARGET_VERSION] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyDust](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NULL,

	[fiberID] [smallint] NULL,

	[MJD] [int] NULL,

	[ra] [float] NULL,

	[dec] [float] NULL,

	[z] [real] NULL,

	[z_err] [real] NULL,

	[ke_u] [float] NULL,

	[ke_g] [float] NULL,

	[ke_r] [float] NULL,

	[ke_i] [float] NULL,

	[ke_z] [float] NULL,

	[cModelAbsMag_u] [float] NULL,

	[cModelAbsMag_g] [float] NULL,

	[cModelAbsMag_r] [float] NULL,

	[cModelAbsMag_i] [float] NULL,

	[cModelAbsMag_z] [float] NULL,

	[m2l_u] [float] NULL,

	[m2l_g] [float] NULL,

	[m2l_r] [float] NULL,

	[m2l_i] [float] NULL,

	[m2l_z] [float] NULL,

	[m2l_median_u] [float] NULL,

	[m2l_median_g] [float] NULL,

	[m2l_median_r] [float] NULL,

	[m2l_median_i] [float] NULL,

	[m2l_median_z] [float] NULL,

	[m2l_err_u] [float] NULL,

	[m2l_err_g] [float] NULL,

	[m2l_err_r] [float] NULL,

	[m2l_err_i] [float] NULL,

	[m2l_err_z] [float] NULL,

	[m2l_min_u] [float] NULL,

	[m2l_min_g] [float] NULL,

	[m2l_min_r] [float] NULL,

	[m2l_min_i] [float] NULL,

	[m2l_min_z] [float] NULL,

	[m2l_max_u] [float] NULL,

	[m2l_max_g] [float] NULL,

	[m2l_max_r] [float] NULL,

	[m2l_max_i] [float] NULL,

	[m2l_max_z] [float] NULL,

	[logMass] [float] NULL,

	[logMass_median] [float] NULL,

	[logMass_err] [float] NULL,

	[logMass_min] [float] NULL,

	[logMass_max] [float] NULL,

	[chi2] [float] NULL,

	[nFilter] [smallint] NULL,

	[t_age] [float] NULL,

	[t_age_mean] [float] NULL,

	[t_age_err] [float] NULL,

	[t_age_min] [float] NULL,

	[t_age_max] [float] NULL,

	[metallicity] [float] NULL,

	[metallicity_mean] [float] NULL,

	[metallicity_err] [float] NULL,

	[metallicity_min] [float] NULL,

	[metallicity_max] [float] NULL,

	[dust1] [float] NULL,

	[dust1_mean] [float] NULL,

	[dust1_err] [float] NULL,

	[dust1_min] [float] NULL,

	[dust1_max] [float] NULL,

	[dust2] [float] NULL,

	[dust2_mean] [float] NULL,

	[dust2_err] [float] NULL,

	[dust2_min] [float] NULL,

	[dust2_max] [float] NULL,

	[tau] [float] NULL,

	[tau_mean] [float] NULL,

	[tau_err] [float] NULL,

	[tau_min] [float] NULL,

	[tau_max] [float] NULL,

	[age] [float] NULL,

	[age_mean] [float] NULL,

	[age_min] [float] NULL,

	[age_max] [float] NULL,

	[ssfr] [float] NULL,

	[ssfr_mean] [float] NULL,

	[ssfr_min] [float] NULL,

	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranEarlyDust_] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyNoDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyNoDust](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NULL,

	[fiberID] [smallint] NULL,

	[MJD] [int] NULL,

	[ra] [float] NULL,

	[dec] [float] NULL,

	[z] [real] NULL,

	[z_err] [real] NULL,

	[ke_u] [float] NULL,

	[ke_g] [float] NULL,

	[ke_r] [float] NULL,

	[ke_i] [float] NULL,

	[ke_z] [float] NULL,

	[cModelAbsMag_u] [float] NULL,

	[cModelAbsMag_g] [float] NULL,

	[cModelAbsMag_r] [float] NULL,

	[cModelAbsMag_i] [float] NULL,

	[cModelAbsMag_z] [float] NULL,

	[m2l_u] [float] NULL,

	[m2l_g] [float] NULL,

	[m2l_r] [float] NULL,

	[m2l_i] [float] NULL,

	[m2l_z] [float] NULL,

	[m2l_median_u] [float] NULL,

	[m2l_median_g] [float] NULL,

	[m2l_median_r] [float] NULL,

	[m2l_median_i] [float] NULL,

	[m2l_median_z] [float] NULL,

	[m2l_err_u] [float] NULL,

	[m2l_err_g] [float] NULL,

	[m2l_err_r] [float] NULL,

	[m2l_err_i] [float] NULL,

	[m2l_err_z] [float] NULL,

	[m2l_min_u] [float] NULL,

	[m2l_min_g] [float] NULL,

	[m2l_min_r] [float] NULL,

	[m2l_min_i] [float] NULL,

	[m2l_min_z] [float] NULL,

	[m2l_max_u] [float] NULL,

	[m2l_max_g] [float] NULL,

	[m2l_max_r] [float] NULL,

	[m2l_max_i] [float] NULL,

	[m2l_max_z] [float] NULL,

	[logMass] [float] NULL,

	[logMass_median] [float] NULL,

	[logMass_err] [float] NULL,

	[logMass_min] [float] NULL,

	[logMass_max] [float] NULL,

	[chi2] [float] NULL,

	[nFilter] [smallint] NULL,

	[t_age] [float] NULL,

	[t_age_mean] [float] NULL,

	[t_age_err] [float] NULL,

	[t_age_min] [float] NULL,

	[t_age_max] [float] NULL,

	[metallicity] [float] NULL,

	[metallicity_mean] [float] NULL,

	[metallicity_err] [float] NULL,

	[metallicity_min] [float] NULL,

	[metallicity_max] [float] NULL,

	[dust1] [float] NULL,

	[dust1_mean] [float] NULL,

	[dust1_err] [float] NULL,

	[dust1_min] [float] NULL,

	[dust1_max] [float] NULL,

	[dust2] [float] NULL,

	[dust2_mean] [float] NULL,

	[dust2_err] [float] NULL,

	[dust2_min] [float] NULL,

	[dust2_max] [float] NULL,

	[tau] [float] NULL,

	[tau_mean] [float] NULL,

	[tau_err] [float] NULL,

	[tau_min] [float] NULL,

	[tau_max] [float] NULL,

	[age] [float] NULL,

	[age_mean] [float] NULL,

	[age_min] [float] NULL,

	[age_max] [float] NULL,

	[ssfr] [float] NULL,

	[ssfr_mean] [float] NULL,

	[ssfr_min] [float] NULL,

	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranEarlyNoDus] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranWideDust](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NULL,

	[fiberID] [smallint] NULL,

	[MJD] [int] NULL,

	[ra] [float] NULL,

	[dec] [float] NULL,

	[z] [real] NULL,

	[z_err] [real] NULL,

	[ke_u] [float] NULL,

	[ke_g] [float] NULL,

	[ke_r] [float] NULL,

	[ke_i] [float] NULL,

	[ke_z] [float] NULL,

	[cModelAbsMag_u] [float] NULL,

	[cModelAbsMag_g] [float] NULL,

	[cModelAbsMag_r] [float] NULL,

	[cModelAbsMag_i] [float] NULL,

	[cModelAbsMag_z] [float] NULL,

	[m2l_u] [float] NULL,

	[m2l_g] [float] NULL,

	[m2l_r] [float] NULL,

	[m2l_i] [float] NULL,

	[m2l_z] [float] NULL,

	[m2l_median_u] [float] NULL,

	[m2l_median_g] [float] NULL,

	[m2l_median_r] [float] NULL,

	[m2l_median_i] [float] NULL,

	[m2l_median_z] [float] NULL,

	[m2l_err_u] [float] NULL,

	[m2l_err_g] [float] NULL,

	[m2l_err_r] [float] NULL,

	[m2l_err_i] [float] NULL,

	[m2l_err_z] [float] NULL,

	[m2l_min_u] [float] NULL,

	[m2l_min_g] [float] NULL,

	[m2l_min_r] [float] NULL,

	[m2l_min_i] [float] NULL,

	[m2l_min_z] [float] NULL,

	[m2l_max_u] [float] NULL,

	[m2l_max_g] [float] NULL,

	[m2l_max_r] [float] NULL,

	[m2l_max_i] [float] NULL,

	[m2l_max_z] [float] NULL,

	[logMass] [float] NULL,

	[logMass_median] [float] NULL,

	[logMass_err] [float] NULL,

	[logMass_min] [float] NULL,

	[logMass_max] [float] NULL,

	[chi2] [float] NULL,

	[nFilter] [smallint] NULL,

	[t_age] [float] NULL,

	[t_age_mean] [float] NULL,

	[t_age_err] [float] NULL,

	[t_age_min] [float] NULL,

	[t_age_max] [float] NULL,

	[metallicity] [float] NULL,

	[metallicity_mean] [float] NULL,

	[metallicity_err] [float] NULL,

	[metallicity_min] [float] NULL,

	[metallicity_max] [float] NULL,

	[dust1] [float] NULL,

	[dust1_mean] [float] NULL,

	[dust1_err] [float] NULL,

	[dust1_min] [float] NULL,

	[dust1_max] [float] NULL,

	[dust2] [float] NULL,

	[dust2_mean] [float] NULL,

	[dust2_err] [float] NULL,

	[dust2_min] [float] NULL,

	[dust2_max] [float] NULL,

	[tau] [float] NULL,

	[tau_mean] [float] NULL,

	[tau_err] [float] NULL,

	[tau_min] [float] NULL,

	[tau_max] [float] NULL,

	[age] [float] NULL,

	[age_mean] [float] NULL,

	[age_min] [float] NULL,

	[age_max] [float] NULL,

	[ssfr] [float] NULL,

	[ssfr_mean] [float] NULL,

	[ssfr_min] [float] NULL,

	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranWideDust_s] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideNoDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassFSPSGranWideNoDust](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NULL,

	[fiberID] [smallint] NULL,

	[MJD] [int] NULL,

	[ra] [float] NULL,

	[dec] [float] NULL,

	[z] [real] NULL,

	[z_err] [real] NULL,

	[ke_u] [float] NULL,

	[ke_g] [float] NULL,

	[ke_r] [float] NULL,

	[ke_i] [float] NULL,

	[ke_z] [float] NULL,

	[cModelAbsMag_u] [float] NULL,

	[cModelAbsMag_g] [float] NULL,

	[cModelAbsMag_r] [float] NULL,

	[cModelAbsMag_i] [float] NULL,

	[cModelAbsMag_z] [float] NULL,

	[m2l_u] [float] NULL,

	[m2l_g] [float] NULL,

	[m2l_r] [float] NULL,

	[m2l_i] [float] NULL,

	[m2l_z] [float] NULL,

	[m2l_median_u] [float] NULL,

	[m2l_median_g] [float] NULL,

	[m2l_median_r] [float] NULL,

	[m2l_median_i] [float] NULL,

	[m2l_median_z] [float] NULL,

	[m2l_err_u] [float] NULL,

	[m2l_err_g] [float] NULL,

	[m2l_err_r] [float] NULL,

	[m2l_err_i] [float] NULL,

	[m2l_err_z] [float] NULL,

	[m2l_min_u] [float] NULL,

	[m2l_min_g] [float] NULL,

	[m2l_min_r] [float] NULL,

	[m2l_min_i] [float] NULL,

	[m2l_min_z] [float] NULL,

	[m2l_max_u] [float] NULL,

	[m2l_max_g] [float] NULL,

	[m2l_max_r] [float] NULL,

	[m2l_max_i] [float] NULL,

	[m2l_max_z] [float] NULL,

	[logMass] [float] NULL,

	[logMass_median] [float] NULL,

	[logMass_err] [float] NULL,

	[logMass_min] [float] NULL,

	[logMass_max] [float] NULL,

	[chi2] [float] NULL,

	[nFilter] [smallint] NULL,

	[t_age] [float] NULL,

	[t_age_mean] [float] NULL,

	[t_age_err] [float] NULL,

	[t_age_min] [float] NULL,

	[t_age_max] [float] NULL,

	[metallicity] [float] NULL,

	[metallicity_mean] [float] NULL,

	[metallicity_err] [float] NULL,

	[metallicity_min] [float] NULL,

	[metallicity_max] [float] NULL,

	[dust1] [float] NULL,

	[dust1_mean] [float] NULL,

	[dust1_err] [float] NULL,

	[dust1_min] [float] NULL,

	[dust1_max] [float] NULL,

	[dust2] [float] NULL,

	[dust2_mean] [float] NULL,

	[dust2_err] [float] NULL,

	[dust2_min] [float] NULL,

	[dust2_max] [float] NULL,

	[tau] [float] NULL,

	[tau_mean] [float] NULL,

	[tau_err] [float] NULL,

	[tau_min] [float] NULL,

	[tau_max] [float] NULL,

	[age] [float] NULL,

	[age_mean] [float] NULL,

	[age_min] [float] NULL,

	[age_max] [float] NULL,

	[ssfr] [float] NULL,

	[ssfr_mean] [float] NULL,

	[ssfr_min] [float] NULL,

	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranWideNoDust] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassPassivePort]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stellarMassPassivePort](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[mjd] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[logMass] [real] NOT NULL,

	[minLogMass] [real] NOT NULL,

	[maxLogMass] [real] NOT NULL,

	[medianPDF] [real] NOT NULL,

	[PDF16] [real] NOT NULL,

	[PDF84] [real] NOT NULL,

	[peakPDF] [real] NOT NULL,

	[logMass_noMassLoss] [real] NOT NULL,

	[minLogMass_noMassLoss] [real] NOT NULL,

	[maxLogMass_noMassLoss] [real] NOT NULL,

	[medianPDF_noMassLoss] [real] NOT NULL,

	[PDF16_noMassLoss] [real] NOT NULL,

	[PDF84_noMassLoss] [real] NOT NULL,

	[peakPDF_noMassLoss] [real] NOT NULL,

	[reducedChi2] [real] NOT NULL,

	[age] [real] NOT NULL,

	[minAge] [real] NOT NULL,

	[maxAge] [real] NOT NULL,

	[SFR] [real] NOT NULL,

	[minSFR] [real] NOT NULL,

	[maxSFR] [real] NOT NULL,

	[absMagK] [real] NOT NULL,

	[SFH] [varchar](32) NOT NULL,

	[Metallicity] [varchar](32) NOT NULL,

	[reddeninglaw] [smallint] NOT NULL,

	[nFilter] [smallint] NOT NULL,
 CONSTRAINT [pk_stellarMassPassivePort_specOb] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[stellarMassPCAWiscBC03]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassPCAWiscBC03](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[mjd] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[zNum] [int] NOT NULL,

	[mstellar_median] [float] NOT NULL,

	[mstellar_err] [float] NOT NULL,

	[mstellar_p2p5] [float] NOT NULL,

	[mstellar_p16] [float] NOT NULL,

	[mstellar_p84] [float] NOT NULL,

	[mstellar_p97p5] [float] NOT NULL,

	[vdisp_median] [float] NOT NULL,

	[vdisp_err] [float] NOT NULL,

	[vdisp_p2p5] [float] NOT NULL,

	[vdisp_p16] [float] NOT NULL,

	[vdisp_p84] [float] NOT NULL,

	[vdisp_p97p5] [float] NOT NULL,

	[calpha_0] [real] NOT NULL,

	[calpha_1] [real] NOT NULL,

	[calpha_2] [real] NOT NULL,

	[calpha_3] [real] NOT NULL,

	[calpha_4] [real] NOT NULL,

	[calpha_5] [real] NOT NULL,

	[calpha_6] [real] NOT NULL,

	[calpha_norm] [real] NOT NULL,

	[warning] [int] NOT NULL,
 CONSTRAINT [pk_stellarMassPCAWiscBC03_specOb] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassPCAWiscM11]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stellarMassPCAWiscM11](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[mjd] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[zNum] [int] NOT NULL,

	[mstellar_median] [float] NOT NULL,

	[mstellar_err] [float] NOT NULL,

	[mstellar_p2p5] [float] NOT NULL,

	[mstellar_p16] [float] NOT NULL,

	[mstellar_p84] [float] NOT NULL,

	[mstellar_p97p5] [float] NOT NULL,

	[vdisp_median] [float] NOT NULL,

	[vdisp_err] [float] NOT NULL,

	[vdisp_p2p5] [float] NOT NULL,

	[vdisp_p16] [float] NOT NULL,

	[vdisp_p84] [float] NOT NULL,

	[vdisp_p97p5] [float] NOT NULL,

	[calpha_0] [real] NOT NULL,

	[calpha_1] [real] NOT NULL,

	[calpha_2] [real] NOT NULL,

	[calpha_3] [real] NOT NULL,

	[calpha_4] [real] NOT NULL,

	[calpha_5] [real] NOT NULL,

	[calpha_6] [real] NOT NULL,

	[calpha_norm] [real] NOT NULL,

	[warning] [int] NOT NULL,
 CONSTRAINT [pk_stellarMassPCAWiscM11_specObj] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassStarformingPort]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stellarMassStarformingPort](

	[specObjID] [bigint] NOT NULL,

	[plate] [smallint] NOT NULL,

	[fiberID] [smallint] NOT NULL,

	[mjd] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[z] [real] NOT NULL,

	[zErr] [real] NOT NULL,

	[logMass] [real] NOT NULL,

	[minLogMass] [real] NOT NULL,

	[maxLogMass] [real] NOT NULL,

	[medianPDF] [real] NOT NULL,

	[PDF16] [real] NOT NULL,

	[PDF84] [real] NOT NULL,

	[peakPDF] [real] NOT NULL,

	[logMass_noMassLoss] [real] NOT NULL,

	[minLogMass_noMassLoss] [real] NOT NULL,

	[maxLogMass_noMassLoss] [real] NOT NULL,

	[medianPDF_noMassLoss] [real] NOT NULL,

	[PDF16_noMassLoss] [real] NOT NULL,

	[PDF84_noMassLoss] [real] NOT NULL,

	[peakPDF_noMassLoss] [real] NOT NULL,

	[reducedChi2] [real] NOT NULL,

	[age] [real] NOT NULL,

	[minAge] [real] NOT NULL,

	[maxAge] [real] NOT NULL,

	[SFR] [real] NOT NULL,

	[minSFR] [real] NOT NULL,

	[maxSFR] [real] NOT NULL,

	[absMagK] [real] NOT NULL,

	[SFH] [varchar](32) NOT NULL,

	[Metallicity] [varchar](32) NOT NULL,

	[reddeninglaw] [smallint] NOT NULL,

	[nFilter] [smallint] NOT NULL,
 CONSTRAINT [pk_stellarMassStarformingPort_sp] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[StripeDefs]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StripeDefs](

	[stripe] [int] NOT NULL,

	[hemisphere] [varchar](64) NOT NULL,

	[eta] [float] NOT NULL,

	[lambdaMin] [float] NOT NULL,

	[lambdaMax] [float] NOT NULL,

	[htmArea] [varchar](1024) NOT NULL,
 CONSTRAINT [pk_StripeDefs_stripe] PRIMARY KEY CLUSTERED 
(
	[stripe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[thingIndex]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thingIndex](

	[thingId] [bigint] NOT NULL,

	[sdssPolygonID] [int] NOT NULL,

	[fieldID] [bigint] NOT NULL,

	[objID] [bigint] NOT NULL,

	[isPrimary] [tinyint] NOT NULL,

	[nDetect] [int] NOT NULL,

	[nEdge] [int] NOT NULL,

	[ra] [float] NOT NULL,

	[dec] [float] NOT NULL,

	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_thingIndex_thingId] PRIMARY KEY CLUSTERED 
(
	[thingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zoo2MainPhotoz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zoo2MainPhotoz](

	[dr8objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](16) NOT NULL,

	[decstring] [varchar](16) NOT NULL,

	[sample] [varchar](32) NOT NULL,

	[total_classifications] [int] NOT NULL,

	[total_votes] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	[t02_edgeon_a05_no_count] [int] NOT NULL,

	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	[t03_bar_a06_bar_count] [int] NOT NULL,

	[t03_bar_a06_bar_weight] [float] NOT NULL,

	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	[t03_bar_a06_bar_flag] [int] NOT NULL,

	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	[t06_odd_a14_yes_count] [int] NOT NULL,

	[t06_odd_a14_yes_weight] [float] NOT NULL,

	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	[t06_odd_a14_yes_flag] [int] NOT NULL,

	[t06_odd_a15_no_count] [int] NOT NULL,

	[t06_odd_a15_no_weight] [float] NOT NULL,

	[t06_odd_a15_no_fraction] [float] NOT NULL,

	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	[t06_odd_a15_no_debiased] [float] NOT NULL,

	[t06_odd_a15_no_flag] [int] NOT NULL,

	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	[t11_arms_number_a31_1_count] [int] NOT NULL,

	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	[t11_arms_number_a32_2_count] [int] NOT NULL,

	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	[t11_arms_number_a33_3_count] [int] NOT NULL,

	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	[t11_arms_number_a34_4_count] [int] NOT NULL,

	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2MainPhotoz_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2MainSpecz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zoo2MainSpecz](

	[specobjid] [bigint] NOT NULL,

	[dr8objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](16) NOT NULL,

	[decstring] [varchar](16) NOT NULL,

	[sample] [varchar](32) NOT NULL,

	[total_classifications] [int] NOT NULL,

	[total_votes] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	[t02_edgeon_a05_no_count] [int] NOT NULL,

	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	[t03_bar_a06_bar_count] [int] NOT NULL,

	[t03_bar_a06_bar_weight] [float] NOT NULL,

	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	[t03_bar_a06_bar_flag] [int] NOT NULL,

	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	[t06_odd_a14_yes_count] [int] NOT NULL,

	[t06_odd_a14_yes_weight] [float] NOT NULL,

	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	[t06_odd_a14_yes_flag] [int] NOT NULL,

	[t06_odd_a15_no_count] [int] NOT NULL,

	[t06_odd_a15_no_weight] [float] NOT NULL,

	[t06_odd_a15_no_fraction] [float] NOT NULL,

	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	[t06_odd_a15_no_debiased] [float] NOT NULL,

	[t06_odd_a15_no_flag] [int] NOT NULL,

	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	[t11_arms_number_a31_1_count] [int] NOT NULL,

	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	[t11_arms_number_a32_2_count] [int] NOT NULL,

	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	[t11_arms_number_a33_3_count] [int] NOT NULL,

	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	[t11_arms_number_a34_4_count] [int] NOT NULL,

	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2MainSpecz_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd1]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Coadd1](

	[specobjid] [bigint] NOT NULL,

	[stripe82objid] [bigint] NOT NULL,

	[dr8objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[sample] [varchar](32) NOT NULL,

	[total_classifications] [int] NOT NULL,

	[total_votes] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	[t02_edgeon_a05_no_count] [int] NOT NULL,

	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	[t03_bar_a06_bar_count] [int] NOT NULL,

	[t03_bar_a06_bar_weight] [float] NOT NULL,

	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	[t03_bar_a06_bar_flag] [int] NOT NULL,

	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	[t06_odd_a14_yes_count] [int] NOT NULL,

	[t06_odd_a14_yes_weight] [float] NOT NULL,

	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	[t06_odd_a14_yes_flag] [int] NOT NULL,

	[t06_odd_a15_no_count] [int] NOT NULL,

	[t06_odd_a15_no_weight] [float] NOT NULL,

	[t06_odd_a15_no_fraction] [float] NOT NULL,

	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	[t06_odd_a15_no_debiased] [float] NOT NULL,

	[t06_odd_a15_no_flag] [int] NOT NULL,

	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	[t11_arms_number_a31_1_count] [int] NOT NULL,

	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	[t11_arms_number_a32_2_count] [int] NOT NULL,

	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	[t11_arms_number_a33_3_count] [int] NOT NULL,

	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	[t11_arms_number_a34_4_count] [int] NOT NULL,

	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Coadd1_stripe82ob] PRIMARY KEY CLUSTERED 
(
	[stripe82objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd2]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Coadd2](

	[specobjid] [bigint] NOT NULL,

	[stripe82objid] [bigint] NOT NULL,

	[dr8objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[sample] [varchar](32) NOT NULL,

	[total_classifications] [int] NOT NULL,

	[total_votes] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	[t02_edgeon_a05_no_count] [int] NOT NULL,

	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	[t03_bar_a06_bar_count] [int] NOT NULL,

	[t03_bar_a06_bar_weight] [float] NOT NULL,

	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	[t03_bar_a06_bar_flag] [int] NOT NULL,

	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	[t06_odd_a14_yes_count] [int] NOT NULL,

	[t06_odd_a14_yes_weight] [float] NOT NULL,

	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	[t06_odd_a14_yes_flag] [int] NOT NULL,

	[t06_odd_a15_no_count] [int] NOT NULL,

	[t06_odd_a15_no_weight] [float] NOT NULL,

	[t06_odd_a15_no_fraction] [float] NOT NULL,

	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	[t06_odd_a15_no_debiased] [float] NOT NULL,

	[t06_odd_a15_no_flag] [int] NOT NULL,

	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	[t11_arms_number_a31_1_count] [int] NOT NULL,

	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	[t11_arms_number_a32_2_count] [int] NOT NULL,

	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	[t11_arms_number_a33_3_count] [int] NOT NULL,

	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	[t11_arms_number_a34_4_count] [int] NOT NULL,

	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Coadd2_stripe82ob] PRIMARY KEY CLUSTERED 
(
	[stripe82objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Normal]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zoo2Stripe82Normal](

	[specobjid] [bigint] NOT NULL,

	[dr8objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](16) NOT NULL,

	[decstring] [varchar](16) NOT NULL,

	[sample] [varchar](32) NOT NULL,

	[total_classifications] [int] NOT NULL,

	[total_votes] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	[t02_edgeon_a05_no_count] [int] NOT NULL,

	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	[t03_bar_a06_bar_count] [int] NOT NULL,

	[t03_bar_a06_bar_weight] [float] NOT NULL,

	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	[t03_bar_a06_bar_flag] [int] NOT NULL,

	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	[t06_odd_a14_yes_count] [int] NOT NULL,

	[t06_odd_a14_yes_weight] [float] NOT NULL,

	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	[t06_odd_a14_yes_flag] [int] NOT NULL,

	[t06_odd_a15_no_count] [int] NOT NULL,

	[t06_odd_a15_no_weight] [float] NOT NULL,

	[t06_odd_a15_no_fraction] [float] NOT NULL,

	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	[t06_odd_a15_no_debiased] [float] NOT NULL,

	[t06_odd_a15_no_flag] [int] NOT NULL,

	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	[t11_arms_number_a31_1_count] [int] NOT NULL,

	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	[t11_arms_number_a32_2_count] [int] NOT NULL,

	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	[t11_arms_number_a33_3_count] [int] NOT NULL,

	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	[t11_arms_number_a34_4_count] [int] NOT NULL,

	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Normal_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooConfidence]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooConfidence](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[f_unclass_clean] [float] NOT NULL,

	[f_misclass_clean] [float] NOT NULL,

	[avcorr_clean] [float] NOT NULL,

	[stdcorr_clean] [float] NOT NULL,

	[f_misclass_greater] [float] NOT NULL,

	[avcorr_greater] [float] NOT NULL,

	[stdcorr_greater] [float] NOT NULL,
 CONSTRAINT [pk_zooConfidence_specObjID] PRIMARY KEY CLUSTERED 
(
	[specobjid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooMirrorBias]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooMirrorBias](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[nvote_mr1] [int] NOT NULL,

	[p_el_mr1] [float] NOT NULL,

	[p_cw_mr1] [float] NOT NULL,

	[p_acw_mr1] [float] NOT NULL,

	[p_edge_mr1] [float] NOT NULL,

	[p_dk_mr1] [float] NOT NULL,

	[p_mg_mr1] [float] NOT NULL,

	[p_cs_mr1] [float] NOT NULL,

	[nvote_mr2] [int] NOT NULL,

	[p_el_mr2] [float] NOT NULL,

	[p_cw_mr2] [float] NOT NULL,

	[p_acw_mr2] [float] NOT NULL,

	[p_edge_mr2] [float] NOT NULL,

	[p_dk_mr2] [float] NOT NULL,

	[p_mg_mr2] [float] NOT NULL,

	[p_cs_mr2] [float] NOT NULL,
 CONSTRAINT [pk_zooMirrorBias_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooMonochromeBias]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooMonochromeBias](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[nvote_mon] [int] NOT NULL,

	[p_el_mon] [float] NOT NULL,

	[p_cw_mon] [float] NOT NULL,

	[p_acw_mon] [float] NOT NULL,

	[p_edge_mon] [float] NOT NULL,

	[p_dk_mon] [float] NOT NULL,

	[p_mg_mon] [float] NOT NULL,

	[p_cs_mon] [float] NOT NULL,
 CONSTRAINT [pk_zooMonochromeBias_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooNoSpec]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooNoSpec](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[nvote] [int] NOT NULL,

	[p_el] [float] NOT NULL,

	[p_cw] [float] NOT NULL,

	[p_acw] [float] NOT NULL,

	[p_edge] [float] NOT NULL,

	[p_dk] [float] NOT NULL,

	[p_mg] [float] NOT NULL,

	[p_cs] [float] NOT NULL,
 CONSTRAINT [pk_zooNoSpec_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooSpec]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooSpec](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[nvote] [int] NOT NULL,

	[p_el] [float] NOT NULL,

	[p_cw] [float] NOT NULL,

	[p_acw] [float] NOT NULL,

	[p_edge] [float] NOT NULL,

	[p_dk] [float] NOT NULL,

	[p_mg] [float] NOT NULL,

	[p_cs] [float] NOT NULL,

	[p_el_debiased] [float] NOT NULL,

	[p_cs_debiased] [float] NOT NULL,

	[spiral] [int] NOT NULL,

	[elliptical] [int] NOT NULL,

	[uncertain] [int] NOT NULL,
 CONSTRAINT [pk_zooSpec_specObjID] PRIMARY KEY CLUSTERED 
(
	[specobjid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooVotes]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zooVotes](

	[specobjid] [bigint] NOT NULL,

	[objid] [bigint] NOT NULL,

	[dr7objid] [bigint] NOT NULL,

	[ra] [real] NOT NULL,

	[dec] [real] NOT NULL,

	[rastring] [varchar](11) NOT NULL,

	[decstring] [varchar](11) NOT NULL,

	[nvote_tot] [int] NOT NULL,

	[nvote_std] [int] NOT NULL,

	[nvote_mr1] [int] NOT NULL,

	[nvote_mr2] [int] NOT NULL,

	[nvote_mon] [int] NOT NULL,

	[p_el] [float] NOT NULL,

	[p_cw] [float] NOT NULL,

	[p_acw] [float] NOT NULL,

	[p_edge] [float] NOT NULL,

	[p_dk] [float] NOT NULL,

	[p_mg] [float] NOT NULL,

	[p_cs] [float] NOT NULL,
 CONSTRAINT [pk_zooVotes_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

