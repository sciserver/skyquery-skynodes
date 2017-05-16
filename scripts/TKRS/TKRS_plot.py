import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt
 
dbName = "TKRS"
dbTable = "SpecObj"  

ra, dec, dens = GetDensity(dbName,dbTable,level=12,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)


# SpecObj PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(grid=False)
plt.show()


# SpecObj Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()