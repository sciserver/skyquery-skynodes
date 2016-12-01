# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\HERSCHEL\\"
src = path+"goods-updp-irsa-north_DR1.tbl"
cols = ["IAU_name","id","ra","dec","f3p6","err3p6","flag3p6","f4p5","err4p5",
        "flag4p5","f5p8","err5p8","flag5p8","f8p0","err8p0","flag8p0","f24","err24_ima",
        "err24_sim","cov24","f70","err70_ima","err70_sim","cov70","f100","err100_ima",
        "err100_sim","cov100","f160","err160_ima","err160_sim","cov160","f250","err250_ima",
        "err250_sim","cov250","f350","err350_ima","err350_sim","cov350","f500","err500_ima",
        "err500_sim","cov500","clean_index"]


# grab the data
# NORTH
df = pd.read_table(src,names=cols,index_col=False,skiprows=103,skipinitialspace=True,sep=" ")

df.fillna(value=-99,inplace=True)
df["objID"] = df.index+1


# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID","i8"),
        ("IAU_name","S25"),
        ("ra","f8"),
        ("dec","f8"),
        ("f3p6","f4"),
        ("err3p6","f4"),
        ("flag3p6","i4"),
        ("f4p5","f4"),
        ("err4p5","f4"),
        ("flag4p5","i4"),
        ("f5p8","f4"),
        ("err5p8","f4"),
        ("flag5p8","i4"),
        ("f8p0","f4"),
        ("err8p0","f4"),
        ("flag8p0","i4"),
        ("f24","f4"),
        ("err24_ima","f4"),
        ("err24_sim","f4"),
        ("cov24","f4"),
        ("f70","f4"),
        ("err70_ima","f4"),
        ("err70_sim","f4"),
        ("cov70","f4"),
        ("f100","f4"),
        ("err100_ima","f4"),
        ("err100_sim","f4"),
        ("cov100","f4"),
        ("f160","f4"),
        ("err160_ima","f4"),
        ("err160_sim","f4"),
        ("cov160","f4"),
        ("f250","f4"),
        ("err250_ima","f4"),
        ("err250_sim","f4"),
        ("cov250","f4"),
        ("f350","f4"),
        ("err350_ima","f4"),
        ("err350_sim","f4"),
        ("cov350","f4"),
        ("f500","f4"),
        ("err500_ima","f4"),
        ("err500_sim","f4"),
        ("cov500","f4"),
        ("clean_index","i4")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"HERSCHEL_goodsNorth.bin" 


# write to file
records.tofile(dst)
