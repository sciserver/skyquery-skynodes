# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\WiggleZ\\"
src = path + "wigglez_dr1_1-20150923_wigglez.txt"

# grab the data
cols = ["ID","RA","DEC","Redshift","Qop","u_SDSS","g_SDSS","r_SDSS","i_SDSS",
        "z_SDSS","g_RCS2","r_RCS2","z_RCS2","NUV","FUV"]

df = pd.read_table(src,names=cols,index_col=False,sep=" ",comment="#",skipinitialspace=True,na_values=["-"])
df.replace(to_replace=np.nan, value=-99.,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("ID","S22"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Redshift","f4"),
        ("Qop","i1"),
        ("u_SDSS","f4"),
        ("g_SDSS","f4"),
        ("r_SDSS","f4"),
        ("i_SDSS","f4"),
        ("z_SDSS","f4"),
        ("g_RCS2","f4"),
        ("r_RCS2","f4"),
        ("z_RCS2","f4"),
        ("NUV","f4"),
        ("FUV","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"wigglez_SpecObj.bin" 

# write to file
records.tofile(dst)
