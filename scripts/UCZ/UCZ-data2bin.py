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
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\UCZ\\"
src = path+"UZC-20150923_VizieR.tsv"
cols = ["RAJ2000","DEJ2000","Bmag","z","e_z","T","U","N","Zname","Spectrum",
        "f_z","r_z","Name","UZC","mul"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True)
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],unit=(u.hourangle,u.deg))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)
df[["T","Zname","f_z","Name","UZC","mul"]] = df[["T","Zname","f_z","Name","UZC","mul"]].replace(to_replace=[-99],value="")

df["seqID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("seqID","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Bmag","f4"),
        ("z","i4"),
        ("e_z","i2"),
        ("T","S1"),
        ("U","i1"),
        ("N","i1"),
        ("Zname","S12"),
        ("f_z","S1"),
        ("r_z","i4"),
        ("Name","S11"),
        ("UZC","S1"),
        ("mul","S1")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"ucz.bin" 

# write to file
records.tofile(dst)