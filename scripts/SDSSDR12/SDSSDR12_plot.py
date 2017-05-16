import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt

dbName = "SDSSDR12"
dbTable = "PhotoObjAll"  

ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=True)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# PhotoObjAll PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# PhotoObjAll Aitoff

plot.CreateDensityPlot(proj="Aitoff")
plt.show()

#################################################################################
dbTable = "SpecObjAll"  

ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=True)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# PhotoObjAll PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# PhotoObjAll Aitoff

plot.CreateDensityPlot(proj="Aitoff")
plt.show()