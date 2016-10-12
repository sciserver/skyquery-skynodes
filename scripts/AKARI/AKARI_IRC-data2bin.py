# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 14:29:54 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# source file:
src = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\AKARI\\AKARI-IRC_PSC_V1.txt.gz"
cols = ["OBJID","OBJNAME","RA","DEC","POSERRMJ","POSERRMI","POSERRPA","FLUX09","FLUX18",
        "FERR09","FERR18","FQUAL09","FQUAL18","FLAGS09","FLAGS18","NSCANC09","NSCANC18",
        "NCSANP09","NSCANP18","MCONF09","MCONF18","NDENS09","NDENS18","EXTENDED09","EXTENDED18",
        "MEAN_AB09","MEAN_AB18","NDATA_POS","NDATA09","NDATA18"]


# load data
df = pd.read_table(src,sep=" ",names=cols,index_col=False,comment="#",skipinitialspace=True,compression="gzip")


# DEFINE DATA TYPES FOR BINARY FORMAT
dt_df = np.dtype([("OBJID","i8"),
                  ("OBJNAME","S14"),
                  ("RA","f8"),
                  ("DEC","f8"),
                  ("POSERRMJ","f4"),
                  ("POSERRMI","f4"),
                  ("POSERRPA","f4"),
                  ("FLUX09","f4"),
                  ("FLUX18","f4"),
                  ("FERR09","f4"),
                  ("FERR18","f4"),
                  ("FQUAL09","i1"),
                  ("FQUAL18","i1"),
                  ("FLAGS09","S4"),
                  ("FLAGS18","S4"),
                  ("NSCANC09","i4"),
                  ("NSCANC18","i4"),
                  ("NSCANP09","i4"),
                  ("NSCANP18","i4"),
                  ("MCONF09","i2"),
                  ("MCONF18","i2"),
                  ("NDENS09","i4"),
                  ("NDENS18","i4"),
                  ("EXTENDED09","i2"),
                  ("EXTENDED18","i2"),
                  ("MEAN_AB09","f4"),
                  ("MEAN_AB18","f4"),
                  ("NDATA_POS","i4"),
                  ("NDATA09","i4"),
                  ("NDATA18","i4")])
                    
# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\AKARI\akari_irc.bin" 



# write to file
records.tofile(dst)
