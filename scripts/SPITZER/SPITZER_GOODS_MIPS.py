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
src = path+"GOODSN-24.tbl"
src2 = path+"GOODSS-24.tbl"
cols = ["srcid","ra","dec","ra_irac","dec_irac","s_24","s_24_err","irac_tag","extended_tag"]


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


# grab the data
# GOODS-N MIPS 24
df1 = pd.read_table(src,names=cols,index_col=False,skiprows=35,skipinitialspace=True,sep=" ",na_values=["null"])
df1.fillna(value=-99,inplace=True)
df1["objID"] = df1.index+1  

# GOODS-N MIPS 24
df2 = pd.read_table(src2,names=cols,index_col=False,skiprows=35,skipinitialspace=True, sep=" ",na_values=["null"])
df2.fillna(value=-99,inplace=True)       
df2["objID"] = df2.index+1                  

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records1 = np.array(df1.to_records(),dtype=dt_df) 
records2 = np.array(df2.to_records(),dtype=dt_df) 

# destination folder
dst1 = path+"spitzer_goodsnMIPS24micron.bin" 
dst2 = path+"spitzer_goodssMIPS24micron.bin" 

# write to file
records1.tofile(dst1)
records2.tofile(dst2)
