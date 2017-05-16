import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt
 
dbName = "SPITZER"

dbTable = "goodsnIRS16micron"  

ra, dec, dens = GetDensity(dbName,dbTable,level=12,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)


# goodsnIRS16micron PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(grid=False)
plt.show()


# goodsnIRS16micron Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)

plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()

##################################################
dbTable = "goodssIRS16micron"  

ra, dec, dens = GetDensity(dbName,dbTable,level=12,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# goodssIRS16micron PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(grid=False)
plt.show()


# goodssIRS16micron Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)

plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()



##################################################
dbTable = "goodsnMIPS24micron"  

ra, dec, dens = GetDensity(dbName,dbTable,level=12,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# goodsnMIPS24micron PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(grid=False)
plt.show()


# goodsnMIPS24micron Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)

plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()

##################################################
dbTable = "goodssMIPS24micron"  

ra, dec, dens = GetDensity(dbName,dbTable,level=12,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# goodssMIPS24micron PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(grid=False)
plt.show()


# goodssMIPS24micron Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)

plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()