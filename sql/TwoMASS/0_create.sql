--/ <dataset>
--/ <summary> The Two Micron All Sky Survey </summary>
--/ <remarks>
--/ The Point Source catalogue of 470,992,970 sources.
--/ </remarks>
--/ <url>http://www.ipac.caltech.edu/2mass/</url>
--/ <icon>twomass.png</icon>
--/ <docpage>twomass.html</docpage>
--/ </dataset>
 GO
 
 --/ <summary>Point source survey objects</summary>
--/ <remarks>This is the Point Source Catalog.</remarks>
CREATE TABLE [dbo].[PhotoPSC](
	
	--/ <summary>unique identification number for the PSC source</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[objID] [bigint] NOT NULL, 

		
	--/ <summary>right ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

    
	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL, 
	
	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL, 
	
	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL, 
	
	--/ <summary>Unique HTM ID</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] [bigint] NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NULL, 
	
	--/ <summary>major axis of position error ellipse</summary>
	--/ <quantity>pos.errorEllipse.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[err_maj] [real] NOT NULL, 

	--/ <summary>minor axis of position error ellipse</summary>
	--/ <quantity>pos.errorEllipse.sminAxis</quantity>
	--/ <unit>arcsec</unit>
	[err_min] [real] NOT NULL, 

	--/ <summary>position angle of error ellipse major axis</summary>
	--/ <quantity>pos.posAng;pos.errorEllipse</quantity>
	--/ <unit>deg</unit>
	[err_ang] [smallint] NOT NULL, 

	--/ <summary>source designation formed from sexigesimal coordinates</summary>
	--/ <quantity>meta.id</quantity>
	[designation] [varchar](17) NOT NULL, 

	--/ <summary>J default magnitude</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m] [real] NOT NULL, 

	--/ <summary>J corrected magnitude uncertainty</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_cmsig] [real] NOT NULL, 

	--/ <summary>J total mag uncertainty</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msigcom] [real] NOT NULL, 

	--/ <summary>J band scan signal-to-noise ratio</summary>
	--/ <quantity>stat.snr;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_snr] [real] NOT NULL, 

	--/ <summary>H default magnitude</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m] [real] NOT NULL, 

	--/ <summary>H corrected magnitude uncertainty</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.</quantity>
	--/ <unit>mag</unit>
	[h_cmsig] [real] NOT NULL, 

	--/ <summary>H total mag uncertainty</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msigcom] [real] NOT NULL, 

	--/ <summary>H band scan signal-to-noise ratio</summary>
	--/ <quantity>stat.snr;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_snr] [real] NOT NULL, 

	--/ <summary>K default magnitude</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m] [real] NOT NULL, 

	--/ <summary>K corrected magnitude uncertainty</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_cmsig] [real] NOT NULL, 

	--/ <summary>K total mag uncertainty</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msigcom] [real] NOT NULL, 

	--/ <summary>K band scan signal-to-noise ratio</summary>
	--/ <quantity>stat.snr;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_snr] [real] NOT NULL, 

	--/ <summary>photometric quality flag</summary>
	--/ <quantity>meta.code.qual;phot</quantity>
	[ph_qual] [varchar](32) NOT NULL, 

	--/ <summary>source of JHK default mags (read flag)</summary>
	--/ <quantity>meta.ref;phot.mag;em.IR</quantity>
	[rd_flg] [varchar](32) NOT NULL, 

	--/ <summary>indicates no of JHK components fit to source (each digit 0|1|2)</summary>
	--/ <quantity>meta.code;stat.fit.param</quantity>
	[bl_flg] [varchar](32) NOT NULL, 

	--/ <summary>indicates artifact contamination and/or confusion</summary>
	--/ <quantity>meta.code</quantity>
	[cc_flg] [varchar](32) NOT NULL, 

	--/ <summary>frame detection statistics</summary>
	--/ <quantity>meta.note</quantity>
	[ndet] [varchar](32) NOT NULL, 

	--/ <summary>distance between this source and its nearest neighbor in the PSC</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[prox] [real] NOT NULL, 

	--/ <summary>position angle on the sky of the vector from the source to the nearest neighbor in the PSC</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[pxpa] [smallint] NOT NULL, 

	--/ <summary>pts_key value of the nearest source in the PSC</summary>
	--/ <quantity>meta.id.assoc</quantity>
	[pxcntr] [int] NOT NULL, 

	--/ <summary>indicates src associated with or contaminated by an ext. src</summary>
	--/ <quantity>meta.code</quantity>
	[gal_contam] [smallint] NOT NULL, 

	--/ <summary>source is positionally associated with an asteroid or comet</summary>
	--/ <quantity>meta.code</quantity>
	[mp_flg] [smallint] NOT NULL, 

	--/ <summary>hemisphere (N/S) of observation</summary>
	--/ <quantity>meta.note</quantity>
	[hemis] [varchar](32) NOT NULL, 

	--/ <summary>observation date</summary>
	--/ <quantity>time.epoch</quantity>
	[date] [varchar](32) NOT NULL, 

	--/ <summary>scan number (unique within date)</summary>
	--/ <quantity>meta.id;obs</quantity>
	[scan] [smallint] NOT NULL, 

	--/ <summary>galactic longitude, rounded to 0.001 deg</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [real] NOT NULL, 

	--/ <summary>galactic latitude, rounded to 0.001 deg</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [real] NOT NULL, 

	--/ <summary>mean cross-scan focal plane position of the source in the U-scan coordinate system</summary>
	--/ <quantity>pos;instr.det;stat.mean</quantity>
	--/ <unit>arcsec</unit>
	[x_scan] [real] NOT NULL, 

	--/ <summary>Julian Date of the source measurement accurate to +-30 seconds</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[jdate] [float] NOT NULL, 

	--/ <summary>J band reduced chi-squared value of fit</summary>
	--/ <quantity>stat.fit.chi2;em.IR.J</quantity>
	[j_psfchi] [real] NOT NULL, 

	--/ <summary>H band reduced chi-squared value of fit</summary>
	--/ <quantity>stat.fit.chi2;em.IR.K</quantity>
	[h_psfchi] [real] NOT NULL, 

	--/ <summary>K band reduced chi-squared value of fit</summary>
	--/ <quantity>stat.fit.chi2;em.IR.H</quantity>
	[k_psfchi] [real] NOT NULL, 

	--/ <summary>J standard aperture magnitude or BF aperture-photometry mag</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_stdap] [real] NOT NULL, 

	--/ <summary>J standard ap. mag/BF ap.-photometry mag uncertainty</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_stdap] [real] NOT NULL, 

	--/ <summary>H standard aperture magnitude or BF aperture-photometry mag</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_stdap] [real] NOT NULL, 

	--/ <summary>H standard ap. mag/BF ap.-photometry mag uncertainty</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.</quantity>
	--/ <unit>mag</unit>
	[h_msig_stdap] [real] NOT NULL, 

	--/ <summary>K standard aperture magnitude or BF aperture-photometry mag</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_stdap] [real] NOT NULL, 

	--/ <summary>K standard ap. mag/BF ap.-photometry mag uncertainty</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.</quantity>
	--/ <unit>mag</unit>
	[k_msig_stdap] [real] NOT NULL, 

	--/ <summary>distance from the source to the nearest North or South scan edge</summary>
	--/ <quantity>pos.angDistance;instr.det</quantity>
	--/ <unit>arcsec</unit>
	[dist_edge_ns] [int] NOT NULL, 

	--/ <summary>distance from the source to the nearest East or West scan edge</summary>
	--/ <quantity>pos.angDistance;instr.det</quantity>
	--/ <unit>arcsec</unit>
	[dist_edge_ew] [int] NOT NULL, 

	--/ <summary>two character flag that specifies to which scan edges a source lies closest</summary>
	--/ <quantity>meta.code;instr.det</quantity>
	[dist_edge_flg] [varchar](32) NOT NULL, 

	--/ <summary>duplicate source flag</summary>
	--/ <quantity>meta.code.multip</quantity>
	[dup_src] [smallint] NOT NULL, 

	--/ <summary>use source flag</summary>
	--/ <quantity>meta.code</quantity>
	[use_src] [smallint] NOT NULL, 

	--/ <summary>catalog identifier of an optical source from either the Tycho 2 or USNO-A2.0 catalog</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[a] [char](1) NOT NULL, 

	--/ <summary>distance in arcsec relative to associated optical source</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[dist_opt] [real] NOT NULL, 

	--/ <summary>position angle relative to assocaited optical source</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[phi_opt] [smallint] NOT NULL, 

	--/ <summary>catalog blue mag of associated optical source</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[b_m_opt] [real] NOT NULL, 

	--/ <summary>catalog red magnitude of the associated optical source</summary>
	--/ <quantity>poht.mag;em.opt</quantity>
	--/ <unit>mag</unit>
	[vr_m_opt] [real] NOT NULL, 

	--/ <summary>number of optical sources within 5 arcsec of 2MASS src</summary>
	--/ <quantity>meta.number;src</quantity>
	[nopt_mchs] [smallint] NOT NULL, 

	--/ <summary>unique identification number of the record in the XSC that corresponds to this point source</summary>
	--/ <quantity>meta.id</quantity>
	[ext_key] [int] NOT NULL, 

	--/ <summary>unique identification number of the record in the Scan Information Table</summary>
	--/ <quantity>meta.id</quantity>
	[scan_key] [int] NOT NULL, 

	--/ <summary>unique identification number of the record in the Atlas Image Data Table</summary>
	--/ <quantity>meta.id</quantity>
	[coadd_key] [int] NOT NULL, 

	--/ <summary>sequence number of the Atlas Image in which the position of this source falls</summary>
	--/ <quantity>meta.id;obs.image</quantity>
	[coadd] [smallint] NOT NULL, 

	--/ <summary>default J-H mag color</summary>
	--/ <quantity>phot.color;em.IR.J;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[j_h] [real] NOT NULL, 

	--/ <summary>default H-K mag color</summary>
	--/ <quantity>phot.color;em.IR.K;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[h_k] [real] NOT NULL, 

	--/ <summary>default J-K mag color</summary>
	--/ <quantity>phot.color;em.IR.J;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[j_k] [real] NOT NULL 
) ON [PRIMARY]

ALTER TABLE [dbo].[PhotoPSC] ADD PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

---------------------------------------------------------------

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotoXSC](

	--/ <summary>Julian Date of the source measurement accurate to +30 seconds. (See 2MASS PSC documentation).</summary>
	--/ <quantity></quantity>
	[jdate] [float] NOT NULL, 

	--/ <summary>Sexagesimal, equatorial position-based source name in the form: hhmmssss+ddmmsss[ABC...].</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[designation] [varchar](17) NOT NULL, 

	--/ <summary> Right ascension in decimal degrees (J2000). </summary>
	--/ <quantity>pos.eq.ra; pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary> Declination in decimal degrees (J2000). </summary>
	--/ <quantity>pos.eq.dec; pos.frame=j2000</quantity>
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
	--/ <quantity>pos.eq.HTM; pos.frame=J2000</quantity>
	[htmid] [bigint] NOT NULL,
	
	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] [bigint] NOT NULL,
	
	--/ <summary>Super-coadd centroid RA (J2000 decimal deg).</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[sup_ra] [float] NOT NULL, 

	--/ <summary>Super-coadd centroid Dec (J2000 decimal deg).</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[sup_dec] [float] NOT NULL, 

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [real] NOT NULL, 

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [real] NOT NULL, 

	--/ <summary>Coadd log(density) of stars with k&amp;lt;14 mag.</summary>
	--/ <quantity>phys.density;src</quantity>
	[density] [real] NOT NULL, 

	--/ <summary>20mag/sq arcsec isophotal K fiducial ell. ap. semi-major axis.</summary>
	--/ <quantity>phys.angSize.smajAxis;src</quantity>
	--/ <unit>arcsec</unit>
	
	[r_k20fe] [real] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_k20fe] [real] NOT NULL,
	
	--/ <summary>J 1-sigma uncertainty in 20mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_k20fe] [real] NOT NULL, 

	--/ <summary>J confusion flag for 20mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag;em.IR.J</quantity>
	[j_flg_k20fe] [smallint] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_k20fe] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 20mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_k20fe] [real] NOT NULL, 

	--/ <summary>H confusion flag for 20mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag;em.IR.</quantity>
	[h_flg_k20fe] [smallint] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_k20fe] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 20mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_k20fe] [real] NOT NULL, 

	--/ <summary>K confusion flag for 20mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag;em.IR.K</quantity>
	[k_flg_k20fe] [smallint] NOT NULL, 

	--/ <summary>3-sigma K isophotal semi-major axis.</summary>
	--/ <quantity>phys.angSize.smajAxis;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[r_3sig] [real] NOT NULL, 

	--/ <summary>J minor/major axis ratio fit to the 3-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.J</quantity>
	[j_ba] [real] NOT NULL,
	
	--/ <summary>J angle to 3-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.J</quantity>
	--/ <unit>deg</unit>
	[j_phi] [smallint] NOT NULL, 

	--/ <summary>H minor/major axis ratio to 3σ (h_ba)</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.H</quantity>
	[h_ba] [real] NOT NULL, 

	--/ <summary>H angle to 3-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.H</quantity>
	--/ <unit>deg</unit>
	[h_phi] [smallint] NOT NULL, 

	--/ <summary>K minor/major axis ratio fit to the 3-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.K</quantity>
	[k_ba] [real] NOT NULL, 

	--/ <summary>K angle to 3-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.K</quantity>
	--/ <unit>deg</unit>
	[k_phi] [smallint] NOT NULL, 

	--/ <summary>Super-coadd minor/major axis ratio fit to the 3-sigma isophote.</summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[sup_r_3sig] [real] NOT NULL, 

	--/ <summary>K minor/major axis ratio fit to the 3-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio</quantity>
	[sup_ba] [real] NOT NULL, 

	--/ <summary>K angle to 3-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[sup_phi] [smallint] NOT NULL, 

	--/ <summary>K fiducial Kron elliptical aperture semi-major axis.</summary>
	--/ <quantity>phys.angSize;src</quantity>
	[r_fe] [real] NOT NULL, 

	--/ <summary>J fiducial Kron elliptical aperture magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_fe] [real] NOT NULL, 

		
	--/ <summary>J 1-sigma uncertainty in fiducial Kron ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_fe] [real] NOT NULL, 

	--/ <summary>J confusion flag for fiducial Kron ell. mag.</summary>
	--/ <quantity>met.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_fe] [smallint] NOT NULL, 

	--/ <summary>H fiducial Kron elliptical aperture magnitude.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[h_m_fe] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in fiducial Kron ell. mag.</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_fe] [real] NOT NULL, 

	--/ <summary>H confusion flag for fiducial Kron ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_fe] [smallint] NOT NULL, 

	--/ <summary>K fiducial Kron elliptical aperture magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_fe] [real] NOT NULL,
	
	--/ <summary>K 1-sigma uncertainty in fiducial Kron ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_fe] [real] NOT NULL, 

	--/ <summary>K confusion flag for fiducial Kron ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_fe] [smallint] NOT NULL, 

	--/ <summary>extrapolation/total radius.</summary>
	--/ <quantity>phtys.angSize;src</quantity>
	--/ <unit>arcsec</unit>
	[r_ext] [real] NOT NULL, 

	--/ <summary>J mag from fit extrapolation.</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_ext] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in mag from fit extrapolation.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_ext] [real] NOT NULL, 

	--/ <summary>J chi^2 of fit to rad. profile</summary>
	--/ <quantity>stat.fit.chi2;em.IR.J</quantity>
	[j_pchi] [real] NOT NULL, 

	--/ <summary>H mag from fit extrapolation.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_ext] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in mag from fit extrapolation.</summary>
	--/ <quantity>stat.error;stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_ext] [real] NOT NULL, 

	--/ <summary>H chi^2 of fit to rad. profile</summary>
	--/ <quantity>stat.fit.chi2;em.IR.H</quantity>
	[h_pchi] [real] NOT NULL, 

	--/ <summary>K mag from fit extrapolation.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_ext] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in mag from fit extrapolation.</summary>
	--/ <quantity>stat.error;stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_ext] [real] NOT NULL, 

	--/ <summary>K chi^2 of fit to rad. profile</summary>
	--/ <quantity>stat.fit.chi2;em.IR.K</quantity>
	[k_pchi] [real] NOT NULL, 

	--/ <summary>J half-light (integrated half-flux point) radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_eff] [real] NOT NULL, 

	--/ <summary>J mean surface brightness at the half-light radius.</summary>
	--/ <quantity>phot.mag.sb;em.IR.J;stat.mean</quantity>
	--/ <unit>mag arcsec-2</unit>
	[j_mnsurfb_eff] [real] NOT NULL, 

	--/ <summary>H half-light (integrated half-flux point) radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_eff] [real] NOT NULL, 

	--/ <summary>H mean surface brightness at the half-light radius.</summary>
	--/ <quantity>phot.mag.sb;em.IR.H;stat.mean</quantity>
	--/ <unit>mag arcsec-2</unit>
	[h_mnsurfb_eff] [real] NOT NULL,
	
	--/ <summary>K half-light (integrated half-flux point) radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[k_r_eff] [real] NOT NULL, 

	--/ <summary>K mean surface brightness at the half-light radius.</summary>
	--/ <quantity>phot.mag.sb;em.IR.K;stat.mean</quantity>
	--/ <unit>mag arcsec-2</unit>
	[k_mnsurfb_eff] [real] NOT NULL, 

	--/ <summary>J concentration index r_75%/r_25%.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_con_indx] [real] NOT NULL, 

	--/ <summary>H concentration index r_75%/r_25%.</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[h_con_indx] [real] NOT NULL, 

	--/ <summary>K concentration index r_75%/r_25%.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_con_indx] [real] NOT NULL, 

	--/ <summary>J peak pixel brightness.</summary>
	--/ <quantity>phot.mag.sb;em.IR.J</quantity>
	--/ <unit>mag arcsec-2</unit>
	[j_peak] [real] NOT NULL, 

	--/ <summary>H peak pixel brightness.</summary>
	--/ <quantity>phot.mag.sb;em.IR.H</quantity>
	--/ <unit>mag arcsec-2</unit>
	[h_peak] [real] NOT NULL, 

	--/ <summary>K peak pixel brightness.</summary>
	--/ <quantity>phot.mag.sb;em.IR.K</quantity>
	--/ <unit>mag arcsec-2</unit>
	[k_peak] [real] NOT NULL, 

	--/ <summary>J central surface brightness (r&amp;lt;=5).</summary>
	--/ <quantity>phot.mag.sb;em.IR.J</quantity>
	--/ <unit>mag arcsec-2</unit>
	[j_5surf] [real] NOT NULL, 

	--/ <summary>H central surface brightness (r&amp;lt;=5).</summary>
	--/ <quantity>phot.mag.sb;em.IR.H</quantity>
	--/ <unit>mag arcsec-2</unit>
	[h_5surf] [real] NOT NULL, 

	--/ <summary>K central surface brightness (r&amp;lt;=5).</summary>
	--/ <quantity>phot.mag.sb;em.IR.K</quantity>
	--/ <unit>mag arcsec-2</unit>
	[k_5surf] [real] NOT NULL, 

	--/ <summary>extended score: 1(extended) &amp;lt; e_score &amp;lt; 2(point-like).</summary>
	--/ <quantity></quantity>
	[e_score] [real] NOT NULL, 

	--/ <summary>galaxy score: 1(extended) &amp;lt; g_score &amp;lt; 2(point-like).</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[g_score] [real] NOT NULL, 

	--/ <summary>visual verification score for source.</summary>
	--/ <quantity>src.class.starGalaxy</quantity>
	[vc] [smallint] NOT NULL, 

	--/ <summary>indicates artifact contamination and/or confusion.</summary>
	--/ <quantity>meta.code</quantity>
	[cc_flg] [char](1) NOT NULL,
	
	--/ <summary>size of postage stamp image in pixels.</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>pix</unit>
	[im_nx] [smallint] NOT NULL, 

	--/ <summary>20mag/sq arcsec isophotal K fiducial circular ap. radius.</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[r_k20fc] [real] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_k20fc] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 20mag/sq arcsec iso.fid.circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_k20fc] [real] NOT NULL, 

	--/ <summary>J confusion flag for 20mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_flg_k20fc] [smallint] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_k20fc] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 20mag/sq arcsec iso.fid.circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_k20fc] [real] NOT NULL, 

	--/ <summary>H confusion flag for 20mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[h_flg_k20fc] [smallint] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_k20fc] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 20mag/sq arcsec iso.fid.circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_k20fc] [real] NOT NULL, 

	--/ <summary>K confusion flag for 20mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_flg_k20fc] [smallint] NOT NULL, 

	--/ <summary>J Kron elliptical aperture semi-major axis.</summary>
	--/ <quantity>phs.angSize;src</quantity>
	--/ <unit>arcsec</unit>
	[j_r_e] [real] NOT NULL, 

	--/ <summary>J Kron elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_e] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in Kron elliptical mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_e] [real] NOT NULL, 

	--/ <summary>J confusion flag for Kron elliptical mag.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_flg_e] [smallint] NOT NULL, 

	--/ <summary>H Kron elliptical aperture semi-major axis.</summary>
	--/ <quantity>phys.angSize;src;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_e] [real] NOT NULL, 

	--/ <summary>H Kron elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_e] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in Kron elliptical mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_e] [real] NOT NULL,
	
	--/ <summary>H confusion flag for Kron elliptical mag.</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[h_flg_e] [smallint] NOT NULL, 

	--/ <summary>K Kron elliptical aperture semi-major axis.</summary>
	--/ <quantity>phys.angSize;src;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_e] [real] NOT NULL, 

	--/ <summary>K Kron elliptical aperture magnitude</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_e] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in Kron elliptical mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_e] [real] NOT NULL, 

	--/ <summary>K confusion flag for Kron elliptical mag.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_flg_e] [smallint] NOT NULL, 

	--/ <summary>J Kron circular aperture radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_c] [real] NOT NULL, 

	--/ <summary>J Kron circular aperture magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_c] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in Kron circular mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_c] [real] NOT NULL, 

	--/ <summary>J confusion flag for Kron circular mag.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_flg_c] [smallint] NOT NULL, 

	--/ <summary>H Kron circular aperture radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_c] [real] NOT NULL, 

	--/ <summary>H Kron circular aperture magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_c] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in Kron circular mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_c] [real] NOT NULL, 

	--/ <summary>H confusion flag for Kron circular mag.</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[h_flg_c] [smallint] NOT NULL, 

	--/ <summary>K Kron circular aperture radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_c] [real] NOT NULL, 

	--/ <summary>K Kron circular aperture magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_c] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in Kron circular mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_c] [real] NOT NULL, 

	--/ <summary>K confusion flag for Kron circular mag.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_flg_c] [smallint] NOT NULL, 

	--/ <summary>K fiducial Kron circular aperture radius.</summary>
	--/ <quantity>phys.angSize;src;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[r_fc] [real] NOT NULL, 

	--/ <summary>J fiducial Kron circular magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_fc] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in fiducial Kron circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_fc] [real] NOT NULL, 

	--/ <summary>J confusion flag for Kron circular mag. confusion flag for fiducial Kron circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_flg_fc] [smallint] NOT NULL, 

	--/ <summary>H fiducial Kron circular magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_fc] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in fiducial Kron circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_fc] [real] NOT NULL, 

	--/ <summary>H confusion flag for Kron circular mag. confusion flag for fiducial Kron circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[h_flg_fc] [smallint] NOT NULL, 

	--/ <summary>K fiducial Kron circular magnitude.</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_fc] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in fiducial Kron circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_fc] [real] NOT NULL, 

	--/ <summary>K confusion flag for Kron circular mag. confusion flag for fiducial Kron circ. mag.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_flg_fc] [smallint] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phys.angSize;src;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_i20e] [real] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_i20e] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_i20e] [real] NOT NULL, 

	--/ <summary>J confusion flag for 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[j_flg_i20e] [smallint] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phys.angSize;src;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_i20e] [real] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_i20e] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_i20e] [real] NOT NULL, 

	--/ <summary>H confusion flag for 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;IR.H</quantity>	
	[h_flg_i20e] [smallint] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phys.angSiz;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_i20e] [real] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_i20e] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_i20e] [real] NOT NULL, 

	--/ <summary>K confusion flag for 20mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[k_flg_i20e] [smallint] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_i20c] [real] NOT NULL, 

	--/ <summary>J 20mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_i20c] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_i20c] [real] NOT NULL, 

	--/ <summary>J confusion flag for 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.J</quantity>
	[j_flg_i20c] [smallint] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_i20c] [real] NOT NULL, 

	--/ <summary>H 20mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_i20c] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_i20c] [real] NOT NULL, 

	--/ <summary>H confusion flag for 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.H</quantity>
	[h_flg_i20c] [smallint] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_i20c] [real] NOT NULL, 

	--/ <summary>K 20mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_i20c] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_i20c] [real] NOT NULL, 

	--/ <summary>K confusion flag for 20mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.K</quantity>
	[k_flg_i20c] [smallint] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phyas.angSize.smajAxis;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_i21e] [real] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_i21e] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_i21e] [real] NOT NULL, 

	--/ <summary>J confusion flag for 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.J</quantity>
	[j_flg_i21e] [smallint] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phys.angSize.smajAxis;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_i21e] [real] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_i21e] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_i21e] [real] NOT NULL, 

	--/ <summary>H confusion flag for 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.H</quantity>
	[h_flg_i21e] [smallint] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal elliptical ap. semi-major axis.</summary>
	--/ <quantity>phys.angSize.smajAxis;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_i21e] [real] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal elliptical ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_i21e] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_i21e] [real] NOT NULL, 

	--/ <summary>K confusion flag for 21mag/sq arcsec iso. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.K</quantity>
	[k_flg_i21e] [smallint] NOT NULL, 

	--/ <summary></summary>
	--/ <quantity>phys.angSize</quantity>
	[r_j21fe] [real] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_j21fe] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 21mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_j21fe] [real] NOT NULL, 

	--/ <summary>J confusion flag for 21mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.J</quantity>
	[j_flg_j21fe] [smallint] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_j21fe] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 21mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_j21fe] [real] NOT NULL, 

	--/ <summary>H confusion flag for 21mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.H</quantity>
	[h_flg_j21fe] [smallint] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal fiducial ell. ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_j21fe] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 21mag/sq arcsec iso.fid.ell.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_j21fe] [real] NOT NULL, 

	--/ <summary>K confusion flag for 21mag/sq arcsec iso. fid. ell. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.K</quantity>
	[k_flg_j21fe] [smallint] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[j_r_i21c] [real] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_i21c] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_i21c] [real] NOT NULL, 

	--/ <summary>J confusion flag for 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.J</quantity>
	[j_flg_i21c] [smallint] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.H</quantity>
	--/ <unit>arcsec</unit>
	[h_r_i21c] [real] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_i21c] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_i21c] [real] NOT NULL, 

	--/ <summary>H confusion flag for 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.H</quantity>
	[h_flg_i21c] [smallint] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal circular aperture radius.</summary>
	--/ <quantity>phys.angSize;em.IR.K</quantity>
	--/ <unit>arcsec</unit>
	[k_r_i21c] [real] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal circular ap. magnitude.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_i21c] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.</quantity>
	--/ <unit>mag</unit>
	[k_msig_i21c] [real] NOT NULL, 

	--/ <summary>K confusion flag for 21mag/sq arcsec iso. circ. mag.</summary>
	--/ <quantity></quantity>
	[k_flg_i21c] [smallint] NOT NULL, 

	--/ <summary>21mag/sq arcsec isophotal J fiducial circular ap. radius.</summary>
	--/ <quantity>phys.angSize;em.IR.J</quantity>
	--/ <unit>arcsec</unit>
	[r_j21fc] [real] NOT NULL, 

	--/ <summary>J 21mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_j21fc] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in 21mag/sq arcsec iso.fid.circ.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_j21fc] [real] NOT NULL, 

	--/ <summary>J confusion flag for 21mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.J</quantity>
	[j_flg_j21fc] [smallint] NOT NULL, 

	--/ <summary>H 21mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_j21fc] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in 21mag/sq arcsec iso.fid.circ.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_j21fc] [real] NOT NULL, 

	--/ <summary>H confusion flag for 21mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.H</quantity>
	[h_flg_j21fc] [smallint] NOT NULL, 

	--/ <summary>K 21mag/sq arcsec isophotal fiducial circ. ap. mag.</summary>
	--/ <quantity>phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_j21fc] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in 21mag/sq arcsec iso.fid.circ.mag.</summary>
	--/ <quantity>stat.error;phot.mag.isophotal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_j21fc] [real] NOT NULL, 

	--/ <summary>K confusion flag for 21mag/sq arcsec iso. fid. circ. mag.</summary>
	--/ <quantity>meta.code;phot.mag.isophotal;em.IR.K</quantity>
	[k_flg_j21fc] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_5] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_5] [real] NOT NULL, 

	--/ <summary>J confusion flag for 5 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_5] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	[h_m_5] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_5] [real] NOT NULL, 

	--/ <summary>H confusion flag for 5 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_5] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_5] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (5 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_5] [real] NOT NULL, 

	--/ <summary>K confusion flag for 5 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_5] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_7] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_7] [real] NOT NULL, 

	--/ <summary>J confusion flag for 7 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_7] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_7] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_7] [real] NOT NULL, 

	--/ <summary>H confusion flag for 7 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_7] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_7] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (7 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_7] [real] NOT NULL, 

	--/ <summary>K confusion flag for 7 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_7] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_10] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_10] [real] NOT NULL, 

	--/ <summary>J confusion flag for 10 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_10] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_10] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_10] [real] NOT NULL, 

	--/ <summary>H confusion flag for 10 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_10] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_10] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (10 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_10] [real] NOT NULL, 

	--/ <summary>K confusion flag for 10 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_10] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_15] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_15] [real] NOT NULL, 

	--/ <summary>J confusion flag for 15 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_15] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_15] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_15] [real] NOT NULL, 

	--/ <summary>H confusion flag for 15 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_15] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_15] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (15 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_15] [real] NOT NULL, 

	--/ <summary>K confusion flag for 15 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_15] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_20] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_20] [real] NOT NULL, 

	--/ <summary>J confusion flag for 20 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_20] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	[h_m_20] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_20] [real] NOT NULL, 

	--/ <summary>H confusion flag for 20 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_20] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_20] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (20 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_20] [real] NOT NULL, 

	--/ <summary>K confusion flag for 20 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_20] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (25 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_25] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (25 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_25] [real] NOT NULL, 

	--/ <summary>J confusion flag for 25 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_25] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (25 arcsec radius</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	[h_m_25] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (25 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_25] [real] NOT NULL, 

	--/ <summary>H confusion flag for 25 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_25] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (25 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_25] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (25 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_25] [real] NOT NULL, 

	--/ <summary>K confusion flag for 25 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_25] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_30] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_30] [real] NOT NULL, 

	--/ <summary>J confusion flag for 30 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_30] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_30] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_30] [real] NOT NULL, 

	--/ <summary>H confusion flag for 30 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_30] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_30] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (30 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_30] [real] NOT NULL, 

	--/ <summary>K confusion flag for 30 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_30] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_40] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_40] [real] NOT NULL, 

	--/ <summary>J confusion flag for 40 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_40] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_40] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_40] [real] NOT NULL, 

	--/ <summary>H confusion flag for 40 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_40] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_40] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (40 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_40] [real] NOT NULL, 

	--/ <summary>K confusion flag for 40 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_40] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_50] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_50] [real] NOT NULL, 

	--/ <summary>J confusion flag for 50 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_50] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_50] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_50] [real] NOT NULL, 

	--/ <summary>H confusion flag for 50 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_50] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_50] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (50 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_50] [real] NOT NULL, 

	--/ <summary>K confusion flag for 50 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_50] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_60] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_60] [real] NOT NULL, 

	--/ <summary>J confusion flag for 60 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_60] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_60] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_60] [real] NOT NULL, 

	--/ <summary>H confusion flag for 60 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_60] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_60] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (60 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_60] [real] NOT NULL, 

	--/ <summary>K confusion flag for 60 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_60] [smallint] NOT NULL, 

	--/ <summary>J-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_70] [real] NOT NULL, 

	--/ <summary>error in J-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_70] [real] NOT NULL, 

	--/ <summary>J confusion flag for 70 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.J</quantity>
	[j_flg_70] [smallint] NOT NULL, 

	--/ <summary>H-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_70] [real] NOT NULL, 

	--/ <summary>error in H-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_70] [real] NOT NULL, 

	--/ <summary>H confusion flag for 70 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.H</quantity>
	[h_flg_70] [smallint] NOT NULL, 

	--/ <summary>K-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_70] [real] NOT NULL, 

	--/ <summary>error in K-band circular aperture magnitude (70 arcsec radius)</summary>
	--/ <quantity>stat.error;phot.mag.aper;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_70] [real] NOT NULL, 

	--/ <summary>K confusion flag for 70 arcsec circular ap. mag.</summary>
	--/ <quantity>meta.code;phot.mag.aper;em.IR.K</quantity>
	[k_flg_70] [smallint] NOT NULL, 

	--/ <summary>J system photometry magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_m_sys] [real] NOT NULL, 

	--/ <summary>J 1-sigma uncertainty in system photometry mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_msig_sys] [real] NOT NULL, 

	--/ <summary>H system photometry magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_m_sys] [real] NOT NULL, 

	--/ <summary>H 1-sigma uncertainty in system photometry mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_msig_sys] [real] NOT NULL, 

	--/ <summary>K system photometry magnitude.</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_m_sys] [real] NOT NULL, 

	--/ <summary>K 1-sigma uncertainty in system photometry mag.</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_msig_sys] [real] NOT NULL, 

	--/ <summary>system flag: 0=no system, 1=nearby galaxy flux incl. in mag.</summary>
	--/ <quantity>meta.code</quantity>
	[sys_flg] [smallint] NOT NULL, 

	--/ <summary>contamination flag: 0=no stars, 1=stellar flux incl. in mag.</summary>
	--/ <quantity>meta.code</quantity>
	[contam_flg] [smallint] NOT NULL, 

	--/ <summary>J minor/major axis ratio fit to the 5-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.J</quantity>
	[j_5sig_ba] [real] NOT NULL, 

	--/ <summary>J angle to 5-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.J</quantity>
	--/ <unit>deg</unit>
	[j_5sig_phi] [smallint] NOT NULL, 

	--/ <summary>H minor/major axis ratio fit to the 5-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.H</quantity>
	[h_5sig_ba] [real] NOT NULL, 

	--/ <summary>H angle to 5-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.H</quantity>
	--/ <unit>deg</unit>
	[h_5sig_phi] [smallint] NOT NULL, 

	--/ <summary>K minor/major axis ratio fit to the 5-sigma isophote.</summary>
	--/ <quantity>phys.size.axisRatio;em.IR.K</quantity>
	[k_5sig_ba] [real] NOT NULL, 

	--/ <summary>K angle to 5-sigma major axis (E of N).</summary>
	--/ <quantity>pos.posAng;em.IR.K</quantity>
	--/ <unit>deg</unit>
	[k_5sig_phi] [smallint] NOT NULL, 

	--/ <summary>J 5-sigma to 3-sigma differential area.</summary>
	--/ <quantity>phys.angSize.area;em.IR.J</quantity>
	[j_d_area] [smallint] NOT NULL, 

	--/ <summary>J 5-sigma to 3-sigma percent area change.</summary>
	--/ <quantity>phys.angSize.area;em.IR.J</quantity>
	--/ <unit>%</unit>
	[j_perc_darea] [smallint] NOT NULL, 

	--/ <summary>H 5-sigma to 3-sigma differential area.</summary>
	--/ <quantity>phys.angSize.area;em.IR.H</quantity>
	[h_d_area] [smallint] NOT NULL, 

	--/ <summary>H 5-sigma to 3-sigma percent area change.</summary>
	--/ <quantity>phys.angSize.area;em.IR.H</quantity>
	--/ <unit>%</unit>
	[h_perc_darea] [smallint] NOT NULL, 

	--/ <summary>K 5-sigma to 3-sigma differential area.</summary>
	--/ <quantity>phys.angSize.area;em.IR.K</quantity>
	[k_d_area] [smallint] NOT NULL, 

	--/ <summary>K 5-sigma to 3-sigma percent area change.</summary>
	--/ <quantity>phys.angSize.area;em.IR.K</quantity>
	--/ <unit>%</unit>
	[k_perc_darea] [smallint] NOT NULL, 

	--/ <summary>J bi-symmetric flux ratio.</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_bisym_rat] [real] NOT NULL, 

	--/ <summary>J bi-symmetric cross-correlation chi.</summary>
	--/ <quantity>stat.fit.chi2;em.IR.J</quantity>
	[j_bisym_chi] [real] NOT NULL, 

	--/ <summary>H bi-symmetric flux ratio.</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_bisym_rat] [real] NOT NULL, 

	--/ <summary>H bi-symmetric flux ratio.</summary>
	--/ <quantity>stat.fit.chi2;em.IR.H</quantity>
	[h_bisym_chi] [real] NOT NULL, 

	--/ <summary>K bi-symmetric flux ratio.</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_bisym_rat] [real] NOT NULL, 

	--/ <summary>K bi-symmetric cross-correlation chi.</summary>
	--/ <quantity>stat.fit.chi2;em.IR.</quantity>
	[k_bisym_chi] [real] NOT NULL, 

	--/ <summary>J ridge shape (LCSB: BSNR limit).</summary>
	--/ <quantity>src.morph.param;em.IR.J</quantity>
	[j_sh0] [real] NOT NULL, 

	--/ <summary>J ridge shape sigma (LCSB: B2SNR limit).</summary>
	--/ <quantity>stat.error;src.morph.param;em.IR.J</quantity>
	[j_sig_sh0] [real] NOT NULL, 

	--/ <summary>H ridge shape (LCSB: BSNR limit).</summary>
	--/ <quantity>src.morph.param;em.IR.H</quantity>
	[h_sh0] [real] NOT NULL, 

	--/ <summary>H ridge shape sigma (LCSB: B2SNR limit).</summary>
	--/ <quantity>stat.error;src.morph.param;em.IR.H</quantity>
	[h_sig_sh0] [real] NOT NULL, 

	--/ <summary>K ridge shape (LCSB: BSNR limit).</summary>
	--/ <quantity>src.morph.param;em.IR.K</quantity>
	[k_sh0] [real] NOT NULL, 

	--/ <summary>K ridge shape sigma (LCSB: B2SNR limit).</summary>
	--/ <quantity>stat.error;src.morph.param;em.IR.K</quantity>
	[k_sig_sh0] [real] NOT NULL, 

	--/ <summary>J mxdn (score) (LCSB: BSNR - block/smoothed SNR)</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_mxdn] [real] NOT NULL, 

	--/ <summary>J shape (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_sh] [real] NOT NULL, 

	--/ <summary>J wsh (score) (LCSB: PSNR - peak raw SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_wsh] [real] NOT NULL, 

	--/ <summary>J r23 (score) (LCSB: TSNR - integrated SNR for r=15).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_r23] [real] NOT NULL, 

	--/ <summary>J 1st moment (score) (LCSB: super blk 2,4,8 SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_1mm] [real] NOT NULL, 

	--/ <summary>J 2nd moment (score) (LCSB: SNRMAX - super SNR max).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_2mm] [real] NOT NULL, 

	--/ <summary>J vint (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_vint] [real] NOT NULL, 

	--/ <summary>J r1 (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_r1] [real] NOT NULL, 

	--/ <summary>J median shape score.</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_sc_msh] [real] NOT NULL, 

	--/ <summary>H mxdn (score) (LCSB: BSNR - block/smoothed SNR)</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_mxdn] [real] NOT NULL, 

	--/ <summary>H shape (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_sh] [real] NOT NULL, 

	--/ <summary>H wsh (score) (LCSB: PSNR - peak raw SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_wsh] [real] NOT NULL, 

	--/ <summary>H r23 (score) (LCSB: TSNR - integrated SNR for r=15).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_r23] [real] NOT NULL, 

	--/ <summary>H 1st moment (score) (LCSB: super blk 2,4,8 SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_1mm] [real] NOT NULL, 

	--/ <summary>H 2nd moment (score) (LCSB: SNRMAX - super SNR max).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_2mm] [real] NOT NULL, 

	--/ <summary>H vint (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_vint] [real] NOT NULL, 

	--/ <summary>H r1 (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_r1] [real] NOT NULL, 

	--/ <summary>H median shape score.</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_sc_msh] [real] NOT NULL, 

	--/ <summary>K mxdn (score) (LCSB: BSNR - block/smoothed SNR)</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_mxdn] [real] NOT NULL, 

	--/ <summary>K shape (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_sh] [real] NOT NULL, 

	--/ <summary>K wsh (score) (LCSB: PSNR - peak raw SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_wsh] [real] NOT NULL, 

	--/ <summary>K r23 (score) (LCSB: TSNR - integrated SNR for r=15).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_r23] [real] NOT NULL, 

	--/ <summary>K 1st moment (score) (LCSB: super blk 2,4,8 SNR).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_1mm] [real] NOT NULL, 

	--/ <summary>K 2nd moment (score) (LCSB: SNRMAX - super SNR max).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_2mm] [real] NOT NULL, 

	--/ <summary>K vint (score).</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_vint] [real] NOT NULL, 

	--/ <summary>K r1 (score).</summary>
	--/ <quantity></quantity>
	[k_sc_r1] [real] NOT NULL, 

	--/ <summary>K median shape score.</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_sc_msh] [real] NOT NULL, 

	--/ <summary>J % chi-fraction for elliptical fit to 3-sig isophote.</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	--/ <unit>%</unit>
	[j_chif_ellf] [real] NOT NULL, 

	--/ <summary>K % chi-fraction for elliptical fit to 3-sig isophote.</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	--/ <unit>%</unit>
	[k_chif_ellf] [real] NOT NULL, 

	--/ <summary>ellipse fitting contamination flag.</summary>
	--/ <quantity>meta.code</quantity>
	[ellfit_flg] [smallint] NOT NULL, 

	--/ <summary>super-coadd % chi-fraction for ellip. fit to 3-sig isophote.</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	--/ <unit>%</unit>
	[sup_chif_ellf] [real] NOT NULL, 

	--/ <summary>number of blanked source records.</summary>
	--/ <quantity>meta.number</quantity>
	[n_blank] [smallint] NOT NULL, 

	--/ <summary>number of subtracted source records.</summary>
	--/ <quantity>meta.number</quantity>
	[n_sub] [smallint] NOT NULL, 

	--/ <summary>blanked/subtracted src description flag.</summary>
	--/ <quantity>meta.code</quantity>
	[bl_sub_flg] [smallint] NOT NULL, 

	--/ <summary>type/galaxy ID flag (0=non-catalog, 1=catalog, 2=LCSB).</summary>
	--/ <quantity>meta.code</quantity>
	[id_flg] [smallint] NOT NULL, 

	--/ <summary>matched galaxy catalog name.</summary>
	--/ <quantity>meta.id</quantity>
	[id_cat] [varchar](20) NOT NULL, 

	--/ <summary>flux-growth convergence flag.</summary>
	--/ <quantity>meta.code</quantity>
	[fg_flg] [varchar](6) NOT NULL, 

	--/ <summary>LCSB blocking factor (1, 2, 4, 8).</summary>
	--/ <quantity>meta.code</quantity>
	[blk_fac] [smallint] NOT NULL, 

	--/ <summary>Duplicate source flag.</summary>
	--/ <quantity>meta.code.multip</quantity>
	[dup_src] [smallint] NOT NULL, 

	--/ <summary>Use source flag.</summary>
	--/ <quantity>meta.code.multip</quantity>
	[use_src] [smallint] NOT NULL, 

	--/ <summary>Proximity. The distance between this source and its nearest neighbor in the PSC.</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[prox] [real] NOT NULL, 

	--/ <summary>The position angle on the sky of the vector from the source to the nearest neighbor in the PSC, East of North.</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[pxpa] [smallint] NOT NULL, 

	--/ <summary>ext_key value of nearest XSC source.</summary>
	--/ <quantity>meta.id.assoc</quantity>
	[pxcntr] [int] NOT NULL, 

	--/ <summary>The distance from the source to the nearest North or South scan edge.</summary>
	--/ <quantity>phys.angDistance;instr.det</quantity>
	--/ <unit>arcsec</unit>
	[dist_edge_ns] [int] NOT NULL, 

	--/ <summary>The distance from the source to the nearest East or West scan edge.</summary>
	--/ <quantity>phys.angDistance;instr.det</quantity>
	--/ <unit>arcsec</unit>
	[dist_edge_ew] [smallint] NOT NULL, 

	--/ <summary>flag indicating which edges ([n|s][e|w]) are nearest to src.</summary>
	--/ <quantity>meta.code;instr.det</quantity>
	[dist_edge_flg] [varchar](2) NOT NULL, 

	--/ <summary>key to point source data DB record.</summary>
	--/ <quantity>meta.id</quantity>
	[pts_key] [bigint] NOT NULL, 

	--/ <summary>key to minor planet prediction DB record.</summary>
	--/ <quantity>meta.id</quantity>
	[mp_key] [int] NOT NULL, 

	--/ <summary>key to night data record in "scan DB".</summary>
	--/ <quantity>meta.id</quantity>
	[night_key] [smallint] NOT NULL, 

	--/ <summary>key to scan data record in "scan DB".</summary>
	--/ <quantity>meta.id</quantity>
	[scan_key] [int] NOT NULL, 

	--/ <summary>key to coadd data record in "scan DB".</summary>
	--/ <quantity>meta.id</quantity>
	[coadd_key] [int] NOT NULL, 

	--/ <summary>hemisphere (N/S) of observation. "n" = North/Mt. Hopkins; "s" = South/CTIO.</summary>
	--/ <quantity>meta.id;instr.obsty</quantity>
	[hemis] [char](1) NOT NULL, 

	--/ <summary>The observation reference date for this source expressed in ISO standard format.</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[date] [varchar](32) NOT NULL, 

	--/ <summary>scan number (unique within date).</summary>
	--/ <quantity>meta.id</quantity>
	[scan] [smallint] NOT NULL, 

	--/ <summary>3-digit coadd number (unique within scan).</summary>
	--/ <quantity>meta.id</quantity>
	[coadd] [smallint] NOT NULL, 

	--/ <summary>source ID number (unique within scan+coadd)</summary>
	--/ <quantity>meta.id</quantity>
	[id] [int] NOT NULL, 

	--/ <summary>x (cross-scan) position (coadd coord.).</summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit>pix</unit>
	[x_coadd] [real] NOT NULL, 

	--/ <summary>y (in-scan) position (coadd coord.).</summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit>pix</unit>
	[y_coadd] [real] NOT NULL, 

	--/ <summary>J residual background #2 (score).</summary>
	--/ <quantity>stat.fit.residual;em.IR.J</quantity>
	[j_subst2] [real] NOT NULL, 

	--/ <summary>H residual background #2 (score).</summary>
	--/ <quantity>stat.fit.residual;em.IR.H</quantity>
	[h_subst2] [real] NOT NULL, 

	--/ <summary>K residual background #2 (score).</summary>
	--/ <quantity>stat.fit.residual;em.IR.K</quantity>
	[k_subst2] [real] NOT NULL, 

	--/ <summary>J coadd median background.</summary>
	--/ <quantity>instr.background;em.IR.J</quantity>
	[j_back] [real] NOT NULL, 

	--/ <summary>H coadd median background</summary>
	--/ <quantity>instr.background;em.IR.H</quantity>
	[h_back] [real] NOT NULL, 

	--/ <summary>K coadd median background.</summary>
	--/ <quantity>instr.background;em.IR.K</quantity>
	[k_back] [real] NOT NULL, 

	--/ <summary>J residual annulus background median.</summary>
	--/ <quantity>stat.fit.residual;em.IR.J</quantity>
	--/ <unit>mag/sq arcsec</unit>
	[j_resid_ann] [real] NOT NULL, 

	--/ <summary>H residual annulus background median.</summary>
	--/ <quantity>stat.fit.residual;em.IR.H</quantity>
	--/ <unit>mag/sq arcsec</unit>
	[h_resid_ann] [real] NOT NULL, 

	--/ <summary>K residual annulus background median.</summary>
	--/ <quantity>stat.fit.residual;em.IR.K</quantity>
	--/ <unit>mag/sq arcsec</unit>
	[k_resid_ann] [real] NOT NULL, 

	--/ <summary>J banding Fourier Transf. period on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_bndg_per] [int] NOT NULL, 

	--/ <summary>J banding maximum FT amplitude on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_bndg_amp] [real] NOT NULL, 

	--/ <summary>H banding Fourier Transf. period on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_bndg_per] [int] NOT NULL, 

	--/ <summary>H banding maximum FT amplitude on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_bndg_amp] [real] NOT NULL, 

	--/ <summary>K banding Fourier Transf. period on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_bndg_per] [int] NOT NULL, 

	--/ <summary>K banding maximum FT amplitude on this side of coadd.</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_bndg_amp] [real] NOT NULL, 

	--/ <summary>J band seetracking score.</summary>
	--/ <quantity>stat.fit.param;em.IR.J</quantity>
	[j_seetrack] [real] NOT NULL, 

	--/ <summary>H band seetracking score.</summary>
	--/ <quantity>stat.fit.param;em.IR.H</quantity>
	[h_seetrack] [real] NOT NULL, 

	--/ <summary>K band seetracking score.</summary>
	--/ <quantity>stat.fit.param;em.IR.K</quantity>
	[k_seetrack] [real] NOT NULL, 

	--/ <summary>entry counter (key) number (unique within table).</summary>
	--/ <quantity>meta.id</quantity>
	[ext_key] [int] NOT NULL 
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PhotoXSC]
ADD CONSTRAINT [PX_PhotoXSC] PRIMARY KEY
(
	[ext_key] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

------------------------------------------------------------------------

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[ScanInfo](

	--/ <summary>The unique identification number for this scan</summary>
	--/ <quantity>meta.id</quantity>
	[scan_key] [int] NOT NULL, 

	--/ <summary>Observatory from which data were obtained (n/s)</summary>
	--/ <quantity>meta.id;instr.obsty</quantity>
	[hemis] [char](1) NOT NULL, 

	--/ <summary>The observation reference date for this scan expressed in ISO standard format</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[date] [varchar](32) NOT NULL, 

	--/ <summary>Scan number (unique within date)</summary>
	--/ <quantity>meta.id</quantity>
	[scan] [smallint] NOT NULL, 

	--/ <summary>Tile identification number</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [int] NOT NULL, 

	--/ <summary>Right ascension of scan center for equinox J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 
	
	--/ <summary>Declination of scan center for equinox J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Galactic longitude of scan center, as computed from ra and dec</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [real] NOT NULL, 

	--/ <summary>Galactic latitude of scan center, as computed from ra and dec</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [real] NOT NULL, 

	--/ <summary>J2000 right ascension of the eastern corner at start of scan</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[ra_1] [float] NOT NULL, 

	--/ <summary>J2000 declination of the eastern corner at start of scan</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[dec_1] [float] NOT NULL, 

	--/ <summary>J2000 right ascension of the western corner at start of s</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[ra_2] [float] NOT NULL, 

	--/ <summary>J2000 declination of the western corner at start of scan</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[dec_2] [float] NOT NULL, 

	--/ <summary>J2000 right ascension of the eastern corner at end of scan</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[ra_3] [float] NOT NULL, 

	--/ <summary>J2000 declination of the eastern corner at end of scan</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[dec_3] [float] NOT NULL, 

	--/ <summary>J2000 right ascension of the western corner at end of scan</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[ra_4] [float] NOT NULL, 

	--/ <summary>J2000 declination of the western corner at end of scan</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;obs.image</quantity>
	--/ <unit>deg</unit>
	[dec_4] [float] NOT NULL, 

	--/ <summary>Scanning direction (north-going or south-going)</summary>
	--/ <quantity>meta.note;obs</quantity>
	[sd] [char](1) NOT NULL, 

	--/ <summary>Quality score for scan (10 is highest grade,0 is lowest)</summary>
	--/ <quantity>meta.code.qual</quantity>
	[qual] [smallint] NOT NULL, 

	--/ <summary>flag indicating whether(1) or not(0) the scan has a single-frame H-band electronic glitch</summary>
	--/ <quantity>meta.code</quantity>
	[hgl] [smallint] NOT NULL, 

	--/ <summary>flag indicating whether or not a cloud was found in the scan after comparison (1 indicates clouds)</summary>
	--/ <quantity>meta.code</quantity>
	[cld] [smallint] NOT NULL, 

	--/ <summary>flag indicating whether(1) or not(0) another photometric problem, not obviously cloud related, was found</summary>
	--/ <quantity>meta.code</quantity>
	[xph] [smallint] NOT NULL, 

	--/ <summary>flag indicating whether(1) or not(0) an unusual problem was found in the Atlas Images for this scan</summary>
	--/ <quantity>meta.code</quantity>
	[anom] [smallint] NOT NULL, 

	--/ <summary>Universal Time (UT) at beginning of scan</summary>
	--/ <quantity>time.start;obs</quantity>
	--/ <unit>h</unit>
	[ut] [float] NOT NULL, 

	--/ <summary>Julian Date at beginning of scan</summary>
	--/ <quantity>time.start;obs</quantity>
	--/ <unit>day</unit>
	[jdate] [float] NOT NULL, 

	--/ <summary>Airmass at beginning of scan</summary>
	--/ <quantity>obs.airmass</quantity>
	[airm] [real] NOT NULL, 

	--/ <summary>Scan's distance from the zenith at beginning of scan</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>deg</unit>
	[zd] [real] NOT NULL, 

	--/ <summary>Hour angle at beginning of scan</summary>
	--/ <quantity>pos.eq.ha</quantity>
	--/ <unit>h</unit>
	[ha] [float] NOT NULL, 

	--/ <summary>Relative humidity of telescope enclosure at beginning of scan</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>%</unit>
	[rh] [smallint] NOT NULL, 

	--/ <summary>Air temperature at beginning of scan</summary>
	--/ <quantity>phys.temperature;obs</quantity>
	--/ <unit>deg C</unit>
	[air_temp] [real] NOT NULL, 

	--/ <summary>Telescope girdle temperature at beginning of scan</summary>
	--/ <quantity>phys.temperature;instr.tel</quantity>
	--/ <unit>deg C</unit>
	[tel_temp] [real] NOT NULL, 

	--/ <summary>Focus setting of telescope at beginning of scan</summary>
	--/ <quantity>instr.param</quantity>
	[focus] [smallint] NOT NULL, 

	--/ <summary>Flag indicating the H-band array configuration for the camera (1 indicates the new  configuration)</summary>
	--/ <quantity>meta.code</quantity>
	[hry] [smallint] NOT NULL, 

	--/ <summary>Flag indicating the calibration strategy for this night's data</summary>
	--/ <quantity>meta.code</quantity>
	[c_strat] [smallint] NOT NULL, 

	--/ <summary>Photometric zero-point for J-band aperture photometry</summary>
	--/ <quantity>phot.mag;arith.zp;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_zp_ap] [real] NOT NULL, 

	--/ <summary>Photometric zero-point for H-band aperture photometry</summary>
	--/ <quantity>phot.mag;arith.zp;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_zp_ap] [real] NOT NULL, 

	--/ <summary>Photometric zero-point for Ks-band aperture photometry</summary>
	--/ <quantity>phot.mag;arith.zp;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_zp_ap] [real] NOT NULL, 

	--/ <summary>RMS-error of zero-point for H-band aperture photometry</summary>
	--/ <quantity>stat.error;phot.mag;arith.zp;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_zperr_ap] [real] NOT NULL, 

	--/ <summary>RMS-error of zero-point for Ks-band aperture photometry</summary>
	--/ <quantity>stat.error;phot.mag;arith.zp;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_zperr_ap] [real] NOT NULL, 

	--/ <summary>Number of point sources at J-band with SNR&amp;gt;10 (instrumental mag &amp;lt;=15.8)</summary>
	--/ <quantity>meta.number;src;em.IR.J</quantity>
	[j_n_snr10] [int] NOT NULL, 

	--/ <summary>Number of point sources at H-band with SNR&amp;gt;10 (instrumental mag &amp;lt;=15.1)</summary>
	--/ <quantity>meta.number;src;em.IR.H</quantity>
	[h_n_snr10] [int] NOT NULL, 

	--/ <summary>Number of point sources at Ks-band with SNR&amp;gt;10 (instrumental mag &amp;lt;=14.3)</summary>
	--/ <quantity>meta.number;src;em.IR.K</quantity>
	[k_n_snr10] [int] NOT NULL, 

	--/ <summary>Number of regular extended sources detected in scan</summary>
	--/ <quantity>meta.number;src</quantity>
	[n_ext] [int] NOT NULL, 

	--/ <summary>J-band average seeing shape for scan</summary>
	--/ <quantity>isntr.obsty.seeing;em.IR.J</quantity>
	[j_shape_avg] [real] NOT NULL, 

	--/ <summary>H-band average seeing shape for scan</summary>
	--/ <quantity>isntr.obsty.seeing;em.IR.H</quantity>
	[h_shape_avg] [real] NOT NULL, 

	--/ <summary>Ks-band average seeing shape for scan</summary>
	--/ <quantity>isntr.obsty.seeing;em.IR.K</quantity>
	[k_shape_avg] [real] NOT NULL, 

	--/ <summary>RMS-error of J-band average seeing shape</summary>
	--/ <quantity>stat.error;isntr.obsty.seeing;em.IR.J</quantity>
	[j_shape_rms] [real] NOT NULL, 

	--/ <summary>RMS-error of H-band average seeing shape</summary>
	--/ <quantity>stat.error;isntr.obsty.seeing;em.IR.H</quantity>
	[h_shape_rms] [real] NOT NULL, 

	--/ <summary>RMS-error of Ks-band average seeing shape</summary>
	--/ <quantity>stat.error;isntr.obsty.seeing;em.IR.K</quantity>
	[k_shape_rms] [real] NOT NULL, 

	--/ <summary>J-band average 2nd image moment ratio</summary>
	--/ <quantity>arith.ratio;em.IR.J</quantity>
	[j_2mrat] [real] NOT NULL, 

	--/ <summary>H-band average 2nd image moment ratio</summary>
	--/ <quantity>arith.ratio;em.IR.H</quantity>
	[h_2mrat] [real] NOT NULL, 

	--/ <summary>Ks-band average 2nd image moment ratio</summary>
	--/ <quantity>arith.ratio;em.IR.K</quantity>
	[k_2mrat] [real] NOT NULL, 

	--/ <summary>J-band photometric sensitivity paramater (PSP).</summary>
	--/ <quantity>inst.sensitivity;em.IR.J</quantity>
	[j_psp] [real] NOT NULL, 

	--/ <summary>H-band photometric sensitivity parameter (PSP).</summary>
	--/ <quantity>inst.sensitivity;em.IR.H</quantity>
	[h_psp] [real] NOT NULL, 

	--/ <summary>Ks-band photometric sensitivity parameter (PSP).</summary>
	--/ <quantity>inst.sensitivity;em.IR.K</quantity>
	[k_psp] [real] NOT NULL, 

	--/ <summary>log10 of the mode of the noise distribution (noise estimated from J-band)</summary>
	--/ <quantity>isntr.noise;em.IR.J</quantity>
	[j_pts_noise] [real] NOT NULL, 

	--/ <summary>log10 of the mode of the noise distribution (noise estimated from H-band)</summary>
	--/ <quantity>isntr.noise;em.IR.H</quantity>
	[h_pts_noise] [real] NOT NULL, 

	--/ <summary>log10 of the mode of the noise distribution (noise estimated from Ks-band)</summary>
	--/ <quantity>isntr.noise;em.IR.K</quantity>
	[k_pts_noise] [real] NOT NULL, 

	--/ <summary>The J-band magnitude at which SNR=10 is achieved for this scan</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>	
	[j_msnr10] [real] NOT NULL, 

	--/ <summary>The H-band magnitude at which SNR=10 is achieved for this scan</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>	
	[h_msnr10] [real] NOT NULL, 

	--/ <summary>The Ks-band magnitude at which SNR=10 is achieved for this scan</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>	
	[k_msnr10] [real] NOT NULL, 

	--/ <summary>Flag indicating whether the scan is contained in the 2MASS Sampler Release</summary>
	--/ <quantity>meta.code;em.IR.J</quantity>
	[rel0] [smallint] NOT NULL, 

	--/ <summary>Flag indicating whether the scan is contained in the 2MASS First Incremental Data Release (IDR1)</summary>
	--/ <quantity>meta.code;em.IR.H</quantity>
	[rel1] [smallint] NOT NULL, 

	--/ <summary>Flag indicating whether the scan is contained in the 2MASS Second Incremental Data Release (IDR2)</summary>
	--/ <quantity>meta.code;em.IR.K</quantity>
	[rel2] [smallint] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ScanInfo]
ADD CONSTRAINT PK_ScanInfo PRIMARY KEY
(
	[scan_key]
) ON [PRIMARY]