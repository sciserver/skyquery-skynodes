# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
AGES to binary file
"""

import pandas as pd
import numpy as np
import astropy.units as u
from astropy.coordinates import SkyCoord

# LOAD DATA
# source file:
src = "C:\\Data\\ebanyai\\project\\Skyquery-data\\COMBO-17\\public_catalogue-20150923_combo.dat"
cols = ["objID","RAh","RAm","RAs","DEd","DEm","DEs","x_pos","y_pos",
        "Rmag","e_Rmag","Ap_Rmag","ApD_Rmag","mu_max","MajAxis","MinAxis","PA","phot_flag","var_flag","stellarity",
        "MC_class","MC_z",
        "e_MC_z","MC_z2","e_MC_z2","MC_z_ml","dl","chi2red","UjMag","e_UjMag","BjMag","e_BjMag",
        "VjMag","e_VjMag","usMag","e_usMag","gsMag","e_gsMag","rsMag","e_rsMag","UbMag","e_UbMag",
        "BbMag","e_BbMag","VbMag","e_VbMag","S280Mag","e_S280Mag","S145Mag","e_S145Mag",
        "W420F_E","e_W420F_E","W462F_E","e_W462F_E","W485F_D","e_W485F_D","W518F_E","e_W518F_E",
        "W571F_D","e_W571F_D","W571F_E","e_W571F_E","W571F_S","e_W571F_S","W604F_E","e_W604F_E",
        "W646F_D","e_W646F_D","W696F_E","e_W696F_E","W753F_E","e_W753F_E","W815F_E","e_W815F_E",
        "W815F_G","e_W815F_G","W815F_S","e_W815F_S","W856F_D","e_W856F_D","W914F_D","e_W914F_D",
        "W914F_E","e_W914F_E","UF_F","e_UF_F","UF_G","e_UF_G","UF_S","e_UF_S","BF_D","e_BF_D",
        "BF_F","e_BF_F","BF_S","e_BF_S","VF_D","e_VF_D","RF_D","e_RF_D","RF_E","e_RF_E",
        "RF_F","e_RF_F","RF_G","e_RF_G","RF_S","e_RF_S","IF_D","e_IF_D"]



byte = [1, 7,10,13,20,24,27,33,41,49,56,62,69,77,84,91,98,104,109,111,117,
        133,139,145,151,157,163,171,179,186,192,199,207,214,222,229,235,242,250,
        257,265,272,278,285,293,300,308,315,322,329,334,345,356,367,378,389,400,
        411,422,433,444,455,466,477,488,499,510,521,532,543,554,565,576,587,598,
        609,620,631,642,653,664,675,686,697,708,719,730,741,752,763,774,785,796,
        807,818,829,840,851,862,873,884,895,906,917,928, 939,950,961,972,983,994]

ad = []
with open(src) as f:
    for line in f:
        row = []
        for i in range(len(byte)-1):
            row.append(line[(byte[i]-1):(byte[i+1]-2)])
    
        ad.append(row)
        

ad = np.array(ad).T

df = pd.DataFrame()
for name,data_col in zip(cols,ad):
    df[name] = data_col
    

coords = SkyCoord(ra=(df["RAh"]+" "+df["RAm"]+" "+df["RAs"]),dec=(df["DEd"]+" "+df["DEm"]+" "+df["DEs"]),unit=(u.hourangle,u.deg))
df["RA"],df["DEC"] = coords.ra.deg, coords.dec.deg

df.replace(to_replace="^\s+$",value=-9999,regex=True,inplace=True)
# grab the data

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("RA","f8"),
        ("DEC","f8"),
        ("x_pos","f8"),
        ("y_pos","f8"),
        ("Rmag","f4"),
        ("e_Rmag","f4"),
        ("Ap_Rmag","f4"),
        ("ApD_Rmag","f4"),
        ("mu_max","f4"),
        ("MajAxis","f4"),
        ("MinAxis","f4"),
        ("PA","f4"),
        ("phot_flag","i4"),
        ("var_flag","i1"),
        ("stellarity","f4"),
        ("MC_class","S15"),
        ("MC_z","f4"),
        ("e_MC_z","f4"),
        ("MC_z2","f4"),
        ("e_MC_z2","f4"),
        ("MC_z_ml","f4"),
        ("dl","f4"),
        ("chi2red","f4"),
        ("UjMag","f4"),
        ("e_UjMag","f4"),
        ("BjMag","f4"),
        ("e_BjMag","f4"),
        ("VjMag","f4"),
        ("e_VjMag","f4"),
        ("usMag","f4"),
        ("e_usMag","f4"),
        ("gsMag","f4"),
        ("e_gsMag","f4"),
        ("rsMag","f4"),
        ("e_rsMag","f4"),
        ("UbMag","f4"),
        ("e_UbMag","f4"),
        ("BbMag","f4"),
        ("e_BbMag","f4"),
        ("VbMag","f4"),
        ("e_VbMag","f4"),
        ("S280Mag","f4"),
        ("e_S280Mag","f4"),
        ("S145Mag","f4"),
        ("e_S145Mag","f4"),
        ("W420F_E","f8"),
        ("e_W420F_E","f8"),
        ("W462F_E","f8"),
        ("e_W462F_E","f8"),
        ("W485F_D","f8"),
        ("e_W485F_D","f8"),
        ("W518F_E","f8"),
        ("e_W518F_E","f8"),
        ("W571F_D","f8"),
        ("e_W571F_D","f8"),
        ("W571F_E","f8"),
        ("e_W571F_E","f8"),
        ("W571F_S","f8"),
        ("e_W571F_S","f8"),
        ("W604F_E","f8"),
        ("e_W604F_E","f8"),
        ("W646F_D","f8"),
        ("e_W646F_D","f8"),
        ("W696F_E","f8"),
        ("e_W696F_E","f8"),
        ("W753F_E","f8"),
        ("e_W753F_E","f8"),
        ("W815F_E","f8"),
        ("e_W815F_E","f8"),
        ("W815F_G","f8"),
        ("e_W815F_G","f8"),
        ("W815F_S","f8"),
        ("e_W815F_S","f8"),
        ("W856F_D","f8"),
        ("e_W856F_D","f8"),
        ("W914F_D","f8"),
        ("e_W914F_D","f8"),
        ("W914F_E","f8"),
        ("e_W914F_E","f8"),
        ("UF_F","f8"),
        ("e_UF_F","f8"),
        ("UF_G","f8"),
        ("e_UF_G","f8"),
        ("UF_S","f8"),
        ("e_UF_S","f8"),
        ("BF_D","f8"),
        ("e_BF_D","f8"),
        ("BF_F","f8"),
        ("e_BF_F","f8"),
        ("BF_S","f8"),
        ("e_BF_S","f8"),
        ("VF_D","f8"),
        ("e_VF_D","f8"),
        ("RF_D","f8"),
        ("e_RF_D","f8"),
        ("RF_E","f8"),
        ("e_RF_E","f8"),
        ("RF_F","f8"),
        ("e_RF_F","f8"),
        ("RF_G","f8"),
        ("e_RF_G","f8"),
        ("RF_S","f8"),
        ("e_RF_S","f8"),
        ("IF_D","f8"),
        ("e_IF_D","f8")]
                
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=np.dtype(types)) 

# destination folder
dst = r"C:\Data\ebanyai\project\Skyquery-data\COMBO-17\combo17.bin" 

# write to file
records.tofile(dst)
