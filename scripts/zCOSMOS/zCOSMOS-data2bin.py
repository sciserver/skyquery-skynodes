# -*- coding: utf-8 -*-
"""
Created on Fri Sep 25 11:06:57 2015

@author: ebanyai

zCOSMOS to binary file
"""
import pandas as pd
import numpy as np


# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\zCOSMOS"
src = path + r"\zCOSMOS.tsv"
cols = ["zCOSMOS", "RAJ2000","DEJ2000","z","CC","Imag","Sp","Cutout"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=51,skipinitialspace=True)
df.fillna(value=-9999,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("zCOSMOS","i8"),
                    ("RAJ2000","f8"),
                    ("DEJ2000","f8"),
                    ("z","f4"),
                    ("CC","f4"),
                    ("Imag","f4")])
                    
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path + r"\zCOSMOS.bin" 

# write to file
records.tofile(dst)