# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


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
path =  r"\\SKYQUERY01\Data\temp0\data0\ebanyai\GDDS\\"
src = path+"GDDS.tsv"
cols = ["GDDS","z","Sp","RAJ2000","DEJ2000","Conf","Ovlap","Weight","Bmag",
        "n_Bmag","e_Bmag","Vmag","n_Vmag","e_Vmag","Rmag","n_Rmag","e_Rmag","Icmag",
        "n_Icmag","e_Icmag","z_mag","n_z_mag","e_z_mag","Hmag","n_Hmag","e_Hmag",
        "Ksmag","n_Ksmag","e_Ksmag"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skipinitialspace=True,skiprows=92)
df.fillna(value=-99,inplace=True)
df["RA"],df["DEC"] = hmsdms2dd(df["RAJ2000"],df["DEJ2000"])
df["objID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("GDDS","S7"),
        ("RA","f8"),
        ("DEC","f8"),
        ("z","f8"),
        ("Conf","i2"),
        ("Ovlap","S3"),
        ("Weight","f8"),
        ("Bmag","f4"),
        ("n_Bmag","S1"),
        ("e_Bmag","f4"),
        ("Vmag","f4"),
        ("n_Vmag","S1"),
        ("e_Vmag","f4"),
        ("Rmag","f4"),
        ("n_Rmag","S1"),
        ("e_Rmag","f4"),
        ("Icmag","f4"),
        ("n_Icmag","S1"),
        ("e_Icmag","f4"),
        ("z_mag","f4"),
        ("n_z_mag","S1"),
        ("e_z_mag","f4"),
        ("Hmag","f4"),
        ("n_Hmag","S1"),
        ("e_Hmag","f4"),
        ("Ksmag","f4"),
        ("n_Ksmag","S1"),
        ("e_Ksmag","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"gdds.bin" 



# write to file
records.tofile(dst)