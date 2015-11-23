# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\2SLAQ\\"
src = path + "2SLAQ-20150923_VizieR.tsv"

# grab the data
cols = ["Name","n_Name","Pr","Run","Rerun","Camcol","Field","ID","umag","e_umag",
        "gmag","e_gmag","rmag","e_rmag","imag","e_imag","zmag","e_zmag","ured",
        "gred","rred","ired","zred","S/G","Cl","zem_S","q_zem_S","ID_S","bj",
        "zem2q","q_zem2q","ID2q","q_ID2q","TwoQZ","z2S","q_z2S","ID2S","q_ID2S",
        "Date","Fl2S","Fb2S","S/N","dmag","FX","F1.4","n_F1.4","Com","DR7","SDSS",
        "RA","DEC"]

df = pd.read_table(src,names=cols,index_col=False,sep="\t",skiprows=140,skipinitialspace=True)
df.replace(to_replace=np.nan, value=-99.,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("Name","S19"),
        ("n_Name","S1"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Pr","i1"),
        ("Run","i4"),
        ("Rerun","i2"),
        ("Camcol","i1"),
        ("Field","i4"),
        ("ID","i4"),
        ("umag","f4"),
        ("e_umag","f4"),
        ("gmag","f4"),
        ("e_gmag","f4"),
        ("rmag","f4"),
        ("e_rmag","f4"),
        ("imag","f4"),
        ("e_imag","f4"),
        ("zmag","f4"),
        ("e_zmag","f4"),
        ("ured","f4"),
        ("gred","f4"),
        ("rred","f4"),
        ("ired","f4"),
        ("zred","f4"),
        ("S/G","f4"),
        ("Cl","i1"),
        ("zem_S","f4"),
        ("q_zem_S","f4"),
        ("ID_S","S9"),
        ("bj","f4"),
        ("zem2q","f4"),
        ("q_zem2q","i1"),
        ("ID2q","S9"),
        ("q_ID2q","i1"),
        ("TwoQZ","S17"),
        ("z2S","f4"),
        ("q_z2S","i1"),
        ("ID2S","S10"),
        ("q_ID2S","i1"),
        ("Date","S10"),
        ("Fl2S","S3"),
        ("Fb2S","i2"),
        ("S/N","f4"),
        ("dmag","f4"),
        ("FX","f4"),
        ("F1.4","f4"),
        ("n_F1.4","i1"),
        ("Com","S20")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"TwoSLAQ_SpecObj.bin" 

# write to file
records.tofile(dst)
