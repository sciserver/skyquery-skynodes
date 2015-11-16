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
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\SSRS\\"
src = path+"SSRS-20150923_VizieR.tsv"
cols = ["n_GSC","GSC","m_GSC","ESO_MCG","RAB1950","DEB1950","mSSR","RV","e_RV",
        "TT","r_RV","Note","NGC_IC","_RA.icrs","_DE.icrs"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=64,skipinitialspace=True)
coords = SkyCoord(df["RAB1950"],df["DEB1950"],unit=(u.hourangle,u.deg))
df["RA_1950"],df["DEC_1950"] = coords.ra.deg, coords.dec.deg
coords = SkyCoord(df["_RA.icrs"],df["_DE.icrs"],frame="icrs",unit=(u.hourangle,u.deg))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg


df.fillna(value=-99,inplace=True)
df[["n_GSC","m_GSC","Note","NGC_IC"]] = df[["n_GSC","m_GSC","Note","NGC_IC"]].replace(to_replace=[-99],value="")
df["seqID"] = df.index

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("seqID","i8"),
        ("n_GSC","S1"),
        ("GSC","S9"),
        ("m_GSC","S1"),
        ("ESO_MCG","S10"),
        ("RA","f8"),
        ("DEC","f8"),
        ("RA_1950","f8"),
        ("DEC_1950","f8"),
        ("mSSR","f4"),
        ("RV","i4"),
        ("e_RV","i4"),
        ("TT","i2"),
        ("r_RV","i1"),
        ("Note","S4"),
        ("NGC_IC","S10")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"ssrs.bin" 

# write to file
records.tofile(dst)