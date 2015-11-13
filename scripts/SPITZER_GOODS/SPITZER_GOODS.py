# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\Spitzer_GOODS\\"
src = path+"GOODSN-20150923_IRAS.tbl"
src2 = path+"GOODSN-20150923_IRAS.tbl"
cols = ["srcid","ra","dec","ra_irac","dec_irac","s_24","s_24_err","irac_tag","extended_tag"]


# grab the data
df1 = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True,sep=" ",na_values=["null"])
df2 = pd.read_table(src2,names=cols,index_col=False,comment="#",skipinitialspace=True, sep=" ",na_values=["null"])
df = pd.concat([df1,df2],ignore_index=True)
df.fillna(value=-99,inplace=True)
df["objID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("srcid","i4"),
        ("ra","f8"),
        ("dec","f8"),
        ("ra_irac","f8"),
        ("dec_irac","f8"),
        ("s_24","f4"),
        ("s_24_err","f4"),
        ("irac_tag","i1"),
        ("extended_tag","i1")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"spitzer_goods.bin" 

# write to file
records.tofile(dst)

