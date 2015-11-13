# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


def hmsdms2dd_no(ra,dec):
   i=0
   newRa, newDec = np.array(np.zeros(len(ra))),np.array(np.zeros(len(dec)))
   for item in ra:
      newRa[i] = (int(item[0])+ int(item[1])/60.+ float(item[2])/3600.)*15
      i+=1
   i=0
   for item in dec:
      
      if int(item[0]) < 0:
          newDec[i] = int(item[0]) - int(item[1])/60. - float(item[2]) /3600.
      else: 
          newDec[i] = int(item[0]) + int(item[1])/60. + float(item[2]) /3600.
      i+=1
   return newRa.astype(np.float), newDec.astype(np.float)



# LOAD DATA
# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\VLA_GOODSN\\"
src = path+"Table_GOODSN_VLA_v1_8.txt"
cols = ["Name","RAh","RAm","RAs","e_RAs","DECd","DECm","DECs","e_DECs","SN",
        "Peak","e_Peak","Total","e_Total","bmaj","bmin","PA","ulim","beam "]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True,sep=" ")
df["RA"],df["DEC"] =  hmsdms2dd_no(df[["RAh","RAm","RAs"]].values,df[["DECd","DECm","DECs"]].values)
df["objID"] = df.index+1


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("Name","S5"),
        ("RA","f8"),
        ("e_RAs","f8"),
        ("DEC","f8"),
        ("e_DECs","f8"),
        ("SN","f4"),
        ("Peak","f4"),
        ("e_Peak","f4"),
        ("Total","f4"),
        ("e_Total","f4"),
        ("bmaj","f4"),
        ("bmin","f4"),
        ("PA","i4"),
        ("ulim","f4"),
        ("beam ","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"vla_goods.bin" 

# write to file
records.tofile(dst)
