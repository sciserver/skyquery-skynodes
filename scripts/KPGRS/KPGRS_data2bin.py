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
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\KPGRS\\"
src = path+"KPGRS_VizieR.tsv"

cols = ["MKK97","RA1950","DE1950","RFmag","U-BJ","BJ-RF","RF-IN","z","q_z","r_z",
        "Ns","Nb","Note","_RA.icrs","_DE.icrs"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=64,skipinitialspace=True)

# convert from HH:MM:SS.s DD:MM:SS.s
coords = SkyCoord(df["_RA.icrs"],df["_DE.icrs"],frame="icrs", unit=(u.hourangle, u.deg))
df["RA"], df["DEC"] = coords.ra.deg, coords.dec.deg

# replace nan values
df.fillna(value=-99,inplace=True)
df[["r_z","Note"]] = df[["r_z","Note"]].replace(to_replace=[-99],value="")


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("MKK97","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("RFmag","f4"),
        ("U-BJ","f4"),
        ("BJ-RF","f4"),
        ("RF-IN","f4"),
        ("z","f4"),
        ("q_z","i1"),
        ("r_z","S9"),
        ("Ns","i2"),
        ("Nb","i2"),
        ("Note","S1"),
        ("RA1950","S11"),
        ("DE1950","S11")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"kpgrs.bin" 

# write to file
records.tofile(dst)