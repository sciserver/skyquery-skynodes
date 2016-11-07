# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np
from astropy.coordinates import SkyCoord
from astropy import units as u


# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\OGLEIII\\"
src = path+"ogleIII.txt"


# grab the data
cols = ["ID","Field","StarID","Type","Subtype","RA","DECL","ID_OGLE_II","ID_MACHO",
        "ID_ASAS","ID_GCVS","ID_OTHER","I","V","P_1","dP_1","T0_1","A_1","R21_1","phi21_1",
        "R31_1","phi31_1","P_2","dP_2","T0_2","A_2","R21_2","phi21_2","R31_2","phi31_2",
        "P_3","dP_3","T0_3","A_3","R21_3","phi21_3","R31_3","phi31_3","Remarks"]
df = pd.read_table(src,names=cols,index_col=False,comment="#",skipinitialspace=True)
coords = SkyCoord(df["RA"],df["DECL"],unit=(u.hourangle,u.deg))
df["ra"], df["dec"] = coords.ra.value, coords.dec.value

df[["ID_OGLE_II","ID_MACHO","ID_ASAS","ID_GCVS","ID_OTHER"]] = df[["ID_OGLE_II","ID_MACHO","ID_ASAS","ID_GCVS","ID_OTHER"]].replace(to_replace=-99.99,value="").copy(deep=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("ID","S20"),
        ("Field","S8"),
        ("StarID","i8"),
        ("Type","S5"),
        ("Subtype","S9"),
        ("ra","f8"),
        ("dec","f8"),
        ("ID_OGLE_II","S16"),
        ("ID_MACHO","S14"),
        ("ID_ASAS","S13"),
        ("ID_GCVS","S6"),
        ("ID_OTHER","S21"),
        ("I","f4"),
        ("V","f4"),
        ("P_1","f4"),
        ("dP_1","f8"),
        ("T0_1","f4"),
        ("A_1","f4"),
        ("R21_1","f4"),
        ("phi21_1","f4"),
        ("R31_1","f4"),
        ("phi31_1","f4"),
        ("P_2","f4"),
        ("dP_2","f8"),
        ("T0_2","f4"),
        ("A_2","f4"),
        ("R21_2","f4"),
        ("phi21_2","f4"),
        ("R31_2","f4"),
        ("phi31_2","f4"),
        ("P_3","f4"),
        ("dP_3","f8"),
        ("T0_3","f4"),
        ("A_3","f4"),
        ("R21_3","f4"),
        ("phi21_3","f4"),
        ("R31_3","f4"),
        ("phi31_3","f4"),
        ("Remarks","S85")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.iloc[:-1].to_records(),dtype=dt_df) 


# destination folder
dst = path+"ogleIII_VariableStars.bin" 

# write to file
records.tofile(dst)