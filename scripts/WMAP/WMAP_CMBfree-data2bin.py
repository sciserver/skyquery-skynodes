# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\WMAP\\"
src = path+"wmap_CMB-freeQVW-20150923_VizieR.tsv"
cols = ["RA","DEC","RAJ2000","DEJ2000","WMAP","All","WMAP1","S(Q)",
        "e_S(Q)","S(V)","e_S(V)","S(W)","e_S(W)","fiveGHzID","f_5GHzID","Simbad"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=23,skipinitialspace=True)
df.fillna(value=-99,inplace=True)

df[["fiveGHzID","f_5GHzID"]] = df[["fiveGHzID","f_5GHzID"]].replace(to_replace=[-99],value="")

df["seqID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("seqID","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("WMAP","S10"),
        ("WMAP1","i4"),
        ("S(Q)","f4"),
        ("e_S(Q)","f4"),
        ("S(V)","f4"),
        ("e_S(V)","f4"),
        ("S(W)","f4"),
        ("e_S(W)","f4"),
        ("fiveGHzID","S15"),
        ("f_5GHzID","S1")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"wmap_CMBfree.bin" 

# write to file
records.tofile(dst)