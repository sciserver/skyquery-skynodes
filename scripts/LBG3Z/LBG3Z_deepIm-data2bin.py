# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
AGES to binary file
"""

import pandas as pd
import numpy as np
from astropy import units as u
from astropy.coordinates import SkyCoord

# LOAD DATA
# header should be checked for newer files
# comment out header, units and the "hline" (------) rows


# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\LBG-3z\\"
src = path+"DeepImagingObservations-20150923_VizieR.tsv"
cols = ["Field","RAJ2000","DEJ2000","Filt","Tel","Scale","FWHM","ExpTime","Dim1","Dim2","Area"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=55,skipinitialspace=True)

# convert from HH:MM:SS.s DD:MM:SS.s
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],frame="icrs", unit=(u.hourangle, u.deg))
df["RA"], df["DEC"] = coords.ra.deg, coords.dec.deg
df["objID"] = df.index

df.fillna(value=-99,inplace=True)
df[["Filt","Tel"]] = df[["Filt","Tel"]].replace(to_replace=[-99],value="")

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("Field","S10"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Filt","S4"),
        ("Tel","S28"),
        ("Scale","f4"),
        ("FWHM","f4"),
        ("ExpTime","i4"),
        ("Dim1","f4"),
        ("Dim2","f4"),
        ("Area","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"lbg3z-deepIm.bin" 

# write to file
records.tofile(dst)