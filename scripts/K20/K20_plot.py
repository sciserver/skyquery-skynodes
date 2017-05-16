import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt
 
dbName = "K20"
dbTable = "SpecObj"  


ra, dec, dens = GetDensity(dbName,dbTable,level=8,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# SpecObj PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# SpecObj Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()

"""
#                        FIGURE    CARTOPY                

fig = plt.figure(figsize=(18,8),dpi=300)
fig.suptitle(dbName+" density map")
ax1 = fig.add_subplot(121, facecolor="black", projection=ccrs.PlateCarree())
ax1.add_feature(cf.LAND,color="black")
ax1.add_feature(cf.OCEAN,color="black")
ax1.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax1.scatter(ra[ra < 18],dec[ra < 18] ,s=20, c=d[ra < 18],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())


ax2 = fig.add_subplot(122, facecolor="black", projection=ccrs.PlateCarree())
ax2.add_feature(cf.LAND,color="black")
ax2.add_feature(cf.OCEAN,color="black")
ax2.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax2.scatter(ra[ra > 48], dec[ra > 48],s=20, c=d[ra > 48],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())

plt.show()

#fig.savefig("SDSS_PlateCaree_wLabels.png")
fig.savefig(dbName+"_"+dbTable+"_"+"_PlateCarree.png")

#                 FIGURE    AITOFF     



fig = plt.figure(figsize=(16,8.4),dpi=300)
ax = plt.subplot(111, facecolor="black", projection="aitoff")
ax.set_title(dbName+" density map", y=1.08)
ax.grid(True, alpha=0.5)
ax.xaxis.set_major_formatter(plt.NullFormatter())
ax.scatter(ra_rad, dec_rad,s=2, c=d,cmap="plasma") #pink
plt.show()

fig.savefig(dbName+"_"+dbTable+"_"+"_Aitoff.png")
"""     