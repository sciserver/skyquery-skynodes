# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np
from astropy import units as u
from astropy.coordinates import SkyCoord


# LOAD DATA
# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\VLA"
src = path+r"\Table_GOODSN_VLA_v1_8.txt"
cols = ["Name","RAh","RAm","RAs","e_RAs","DECd","DECm","DECs","e_DECs","SN",
        "Peak","e_Peak","Total","e_Total","bmaj","bmin","PA","ulim","beam "]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=33,skipfooter=1,skipinitialspace=True,sep=" ")
#df["RA"],df["DEC"] =  hmsdms2dd_no(df[["RAh","RAm","RAs"]].values,df[["DECd","DECm","DECs"]].values)
df["objID"] = df.index+1

df["ra_s"] = df["RAh"].astype(int).astype(str)+" "+df["RAm"].astype(int).astype(str)+" "+df["RAs"].astype(str)
df["dec_s"] = df["RAh"].astype(int).astype(str)+" "+df["RAm"].astype(int).astype(str)+" "+df["RAs"].astype(str)

coords = SkyCoord(df["ra_s"],df["dec_s"],unit=(u.hourangle,u.deg))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)
# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("Name","S5"),
        ("RA","f8"),
        ("e_RAs","f8"),
        ("DEC","f8"),
        ("e_DECs","f8"),
        ("SN","f4"),
        ("Peak","f4"),
        ("e_Peak","f4"),
        ("Total","f4"),
        ("e_Total","f4"),
        ("bmaj","f4"),
        ("bmin","f4"),
        ("PA","i4"),
        ("ulim","f4"),
        ("beam ","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+r"\vla_goodsn.bin" 

# write to file
records.tofile(dst)
