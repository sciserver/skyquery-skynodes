# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = r"\\skyquery01\Data\temp0\data0\ebanyai\VIPERSPDR2\\"


# grab the data
cols = ["id_IAU","num","ra","dec","selmag","errselmag","pointing","quadrant",
        "zspec","zflg","norm","epoch","photoMask","tsr","ssr","classFlag"]

src1 = path+"VIPERS_W1_SPECTRO_PDR2.txt.gz"
src2 = path+"VIPERS_W4_SPECTRO_PDR2.txt.gz"
df1 = pd.read_table(src1,names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip",sep="\s+")
df2 = pd.read_table(src2,names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip",sep="\s+")

df = pd.concat([df1,df2],ignore_index=True)


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("id_IAU","S16"),
        ("num","i8"),
        ("ra","f8"),
        ("dec","f8"),
        ("selmag","f4"),
        ("errselmag","f4"),
        ("pointing","S6"),
        ("quadrant","i1"),
        ("zspec","f4"),
        ("zflg","f4"),
        ("norm","f4"),
        ("epoch","i1"),
        ("photoMask","i1"),
        ("tsr","f4"),
        ("ssr","f4"),
        ("classFlag","i4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"VIPERSPDR2_SpecObj.bin" 

# write to file
records.tofile(dst)
