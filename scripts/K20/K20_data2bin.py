# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np
from astropy import units as u
from astropy.coordinates import SkyCoord

# source file:
src = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\K20\K20_VizieR.tsv"
cols = ["Seq","RAJ2000","DEJ2000","Ksmag","R-K","z","q_z","Class","FileName","Com"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=53,skipinitialspace=True)
coords = SkyCoord(df["RAJ2000"],df["DEJ2000"],unit=[u.hourangle,u.deg])
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg
df.fillna(value=-99,inplace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("Seq","S11"),
        ("RA","f8"),
        ("DEC","f8"),
        ("Ksmag","f4"),
        ("R-K","f4"),
        ("z","f4"),
        ("q_z","i2"),
        ("Class","S3"),
        ("FileName","S17"),
        ("Com","S12")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\K20\K20_SpecObj.bin" 



# write to file
records.tofile(dst)
