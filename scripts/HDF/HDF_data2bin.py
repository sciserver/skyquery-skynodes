# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

def msms2dd(ra,dec):
   i=0
   newRa, newDec = np.array(np.zeros(len(ra))),np.array(np.zeros(len(dec)))
   for item in ra:
      newRa[i] = (int(item[0:2])/60.+ float(item[3:])/3600.)*15
      i+=1
   i=0
   for item in dec:
      newDec[i] = int(item[0:2])/60. + float(item[3:])/3600.
      i+=1
   return newRa.astype(np.float), newDec.astype(np.float)

def get_limit(item):
    if item[0] == ">":
        return "lower"
    elif item[0] == "<":
        return "upper"
    elif item[:3] == "...":
        return "both"
    else:
        return "-"

def get_number(item):
    if item[0] == ">" or item[0] == "<":
        return float(item[1:])
    elif item[:3] == "...":
        return -99.
    else:
        return float(item)

# LOAD DATA

# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\HDF\\"
src = path+"chip1.txt"
src2 = path+"chip2.txt"
src3 = path+"chip3.txt"
src4 = path+"chip4.txt"
cols = ["objID","x","y","RA","Dec","mt","mi","U-B","B-V","V-I","SN","area","r1","bpa","PA","Flags"]


# grab the data
df1 = pd.read_table(src,names=cols,index_col=False,skiprows=1,skipinitialspace=True,sep=" ")
df2 = pd.read_table(src2,names=cols,index_col=False,skiprows=1,skipinitialspace=True, sep=" ")
df3 = pd.read_table(src3,names=cols,index_col=False,skiprows=1,skipinitialspace=True, sep=" ")
df4 = pd.read_table(src4,names=cols,index_col=False,skiprows=1,skipinitialspace=True, sep=" ")
df = pd.concat([df1,df2,df3,df4],ignore_index=True)

df["ra"],df["dec"] = msms2dd(df["RA"],df["Dec"])
df["ra"] += 12*15 
df["dec"] += 62
df.fillna(value=-99,inplace=True)
df["mt_limit"] = df["mt"].apply(lambda x: get_limit(x))
df["mi_limit"] = df["mi"].apply(lambda x: get_limit(x))
df["U-B_limit"] = df["U-B"].apply(lambda x: get_limit(x))
df["B-V_limit"] = df["B-V"].apply(lambda x: get_limit(x))
df["V-I_limit"] = df["V-I"].apply(lambda x: get_limit(x))

df["mt"] = df["mt"].apply(lambda x: get_number(x))
df["mi"] = df["mi"].apply(lambda x: get_number(x))
df["U-B"] = df["U-B"].apply(lambda x: get_number(x))
df["B-V"] = df["B-V"].apply(lambda x: get_number(x))
df["V-I"] = df["V-I"].apply(lambda x: get_number(x))


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","S14"),
        ("x","f4"),
        ("y","f4"),
        ("ra","f8"),
        ("dec","f8"),
        ("mt","f4"),
        ("mt_limit","S5"),
        ("mi","f4"),
        ("mi_limit","S5"),
        ("U-B","f4"),
        ("U-B_limit","S5"),
        ("B-V","f4"),
        ("B-V_limit","S5"),
        ("V-I","f4"),
        ("V-I_limit","S5"),
        ("SN","f4"),
        ("area","f4"),
        ("r1","f4"),
        ("bpa","f4"),
        ("PA","f4"),
        ("Flags","S3")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"hdf.bin" 

# write to file
records.tofile(dst)
