# -*- coding: utf-8 -*-
"""
Created on Mon Nov  2 09:36:19 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA
# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\GDDS\\"
src = path+"SpectralFeaturesAndClassifications.tsv"
cols = ["GDDS","AGN","OII","OIII","HiBal","LoBal","Fe2375","Fe2600","Mg2800",
        "Mg2852","HandK","Balmer","D4000","Temp","Class","Conf","z"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True)
df.fillna(value=-99,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("GDDS","S7"),
        ("AGN","i1"),
        ("OII","i1"),
        ("OIII","i1"),
        ("HiBal","i1"),
        ("LoBal","i1"),
        ("Fe2375","i1"),
        ("Fe2600","i1"),
        ("Mg2800","i1"),
        ("Mg2852","i1"),
        ("HandK","i1"),
        ("Balmer","i1"),
        ("D4000","i1"),
        ("Temp","i1"),
        ("Class","i4"),
        ("Conf","i2"),
        ("z","f4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"gdds_specFeatures.bin" 

# write to file
records.tofile(dst)