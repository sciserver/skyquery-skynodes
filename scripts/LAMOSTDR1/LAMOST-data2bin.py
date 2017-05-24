# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\LAMOST\\"
src = path+"dr1.csv.gz"


# grab the data
df = pd.read_table(src,index_col=False,comment="#",skipinitialspace=True,sep="|",compression="gzip")
df.fillna(value=-9999,inplace=True)

df[["designation","obsdate","lmjd","planid","objtype","class","subclass","tsource","fibertype","tfrom","t_info","magtype"]] = df[["designation","obsdate","lmjd","planid","objtype","class","subclass","tsource","fibertype","tfrom","t_info","magtype"]].replace(to_replace=[-99],value="")

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("obsid","i8"),
        ("designation","S19"),
        ("obsdate","S10"),
        ("lmjd","f8"),
        ("planid","S20"),
        ("spid","i4"),
        ("fiberid","i4"),
        ("ra","f8"),
        ("dec","f8"),
        ("snru","f4"),
        ("snrg","f4"),
        ("snrr","f4"),
        ("snri","f4"),
        ("snrz","f4"),
        ("objtype","S10"),
        ("class","S7"),
        ("subclass","S12"),
        ("magtype","S10"),
        ("mag1","f4"),
        ("mag2","f4"),
        ("mag3","f4"),
        ("mag4","f4"),
        ("mag5","f4"),
        ("mag6","f4"),
        ("mag7","f4"),
        ("tsource","S10"),
        ("fibertype","S5"),
        ("tfrom","S18"),
        ("t_info","S23"),
        ("rv","f4"),
        ("z","f4"),
        ("z_err","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.iloc[:-1].to_records(),dtype=dt_df) 

# destination folder
dst = path+"lamost_SpecObj.bin" 

# write to file
records.tofile(dst)