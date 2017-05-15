import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt
 
dbName = "WMAP"
dbTable = "Obs"  

ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

# Obs PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# Obs Aitoff

plot.CreateDensityPlot(proj="Aitoff")
plt.show()
