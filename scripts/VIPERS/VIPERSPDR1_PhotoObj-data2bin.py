# -*- coding: utf-8 -*-
"""
Created on Fri Nov 11 08:05:46 2016

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = r"\\skyquery01\Data\temp0\data0\ebanyai\VIPERSPDR1\\\\"


# grab the data
cols = ["id_IAU","num","ra","dec","selmag","errselmag","u","g","r","i","z",
"erru","errg","errr","erri","errz","u_T07","g_T07","r_T07","i_T07","iy_T07","z_T07",
"erru_T07","errg_T07","errr_T07","erri_T07","erriy_T07","errz_T07","DeltaUG",
"DeltaGR","DeltaRI","E_BV","r2","r2_T07","classFlag","agnFlag","photoMask","spectroMask"]

src1 = path+"VIPERS_W1_PHOT_PDR1.txt.gz"
src2 = path+"VIPERS_W4_PHOT_PDR1.txt.gz"
df1 = pd.read_table(src1,names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip")
df2 = pd.read_table(src2,names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip")

df = pd.concat([df1,df2],ignore_index=True)


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("id_IAU","S16"),
        ("num","i8"),
        ("ra","f8"),
        ("dec","f8"),
        ("selmag","f4"),
        ("errselmag","f4"),
        ("u","f4"),
        ("g","f4"),
        ("r","f4"),
        ("i","f4"),
        ("z","f4"),
        ("erru","f4"),
        ("errg","f4"),
        ("errr","f4"),
        ("erri","f4"),
        ("errz","f4"),
        ("u_T07","f4"),
        ("g_T07","f4"),
        ("r_T07","f4"),
        ("i_T07","f4"),
        ("iy_T07","f4"),
        ("z_T07","f4"),
        ("erru_T07","f4"),
        ("errg_T07","f4"),
        ("errr_T07","f4"),
        ("erri_T07","f4"),
        ("erriy_T07","f4"),
        ("errz_T07","f4"),
        ("DeltaUG","f4"),
        ("DeltaGR","f4"),
        ("DeltaRI","f4"),
        ("E_BV","f4"),
        ("r2","f4"),
        ("r2_T07","f4"),
        ("classFlag","i4"),
        ("agnFlag","i4"),
        ("photoMask","i1"),
        ("spectroMask","i1")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"vipers_PhotoObj.bin" 

# write to file
records.tofile(dst)
