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
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\TKRS\\"
src = path+"TKRS-20150923_VizieR.tsv"
cols = ["TKRS","RAJ2000","DEJ2000","Rmag","Mask","Slit","z","q_z","zOther",
        "r_zOther","XpixD","YpixD","ACS","XpixG","YpixG","MajAxis","e2","PA","GOODS"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=72,skipinitialspace=True)
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],unit=(u.hourangle,u.deg))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)
df["GOODS"] = df["GOODS"].replace(to_replace=[-99],value="")

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("TKRS","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Rmag","f4"),
        ("Mask","i2"),
        ("Slit","i4"),
        ("z","f8"),
        ("q_z","i2"),
        ("zOther","f4"),
        ("r_zOther","i2"),
        ("XpixD","f4"),
        ("YpixD","f4"),
        ("ACS","i2"),
        ("XpixG","f4"),
        ("YpixG","f4"),
        ("MajAxis","f4"),
        ("e2","f4"),
        ("PA","f4"),
        ("GOODS","S20")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"tkrs.bin" 

# write to file
records.tofile(dst)