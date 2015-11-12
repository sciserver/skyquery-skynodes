# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 14:29:54 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# convert from HH:MM:SS.s DD:MM:SS.s

def hmsdms2dd(ra,dec):
   i=0
   newRa, newDec = np.array(np.zeros(len(ra))),np.array(np.zeros(len(dec)))
   for item in ra:
      newRa[i] = (int(item[0:2])+ int(item[3:5])/60.+ float(item[6:])/3600.)*15
      i+=1
   i=0
   for item in dec:
      if int(item[0:3]) < 0:
          newDec[i] = int(item[0:3]) - int(item[4:6])/60. - float(item[7:]) /3600.
      else: 
          newDec[i] = int(item[0:3]) + int(item[4:6])/60. + float(item[7:]) /3600.
      i+=1
   return newRa.astype(np.float), newDec.astype(np.float)

# LOAD DATA
# source file:
src = "C:\\Data\\ebanyai\\project\\Skyquery-data\\CSDR2\\CatalinaVars.tbl"
src_vt = "C:\\Data\\ebanyai\\project\\Skyquery-data\\CSDR2\\VarTypes.tsv"

cols = ["CS_ID","Num_ID","RA","Dec","V","Period","Amplitude","NumberObs","VarType"]


# grab the data
df = pd.read_table(src,sep=" ",names=cols,header=False,index_col=False,comment="#",skipinitialspace=True,compression=None,na_values=[r"\\nodata"])
vartypes = pd.read_table(src_vt,header=0,index_col=3)
df = df.fillna(value=-99)
df["Type"] = df["VarType"].apply(lambda x: vartypes["Type"].loc[x])


# GET RA & DEC
df["ra"],df["dec"] = hmsdms2dd(df["RA"],df["Dec"])



# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("Num_ID","i8"),
                  ("CS_ID","S20"),
                  ("ra","f8"),
                  ("dec","f8"),
                  ("V","f4"),
                  ("Period","f4"),
                  ("Amplitude","f4"),
                  ("NumberObs","i4"),
                  ("Type","S10")])
 
              
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"C:\Data\ebanyai\project\Skyquery-data\CSDR2\csdr2_varCat.bin" 



# write to file
records.tofile(dst)
