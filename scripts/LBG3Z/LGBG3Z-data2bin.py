# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np
from astropy import units as u
from astropy.coordinates import SkyCoord

# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\LBG-3z\\"
src = path+"LBG-3z-20150923.tsv"
cols = ["Name","RAJ2000","DEJ2000","Rmag","G-R","U-G","u_z-em","z-em","u_z-abs","z-abs","Type","n_Name"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=57,skipinitialspace=True)

# convert from HH:MM:SS.s DD:MM:SS.s
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],frame="icrs", unit=(u.hourangle, u.deg))
df["RA"], df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)
df[["u_z-em","u_z-abs","Type","n_Name"]] = df[["u_z-em","u_z-abs","Type","n_Name"]].replace(to_replace=[-99],value="")

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("Name","S16"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Rmag","f4"),
        ("G-R","f4"),
        ("U-G","f4"),
        ("u_z-em","S1"),
        ("z-em","f4"),
        ("u_z-abs","S1"),
        ("z-abs","f4"),
        ("Type","S4"),
        ("n_Name","S23")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"lbg3z.bin" 

# write to file
records.tofile(dst)