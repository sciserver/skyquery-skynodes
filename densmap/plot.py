# -*- coding: utf-8 -*-
"""
Created on Wed May 10 02:25:08 2017

@author: ebanyai
"""

import os
import sys
import numpy as np
import pymssql
from matplotlib.patches import Polygon
from astropy import units as u
from astropy.coordinates import SkyCoord
from matplotlib.collections import PatchCollection
from mpltools import color
import math as m
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import cartopy.feature as cf

colormaps = {
    "radio": color.LinearColormap("green", [(0, 0, 0), (0, 0.8, 0), (1, 1, 1)]),
    "fir": plt.get_cmap("hot"),
    "nir": plt.get_cmap("copper"),
    "visual": color.LinearColormap("visual", [(0, 0, 0), (1, 1, 0.5), (1, 1, 1)]),
    "nuv": plt.get_cmap("bone"),
    "fuv": color.LinearColormap("nuv", [(0, 0, 0), (1, 0, 1)]),
    "xray": plt.get_cmap("viridis"),
    "gamma": plt.get_cmap("inferno"),
    
    "red": color.LinearColormap("red", [(0, 0, 0), (1, 0, 0)]),
    "blue": color.LinearColormap("red", [(0, 0, 0), (0, 0, 1)]),
}

class DensityPlotLayer():

    def __init__(self, database, table, cmap="plasma", alpha=1, level=6):
        self.database = database
        self.table = table
        self.cmap = cmap
        self.alpha = alpha
        self.level = level
        
        self.sqlRun = False
        self.ra = None
        self.dec = None
        self.dens = None
        
    def RunSql(self):
        sql = """
        DECLARE @level int = """ + str(self.level) + """;
        DECLARE @bits int = POWER(2, 40 - 2 * @level);
        DECLARE @mask bigint = 0xFFFFFFFFFFFFFFFF * @bits;
         
        PRINT CAST(@mask AS binary(8));
         
        WITH density AS
        (
                        SELECT (htmid & @mask) / @bits AS htmid, COUNT(*) AS cnt
                        FROM SkyNode_""" + self.database + ".." + self.table + """
                        GROUP BY (htmid & @mask) / @bits
        )
        SELECT c.ra, c.dec, cnt / htmid.Area(htmid)
        FROM density
        CROSS APPLY htmid.GetCorners(htmid) c
        ORDER BY htmid
        """
        
        conn = pymssql.connect("skyquery01\mssql_a", "", "", "SkyQuery_CODE_dev")
        cursor = conn.cursor()
        cursor.execute(sql)
        arr = np.array(cursor.fetchall())
        conn.commit()
        
        self.ra = arr[:,0]
        self.dec = arr[:,1]
        self.dens = arr[:,2]
        self.sqlRun = True
            
    def CalcDensity(self):
        return np.log(self.dens) / np.log(np.max(self.dens))
    
    def WrapCoords(self):
        coords = SkyCoord(ra=self.ra,dec=self.dec,frame="fk5",equinox="j2000",unit=u.degree)    
        return coords.ra.wrap_at(180 * u.deg).deg, coords.dec.deg, coords.ra.wrap_at(180 * u.deg).radian, coords.dec.radian

class DensityPlot():
    
    def __init__(self, title=None, proj="PlateCarree", labels=False, zoom=False):
        self.dpi = 96.0
        self.title = title
        self.proj = proj
        self.labels = labels
        self.zoom = zoom
        
    def GetSize(self, size):
        if (size == "icon"):
            return 120, 60, False, False
        elif (size == "small"):
            return 320, 160, False, False
        elif (size == "large"):
            return 1024, 512, True, False
            
    def GetFilename(self, name, size):
        if (size == "icon"):
            return "./skyquery/web/Jhu.SkyQuery.Web.UI/Assets/Schema/Icons/%s.png" % name
        elif (size == "small"):
            return "./skyquery/web/Jhu.SkyQuery.Web.UI/Assets/Schema/Pages/Images/%s_small.png" % name
        elif (size == "large"):
            return "./skyquery/web/Jhu.SkyQuery.Web.UI/Assets/Schema/Pages/Images/%s.png" % name
        
    def CreateFig(self):
        w = self.width / self.dpi
        h = self.height / self.dpi
        fig = plt.figure(figsize=(w,h), dpi=self.dpi)
        return fig
        
    def RenderLayer(self, layer):
        if (not layer.sqlRun):
            print("Executing SQL query on %s..%s" % (layer.database, layer.table))
            layer.RunSql()
        
        print("Wrapping coordinates...")
        ra_deg, dec_deg, ra_rad, dec_rad = layer.WrapCoords()
        d = layer.CalcDensity()
        
        print("Generating plot...")
       
        fig = self.CreateFig()
        cmap = colormaps[layer.cmap]
        
        if self.proj == "Aitoff":
            ax = plt.subplot(111, facecolor="black", projection="aitoff")
            ax.get_xaxis().set_visible(False)
            p = self.CreatePatches(ra_rad, dec_rad, d, "rad", layer.alpha, cmap)
            ax.get_xaxis().set_visible(False)   # always hidden for Aitoff
            ax.get_yaxis().set_visible(self.labels)
        elif self.proj == "PlateCarree":
            ax = fig.add_subplot(111, facecolor="black", projection=ccrs.PlateCarree())
            ax.add_feature(cf.LAND, color="black", zorder=-1)
            ax.add_feature(cf.OCEAN, color="black", zorder=-1)
            p = self.CreatePatches(ra_deg, dec_deg, d, "deg", layer.alpha, cmap)
            ax.get_xaxis().set_visible(self.labels)
            ax.get_yaxis().set_visible(self.labels)
            if (self.zoom):
                plt.axis([np.min(ra_deg), np.max(ra_deg), np.min(dec_deg), np.max(dec_deg)])
        
        ax.add_collection(p)
        
        if (self.labels):
            plt.title(self.title, y=1.08)
        else:
            # zero margins
            plt.subplots_adjust(left=0.01, bottom=0.01, right=0.99, top=0.99, wspace=0, hspace=0)
        
        
        # get buffer
        fig.canvas.draw()
        buf = np.frombuffer(fig.canvas.buffer_rgba(), np.uint8).reshape(self.height, self.width, -1).copy()
        buf[buf[:, :, -1] == 0] = 0
        
        fig.clf()
        plt.close(fig)
        del fig
        
        return buf
        
            
    #def AddLayer_PlateCarree(self, cmap):
    #    #grid_alpha = 0.0
    #    #if (grid): 
    #    #    grid_alpha = 0.4
    #    #ax.gridlines(zorder=11, crs=ccrs.PlateCarree(), draw_labels=True,
    #    #                  linewidth=1, color='gray', alpha=grid_alpha)

    def CreatePatches(self, ra, dec, d, unit, alpha, cmap):
        patches = []
        
        if (unit == "deg"):
            lowerLimit = -170
            upperLimit = 90
            fixedVal = 180
                
        elif (unit == "rad"):
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
                
            polygon = Polygon(t, True, linewidth=0, aa=False)
            patches.append(polygon)
        
        c = np.array(d[::3]) # we need only 1 point out of 3 since 3 ra-dec pairs defines a triangle
        p = PatchCollection(patches, match_original=True, alpha=alpha, cmap=cmap)
        p.set_clim(vmin=0, vmax=1.2)
        p.set_array(c) 
        return p
    
    def Plot(self, filename, layers, sizes=["icon", "small", "large"]):
        for size in sizes:
            self.width, self.height, self.labels, self.grid = self.GetSize(size)
            self.img = np.zeros((self.height, self.width, 4), dtype=np.uint8)
            path = self.GetFilename(filename, size)
            path = os.path.abspath(path)
            
            for layer in layers:
                buf = self.RenderLayer(layer)
                self.img = np.bitwise_or(self.img, buf)
                
            print("Saving plot to %s" % path)
            
            fig = self.CreateFig()
            plt.imshow(self.img)
            plt.subplots_adjust(0, 0, 1, 1)
            plt.axis("off")
            plt.savefig(path)
    