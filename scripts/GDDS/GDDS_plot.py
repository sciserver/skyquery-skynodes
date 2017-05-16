import numpy as np
from densmap.sql import GetDensity
from densmap.plot import DensityPlot
from astropy import units as u
from astropy.coordinates import SkyCoord
import matplotlib.pyplot as plt
 
dbName = "GDDS"
dbTable = "specObj"  

ra, dec, dens = GetDensity(dbName,dbTable,level=6,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)

 

# specObj PLateCarree

plot = DensityPlot(c,d,dbName,dbTable)
     
plot.CreateDensityPlot()
plt.show()


# specObj Aitoff

ra, dec, dens = GetDensity(dbName,dbTable,level=5,isStat=False)

d = np.log(dens) / np.log(np.max(dens))
c = SkyCoord(ra=ra,dec=dec,frame="fk5",equinox="j2000",unit=u.degree)
plot = DensityPlot(c,d,dbName,dbTable)

plot.CreateDensityPlot(proj="Aitoff",cmap="autumn")
plt.show()
 
#########################################

"""
#                          FIGURE    CARTOPY                 

fig = plt.figure(figsize=(12,8),dpi=300)
fig.suptitle(dbName+" density map")
ax1 = fig.add_subplot(221, facecolor="black", projection=ccrs.PlateCarree())
ax1.add_feature(cf.LAND,color="black")
ax1.add_feature(cf.OCEAN,color="black")
gl1 = ax1.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax1.scatter(ra[ra<-170],dec[ra < -170] ,s=20, c=d[ra < -170],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())
locs = ax1.get_xticks() 
gl1.xlocator = mticker.FixedLocator(locs[::2]) 

ax2 = fig.add_subplot(222, facecolor="black", projection=ccrs.PlateCarree())
ax2.add_feature(cf.LAND,color="black")
ax2.add_feature(cf.OCEAN,color="black")
gl2 = ax2.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax2.scatter(ra[(ra > -140) & (ra < -120)], dec[(ra > -140) & (ra < -120)],s=20, c=d[(ra > -140) & (ra < -120)],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())
locs = ax2.get_xticks() 
gl2.xlocator = mticker.FixedLocator(locs[::2]) 

ax3 = fig.add_subplot(223, facecolor="black", projection=ccrs.PlateCarree())
ax3.add_feature(cf.LAND,color="black")
ax3.add_feature(cf.OCEAN,color="black")
gl3 = ax3.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax3.scatter(ra[(ra > -50) & (ra < 0)], dec[(ra > -50) & (ra < 0)],s=20, c=d[(ra > -50) & (ra < 0)],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())

locs = ax3.get_xticks() 
gl3.xlocator = mticker.FixedLocator(locs[::2]) 

ax4 = fig.add_subplot(224, facecolor="black", projection=ccrs.PlateCarree())
ax4.add_feature(cf.LAND,color="black")
ax4.add_feature(cf.OCEAN,color="black")
gl4 = ax4.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                  linewidth=1, color='gray', alpha=0.5)
ax4.scatter(ra[ra>0],dec[ra > 0] ,s=20, c=d[ra > 0],cmap="plasma",zorder=10,transform=ccrs.PlateCarree())
locs = ax4.get_xticks() 
gl4.xlocator = mticker.FixedLocator(locs[::2]) 

    
plt.show()

#fig.savefig("SDSS_PlateCaree_wLabels.png")
fig.savefig(dbName+"_"+dbTable+"_"+"_PlateCarree.png")

#                          FIGURE    AITOFF                 



fig = plt.figure(figsize=(16,8.4),dpi=300)
ax = plt.subplot(111, facecolor="black", projection="aitoff")
ax.set_title(dbName+" density map", y=1.08)
ax.grid(True, alpha=0.5)
ax.xaxis.set_major_formatter(plt.NullFormatter())
ax.scatter(ra_rad, dec_rad,s=2, c=-d,cmap="plasma") #pink
plt.show()

fig.savefig(dbName+"_"+dbTable+"_"+"_Aitoff.png")

#################################################################################
"""