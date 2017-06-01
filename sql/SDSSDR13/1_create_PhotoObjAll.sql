USE [SkyNode_SDSSDR13]

--/ <summary> The full photometric catalog quantities for SDSS imaging.</summary>
--/ <remarks> This table contains one entry per detection, with the associated 
--/ photometric parameters measured by PHOTO, and astrometrically 
--/ and photometrically calibrated. 
--/ &lt;p>
--/ The table has the following  views:
--/ &lt;ul>
--/ &lt;li> &lt;b>PhotoObj&lt;/b>: all primary and secondary objects; essentially this is the view you should use unless you want a specific type of object.
--/ &lt;li> &lt;b>PhotoPrimary&lt;/b>: all photo objects that are primary (the best version of the object).
--/ &lt;ul>&lt;li> &lt;b>Star&lt;/b>: Primary objects that are classified as stars.
--/     &lt;li> &lt;b>Galaxy&lt;/b>: Primary objects that are classified as galaxies.
--/	   &lt;li> &lt;b>Sky&lt;/b>:Primary objects which are sky samples.
--/     &lt;li> &lt;b>Unknown&lt;/b>:Primary objects which are no0ne of the above&lt;/ul>
--/     &lt;li> &lt;b>PhotoSecondary&lt;/b>: all photo objects that are secondary (secondary detections)
--/     &lt;li> &lt;b>PhotoFamily&lt;/b>: all photo objects which are neither primary nor secondary (blended)
--/ &lt;/ul>
--/ &lt;p> The table has indices that cover the popular columns.</remarks>
-------------------------------------------------------------------------------
CREATE TABLE PhotoObjAll (
--/ <summary>Unique SDSS identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
    

    --/ <summary>Unique SDSS identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	objID            bigint NOT NULL,
	
    --/ <summary>Layer of catalog (currently only one layer, 0; 0-15 available)</summary>
	--/ <quantity>meta.id</quantity>
	skyVersion       tinyint NOT NULL,

    --/ <summary>Run number</summary>
	--/ <quantity>meta.id;obs</quantity>
	run              smallint NOT NULL,

    --/ <summary>Rerun number</summary>
	--/ <quantity>meta.id;obs</quantity>
	rerun            smallint NOT NULL,

    --/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	camcol           tinyint NOT NULL,

    --/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	field            smallint NOT NULL,

    --/ <summary>The object id within a field. Usually changes between reruns of the same field</summary>
	--/ <quantity>meta.id</quantity>
	obj              smallint NOT NULL,

    --/ <summary>1: primary, 2: secondary, 3: other</summary>
	--/ <quantity>meta.code;obs.param</quantity>
	mode             tinyint NOT NULL,

    --/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.number</quantity>
	nChild           smallint NOT NULL,

    --/ <summary>Type classification of the object (star, galaxy, cosmic ray, etc.)</summary>
	--/ <quantity>meta.code;src.class</quantity>
	type             smallint NOT NULL,

    --/ <summary>Clean photometry flag (1=clean, 0=unclean).</summary>
	--/ <quantity></quantity>
	clean            [int] NOT NULL,

    --/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>meta.code;stat.probability</quantity>
	probPSF          real NOT NULL,

    --/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	insideMask       tinyint NOT NULL,

    --/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	flags            bigint NOT NULL,

	/*rowc             real NOT NULL,

	rowcErr          real NOT NULL,

	colc             real NOT NULL,

	colcErr          real NOT NULL,

	rowv             real NOT NULL,

	rowvErr          real NOT NULL,

	colv             real NOT NULL,

	colvErr          real NOT NULL,

	rowc_u           real NOT NULL,

	rowc_g           real NOT NULL,

	rowc_r           real NOT NULL,

	rowc_i           real NOT NULL,

	rowc_z           real NOT NULL,

	rowcErr_u        real NOT NULL,

	rowcErr_g        real NOT NULL,

	rowcErr_r        real NOT NULL,

	rowcErr_i        real NOT NULL,

	rowcErr_z        real NOT NULL,

	colc_u           real NOT NULL,

	colc_g           real NOT NULL,

	colc_r           real NOT NULL,

	colc_i           real NOT NULL,

	colc_z           real NOT NULL,

	colcErr_u        real NOT NULL,

	colcErr_g        real NOT NULL,

	colcErr_r        real NOT NULL,

	colcErr_i        real NOT NULL,

	colcErr_z        real NOT NULL,*/

    --/ <summary>Sky flux at the center of object (allowing for siblings if blended).</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	sky_u            real NOT NULL,

    --/ <summary>Sky flux at the center of object (allowing for siblings if blended).</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	sky_g            real NOT NULL,

    --/ <summary>Sky flux at the center of object (allowing for siblings if blended).</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	sky_r            real NOT NULL,

    --/ <summary>Sky flux at the center of object (allowing for siblings if blended).</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	sky_i            real NOT NULL,

    --/ <summary>Sky flux at the center of object (allowing for siblings if blended).</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	sky_z            real NOT NULL,

    --/ <summary>Sky flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	skyIvar_u         real NOT NULL,

    --/ <summary>Sky flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	skyIvar_g         real NOT NULL,

    --/ <summary>Sky flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	skyIvar_r         real NOT NULL,

    --/ <summary>Sky flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	skyIvar_i         real NOT NULL,

    --/ <summary>Sky flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy arcsec-2</unit>
	skyIvar_z         real NOT NULL,

    --/ <summary>PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	psfMag_u         real NOT NULL,

    --/ <summary>PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	psfMag_g         real NOT NULL,

    --/ <summary>PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	psfMag_r         real NOT NULL,

    --/ <summary>PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	psfMag_i         real NOT NULL,

    --/ <summary>PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	psfMag_z         real NOT NULL,

    --/ <summary>PSF magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	psfMagErr_u      real NOT NULL,

    --/ <summary>PSF magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	psfMagErr_g      real NOT NULL,

    --/ <summary>PSF magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	psfMagErr_r      real NOT NULL,

    --/ <summary>PSF magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	psfMagErr_i      real NOT NULL,

    --/ <summary>PSF magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	psfMagErr_z      real NOT NULL,

    --/ <summary>Magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	fiberMag_u       real NOT NULL,

    --/ <summary>Magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	fiberMag_g       real NOT NULL,

    --/ <summary>Magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	fiberMag_r       real NOT NULL,

    --/ <summary>Magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	fiberMag_i       real NOT NULL,

    --/ <summary>Magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	fiberMag_z       real NOT NULL,

    --/ <summary>Error in magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	fiberMagErr_u    real NOT NULL,

    --/ <summary>Error in magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	fiberMagErr_g    real NOT NULL,

    --/ <summary>Error in magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	fiberMagErr_r    real NOT NULL,

    --/ <summary>Error in magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	fiberMagErr_i    real NOT NULL,

    --/ <summary>Error in magnitude in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	fiberMagErr_z    real NOT NULL,

    --/ <summary>Magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	fiber2Mag_u      real NOT NULL,

    --/ <summary>Magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	fiber2Mag_g      real NOT NULL,

    --/ <summary>Magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	fiber2Mag_r      real NOT NULL,

    --/ <summary>Magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	fiber2Mag_i      real NOT NULL,

    --/ <summary>Magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	fiber2Mag_z      real NOT NULL,

    --/ <summary>Error in magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	fiber2MagErr_u   real NOT NULL,

    --/ <summary>Error in magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	fiber2MagErr_g   real NOT NULL,

    --/ <summary>Error in magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	fiber2MagErr_r   real NOT NULL,

    --/ <summary>Error in magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	fiber2MagErr_i   real NOT NULL,

    --/ <summary>Error in magnitude in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	fiber2MagErr_z   real NOT NULL,

    --/ <summary>Petrosian magnitude</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	petroMag_u       real NOT NULL,

    --/ <summary>Petrosian magnitude</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	petroMag_g       real NOT NULL,

    --/ <summary>Petrosian magnitude</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	petroMag_r       real NOT NULL,

    --/ <summary>Petrosian magnitude</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	petroMag_i       real NOT NULL,

    --/ <summary>Petrosian magnitude</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	petroMag_z       real NOT NULL,

    --/ <summary>Petrosian magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	petroMagErr_u    real NOT NULL,

    --/ <summary>Petrosian magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	petroMagErr_g    real NOT NULL,

    --/ <summary>Petrosian magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	petroMagErr_r    real NOT NULL,

    --/ <summary>Petrosian magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	petroMagErr_i    real NOT NULL,

    --/ <summary>Petrosian magnitude error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	petroMagErr_z    real NOT NULL,

    --/ <summary>PSF flux</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy</unit>
	psfFlux_u        real NOT NULL,

    --/ <summary>PSF flux</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy</unit>
	psfFlux_g        real NOT NULL,

    --/ <summary>PSF flux</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy</unit>
	psfFlux_r        real NOT NULL,

    --/ <summary>PSF flux</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy</unit>
	psfFlux_i        real NOT NULL,

    --/ <summary>PSF flux</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy</unit>
	psfFlux_z        real NOT NULL,

    --/ <summary>PSF flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy-2</unit>
	psfFluxIvar_u    real NOT NULL,

    --/ <summary>PSF flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy-2</unit>
	psfFluxIvar_g    real NOT NULL,

    --/ <summary>PSF flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy-2</unit>
	psfFluxIvar_r    real NOT NULL,

    --/ <summary>PSF flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy-2</unit>
	psfFluxIvar_i    real NOT NULL,

    --/ <summary>PSF flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy-2</unit>
	psfFluxIvar_z    real NOT NULL,

    --/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy</unit>
	fiberFlux_u      real NOT NULL,

    --/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy</unit>
	fiberFlux_g      real NOT NULL,

    --/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy</unit>
	fiberFlux_r      real NOT NULL,

    --/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy</unit>
	fiberFlux_i      real NOT NULL,

    --/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy</unit>
	fiberFlux_z      real NOT NULL,

    --/ <summary>Inverse variance in flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy-2</unit>
	fiberFluxIvar_u  real NOT NULL,

    --/ <summary>Inverse variance in flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy-2</unit>
	fiberFluxIvar_g  real NOT NULL,

    --/ <summary>Inverse variance in flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy-2</unit>
	fiberFluxIvar_r  real NOT NULL,

    --/ <summary>Inverse variance in flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy-2</unit>
	fiberFluxIvar_i  real NOT NULL,

    --/ <summary>Inverse variance in flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy-2</unit>
	fiberFluxIvar_z  real NOT NULL,

    --/ <summary>Flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy</unit>
	fiber2Flux_u     real NOT NULL,

    --/ <summary>Flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy</unit>
	fiber2Flux_g     real NOT NULL,

    --/ <summary>Flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy</unit>
	fiber2Flux_r     real NOT NULL,

    --/ <summary>Flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy</unit>
	fiber2Flux_i     real NOT NULL,

    --/ <summary>Flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.flux.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy</unit>
	fiber2Flux_z     real NOT NULL,

    --/ <summary>Inverse variance in flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy-2</unit>
	fiber2FluxIvar_u real NOT NULL,

    --/ <summary>Inverse variance in flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy-2</unit>
	fiber2FluxIvar_g real NOT NULL,

    --/ <summary>Inverse variance in flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy-2</unit>
	fiber2FluxIvar_r real NOT NULL,

    --/ <summary>Inverse variance in flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy-2</unit>
	fiber2FluxIvar_i real NOT NULL,

    --/ <summary>Inverse variance in flux in 2 arcsec diameter fiber radius</summary>
	--/ <quantity>stat.variance;phot.flux.fiber;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy-2</unit>
	fiber2FluxIvar_z real NOT NULL,

    --/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.flux.petrosian;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy</unit>
	petroFlux_u      real NOT NULL,

    --/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.flux.petrosian;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy</unit>
	petroFlux_g      real NOT NULL,

    --/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.flux.petrosian;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy</unit>
	petroFlux_r      real NOT NULL,

    --/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.flux.petrosian;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy</unit>
	petroFlux_i      real NOT NULL,

    --/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.flux.petrosian;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy</unit>
	petroFlux_z      real NOT NULL,

    --/ <summary>Petrosian flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux.petrosian;em.opt.SDSS.u</quantity>
    --/ <unit>nmgy-2</unit>
	petroFluxIvar_u  real NOT NULL,

    --/ <summary>Petrosian flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux.petrosian;em.opt.SDSS.g</quantity>
    --/ <unit>nmgy-2</unit>
	petroFluxIvar_g  real NOT NULL,

    --/ <summary>Petrosian flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux.petrosian;em.opt.SDSS.r</quantity>
    --/ <unit>nmgy-2</unit>
	petroFluxIvar_r  real NOT NULL,

    --/ <summary>Petrosian flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux.petrosian;em.opt.SDSS.i</quantity>
    --/ <unit>nmgy-2</unit>
	petroFluxIvar_i  real NOT NULL,

    --/ <summary>Petrosian flux inverse variance</summary>
	--/ <quantity>stat.variance;phot.flux.petrosian;em.opt.SDSS.z</quantity>
    --/ <unit>nmgy-2</unit>
	petroFluxIvar_z  real NOT NULL,

    --/ <summary>Petrosian radius</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroRad_u       real NOT NULL,

    --/ <summary>Petrosian radius</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroRad_g       real NOT NULL,

    --/ <summary>Petrosian radius</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroRad_r       real NOT NULL,

    --/ <summary>Petrosian radius</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroRad_i       real NOT NULL,

    --/ <summary>Petrosian radius</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroRad_z       real NOT NULL,

    --/ <summary>Petrosian radius error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroRadErr_u    real NOT NULL,

    --/ <summary>Petrosian radius error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroRadErr_g    real NOT NULL,

    --/ <summary>Petrosian radius error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroRadErr_r    real NOT NULL,

    --/ <summary>Petrosian radius error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroRadErr_i    real NOT NULL,

    --/ <summary>Petrosian radius error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroRadErr_z    real NOT NULL,

    --/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroR50_u       real NOT NULL,

    --/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroR50_g       real NOT NULL,

    --/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroR50_r       real NOT NULL,

    --/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroR50_i       real NOT NULL,

    --/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroR50_z       real NOT NULL,

    --/ <summary>Error in radius with 50% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroR50Err_u    real NOT NULL,

    --/ <summary>Error in radius with 50% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroR50Err_g    real NOT NULL,

    --/ <summary>Error in radius with 50% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroR50Err_r    real NOT NULL,

    --/ <summary>Error in radius with 50% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroR50Err_i    real NOT NULL,

    --/ <summary>Error in radius with 50% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroR50Err_z    real NOT NULL,

    --/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroR90_u       real NOT NULL,

    --/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroR90_g       real NOT NULL,

    --/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroR90_r       real NOT NULL,

    --/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroR90_i       real NOT NULL,

    --/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroR90_z       real NOT NULL,

    --/ <summary>Error in radius with 90% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.u</quantity>
    --/ <unit>arcsec</unit>
	petroR90Err_u    real NOT NULL,

    --/ <summary>Error in radius with 90% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.g</quantity>
    --/ <unit>arcsec</unit>
	petroR90Err_g    real NOT NULL,

    --/ <summary>Error in radius with 90% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.r</quantity>
    --/ <unit>arcsec</unit>
	petroR90Err_r    real NOT NULL,

    --/ <summary>Error in radius with 90% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.i</quantity>
    --/ <unit>arcsec</unit>
	petroR90Err_i    real NOT NULL,

    --/ <summary>Error in radius with 90% of Petrosian flux error</summary>
	--/ <quantity>stat.error;phys.angSize;em.opt.SDSS.z</quantity>
    --/ <unit>arcsec</unit>
	petroR90Err_z    real NOT NULL,

	/*q_u              real NOT NULL,

	q_g              real NOT NULL,

	q_r              real NOT NULL,

	q_i              real NOT NULL,

	q_z              real NOT NULL,

	qErr_u           real NOT NULL,

	qErr_g           real NOT NULL,

	qErr_r           real NOT NULL,

	qErr_i           real NOT NULL,

	qErr_z           real NOT NULL,

	u_u              real NOT NULL,

	u_g              real NOT NULL,

	u_r              real NOT NULL,

	u_i              real NOT NULL,

	u_z              real NOT NULL,

	uErr_u           real NOT NULL,

	uErr_g           real NOT NULL,

	uErr_r           real NOT NULL,

	uErr_i           real NOT NULL,

	uErr_z           real NOT NULL,

	mE1_u            real NOT NULL,

	mE1_g            real NOT NULL,

	mE1_r            real NOT NULL,

	mE1_i            real NOT NULL,

	mE1_z            real NOT NULL,

	mE2_u            real NOT NULL,

	mE2_g            real NOT NULL,

	mE2_r            real NOT NULL,

	mE2_i            real NOT NULL,

	mE2_z            real NOT NULL,

	mE1E1Err_u       real NOT NULL,

	mE1E1Err_g       real NOT NULL,

	mE1E1Err_r       real NOT NULL,

	mE1E1Err_i       real NOT NULL,

	mE1E1Err_z       real NOT NULL,

	mE1E2Err_u       real NOT NULL,

	mE1E2Err_g       real NOT NULL,

	mE1E2Err_r       real NOT NULL,

	mE1E2Err_i       real NOT NULL,

	mE1E2Err_z       real NOT NULL,

	mE2E2Err_u       real NOT NULL,

	mE2E2Err_g       real NOT NULL,

	mE2E2Err_r       real NOT NULL,

	mE2E2Err_i       real NOT NULL,

	mE2E2Err_z       real NOT NULL,

	mRrCc_u          real NOT NULL,

	mRrCc_g          real NOT NULL,

	mRrCc_r          real NOT NULL,

	mRrCc_i          real NOT NULL,

	mRrCc_z          real NOT NULL,

	mRrCcErr_u       real NOT NULL,

	mRrCcErr_g       real NOT NULL,

	mRrCcErr_r       real NOT NULL,

	mRrCcErr_i       real NOT NULL,

	mRrCcErr_z       real NOT NULL,

	mCr4_u           real NOT NULL,

	mCr4_g           real NOT NULL,

	mCr4_r           real NOT NULL,

	mCr4_i           real NOT NULL,

	mCr4_z           real NOT NULL,

	mE1PSF_u         real NOT NULL,

	mE1PSF_g         real NOT NULL,

	mE1PSF_r         real NOT NULL,

	mE1PSF_i         real NOT NULL,

	mE1PSF_z         real NOT NULL,

	mE2PSF_u         real NOT NULL,

	mE2PSF_g         real NOT NULL,

	mE2PSF_r         real NOT NULL,

	mE2PSF_i         real NOT NULL,

	mE2PSF_z         real NOT NULL,

	mRrCcPSF_u       real NOT NULL,

	mRrCcPSF_g       real NOT NULL,

	mRrCcPSF_r       real NOT NULL,

	mRrCcPSF_i       real NOT NULL,

	mRrCcPSF_z       real NOT NULL,

	mCr4PSF_u        real NOT NULL,

	mCr4PSF_g        real NOT NULL,

	mCr4PSF_r        real NOT NULL,

	mCr4PSF_i        real NOT NULL,

	mCr4PSF_z        real NOT NULL,

	deVRad_u         real NOT NULL,

	deVRad_g         real NOT NULL,

	deVRad_r         real NOT NULL,

	deVRad_i         real NOT NULL,

	deVRad_z         real NOT NULL,

	deVRadErr_u      real NOT NULL,

	deVRadErr_g      real NOT NULL,

	deVRadErr_r      real NOT NULL,

	deVRadErr_i      real NOT NULL,

	deVRadErr_z      real NOT NULL,

	deVAB_u          real NOT NULL,

	deVAB_g          real NOT NULL,

	deVAB_r          real NOT NULL,

	deVAB_i          real NOT NULL,

	deVAB_z          real NOT NULL,

	deVABErr_u       real NOT NULL,

	deVABErr_g       real NOT NULL,

	deVABErr_r       real NOT NULL,

	deVABErr_i       real NOT NULL,

	deVABErr_z       real NOT NULL,

	deVPhi_u         real NOT NULL,

	deVPhi_g         real NOT NULL,

	deVPhi_r         real NOT NULL,

	deVPhi_i         real NOT NULL,

	deVPhi_z         real NOT NULL,

	deVMag_u         real NOT NULL,

	deVMag_g         real NOT NULL,

	deVMag_r         real NOT NULL,

	deVMag_i         real NOT NULL,

	deVMag_z         real NOT NULL,

	deVMagErr_u      real NOT NULL,

	deVMagErr_g      real NOT NULL,

	deVMagErr_r      real NOT NULL,

	deVMagErr_i      real NOT NULL,

	deVMagErr_z      real NOT NULL,

	deVFlux_u        real NOT NULL,

	deVFlux_g        real NOT NULL,

	deVFlux_r        real NOT NULL,

	deVFlux_i        real NOT NULL,

	deVFlux_z        real NOT NULL,

	deVFluxIvar_u    real NOT NULL,

	deVFluxIvar_g    real NOT NULL,

	deVFluxIvar_r    real NOT NULL,

	deVFluxIvar_i    real NOT NULL,

	deVFluxIvar_z    real NOT NULL,

	expRad_u         real NOT NULL,

	expRad_g         real NOT NULL,

	expRad_r         real NOT NULL,

	expRad_i         real NOT NULL,

	expRad_z         real NOT NULL,

	expRadErr_u      real NOT NULL,

	expRadErr_g      real NOT NULL,

	expRadErr_r      real NOT NULL,

	expRadErr_i      real NOT NULL,

	expRadErr_z      real NOT NULL,

	expAB_u          real NOT NULL,

	expAB_g          real NOT NULL,

	expAB_r          real NOT NULL,

	expAB_i          real NOT NULL,

	expAB_z          real NOT NULL,

	expABErr_u       real NOT NULL,

	expABErr_g       real NOT NULL,

	expABErr_r       real NOT NULL,

	expABErr_i       real NOT NULL,

	expABErr_z       real NOT NULL,

	expPhi_u         real NOT NULL,

	expPhi_g         real NOT NULL,

	expPhi_r         real NOT NULL,

	expPhi_i         real NOT NULL,

	expPhi_z         real NOT NULL,

	expMag_u         real NOT NULL,

	expMag_g         real NOT NULL,

	expMag_r         real NOT NULL,

	expMag_i         real NOT NULL,

	expMag_z         real NOT NULL,

	expMagErr_u      real NOT NULL,

	expMagErr_g      real NOT NULL,

	expMagErr_r      real NOT NULL,

	expMagErr_i      real NOT NULL,

	expMagErr_z      real NOT NULL,

	modelMag_u       real NOT NULL,

	modelMag_g       real NOT NULL,

	modelMag_r       real NOT NULL,

	modelMag_i       real NOT NULL,

	modelMag_z       real NOT NULL,

	modelMagErr_u    real NOT NULL,

	modelMagErr_g    real NOT NULL,

	modelMagErr_r    real NOT NULL,

	modelMagErr_i    real NOT NULL,

	modelMagErr_z    real NOT NULL,

	cModelMag_u      real NOT NULL,

	cModelMag_g      real NOT NULL,

	cModelMag_r      real NOT NULL,

	cModelMag_i      real NOT NULL,

	cModelMag_z      real NOT NULL,

	cModelMagErr_u   real NOT NULL,

	cModelMagErr_g   real NOT NULL,

	cModelMagErr_r   real NOT NULL,

	cModelMagErr_i   real NOT NULL,

	cModelMagErr_z   real NOT NULL,

	expFlux_u        real NOT NULL,

	expFlux_g        real NOT NULL,

	expFlux_r        real NOT NULL,

	expFlux_i        real NOT NULL,

	expFlux_z        real NOT NULL,

	expFluxIvar_u    real NOT NULL,

	expFluxIvar_g    real NOT NULL,

	expFluxIvar_r    real NOT NULL,

	expFluxIvar_i    real NOT NULL,

	expFluxIvar_z    real NOT NULL,

	modelFlux_u      real NOT NULL,

	modelFlux_g      real NOT NULL,

	modelFlux_r      real NOT NULL,

	modelFlux_i      real NOT NULL,

	modelFlux_z      real NOT NULL,

	modelFluxIvar_u  real NOT NULL,

	modelFluxIvar_g  real NOT NULL,

	modelFluxIvar_r  real NOT NULL,

	modelFluxIvar_i  real NOT NULL,

	modelFluxIvar_z  real NOT NULL,

	cModelFlux_u     real NOT NULL,

	cModelFlux_g     real NOT NULL,

	cModelFlux_r     real NOT NULL,

	cModelFlux_i     real NOT NULL,

	cModelFlux_z     real NOT NULL,

	cModelFluxIvar_u real NOT NULL,

	cModelFluxIvar_g real NOT NULL,

	cModelFluxIvar_r real NOT NULL,

	cModelFluxIvar_i real NOT NULL,

	cModelFluxIvar_z real NOT NULL,

	aperFlux7_u      real NOT NULL,

	aperFlux7_g      real NOT NULL,

	aperFlux7_r      real NOT NULL,

	aperFlux7_i      real NOT NULL,

	aperFlux7_z      real NOT NULL,

	aperFlux7Ivar_u  real NOT NULL,

	aperFlux7Ivar_g  real NOT NULL,

	aperFlux7Ivar_r  real NOT NULL,

	aperFlux7Ivar_i  real NOT NULL,

	aperFlux7Ivar_z  real NOT NULL,*/

    --/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.u</quantity>
	lnLStar_u        real NOT NULL,

    --/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.g</quantity>
	lnLStar_g        real NOT NULL,

    --/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	lnLStar_r        real NOT NULL,

    --/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.i</quantity>
	lnLStar_i        real NOT NULL,

    --/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.z</quantity>
	lnLStar_z        real NOT NULL,

    --/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.u</quantity>
	lnLExp_u         real NOT NULL,

    --/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.g</quantity>
	lnLExp_g         real NOT NULL,

    --/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	lnLExp_r         real NOT NULL,

    --/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.i</quantity>
	lnLExp_i         real NOT NULL,

    --/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.z</quantity>
	lnLExp_z         real NOT NULL,

    --/ <summary>de Vaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.u</quantity>
	lnLDeV_u         real NOT NULL,

    --/ <summary>de Vaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.g</quantity>
	lnLDeV_g         real NOT NULL,

    --/ <summary>de Vaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	lnLDeV_r         real NOT NULL,

    --/ <summary>de Vaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.i</quantity>
	lnLDeV_i         real NOT NULL,

    --/ <summary>de Vaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.z</quantity>
	lnLDeV_z         real NOT NULL,

    --/ <summary>Weight of deV component in deV+Exp model</summary>
	--/ <quantity>stat.weight;em.opt.SDSS.u</quantity>
	fracDeV_u        real NOT NULL,

    --/ <summary>Weight of deV component in deV+Exp model</summary>
	--/ <quantity>stat.weight;em.opt.SDSS.g</quantity>
	fracDeV_g        real NOT NULL,

    --/ <summary>Weight of deV component in deV+Exp model</summary>
	--/ <quantity>stat.weight;em.opt.SDSS.r</quantity>
	fracDeV_r        real NOT NULL,

    --/ <summary>Weight of deV component in deV+Exp model</summary>
	--/ <quantity>stat.weight;em.opt.SDSS.i</quantity>
	fracDeV_i        real NOT NULL,

    --/ <summary>Weight of deV component in deV+Exp model</summary>
	--/ <quantity>stat.weight;em.opt.SDSS.z</quantity>
	fracDeV_z        real NOT NULL,

	/*flags_u          bigint NOT NULL,

	flags_g          bigint NOT NULL,

	flags_r          bigint NOT NULL,

	flags_i          bigint NOT NULL,

	flags_z          bigint NOT NULL,

	type_u           [int] NOT NULL,

	type_g           [int] NOT NULL,

	type_r           [int] NOT NULL,

	type_i           [int] NOT NULL,

	type_z           [int] NOT NULL,

	probPSF_u        real NOT NULL,

	probPSF_g        real NOT NULL,

	probPSF_r        real NOT NULL,

	probPSF_i        real NOT NULL,

	probPSF_z        real NOT NULL,*/

    --/ <summary>J2000 Right Ascension (r-band)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
    --/ <unit>deg</unit>
	ra               float NOT NULL,

    --/ <summary>J2000 Declination (r-band)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
    --/ <unit>deg</unit>
	dec              float NOT NULL,

    --/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	cx               float NOT NULL,

    --/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	cy               float NOT NULL,

    --/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	cz               float NOT NULL,

    --/ <summary>Error in RA (* cos(Dec), that is, proper units)</summary>
	--/ <quantity>stat.error;pos.eq.ra;pos.frame=j2000</quantity>
    --/ <unit>arcsec</unit>
	raErr            float NOT NULL,

    --/ <summary>Error in Dec</summary>
	--/ <quantity>stat.error;pos.eq.dec;pos.frame=j2000</quantity>
    --/ <unit>arcsec</unit>
	decErr           float NOT NULL,

    --/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
    --/ <unit>deg</unit>
	b                float NOT NULL,

    --/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
    --/ <unit>deg</unit>
	l                float NOT NULL,

	/*offsetRa_u       real NOT NULL,

	offsetRa_g       real NOT NULL,

	offsetRa_r       real NOT NULL,

	offsetRa_i       real NOT NULL,

	offsetRa_z       real NOT NULL,

	offsetDec_u      real NOT NULL,

	offsetDec_g      real NOT NULL,

	offsetDec_r      real NOT NULL,

	offsetDec_i      real NOT NULL,

	offsetDec_z      real NOT NULL,*/

    --/ <summary>Extinction in u-band</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	extinction_u     real NOT NULL,

    --/ <summary>Extinction in g-band</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	extinction_g     real NOT NULL,

    --/ <summary>Extinction in r-band</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	extinction_r     real NOT NULL,

    --/ <summary>Extinction in i-band</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	extinction_i     real NOT NULL,

    --/ <summary>Extinction in z-band</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	extinction_z     real NOT NULL,

	/*psffwhm_u        real NOT NULL,

	psffwhm_g        real NOT NULL,

	psffwhm_r        real NOT NULL,

	psffwhm_i        real NOT NULL,

	psffwhm_z        real NOT NULL,*/

    --/ <summary>Date of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
    --/ <unit>d</unit>
	mjd              [int] NOT NULL,

    --/ <summary>Airmass at time of observation in u-band</summary>
	--/ <quantity>obs.airMass;em.opt.SDSS.u</quantity>
	airmass_u        real NOT NULL,

    --/ <summary>Airmass at time of observation in g-band</summary>
	--/ <quantity>obs.airMass;em.opt.SDSS.g</quantity>
	airmass_g        real NOT NULL,

    --/ <summary>Airmass at time of observation in r-band</summary>
	--/ <quantity>obs.airMass;em.opt.SDSS.r</quantity>
	airmass_r        real NOT NULL,

    --/ <summary>Airmass at time of observation in i-band</summary>
	--/ <quantity>obs.airMass;em.opt.SDSS.i</quantity>
	airmass_i        real NOT NULL,

    --/ <summary>Airmass at time of observation in z-band</summary>
	--/ <quantity>obs.airMass;em.opt.SDSS.z</quantity>
	airmass_z        real NOT NULL,

	/*phioffset_u      real NOT NULL,

	phioffset_g      real NOT NULL,

	phioffset_r      real NOT NULL,

	phioffset_i      real NOT NULL,

	phioffset_z      real NOT NULL,

	nProf_u          [int] NOT NULL,

	nProf_g          [int] NOT NULL,

	nProf_r          [int] NOT NULL,

	nProf_i          [int] NOT NULL,

	nProf_z          [int] NOT NULL,*/

    --/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	loadVersion      [int] NOT NULL,

    --/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	htmID            bigint NOT NULL,

    --/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	zoneID            bigint NOT NULL,
	
    --/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs</quantity>
	fieldID          bigint NOT NULL,

    --/ <summary>Pointer to parent (if object deblended) or BRIGHT detection (if object has one), else 0</summary>
	--/ <quantity>meta.id.parent</quantity>
	parentID         bigint NOT NULL DEFAULT 0,
	
    --/ <summary>Pointer to the spectrum of object, if exists, else 0</summary>
	--/ <quantity>meta.id;spect</quantity>
	specObjID        bigint NOT NULL DEFAULT 0, 

    --/ <summary>Shorthand alias for modelMag</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	u                real NOT NULL,

    --/ <summary>Shorthand alias for modelMag</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	g                real NOT NULL,

    --/ <summary>Shorthand alias for modelMag</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	r                real NOT NULL,

    --/ <summary>Shorthand alias for modelMag</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	i                real NOT NULL,

    --/ <summary>Shorthand alias for modelMag</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	z                real NOT NULL,

    --/ <summary>Error in modelMag alias</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	err_u            real NOT NULL,

    --/ <summary>Error in modelMag alias</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	err_g            real NOT NULL,

    --/ <summary>Error in modelMag alias</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	err_r            real NOT NULL,

    --/ <summary>Error in modelMag alias</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	err_i            real NOT NULL,

    --/ <summary>Error in modelMag alias</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	err_z            real NOT NULL,

    --/ <summary>Simplified mag, corrected for extinction: modelMag-extinction</summary>
	--/ <quantity>phot.mag.redFree;meta.modelled;em.opt.SDSS.u</quantity>
    --/ <unit>mag</unit>
	dered_u          real NOT NULL,

    --/ <summary>Simplified mag, corrected for extinction: modelMag-extinction</summary>
	--/ <quantity>phot.mag.redFree;meta.modelled;em.opt.SDSS.g</quantity>
    --/ <unit>mag</unit>
	dered_g          real NOT NULL,

    --/ <summary>Simplified mag, corrected for extinction: modelMag-extinction</summary>
	--/ <quantity>phot.mag.redFree;meta.modelled;em.opt.SDSS.r</quantity>
    --/ <unit>mag</unit>
	dered_r          real NOT NULL,

    --/ <summary>Simplified mag, corrected for extinction: modelMag-extinction</summary>
	--/ <quantity>phot.mag.redFree;meta.modelled;em.opt.SDSS.i</quantity>
    --/ <unit>mag</unit>
	dered_i          real NOT NULL,

    --/ <summary>Simplified mag, corrected for extinction: modelMag-extinction</summary>
	--/ <quantity>phot.mag.redFree;meta.modelled;em.opt.SDSS.z</quantity>
    --/ <unit>mag</unit>
	dered_z          real NOT NULL,

	/*cloudCam_u       [int] NOT NULL,

	cloudCam_g       [int] NOT NULL,

	cloudCam_r       [int] NOT NULL,

	cloudCam_i       [int] NOT NULL,

	cloudCam_z       [int] NOT NULL,*/

    --/ <summary>Resolve status of object</summary>
	--/ <quantity>meta.code.status</quantity>
	resolveStatus    [int] NOT NULL,

    --/ <summary>Unique identifier from global resolve</summary>
	--/ <quantity>meta.id</quantity>
	thingId          [int] NOT NULL,

    --/ <summary>What balkan object is in from window</summary>
	--/ <quantity>meta.id</quantity>
	balkanId         [int] NOT NULL,

    --/ <summary>Number of observations of this object</summary>
	--/ <quantity>meta.number;obs</quantity>
	nObserve         [int] NOT NULL,

    --/ <summary>Number of detections of this object</summary>
	--/ <quantity>meta.number;obs</quantity>
	nDetect          [int] NOT NULL,

    --/ <summary>Number of observations of this object near an edge</summary>
	--/ <quantity>meta.number;obs</quantity>
	nEdge            [int] NOT NULL,

    --/ <summary>Quality of field (0-1)</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	score            real NOT NULL,

    --/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.u</quantity>
	calibStatus_u    [int] NOT NULL,

    --/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.g</quantity>
	calibStatus_g    [int] NOT NULL,

    --/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.r</quantity>
	calibStatus_r    [int] NOT NULL,

    --/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.i</quantity>
	calibStatus_i    [int] NOT NULL,

    --/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.z</quantity>
	calibStatus_z    [int] NOT NULL,

	/*nMgyPerCount_u   real NOT NULL,

	nMgyPerCount_g   real NOT NULL,

	nMgyPerCount_r   real NOT NULL,

	nMgyPerCount_i   real NOT NULL,

	nMgyPerCount_z   real NOT NULL,*/

    --/ <summary>time of observation (TAI) in each filter</summary>
	--/ <quantity>time.epoch;obs;em.opt.SDSS.u</quantity>
    --/ <unit>sec</unit>
	TAI_u            float NOT NULL,

    --/ <summary>time of observation (TAI) in each filter</summary>
	--/ <quantity>time.epoch;obs;em.opt.SDSS.g</quantity>
    --/ <unit>sec</unit>
	TAI_g            float NOT NULL,

    --/ <summary>time of observation (TAI) in each filter</summary>
	--/ <quantity>time.epoch;obs;em.opt.SDSS.r</quantity>
    --/ <unit>sec</unit>
	TAI_r            float NOT NULL,

    --/ <summary>time of observation (TAI) in each filter</summary>
	--/ <quantity>time.epoch;obs;em.opt.SDSS.i</quantity>
    --/ <unit>sec</unit>
	TAI_i            float NOT NULL,

    --/ <summary>time of observation (TAI) in each filter</summary>
	--/ <quantity>time.epoch;obs;em.opt.SDSS.z</quantity>
    --/ <unit>sec</unit>
	TAI_z            float NOT NULL,

	CONSTRAINT PK_PhotoObjAll PRIMARY KEY (objID)
) 
--ON PS_PhotoObjAll(objid)
ON PHOTOOBJ
WITH (DATA_COMPRESSION = PAGE)
GO