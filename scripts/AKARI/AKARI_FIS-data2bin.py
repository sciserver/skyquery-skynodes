# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 14:29:54 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
src = "C:\\Data\\ebanyai\\project\\Skyquery-data\\AKARI\\AKARI-FIS_BSC_V1-20151002.txt.gz"
cols = ["OBJID","OBJNAME","RA","DEC","POSERRMJ","POSERRMI","POSERRPA",
        "FLUX65","FLUX90","FLUX140","FLUX160","FERR65","FERR90","FERR140","FERR160",
        "FQUAL65","FQUAL90","FQUAL140","FQUAL160","FLAGS65","FLAGS90","FLAGS140","FLAGS160",
        "NSCANC65","NSCANC90","NSCANC140","NSCANC160","NCSANP65","NSCANP90","NCSANP140","NSCANP160",
        "MCONF65","MCONF90","MCONF140","MCONF160","NDENS"]


# grab the data
df = pd.read_table(src,sep=" ",names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip")


# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("OBJID","i8"),
                  ("OBJNAME","S14"),
                  ("RA","f8"),
                  ("DEC","f8"),
                  ("POSERRMJ","f4"),
                  ("POSERRMI","f4"),
                  ("POSERRPA","f4"),
                  ("FLUX65","f4"),
                  ("FLUX90","f4"),
                  ("FLUX140","f4"),
                  ("FLUX160","f4"),
                  ("FERR65","f4"),
                  ("FERR90","f4"),
                  ("FERR140","f4"),
                  ("FERR160","f4"),
                  ("FQUAL65","i1"),
                  ("FQUAL90","i1"),
                  ("FQUAL140","i1"),
                  ("FQUAL160","i1"),
                  ("FLAGS65","S4"),
                  ("FLAGS90","S4"),
                  ("FLAGS140","S4"),
                  ("FLAGS160","S4"),
                  ("NSCANC65","i4"),
                  ("NSCANC90","i4"),
                  ("NSCANC140","i4"),
                  ("NSCANC160","i4"),
                  ("NSCANP65","i4"),
                  ("NSCANP90","i4"),
                  ("NSCANP140","i4"),
                  ("NSCANP160","i4"),
                  ("MCONF65","i2"),
                  ("MCONF90","i2"),
                  ("MCONF140","i2"),
                  ("MCONF160","i2"),
                  ("NDENS","i4")])
                    
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"C:\Data\ebanyai\project\Skyquery-data\akari\akari_fis.bin" 



# write to file
records.tofile(dst)
