--/ <summary>The main PhotoObj table for the PSCz catalog</summary>
--/ <remarks>The main PhotoObj table for the PSCz catalog</remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object identifier</summary>
	--/ <quantity>meta.record</quantity>
	[objID] [bigint] NOT NULL, 

	--/ <summary>PSCz name e.g. Q12345+4856</summary>
	--/ <quantity>meta.id</quantity>
	[cname] [varchar](11) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	--/ <quantity>pos.cartesian.x; pos.eq; pos.frame=j2000</quantity>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	--/ <quantity>pos.cartesian.y; pos.eq; pos.frame=j2000</quantity>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	--/ <quantity>pos.cartesian.z; pos.eq; pos.frame=j2000</quantity>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	--/ <quantity>pos.HTM; pos.eq; pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.zone</quantity>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>non-color corrected flux, 12 um</summary>
	--/ <quantity>phot.flux.density;em.IR.8-15um</quantity>
	--/ <unit>Jy</unit>
	[flux_12] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 25 um</summary>
	--/ <quantity>phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit>Jy</unit>
	[flux_25] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 60 um</summary>
	--/ <quantity>phot.flux.density;em.IR.30-60um</quantity>
	--/ <unit>Jy</unit>
	[flux_60] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 100 um</summary>
	--/ <quantity>phot.flux.density;em.IR.60-100um</quantity>
	--/ <unit>Jy</unit>
	[flux_100] [real] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 12 um</summary>
	--/ <quantity>meta.code.qual;em.IR.8-15um</quantity>
	[iq_12] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 25 um</summary>
	--/ <quantity>meta.code.qual;em.IR.15-30um</quantity>
	[iq_25] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 60 um</summary>
	--/ <quantity>meta.code.qual;em.IR.30-60um</quantity>
	[iq_60] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 100 um</summary>
	--/ <quantity>meta.code.qual;em.IR.60-100um</quantity>
	[iq_100] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 12 um</summary>
	--/ <quantity>meta.code;instr.param;em.IR.8-15um</quantity>
	[ises_12] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 25 um</summary>
	--/ <quantity>meta.code;instr.param;em.IR.15-30um</quantity>
	[ises_25] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 60 um</summary>
	--/ <quantity>meta.code;instr.param;em.IR.30-60um</quantity>
	[ises_60] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 100 um</summary>
	--/ <quantity>meta.code;instr.param;em.IR.60-100um</quantity>
	[ises_100] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 12 um</summary>
	--/ <quantity>stat.error;phot.flux;em.IR.8-15um</quantity>
	--/ <unit>%</unit>
	[iu_12] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 25 um</summary>
	--/ <quantity>stat.error;phot.flux;em.IR.15-30um</quantity>
	--/ <unit>%</unit>
	[iu_25] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 60 um</summary>
	--/ <quantity>stat.error;phot.flux;em.IR.30-60um</quantity>
	--/ <unit>%</unit>
	[iu_60] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 100 um</summary>
	--/ <quantity>stat.error;phot.flux;em.IR.60-100um</quantity>
	--/ <unit>%</unit>
	[iu_100] [smallint] NOT NULL, 

	--/ <summary>Minor axe of 2 sig er ellipse</summary>
	--/ <quantity>pos.errorEllipse.sminAxis</quantity>
	--/ <unit>arcsec</unit>
	[mine] [smallint] NOT NULL, 

	--/ <summary>Major axe of 2 sig er ellipse,</summary>
	--/ <quantity>pos.errorEllipse.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[maje] [smallint] NOT NULL, 

	--/ <summary>PA of 2 sig er ellipse</summary>
	--/ <quantity>pos.posAng;pos.errorEllipse</quantity>
	--/ <unit>deg</unit>
	[ipose] [smallint] NOT NULL, 

	--/ <summary>CIRR1 flag</summary>
	--/ <quantity>meta.number</quantity>
	[ic1] [smallint] NOT NULL, 

	--/ <summary>CIRR2 flag</summary>
	--/ <quantity>meta.number</quantity>
	[ic2] [smallint] NOT NULL, 

	--/ <summary>CIRR3 flag</summary>
	--/ <quantity>meta.number</quantity>
	[ic3] [smallint] NOT NULL, 

	--/ <summary>Correlation Coefficient, 12 um (NULL allowed)</summary>
	--/ <quantity>stat.correlation;em.IR.8-15um</quantity>
	[cc_12] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 25 um (NULL allowed)</summary>
	--/ <quantity>stat.correlation;em.IR.15-30um</quantity>
	[cc_25] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 60 um (NULL allowed)</summary>
	--/ <quantity>stat.correlation;em.IR.30-60um</quantity>
	[cc_60] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 100 um (NULL allowed)</summary>
	--/ <quantity>stat.correlation;em.IR.60-100um</quantity>
	[cc_100] [varchar](1) NULL, 

	--/ <summary>Confusion flag (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[conf] [char](1) NULL, 

	--/ <summary>Discrepant flux flag (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[cdisc] [char](1) NULL, 

	--/ <summary>HSD flag (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[chsd] [char](1) NULL, 

	--/ <summary>Nearby confirmed sources</summary>
	--/ <quantity>meta.number;src</quantity>
	[ipnearh] [smallint] NOT NULL, 

	--/ <summary>Nearby confirmed sources</summary>
	--/ <quantity>meta.number;src</quantity>
	[ipnearw] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 12 um</summary>
	--/ <quantity>meta.code;em.IR.8-15um</quantity>
	[ises1_12] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 25 um</summary>
	--/ <quantity>meta.code;em.IR.15-30um</quantity>
	[ises1_25] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 60 um</summary>
	--/ <quantity>meta.code;em.IR.30-60um</quantity>
	[ises1_60] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 100 um</summary>
	--/ <quantity>meta.code;em.IR.60-100um</quantity>
	[ises1_100] [smallint] NOT NULL, 

	--/ <summary>10* s/n at 60um</summary>
	--/ <quantity>stat.snr;em.IR.30-60um</quantity>
	[isnr3] [int] NOT NULL, 

	--/ <summary>Number of HCONS with source detected</summary>
	--/ <quantity>meta.number</quantity>
	[nhcon] [smallint] NOT NULL, 

	--/ <summary>Number of HCONS covering sourc</summary>
	--/ <quantity>meta.number</quantity>
	[mhcon] [smallint] NOT NULL, 

	--/ <summary>flux correction factor</summary>
	--/ <quantity>phot.correction;em.IR.30-60um</quantity>
	[ifcor3] [smallint] NOT NULL, 

	--/ <summary>Plate number (POSS or SRC)</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[cplate] [varchar](5) NOT NULL, 

	--/ <summary>Nominal plate centre</summary>
	--/ <quantity>obs.field</quantity>
	[cnom] [varchar](7) NOT NULL, 

	--/ <summary>Identifier for igal source on this plate</summary>
	--/ <quantity>meta.id.cross</quantity>
	[num] [varchar](3) NOT NULL, 

	--/ <summary>RA hours of best optical id</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>h</unit>
	[iarh] [int] NOT NULL, 

	--/ <summary>RA mins of best optical id</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>min</unit>
	[iarm] [int] NOT NULL, 

	--/ <summary>RA secs of best optical id INTEGER PART!</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>s</unit>
	[iars] [int] NOT NULL, 

	--/ <summary>RA secs of best optical id DECIMAL PART!</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>s</unit>
	[ars] [real] NOT NULL, 

	--/ <summary>Dec SIGN (+ if NULL)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[cadsn] [varchar](1) NULL, 

	--/ <summary>Dec DEG part of best optical id</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[iadd] [int] NOT NULL, 

	--/ <summary>Dec MINS part of best optical id</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>min</unit>
	[iadm] [int] NOT NULL, 

	--/ <summary>Dec SEC INTEGER part of best optical id</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>s</unit>
	[iads] [int] NOT NULL, 

	--/ <summary>Dec SEC DECIMAL part of best optical id</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>s</unit>
	[ads] [real] NOT NULL, 

	--/ <summary>Delta X from IRAS posn</summary>
	--/ <quantity>pos.cartesian.x;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[iadx] [smallint] NOT NULL, 

	--/ <summary>Delta Y from IRAS posn</summary>
	--/ <quantity>pos.cartesian.y;arith.diff</quantity>
	--/ <unit>arcsec</unit>
	[iady] [smallint] NOT NULL, 

	--/ <summary>log likelihood</summary>
	--/ <quantity>stat.likelihood</quantity>
	[alk] [real] NOT NULL, 

	--/ <summary>% chance this is right id</summary>
	--/ <quantity>stat.probability</quantity>
	--/ <unit>%</unit>
	[irel] [smallint] NOT NULL, 

	--/ <summary>Candidate A,B etc (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[cand] [varchar](1) NULL, 

	--/ <summary>Schmidt plate material</summary>
	--/ <quantity>meta.code</quantity>
	[iopt] [smallint] NOT NULL, 

	--/ <summary>APM magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[amag] [real] NOT NULL, 

	--/ <summary>APM d1</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[iad1] [smallint] NOT NULL, 

	--/ <summary>APM d2</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcsec</unit>
	[iad2] [smallint] NOT NULL, 

	--/ <summary>APM PA</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[iapa] [smallint] NOT NULL, 

	--/ <summary>surface brightness</summary>
	--/ <quantity>phot.mag.sb</quantity>
	--/ <unit>mag arcsecs-2</unit>
	[amu] [real] NOT NULL, 

	--/ <summary>ID type</summary>
	--/ <quantity>meta.code</quantity>
	[idtype] [smallint] NOT NULL, 

	--/ <summary>Optical name (NULL allowed)</summary>
	--/ <quantity>meta.id</quantity>
	[coname] [varchar](12) NULL, 

	--/ <summary>Zwicky/De Vauc magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[amzw] [real] NOT NULL, 

	--/ <summary>RC3/UGC/MCG/ESO diameter (X for CATX)</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcmin</unit>
	[d1x] [real] NOT NULL, 

	--/ <summary>100*(d25/D25)</summary>
	--/ <quantity>phys.size.axisRatio</quantity>
	[iar] [smallint] NOT NULL, 

	--/ <summary>Best heliocentric Vel from Literature or PSCz.</summary>
	--/ <quantity>spect.dopplerVeloc;pos.heliocentric/quantity>
	--/ <unit>km -s</unit>
	[ivhel] [int] NOT NULL, 

	--/ <summary>Error</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km -s</unit>
	[iverr] [int] NOT NULL, 

	--/ <summary>Reference</summary>
	--/ <quantity>meta.ref;pos.frame</quantity>
	[ivref] [smallint] NOT NULL, 

	--/ <summary>PSCz heliocentric Vel</summary>
	--/ <quantity>spect.dopplerVeloc;pos.heliocentric</quantity>
	--/ <unit>km -s</unit>
	[ivhelp] [int] NOT NULL, 

	--/ <summary>Error</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km -s</unit>
	[iverrp] [smallint] NOT NULL, 

	--/ <summary>Reference</summary>
	--/ <quantity>meta.ref;pos.frame</quantity>
	[ivrefp] [smallint] NOT NULL, 

	--/ <summary>De Vauc Type, 99 = unknown</summary>
	--/ <quantity>meta.code;src.morph.type</quantity>
	[it] [smallint] NOT NULL, 

	--/ <summary>PGC name (NULL allowed)</summary>
	--/ <quantity>meta.id.cross</quantity>
	[cpgc] [varchar](9) NULL, 

	--/ <summary>RA (equinox B1950, degrees)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=b1950</quantity>
	--/ <unit>deg</unit>
	[rad] [float] NOT NULL, 

	--/ <summary>Dec (equinox B1950, degrees)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=b1950</quantity>
	--/ <unit>deg</unit>
	[decd] [float] NOT NULL, 

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL, 

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL, 

	--/ <summary>Velocity cz in LG frame (IVHEL + 300 sin(l) cos(b))</summary>
	--/ <quantity>phys.veloc;pos.lg</quantity>
	--/ <unit>km s-1</unit>
	[ivgal] [int] NOT NULL, 

	--/ <summary>Distance (Rowan-Robinson 1988)</summary>
	--/ <quantity>pos;arith.diff</quantity>
	--/ <unit>Mpc</unit>
	[dist] [real] NOT NULL, 

	--/ <summary>Cluster id (Rowan-Robinson 1988)</summary>
	--/ <quantity>meta.id</quantity>
	[iclus] [smallint] NOT NULL, 

	--/ <summary>log10(100um background in MJy/sr), (see note)</summary>
	--/ <quantity>phot.flux.density;em.radio.12-30GHz</quantity>
	--/ <unit>MJy sr-1</unit>
	[ali4] [real] NOT NULL, 

	--/ <summary>log10(100um background in MJy/sr), (see note)</summary>
	--/ <quantity>phot.flux.density;em.radio.12-30GHz</quantity>
	--/ <unit>MJy sr-1</unit>
	[ali4b] [real] NOT NULL, 

	--/ <summary>lune bin as from P2BIN</summary>
	--/ <quantity>obs.param</quantity>
	[nlbin] [int] NOT NULL, 

	--/ <summary>optical classification (see note)</summary>
	--/ <quantity>meta.code.class</quantity>
	[class] [varchar](2) NOT NULL, 

	--/ <summary>PSC-z sector, e.g. A/123</summary>
	--/ <quantity>obs.param</quantity>
	[csec] [varchar](5) NOT NULL, 

	--/ <summary>posn from bottom left corner of Schmidt plate in mm</summary>
	--/ <quantity>pos.cartesian.x;instr.plate</quantity>
	--/ <unit>mm</unit>
	[platex] [smallint] NOT NULL, 

	--/ <summary>posn from bottom left corner of Schmidt plate in mm</summary>
	--/ <quantity>pos.cartesian.y;instr.plate</quantity>
	--/ <unit>mm</unit>
	[platey] [smallint] NOT NULL, 

	--/ <summary>optical material E,O,R,J,X,Polaroid,Scan (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[cstat] [varchar](1) NULL, 

	--/ <summary>h=high|b|, p=other PSCz, l=low|b|, c=in coverage gaps (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[carea] [varchar](1) NULL, 

	--/ <summary>Redshift status (see note)</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[czstat] [varchar](1) NOT NULL, 

	--/ <summary>1.2Jy classification (NULL allowed)</summary>
	--/ <quantity>meta.code.class</quantity>
	[c12class] [varchar](1) NULL, 

	--/ <summary>Original PSC fluxes</summary>
	--/ <quantity>phot.flux;em.IR.30-60um</quantity>
	--/ <unit>flux</unit>
	[f3psc] [real] NOT NULL, 

	--/ <summary>Original PSC fluxes</summary>
	--/ <quantity>phot.flux;em.IR.60-100um</quantity>
	--/ <unit>flux</unit>
	[f4psc] [real] NOT NULL, 

	--/ <summary>Extinction A_B in lune bin derived from 100 um background, dust temp corrected (see note)</summary>
	--/ <quantity>phys.absorption;em.opt.B;stat.mean</quantity>
	--/ <unit>mag</unit>
	[abb] [real] NOT NULL, 

	--/ <summary>Source category (see note)</summary>
	--/ <quantity>meta.code</quantity>
	[cpscz] [varchar](1) NOT NULL, 

	--/ <summary>2/3 HCON sky, calculated on lune bin basis</summary>
	--/ <quantity>meta.number</quantity>
	[mhconb] [smallint] NOT NULL, 

	--/ <summary>q = in QDOT 1-in-6 sample (NULL allowed)</summary>
	--/ <quantity>meta.code</quantity>
	[cqdot] [varchar](1) NULL, 

	--/ <summary>HI (21cm) 20% vel width (see note)</summary>
	--/ <quantity>meta.code.error;spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[iw20] [smallint] NOT NULL, 

	--/ <summary>error</summary>
	--/ <quantity>stat.error;meta.code.error;spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[iw20e] [smallint] NOT NULL, 

	--/ <summary>HI 50% vel width, codes as IW20</summary>
	--/ <quantity>meta.code.error;spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[iw50] [smallint] NOT NULL, 

	--/ <summary>error</summary>
	--/ <quantity>stat.error;meta.code.error;spect.line.width;em.line.HI</quantity>
	--/ <unit>km s-1</unit>
	[iw50e] [smallint] NOT NULL, 

	--/ <summary>HI reference.</summary>
	--/ <quantity>meta.ref;pos.frame</quantity>
	[ihiref] [smallint] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	--/ <quantity>phot.flux.density;em.IR.8-15um</quantity>
	--/ <unit>Jy</unit>
	[fp_12] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	--/ <quantity>phot.flux.density;em.IR.15-30umum</quantity>
	--/ <unit>Jy</unit>
	[fp_25] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	--/ <quantity>phot.flux.density;em.IR.30-60um</quantity>
	--/ <unit>Jy</unit>
	[fp_60] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	--/ <quantity>phot.flux.density;em.IR.60-100um</quantity>
	--/ <unit>Jy</unit>
	[fp_100] [real] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.8-15um</quantity>
	--/ <unit>mJy</unit>
	[iep_12] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit>mJy</unit>
	[iep_25] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.30-60um</quantity>
	--/ <unit>mJy</unit>
	[iep_60] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.60-100um</quantity>
	--/ <unit>mJy</unit>
	[iep_100] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	--/ <quantity>meta.code</quantity>
	[ibp_12] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	--/ <quantity>meta.code</quantity>
	[ibp_25] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	--/ <quantity>meta.code</quantity>
	[ibp_60] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	--/ <quantity>meta.code</quantity>
	[ibp_100] [smallint] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	--/ <quantity>phot.flux.density;em.IR.8-15um</quantity>
	--/ <unit>Jy</unit>
	[fe_12] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	--/ <quantity>phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit>Jy</unit>
	[fe_25] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	--/ <quantity>phot.flux.density;em.IR.30-60um</quantity>
	--/ <unit>Jy</unit>
	[fe_60] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	--/ <quantity>phot.flux.density;em.IR.60-100um</quantity>
	--/ <unit>Jy</unit>
	[fe_100] [real] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.8-15um</quantity>
	--/ <unit>mJy</unit>
	[iee_12] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.15-30um</quantity>
	--/ <unit>mJy</unit>
	[iee_25] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.30-60um</quantity>
	--/ <unit>mJy</unit>
	[iee_60] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <quantity>stat.error;phot.flux.density;em.IR.60-100um</quantity>
	--/ <unit>mJy</unit>
	[iee_100] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	--/ <quantity>meta.code</quantity>
	[ibe_12] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	--/ <quantity>meta.code</quantity>
	[ibe_25] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	--/ <quantity>meta.code</quantity>
	[ibe_60] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	--/ <quantity>meta.code</quantity>
	[ibe_100] [smallint] NOT NULL, 

	--/ <summary>best fit width**2 at 60um</summary>
	--/ <quantity>spect.line.width;em.IR.30-60um;instr.det</quantity>
	--/ <unit>arcmin+2</unit>
	[width2] [real] NOT NULL, 

	--/ <summary>error on WIDTH2</summary>
	--/ <quantity>stat.error;spect.line.width;em.IR.30-60um;instr.det</quantity>
	--/ <unit>arcmin+2</unit>
	[ewidth] [real] NOT NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[PhotoObj]
ADD PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO
