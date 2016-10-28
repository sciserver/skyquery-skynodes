# -*- coding: utf-8 -*-
"""
Created on Tue Nov 17 13:52:09 2015

@author: ebanyai
"""
from astropy.io.votable import parse
from pandas import DataFrame
import numpy as np

path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\DES\\"
src = path+"DES.vot"

votable = parse(src)
table = votable.get_first_table()

df = DataFrame(table.array.data)

df.replace(to_replace=np.nan,value=-9999,inplace=True)
df["seqID"] = df.index +1

types = [("seqID","i8"),
        ("dtpropid","S10"),
        ("surveyid","S24"),
        ("release_date","S10"),
        ("start_date","S10"),
        ("date_obs","S23"),
        ("dtpi","S7"),
        ("ra","f8"),
        ("dec","f8"),
        ("telescope","S4"),
        ("instrument","S5"),
        ("filter","S32"),
        ("exposure","f4"),
        ("obstype","S6"),
        ("obsmode","S7"),
        ("proctype","S7"),
        ("prodtype","S6"),
        ("seeing","f4"),
        ("depth","f4"),
        ("dtacqnam","S56"),
        ("archive_file","S34"),
        ("filesize","i8"),
        ("reference","S77"),
        ("md5sum","S32")]
        
dt_df = np.dtype(types)

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 

# destination folder
dst = path+"DES.bin" 

# write to file
records.tofile(dst)