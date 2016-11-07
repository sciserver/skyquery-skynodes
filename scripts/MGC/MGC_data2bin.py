# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np


# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\MGC\\"
src = path+"mgc.tsv"
cols = ["MGC","MGCFN","CCD","Xpos","Ypos","RA","DEC","a","b","PA","HLRad",
        "FWHM","Bkgrnd","Bmag","Bmagc","Bmu","Qual","Stel","Class","xReg","NSDSS",
        "SDSSid","SDSSrun","SDSSrun2","SDSScam","SDSSfld","RA1deg","DE1deg",
        "psfUmag","psfGmag","psfRmag","psfImag","psfZmag","petUmag","petGmag",
        "petRmag","petImag","petZmag","modUmag","modGmag","modRmag","modImag",
        "modZmag","galUext","galGext","galRext","galIext","galZext","R50U","R50G",
        "R50R","R50I","R50Z","MType","Class1","SpClass","Class2","N2dFGRS","twodFGRS",
        "ID2dFGRS","RA2deg","DE2deg","UKST","bJmag","bJmagc","bJmagS","RmagS",
        "Class3","Class4","twoQZ","RA3deg","DE3deg","UKST2qz","bJmag2","U-bJ",
        "bJ-R","Ext_B-V","N2qz","T2qz","Class5","NNED","NEDname","RA4deg",
        "DE4deg","NEDID","Class6","PFr","RA5deg","DE5deg","Rmag","Kmag","J-K",
        "LSBG","RA6deg","DE6deg","BTOT","SuBr","SuBreff","Reff","z1","q_z1",
        "z2","q_z2","z3","q_z3","z4","q_z4","z5","q_z5","z6","q_z6","z7","q_z7",
        "r_z","z","q_z","Nsp","FITS"]


# grab the data
df = pd.read_table(src,names=cols,index_col=False,skiprows=278,skipinitialspace=True)
df.fillna(value=-99,inplace=True)
df[["SDSSid","twodFGRS","twoQZ","T2qz","NEDname","NEDID", "PFr","LSBG","r_z"]] = df[["SDSSid","twodFGRS","twoQZ","T2qz","NEDname","NEDID", "PFr","LSBG","r_z"]].replace(to_replace=[-99],value="")


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("MGC","i8"),
        ("MGCFN","i4"),
        ("CCD","i1"),
        ("Xpos","f4"),
        ("Ypos","f4"),
        ("RA","f8"),
        ("DEC","f8"),
        ("a","f4"),
        ("b","f4"),
        ("PA","f4"),
        ("HLRad","f4"),
        ("FWHM","f4"),
        ("Bkgrnd","f4"),
        ("Bmag","f4"),
        ("Bmagc","f4"),
        ("Bmu","f4"),
        ("Qual","i1"),
        ("Stel","f4"),
        ("Class","i2"),
        ("xReg","i1"),
        ("NSDSS","i2"),
        ("SDSSid","S18"),
        ("SDSSrun","i4"),
        ("SDSSrun2","i2"),
        ("SDSScam","i1"),
        ("SDSSfld","i4"),
        ("RA1deg","f8"),
        ("DE1deg","f8"),
        ("psfUmag","f4"),
        ("psfGmag","f4"),
        ("psfRmag","f4"),
        ("psfImag","f4"),
        ("psfZmag","f4"),
        ("petUmag","f4"),
        ("petGmag","f4"),
        ("petRmag","f4"),
        ("petImag","f4"),
        ("petZmag","f4"),
        ("modUmag","f4"),
        ("modGmag","f4"),
        ("modRmag","f4"),
        ("modImag","f4"),
        ("modZmag","f4"),
        ("galUext","f4"),
        ("galGext","f4"),
        ("galRext","f4"),
        ("galIext","f4"),
        ("galZext","f4"),
        ("R50U","f4"),
        ("R50G","f4"),
        ("R50R","f4"),
        ("R50I","f4"),
        ("R50Z","f4"),
        ("MType","i1"),
        ("Class1","i2"),
        ("SpClass","i1"),
        ("Class2","i2"),
        ("N2dFGRS","i1"),
        ("twodFGRS","S10"),
        ("ID2dFGRS","i8"),
        ("RA2deg","f8"),
        ("DE2deg","f8"),
        ("UKST","i4"),
        ("bJmag","f4"),
        ("bJmagc","f4"),
        ("bJmagS","f4"),
        ("RmagS","f4"),
        ("Class3","i1"),
        ("Class4","i1"),
        ("twoQZ","S16"),
        ("RA3deg","f8"),
        ("DE3deg","f8"),
        ("UKST2qz","i4"),
        ("bJmag2","f4"),
        ("U-bJ","f4"),
        ("bJ-R","f4"),
        ("Ext_B-V","f4"),
        ("N2qz","i1"),
        ("T2qz","S10"),
        ("Class5","i1"),
        ("NNED","i1"),
        ("NEDname","S30"),
        ("RA4deg","f8"),
        ("DE4deg","f8"),
        ("NEDID","S3"),
        ("Class6","i1"),
        ("PFr","S7"),
        ("RA5deg","f8"),
        ("DE5deg","f8"),
        ("Rmag","f4"),
        ("Kmag","f4"),
        ("J-K","f4"),
        ("LSBG","S12"),
        ("RA6deg","f8"),
        ("DE6deg","f8"),
        ("BTOT","f4"),
        ("SuBr","f4"),
        ("SuBreff","f4"),
        ("Reff","f4"),
        ("z1","f8"),
        ("q_z1","i1"),
        ("z2","f8"),
        ("q_z2","i1"),
        ("z3","f8"),
        ("q_z3","i1"),
        ("z4","f8"),
        ("q_z4","i1"),
        ("z5","f8"),
        ("q_z5","i1"),
        ("z6","f8"),
        ("q_z6","i1"),
        ("z7","f8"),
        ("q_z7","i1"),
        ("r_z","S8"),
        ("z","f8"),
        ("q_z","i1"),
        ("Nsp","i1")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"mgc.bin" 

# write to file
records.tofile(dst)