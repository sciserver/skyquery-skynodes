USE [SkyNode_VIPERSPDR1]

GO
-- CREATE SpecObj TABLE
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	[zoneid] int NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ The correspondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[id_IAU] char(16) NOT NULL,

	--/ <summary> VIPERS object name, according to IAU standards. The name is composed of
	--/ the prefix VIPERS plus the internal identification number. The internal
	--/ id number (num) is in the form 
	--/ 
	--/   attxxxxxx
	--/ 
	--/ where
	--/ 
	--/  a identifies the sky area (1 for W1 and 4 for W4),
	--/  tt identifies the CFHTLS tile number where the object is located,
	--/  xxxxxx is the original CFHTLS ID within the tile.
	--/ 
	--/ Thecorrespondence between our tile identifier and the official CFHTLS
	--/ tile name is provided in Guzzo et al. 2013. </summary>
	[num] bigint NOT NULL,

	--/ <summary> Right Ascension </summary>
	--/ <unit> deg (J2000) </unit>
	[ra] real NOT NULL,

	--/ <summary> Declination </summary>
	--/ <unit> deg (J2000) </unit>
	[dec] real NOT NULL,

	--/ <summary> i_AB selection magnitude. The selection magnitude comes from
	--/ CFHTLS T0005 catalogues. </summary>
	--/ <unit> mag </unit>
	[selmag] real NOT NULL,

	--/ <summary> i_AB selection magnitude error. </summary>
	--/ <unit> mag </unit>
	[errselmag] real NOT NULL,

	--/ <summary>  </summary>
	[pointing] char(6) NOT NULL,

	--/ <summary>  </summary>
	[quadrant] tinyint NOT NULL,

	--/ <summary> The integer part of the flag has the following meaning:
	--/ 
	--/    4 a high-confidence, highly secure redshift, based on a high SNR
	--/      spectrum and supported by obvious and consistent spectral
	--/      features. The confidence level of Flag 4 measurements is estimated
	--/      to be 99% secure. 
	--/    3 also a very secure redshift, comparable in confidence with Flag
	--/      4, supported by clear spectral features in the spectrum, but not
	--/      necessarily with high SNR.
	--/    2 a fairly secure, ~90% confidence redshift measurement, supported
	--/      by cross-correlation results, continuum shape and some spectral
	--/      features.
	--/    9 a redshift based on only one single clear spectral emission
	--/      feature.
	--/    1 a reasonable redshift measurement, based on weak spectral features
	--/      and/or continuum shape, for which there is roughly a 50% chance
	--/      that the redshift is  actually wrong.
	--/    0 no reliable spectroscopic redshift measurement was
	--/      possible. Redshift is set to the conventional value of 9.9999.
	--/ 
	--/ In case of broad emission lines typical of broad line AGN, a prefix of 1
	--/ is added to zflag, i.e.
	--/ 
	--/    14 secure AGN with a &gt;95% secure redshift, at least 2 broad lines;
	--/    13 secure AGN with good confidence redshift, based on one broad line
	--/       and some faint additional feature;
	--/    12 a >95% secure redshift measurement, but lines are not
	--/       significantly broad, might not be an AGN;
	--/    19 secure AGN with one single secure emission line feature, redshift
	--/       based on this line only;
	--/    11 a tentative redshift measurement, with spectral features not
	--/       significantly broad.
	--/ 
	--/ Second objects in slit get a 2 as prefix to the flag, i.e.
	--/ 
	--/    24 a second object with flag 4
	--/    23 a second object with flag 3
	--/    22 a second object with flag 2
	--/    29 a second object with flag 9
	--/    21 a second object with flag 1
	--/    20 a second object with flag 0
	--/ 
	--/ And similarly for BLAGN (214, 213, 212, ...).
	--/ 
	--/ Suffix in form of decimal digit has the following meaning:
	--/ 
	--/    .5 the spectroscopic redshift is compatible within 1 sigma with
	--/       photometric redshift, i.e
	--/           zphot_min &lt; zspec &lt; zphot_max
	--/    .4 the spectroscopic redshift is compatible with photometric
	--/       redshift at the 2 sigma level, i.e.
	--/            minvalue &lt; zspec &lt; maxvalue
	--/       where
	--/            minvalue = min[ zphot-(1+zphot)*0.05, zphot_min ]
	--/            maxvalue = max[ zphot+(1+zphot)*0.05, zphot_max ]
	--/       and 0.05 is twice the median scatter of the comparison between
	--/       spectroscopic and photometric redshifts.
	--/    .2 spectroscopic redshift is NOT compatible with photometric
	--/       redshift
	--/    .1 no photometric redshift available </summary>
	[zflg] real NOT NULL,

	--/ <summary> Spectroscopic redshift. A conventional zpsec value of 9.9999 is assigned
	--/ in case a redshift could not be measured. </summary>
	[zspec] real NOT NULL,

	--/ <summary> Observing epoch. epoch=1 objects have been observed before VIMOS
	--/ refurbishing in summer 2010, epoch=2 objects have been observed after
	--/ summer 2010. </summary>
	[epoch] tinyint NOT NULL,

	--/ <summary> Flag indicating whether the object falls within the photometric mask. 1
	--/ if the object is inside the mask, 0 if it is outside. Objects outside
	--/ the photometric mask have a less reliable photometry </summary>
	[photoMask] tinyint NOT NULL,

	--/ <summary> The Target Sampling Rate is defined as the ratio of the observed objects
	--/ over the number of possible targets: TSR=Nspec/Nparent, where Nspec is
	--/ the number of detected targets and Nparent is the number of all the
	--/ possible random targets.
	--/ TSR has been computed in bins of apparent magnitude to take into account
	--/ the possible dependence of the sampling rate on the clustering of bright
	--/ objects (possibly causing slit collision) and the higher fraction of
	--/ observed bright objects for which a spectrum has not been extracted (see
	--/ Garilli et al. 2013).
	--/ TSR and is needed to take into account the fact that not all the
	--/ possible targets can be observed in the single pass strategy adopted in
	--/ VIPERS. See Garilli et al. 2013 for details
	--/ TSR is = -1 for serendipitous targets (flags 2*.*), and observed objects
	--/ not fulfilling the selection criterion for z&gt;0.5 galaxies (i.e. AGN);
	--/ TSR = -99 for objects outside the considered area and selection
	--/ magnitude range (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	[tsr] real NOT NULL,

	--/ <summary> The SSR is defined as the ratio of the galaxies with a successfully
	--/ measured redshift (flag = 2.*,3.*,4.*,9.*) over the total sample of
	--/ detected galaxies.
	--/ SSR is a function of the apparent magnitude (since to bright objects
	--/ correspond spectra with high signal-to-noise, from which the redshift
	--/ can be more easily measured), and of redshift (because the spectral
	--/ features visible in the observed spectral range can change). Therefore
	--/ SSR has been computed in bins of redshift and apparent magnitude.
	--/ SSR is = -1 for stars (z=0.0000), non measured objects (flag 0), low
	--/ confidence redshift measurements (flags 1.*), spectroscopic BLAGN (flags
	--/ 1*.*), serendipitous targets (flags=2*.*), and hight redshift galaxies
	--/ (zspec&gt;3);
	--/ SSR = -99 for objects outside the considered area and selection
	--/ magnituderange (i.e. either i&lt;17.5 or i&gt;22.5). </summary>
	[ssr] real NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[id_IAU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Spatial index
CREATE NONCLUSTERED INDEX [IX_SpecObj_Zone] ON [dbo].[SpecObj] 
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_SpecObj_ZoneID] ON [dbo].[SpecObj] 
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
ON [PRIMARY]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_SpecObj_HtmID] ON [dbo].[SpecObj] 
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
ON [PRIMARY]
GO