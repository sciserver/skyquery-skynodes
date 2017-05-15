# -*- coding: utf-8 -*-
"""
Created on Wed May 10 02:25:08 2017

@author: ebanyai
"""

import numpy as np
from matplotlib.patches import Polygon
from astropy import units as u
from astropy.coordinates import SkyCoord
from matplotlib.collections import PatchCollection
import math as m
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import cartopy.feature as cf

class DensityPlot():
    
    def __init__(self,coords,density,database,table):
       self.ra_deg = coords.ra.wrap_at(180 * u.deg).deg
       self.dec_deg = coords.dec.deg
       self.ra_rad = coords.ra.wrap_at(180 * u.deg).radian
       self.dec_rad = coords.dec.radian
       self.d = density
       self.database = database
       self.table = table
        
    def CreatePatches(self,unit):
        patches = []
        
        if (unit == "deg"):
            ra = self.ra_deg
            dec = self.dec_deg
            lowerLimit = -170
            upperLimit = 90
            fixedVal = 180
                
        elif (unit == "rad"):
            ra = self.ra_rad
            dec = self.dec_rad
            lowerLimit = -3
            upperLimit = 1.5
            fixedVal = m.pi
    
        for i in range(0,len(ra-2),3):
            t = np.array([[ra[i],dec[i]],
                          [ra[i+1],dec[i+1]],
                          [ra[i+2],dec[i+2]]])
            
            t = sorted(t, key=lambda x: x[0])
            if (t[0][0] < lowerLimit and t[1][0] < lowerLimit and t[2][0] >= upperLimit):
                t[0][0] = t[1][0] = fixedVal
            elif (t[1][0] >= upperLimit and t[2][0] >= upperLimit and t[0][0] <= lowerLimit):
                t[0][0] = fixedVal
            elif(t[0][0] <= lowerLimit and t[1][0] == 0 and t[2][0] >= upperLimit):
                continue
                
            polygon = Polygon(t, True)        
            patches.append(polygon)
            
            
        p = PatchCollection(patches, alpha=1,cmap="plasma")
        p.set_array(np.array(self.d[::3])) # we need only 1 piont out of 3 since 3 ra-dec pairs defines a triangle
        return p
    
    def CreateDensityPlot(self,proj="PlateCarree"):
        
        fig = plt.figure(figsize=(16,8),dpi=300)
        
        if (proj == "PlateCarree"):
            self.CreateDensityPlot_PlateCarree(fig)
        elif (proj == "Aitoff"):
            self.CreateDensityPlot_Aitoff(fig)

        fig.savefig(self.database+"_"+self.table+"_"+proj+".png")
        return fig
    
    def CreateDensityPlot_PlateCarree(self,fig):
        p = self.CreatePatches("deg")
        ax = fig.add_subplot(111, facecolor="black", projection=ccrs.PlateCarree())
        ax.add_feature(cf.LAND,color="black",zorder=-1)
        ax.add_feature(cf.OCEAN,color="black",zorder=-1)
        ax.gridlines(zorder=11,crs=ccrs.PlateCarree(), draw_labels=True,
                          linewidth=1, color='gray', alpha=0.4)
        plt.axis([np.min(self.ra_deg),np.max(self.ra_deg),np.min(self.dec_deg),np.max(self.dec_deg)])
        ax.set_title(self.database+" "+self.table+" density map", y=1.08)
        ax.add_collection(p)
        return 
    
    def CreateDensityPlot_Aitoff(self,fig):        
        p = self.CreatePatches("rad")
    
        ax = plt.subplot(111, facecolor="black", projection="aitoff")
        ax.add_collection(p)
        ax.xaxis.set_major_formatter(plt.NullFormatter())
        ax.set_title(self.database+" "+self.table+" density map", y=1.08)
        return 
    