# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\SPITZER\\"
src = path+"GOODSN-16.tbl"
src2 = path+"GOODSS-16.tbl"
cols1 = ["id","ra","dec","cov","s3_6","e_s3_6","s4_5","e_s4_5","s5_8","e_s5_8",
        "s8","e_s8","s16","e_s16","s24","e_s24","zspec","r_zspec","xdet","sbf",
        "hbf","star","ratio","ncf","ncf16","q","e","bmag","vmag","imag","zmag",
        "ebmag","evmag","eimag","ezmag","icls","cntr"]
cols2 = ["id","ra","dec","cov","s3_6","e_s3_6","s4_5","e_s4_5","s5_8","e_s5_8",
        "s8","e_s8","s16","e_s16","s24","e_s24","zspec","r_zspec","xdet","sbf",
        "hbf","star","ratio","ncf","ncf16","q","e","bmag","vmag","imag","zmag",
        "ebmag","evmag","eimag","ezmag","icls"]


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("id","i4"),
        ("ra","f8"),
        ("dec","f8"),
        ("cov","i4"),
        ("s3_6","f4"),
        ("e_s3_6","f4"),
        ("s4_5","f4"),
        ("e_s4_5","f4"),
        ("s5_8","f4"),
        ("e_s5_8","f4"),
        ("s8","f4"),
        ("e_s8","f4"),
        ("s16","f4"),
        ("e_s16","f4"),
        ("s24","f4"),
        ("e_s24","f4"),
        ("zspec","f4"),
        ("r_zspec","i4"),
        ("xdet","i1"),
        ("sbf","f8"),
        ("hbf","f8"),
        ("star","i1"),
        ("ratio","f4"),
        ("ncf","i1"),
        ("ncf16","i1"),
        ("q","i2"),
        ("e","i1"),
        ("bmag","f4"),
        ("vmag","f4"),
        ("imag","f4"),
        ("zmag","f4"),
        ("ebmag","f4"),
        ("evmag","f4"),
        ("eimag","f4"),
        ("ezmag","f4"),
        ("icls","i1")]
       
dt_df = np.dtype(types)  


# grab the data
# GOODS-N IRS 16
df1 = pd.read_table(src,names=cols1,index_col=False,skiprows=91,skipinitialspace=True,sep=" ",na_values=["null"])
df1.fillna(value=-99,inplace=True)
df1["objID"] = df1.index+1  

# GOODS-N IRS 16
df2 = pd.read_table(src2,names=cols2,index_col=False,skiprows=89,skipinitialspace=True, sep=" ",na_values=["null"])
df2.fillna(value=-99,inplace=True)       
df2["objID"] = df2.index+1                  

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records1 = np.array(df1.to_records(),dtype=dt_df) 
records2 = np.array(df2.to_records(),dtype=dt_df) 

# destination folder
dst1 = path+"spitzer_goodsnIRS16micron.bin" 
dst2 = path+"spitzer_goodssIRS16micron.bin" 

# write to file
records1.tofile(dst1)
records2.tofile(dst2)
