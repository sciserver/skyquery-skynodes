# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
AGES to binary file
"""

import pandas as pd
import numpy as np

# LOAD DATA

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


# source file:
src = "C:\\Data\\ebanyai\\project\\Skyquery-data\\CNOC2\\CNOC2-20150923_VizieR.tsv"
cols = ["PPP","CNOC2sp","oRA","oDE","z","e_z","Rval","Sc","w_z","Imag","e_Imag","Ice",
        "w_Imag","IWc","IWxy","Rmag","e_Rmag","Rce","w_Rmag","RWc","RWxy","Vmag","e_Vmag","Vce",
        "w_Vmag","VWc","VWxy","Bmag","e_Bmag","Bce","w_Bmag","BWc","BWxy","Umag","e_Umag","Uce",
        "w_Umag","UWc","UWxy","Pcl","Rkcor","xpos","ypos","RA1950","DE1950"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True,skip_rows=127)
df.fillna(value=-99,inplace=True)
df["RA"],df["DEC"] = hmsdms2dd(df["RA1950"],df["DE1950"])


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("PPP","i8"),
        ("CNOC2sp","S6"),
        ("RA","f8"),
        ("DEC","f8"),
        ("oRA","f4"),
        ("oDE","f4"),
        ("z","f8"),
        ("e_z","i4"),
        ("Rval","f4"),
        ("Sc","i2"),
        ("w_z","f4"),
        ("Imag","f4"),
        ("e_Imag","f4"),
        ("Ice","f4"),
        ("w_Imag","f4"),
        ("IWc","f4"),
        ("IWxy","f4"),
        ("Rmag","f4"),
        ("e_Rmag","f4"),
        ("Rce","f4"),
        ("w_Rmag","f4"),
        ("RWc","f4"),
        ("RWxy","f4"),
        ("Vmag","f4"),
        ("e_Vmag","f4"),
        ("Vce","f4"),
        ("w_Vmag","f4"),
        ("VWc","f4"),
        ("VWxy","f4"),
        ("Bmag","f4"),
        ("e_Bmag","f4"),
        ("Bce","f4"),
        ("w_Bmag","f4"),
        ("BWc","f4"),
        ("BWxy","f4"),
        ("Umag","f4"),
        ("e_Umag","f4"),
        ("Uce","f4"),
        ("w_Umag","f4"),
        ("UWc","f4"),
        ("UWxy","f4"),
        ("Pcl","i1"),
        ("Rkcor","f4"),
        ("xpos","f4"),
        ("ypos","f4")]
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"C:\Data\ebanyai\project\Skyquery-data\CNOC2\cnoc2.bin" 



# write to file
records.tofile(dst)
