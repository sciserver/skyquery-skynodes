# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
AGES to binary file
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
src = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\CHANDRA\Chandra_Source-20161026_VizieR.tsv"
cols = ["CXO","RAJ2000","DEJ2000","ePos","S/N","Fb","b_Fb",
        "B_Fb","Fw","b_Fw","B_Fw","hr2","b_hr2","B_hr2","hr1","b_hr1","B_hr1",
        "fc","fe","fs","Vab","Vib","Vaw","Viw"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skipinitialspace=True,skiprows=82)
df.fillna(value=-99,inplace=True)
df["ID"] = df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("ID","i8"),
                  ("CXO","S16"),
                  ("RAJ2000","f8"),
                  ("DEJ2000","f8"),
                  ("ePos","f4"),
                  ("S/N","f4"),
                  ("Fb","f8"),
                  ("b_Fb","f8"),
                  ("B_Fb","f8"),
                  ("Fw","f8"),
                  ("b_Fw","f8"),
                  ("B_Fw","f8"),
                  ("hr2","f4"),
                  ("b_hr2","f4"),
                  ("B_hr2","f4"),
                  ("hr1","f4"),
                  ("b_hr1","f4"),
                  ("B_hr1","f4"),
                  ("fc","i1"),
                  ("fe","i1"),
                  ("fs","i1"),
                  ("Vab","i2"),
                  ("Vib","i1"),
                  ("Vaw","i2"),
                  ("Viw","i1")])
                    
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\CHANDRA\chandra_src.bin" 



# write to file
records.tofile(dst)
