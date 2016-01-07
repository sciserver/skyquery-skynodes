# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np
import astropy.units as u
from astropy.coordinates import SkyCoord
from astropy.coordinates import FK5

# LOAD DATA

# convert from HH:MM:SS.s DD:MM:SS.s
# source file:
src = "C:\\Data\\ebanyai\\project\\Skyquery-data\\CNOC2\\CNOC2-20150923_VizieR.tsv"
cols = ["PPP","CNOC2sp","oRA","oDE","z","e_z","Rval","Sc","w_z","Imag","e_Imag","Ice",
        "w_Imag","IWc","IWxy","Rmag","e_Rmag","Rce","w_Rmag","RWc","RWxy","Vmag","e_Vmag","Vce",
        "w_Vmag","VWc","VWxy","Bmag","e_Bmag","Bce","w_Bmag","BWc","BWxy","Umag","e_Umag","Uce",
        "w_Umag","UWc","UWxy","Pcl","Rkcor","xpos","ypos","RA1950","DE1950"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skipinitialspace=True,skiprows=127)

coordsOld = SkyCoord(df["RA1950"],df["DE1950"],frame="fk5",equinox="J1950",unit =(u.hourangle,u.deg))
coords = coordsOld.transform_to(FK5(equinox="J2000"))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("PPP","i8"),
        ("CNOC2sp","S6"),
        ("RA","f8"),
        ("DEC","f8"),
        ("oRA","f4"),
        ("oDE","f4"),
        ("z","f8"),
        ("e_z","i4"),
        ("Rval","f4"),
        ("Sc","i2"),
        ("w_z","f4"),
        ("Imag","f4"),
        ("e_Imag","f4"),
        ("Ice","f4"),
        ("w_Imag","f4"),
        ("IWc","f4"),
        ("IWxy","f4"),
        ("Rmag","f4"),
        ("e_Rmag","f4"),
        ("Rce","f4"),
        ("w_Rmag","f4"),
        ("RWc","f4"),
        ("RWxy","f4"),
        ("Vmag","f4"),
        ("e_Vmag","f4"),
        ("Vce","f4"),
        ("w_Vmag","f4"),
        ("VWc","f4"),
        ("VWxy","f4"),
        ("Bmag","f4"),
        ("e_Bmag","f4"),
        ("Bce","f4"),
        ("w_Bmag","f4"),
        ("BWc","f4"),
        ("BWxy","f4"),
        ("Umag","f4"),
        ("e_Umag","f4"),
        ("Uce","f4"),
        ("w_Umag","f4"),
        ("UWc","f4"),
        ("UWxy","f4"),
        ("Pcl","i1"),
        ("Rkcor","f4"),
        ("xpos","f4"),
        ("ypos","f4")]
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"C:\Data\ebanyai\project\Skyquery-data\CNOC2\cnoc2.bin" 



# write to file
records.tofile(dst)
