# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 14:29:54 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# convert from HHMMSS DDMM.m
def hmsdm2dd_no(ra,dec):
   i=0
   newRa, newDec = np.array(np.zeros(len(ra))),np.array(np.zeros(len(dec)))
   for item in ra:
      newRa[i] = (int(item[0:2])+ int(item[2:4])/60.+ float(item[4:])/3600.)*15
      i+=1
   i=0
   for item in dec:
      if int(item[0:3]) < 0:
          newDec[i] = int(item[0:3]) - float(item[3:])/60. 
      else: 
          newDec[i] = int(item[0:3]) + float(item[3:])/60.
      i+=1
   return newRa.astype(np.float), newDec.astype(np.float)

# LOAD DATA
# source file:
src = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\ACVS\ACVS.1.1.gz"
cols = ["OBJID","PER","HJD0","VMAX","VAMP","TYPE","GCVS_ID","GCVS_TYPE","IR12",
        "IR25","IR60","IR100","J","H","K","V_IR12","V_J","V_H","V_K","J_H","H_K"]


# grab the data
df = pd.read_table(src,sep=" ",names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip")
df.fillna(value=-99,inplace=True)

df.drop(df.index[37983],inplace=True) # something is wrong with the object ID

# GET RA & DEC
df["RA"],df["DEC"] = hmsdm2dd_no(df["OBJID"].apply(lambda x: x[:6]),df["OBJID"].apply(lambda x: x[6:]))
df["ID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("ID","i8"),
                  ("OBJID","S13"),
                  ("RA","f8"),
                  ("DEC","f8"),
                  ("PER","f4"),
                  ("HJD0","f8"),
                  ("VMAX","f4"),
                  ("VAMP","f4"),
                  ("TYPE","S27"),
                  ("GCVS_ID","S19"),
                  ("GCVS_TYPE","S13"),
                  ("IR12","f4"),
                  ("IR25","f4"),
                  ("IR60","f4"),
                  ("IR100","f4"),
                  ("J","f4"),
                  ("H","f4"),
                  ("K","f4"),
                  ("V_IR12","f4"),
                  ("V_J","f4"),
                  ("V_H","f4"),
                  ("V_K","f4"),
                  ("J_H","f4"),
                  ("H_K","f4")])
 
              
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\ACVS\acvs.bin" 

# write to file
records.tofile(dst)