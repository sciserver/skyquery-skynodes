import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt

dbName = "AKARI"
dbTable = "FIS"    
 
ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=True)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# FIS PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# FIS Aitoff

plot.CreateDensityPlot(proj="Aitoff")
plt.show()

#################################################################################


dbTable = "IRC"    
ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=True)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)



# IRC PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# IRC Aitoff

plot.CreateDensityPlot(proj="Aitoff")
plt.show()