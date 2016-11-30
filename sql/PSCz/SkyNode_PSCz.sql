USE [SkyNode_PSCz]
GO

--/ <summary>The main PhotoObj table for the PSCz catalog</summary>
--/ <remarks>The main PhotoObj table for the PSCz catalog</remarks>
CREATE TABLE [dbo].[PhotoObj](

	--/ <summary>unique object identifier</summary>
	[objID] [bigint] NOT NULL, 

	--/ <summary>PSCz name e.g. Q12345+4856</summary>
	[cname] [varchar](11) NOT NULL, 

	--/ <summary>J2000 right ascension</summary>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL, 

	--/ <summary>J2000 declination</summary>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate x</summary>
	[cx] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate y</summary>
	[cy] [float] NOT NULL, 

	--/ <summary>Cartesian coordinate z</summary>
	[cz] [float] NOT NULL, 

	--/ <summary>HTM ID</summary>
	[htmid] [bigint] NOT NULL, 

	--/ <summary>Zone ID</summary>
	[zoneid] [bigint] NOT NULL, 

	--/ <summary>non-color corrected flux, 12 um</summary>
	--/ <unit>Jy</unit>
	[flux_12] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 25 um</summary>
	--/ <unit>Jy</unit>
	[flux_25] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 60 um</summary>
	--/ <unit>Jy</unit>
	[flux_60] [real] NOT NULL, 

	--/ <summary>non-color corrected flux, 100 um</summary>
	--/ <unit>Jy</unit>
	[flux_100] [real] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 12 um</summary>
	[iq_12] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 25 um</summary>
	[iq_25] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 60 um</summary>
	[iq_60] [smallint] NOT NULL, 

	--/ <summary>Flux origin and quality flag, 100 um</summary>
	[iq_100] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 12 um</summary>
	[ises_12] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 25 um</summary>
	[ises_25] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 60 um</summary>
	[ises_60] [smallint] NOT NULL, 

	--/ <summary>SES flag, derived from SES2, 100 um</summary>
	[ises_100] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 12 um</summary>
	--/ <unit>%</unit>
	[iu_12] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 25 um</summary>
	--/ <unit>%</unit>
	[iu_25] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 60 um</summary>
	--/ <unit>%</unit>
	[iu_60] [smallint] NOT NULL, 

	--/ <summary>flux uncertainty (%), 100 um</summary>
	--/ <unit>%</unit>
	[iu_100] [smallint] NOT NULL, 

	--/ <summary>Minor axe of 2 sig er ellipse</summary>
	[mine] [smallint] NOT NULL, 

	--/ <summary>Major axe of 2 sig er ellipse,</summary>
	[maje] [smallint] NOT NULL, 

	--/ <summary>PA of 2 sig er ellipse</summary>
	[ipose] [smallint] NOT NULL, 

	--/ <summary>CIRR1 flag</summary>
	[ic1] [smallint] NOT NULL, 

	--/ <summary>CIRR2 flag</summary>
	[ic2] [smallint] NOT NULL, 

	--/ <summary>CIRR3 flag</summary>
	[ic3] [smallint] NOT NULL, 

	--/ <summary>Correlation Coefficient, 12 um (NULL allowed)</summary>
	[cc_12] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 25 um (NULL allowed)</summary>
	[cc_25] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 60 um (NULL allowed)</summary>
	[cc_60] [varchar](1) NULL, 

	--/ <summary>Correlation Coefficient, 100 um (NULL allowed)</summary>
	[cc_100] [varchar](1) NULL, 

	--/ <summary>Confusion flag (NULL allowed)</summary>
	[conf] [char](1) NULL, 

	--/ <summary>Discrepant flux flag (NULL allowed)</summary>
	[cdisc] [char](1) NULL, 

	--/ <summary>HSD flag (NULL allowed)</summary>
	[chsd] [char](1) NULL, 

	--/ <summary>Nearby confirmed sources</summary>
	[ipnearh] [smallint] NOT NULL, 

	--/ <summary>Nearby confirmed sources</summary>
	[ipnearw] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 12 um</summary>
	[ises1_12] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 25 um</summary>
	[ises1_25] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 60 um</summary>
	[ises1_60] [smallint] NOT NULL, 

	--/ <summary>nearby seconds confirmed extended sources, 100 um</summary>
	[ises1_100] [smallint] NOT NULL, 

	--/ <summary>10* s/n at 60um</summary>
	[isnr3] [int] NOT NULL, 

	--/ <summary>Number of HCONS with source detected</summary>
	[nhcon] [smallint] NOT NULL, 

	--/ <summary>Number of HCONS covering sourc</summary>
	[mhcon] [smallint] NOT NULL, 

	--/ <summary>flux correction factor</summary>
	[ifcor3] [smallint] NOT NULL, 

	--/ <summary>Plate number (POSS or SRC)</summary>
	[cplate] [varchar](5) NOT NULL, 

	--/ <summary>Nominal plate centre</summary>
	[cnom] [varchar](7) NOT NULL, 

	--/ <summary>Identifier for igal source on this plate</summary>
	[num] [varchar](3) NOT NULL, 

	--/ <summary>RA hours of best optical id</summary>
	--/ <unit>HH</unit>
	[iarh] [int] NOT NULL, 

	--/ <summary>RA mins of best optical id</summary>
	--/ <unit>MIN</unit>
	[iarm] [int] NOT NULL, 

	--/ <summary>RA secs of best optical id INTEGER PART!</summary>
	--/ <unit>SEC</unit>
	[iars] [int] NOT NULL, 

	--/ <summary>RA secs of best optical id DECIMAL PART!</summary>
	--/ <unit>SEC</unit>
	[ars] [real] NOT NULL, 

	--/ <summary>Dec SIGN (+ if NULL)</summary>
	[cadsn] [varchar](1) NULL, 

	--/ <summary>Dec DEG part of best optical id</summary>
	--/ <unit>DEG</unit>
	[iadd] [int] NOT NULL, 

	--/ <summary>Dec MINS part of best optical id</summary>
	--/ <unit>MIN</unit>
	[iadm] [int] NOT NULL, 

	--/ <summary>Dec SEC INTEGER part of best optical id</summary>
	--/ <unit>SEC</unit>
	[iads] [int] NOT NULL, 

	--/ <summary>Dec SEC DECIMAL part of best optical id</summary>
	--/ <unit>SEC</unit>
	[ads] [real] NOT NULL, 

	--/ <summary>Delta X from IRAS posn</summary>
	--/ <unit>arcsec</unit>
	[iadx] [smallint] NOT NULL, 

	--/ <summary>Delta Y from IRAS posn</summary>
	--/ <unit>arcsec</unit>
	[iady] [smallint] NOT NULL, 

	--/ <summary>log likelihood</summary>
	[alk] [real] NOT NULL, 

	--/ <summary>% chance this is right id</summary>
	--/ <unit>%</unit>
	[irel] [smallint] NOT NULL, 

	--/ <summary>Candidate A,B etc (NULL allowed)</summary>
	[cand] [varchar](1) NULL, 

	--/ <summary>Schmidt plate material</summary>
	[iopt] [smallint] NOT NULL, 

	--/ <summary>APM magnitude</summary>
	--/ <unit>mag</unit>
	[amag] [real] NOT NULL, 

	--/ <summary>APM d1</summary>
	--/ <unit>arcsec</unit>
	[iad1] [smallint] NOT NULL, 

	--/ <summary>APM d2</summary>
	--/ <unit>arcsec</unit>
	[iad2] [smallint] NOT NULL, 

	--/ <summary>APM PA</summary>
	[iapa] [smallint] NOT NULL, 

	--/ <summary>surface brightness</summary>
	--/ <unit>(mags/arcsecs^2)</unit>
	[amu] [real] NOT NULL, 

	--/ <summary>ID type</summary>
	[idtype] [smallint] NOT NULL, 

	--/ <summary>Optical name (NULL allowed)</summary>
	[coname] [varchar](12) NULL, 

	--/ <summary>Zwicky/De Vauc magnitude</summary>
	--/ <unit>mag</unit>
	[amzw] [real] NOT NULL, 

	--/ <summary>RC3/UGC/MCG/ESO diameter (X for CATX)</summary>
	[d1x] [real] NOT NULL, 

	--/ <summary>100*(d25/D25)</summary>
	[iar] [smallint] NOT NULL, 

	--/ <summary>Best heliocentric Vel from Literature or PSCz.</summary>
	[ivhel] [int] NOT NULL, 

	--/ <summary>Error</summary>
	[iverr] [int] NOT NULL, 

	--/ <summary>Reference</summary>
	[ivref] [smallint] NOT NULL, 

	--/ <summary>PSCz heliocentric Vel</summary>
	[ivhelp] [int] NOT NULL, 

	--/ <summary>Error</summary>
	[iverrp] [smallint] NOT NULL, 

	--/ <summary>Reference</summary>
	[ivrefp] [smallint] NOT NULL, 

	--/ <summary>De Vauc Type, 99 = unknown</summary>
	[it] [smallint] NOT NULL, 

	--/ <summary>PGC name (NULL allowed)</summary>
	[cpgc] [varchar](9) NULL, 

	--/ <summary>RA (equinox B1950, degrees)</summary>
	--/ <unit>deg</unit>
	[rad] [float] NOT NULL, 

	--/ <summary>Dec (equinox B1950, degrees)</summary>
	--/ <unit>deg</unit>
	[decd] [float] NOT NULL, 

	--/ <summary>Galactic longitude</summary>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL, 

	--/ <summary>Galactic latitude</summary>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL, 

	--/ <summary>Velocity cz in LG frame (IVHEL + 300 sin(l) cos(b))</summary>
	[ivgal] [int] NOT NULL, 

	--/ <summary>Distance (Rowan-Robinson 1988)</summary>
	[dist] [real] NOT NULL, 

	--/ <summary>Cluster id (Rowan-Robinson 1988)</summary>
	[iclus] [smallint] NOT NULL, 

	--/ <summary>log10(100um background in MJy/sr), (see note)</summary>
	[ali4] [real] NOT NULL, 

	--/ <summary>log10(100um background in MJy/sr), (see note)</summary>
	[ali4b] [real] NOT NULL, 

	--/ <summary>lune bin as from P2BIN</summary>
	[nlbin] [int] NOT NULL, 

	--/ <summary>optical classification (see note)</summary>
	[class] [varchar](2) NOT NULL, 

	--/ <summary>PSC-z sector, e.g. A/123</summary>
	[csec] [varchar](5) NOT NULL, 

	--/ <summary>posn from bottom left corner of Schmidt plate in mm</summary>
	--/ <unit>mm</unit>
	[platex] [smallint] NOT NULL, 

	--/ <summary>posn from bottom left corner of Schmidt plate in mm</summary>
	--/ <unit>mm</unit>
	[platey] [smallint] NOT NULL, 

	--/ <summary>optical material E,O,R,J,X,Polaroid,Scan (NULL allowed)</summary>
	[cstat] [varchar](1) NULL, 

	--/ <summary>h=high|b|, p=other PSCz, l=low|b|, c=in coverage gaps (NULL allowed)</summary>
	[carea] [varchar](1) NULL, 

	--/ <summary>Redshift status (see note)</summary>
	[czstat] [varchar](1) NOT NULL, 

	--/ <summary>1.2Jy classification (NULL allowed)</summary>
	[c12class] [varchar](1) NULL, 

	--/ <summary>Original PSC fluxes</summary>
	[f3psc] [real] NOT NULL, 

	--/ <summary>Original PSC fluxes</summary>
	[f4psc] [real] NOT NULL, 

	--/ <summary>Extinction A_B in lune bin derived from 100 um background, dust temp corrected (see note)</summary>
	[abb] [real] NOT NULL, 

	--/ <summary>Source category (see note)</summary>
	[cpscz] [varchar](1) NOT NULL, 

	--/ <summary>2/3 HCON sky, calculated on lune bin basis</summary>
	[mhconb] [smallint] NOT NULL, 

	--/ <summary>q = in QDOT 1-in-6 sample (NULL allowed)</summary>
	[cqdot] [varchar](1) NULL, 

	--/ <summary>HI (21cm) 20% vel width (see note)</summary>
	[iw20] [smallint] NOT NULL, 

	--/ <summary>error</summary>
	[iw20e] [smallint] NOT NULL, 

	--/ <summary>HI 50% vel width, codes as IW20</summary>
	[iw50] [smallint] NOT NULL, 

	--/ <summary>error</summary>
	[iw50e] [smallint] NOT NULL, 

	--/ <summary>HI reference.</summary>
	[ihiref] [smallint] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	[fp_12] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	[fp_25] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	[fp_60] [real] NOT NULL, 

	--/ <summary>Addscan flux using point source template</summary>
	[fp_100] [real] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iep_12] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iep_25] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iep_60] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iep_100] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	[ibp_12] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	[ibp_25] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	[ibp_60] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright)</summary>
	[ibp_100] [smallint] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	[fe_12] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	[fe_25] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	[fe_60] [real] NOT NULL, 

	--/ <summary>Rice or Yahil/Addscan flux for source with size given by WIDTH2</summary>
	[fe_100] [real] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iee_12] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iee_25] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iee_60] [smallint] NOT NULL, 

	--/ <summary>Statistical error</summary>
	--/ <unit>mJy</unit>
	[iee_100] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	[ibe_12] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	[ibe_25] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	[ibe_60] [smallint] NOT NULL, 

	--/ <summary>1 for background fit, 0 for none (extended or bright), 2 = Rice</summary>
	[ibe_100] [smallint] NOT NULL, 

	--/ <summary>best fit width**2 at 60um</summary>
	--/ <unit>arcmin^2</unit>
	[width2] [real] NOT NULL, 

	--/ <summary>error on WIDTH2</summary>
	[ewidth] [real] NOT NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[PhotoObj]
ADD PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO


-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO


-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID] ON [dbo].[PhotoObj] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO