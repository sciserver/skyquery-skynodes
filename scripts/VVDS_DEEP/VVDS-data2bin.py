# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\VVDS-DEEP\\"
src = path+"VVDS-DEEP-20150923_VizieR.tsv"
cols = ["ID","Jname","z","q_z","phf","UEmag","e_UEmag","ULmag","e_ULmag","Bmag",
        "e_Bmag","Vmag","e_Vmag","Rmag","e_Rmag","Imag","e_Imag","Jmag","e_Jmag",
        "Kmag","e_Kmag","VVDS","FITS","RA","DEC"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=86,skipinitialspace=True)

df.fillna(value=-99,inplace=True)
df[["Jname"]] = df[["Jname"]].replace(to_replace=[-99],value="")


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("ID","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Jname","S19"),
        ("z","f4"),
        ("q_z","i2"),
        ("phf","i1"),
        ("UEmag","f4"),
        ("e_UEmag","f4"),
        ("ULmag","f4"),
        ("e_ULmag","f4"),
        ("Bmag","f4"),
        ("e_Bmag","f4"),
        ("Vmag","f4"),
        ("e_Vmag","f4"),
        ("Rmag","f4"),
        ("e_Rmag","f4"),
        ("Imag","f4"),
        ("e_Imag","f4"),
        ("Jmag","f4"),
        ("e_Jmag","f4"),
        ("Kmag","f4"),
        ("e_Kmag","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"vvds.bin" 

# write to file
records.tofile(dst)