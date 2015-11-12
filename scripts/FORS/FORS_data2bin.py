# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
AGES to binary file
"""

import pandas as pd
import numpy as np
from astropy.coordinates import SkyCoord
from astropy import units as u

# LOAD DATA
# source file:
path = "C:\\Data\\ebanyai\\project\\Skyquery-data\\FORS_DeepField\\"
src = path+"FORS-20150923_VizieR.tsv"
cols = ["objID","RAJ2000","DEJ2000","BTmag","ITmag","Texp","ff0","SN","n_SN","Qs","Type","z","e_z","e_Type","q_z","Notes","FileName","Phot"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=70,skipinitialspace=True)

# convert sky coordinates to degree
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],unit=[u.hourangle,u.deg])
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.fillna(value=-99,inplace=True)


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [('objID','i8'),
        ('RA','f8'),
        ('DEC','f8'),
        ('BTmag','f4'),
        ('ITmag','f4'),
        ('Texp','i4'),
        ('ff0','i4'),
        ('SN','f4'),
        ('n_SN','S1'),
        ('Qs','i1'),
        ('Type','i1'),
        ('z','f4'),
        ('e_z','f4'),
        ('e_Type','i4'),
        ('q_z','i1'),
        ('Notes','S20'),
        ('FileName','S7')]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"fors.bin" 

# write to file
records.tofile(dst)
