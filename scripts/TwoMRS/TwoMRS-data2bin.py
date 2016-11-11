# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = r"\\skyquery01\Data\temp0\data0\ebanyai\TwoMRS\\"
src = path + "TwoMRS.tsv"

# grab the data
cols = ["ID","A","RA","DEC","GLON","GLAT","Kcmag","e_Kcmag","Hcmag",
        "e_Hcmag","Jcmag","e_Jcmag","Ktmag","e_Ktmag","Htmag","e_Htmag","Jtmag","e_Jtmag",
        "E(B-V)","Riso","Rext","b/a","flags","type","r_type","cz","e_cz","n_cz","r_cz","CAT",
        "2MX","Simbad","NED"]

df = pd.read_table(src,names=cols,index_col=False,sep="\t",skiprows=103,skipinitialspace=True)
df.replace(to_replace=np.nan, value=-99.,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("ID","S16"),
        ("A","S1"),
        ("RA","f8"),
        ("DEC","f8"),
        ("GLON","f8"),
        ("GLAT","f8"),
        ("Kcmag","f4"),
        ("e_Kcmag","f4"),
        ("Hcmag","f4"),
        ("e_Hcmag","f4"),
        ("Jcmag","f4"),
        ("e_Jcmag","f4"),
        ("Ktmag","f4"),
        ("e_Ktmag","f4"),
        ("Htmag","f4"),
        ("e_Htmag","f4"),
        ("Jtmag","f4"),
        ("e_Jtmag","f4"),
        ("E(B-V)","f4"),
        ("Riso","f4"),
        ("Rext","f4"),
        ("b/a","f4"),
        ("flags","S4"),
        ("type","S5"),
        ("r_type","S2"),
        ("bz","i4"),
        ("e_bz","i4"),
        ("n_bz","S1"),
        ("r_bz","S19"),
        ("CAT","S28")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"TwoMRS_SpecObj.bin" 

# write to file
records.tofile(dst)
