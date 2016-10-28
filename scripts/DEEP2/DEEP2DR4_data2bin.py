# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 12:09:37 2015

@author: ebanyai
"""

import pandas as pd
import numpy as np

# LOAD DATA

# convert from HH:MM:SS.s DD:MM:SS.s

def hmsdms2dd(ra,dec):
   i=0
   newRa, newDec = np.array(np.zeros(len(ra))),np.array(np.zeros(len(dec)))
   for item in ra:
      newRa[i] = (int(item[0:2])+ int(item[3:5])/60.+ float(item[6:])/3600.)*15
      i+=1
   i=0
   for item in dec:
      if int(item[0:3]) < 0:
          newDec[i] = int(item[0:3]) - int(item[4:6])/60. - float(item[7:]) /3600.
      else: 
          newDec[i] = int(item[0:3]) + int(item[4:6])/60. + float(item[7:]) /3600.
      i+=1
   return newRa.astype(np.float), newDec.astype(np.float)


# source file:
src = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\DEEP2\zcat.deep2.dr4.uniq.ascii"
cols = ["objID","RA","DEC","MAGB","MAGR","MAGI","MAGBERR","MAGRERR","MAGIERR","RG","E2","PA",
        "PGAL","SFD_EBV","M_B","U_B","OBJNAME","MASK","SLIT","DATE","MJD","SLITRA","SLITDEC",
        "SLITLEN","SLITPA","Z","ZBEST","ZERR","ZQUALITY","CLASS","SUBCLASS","RCHI2","DOF",
        "VDISP","VDISPERR","COMMENT"]




# grab the data
df = pd.read_table(src,names=cols,index_col=False,sep=" ",comment="#",skipinitialspace=True)

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("objID",'i8'),
        ("RA",'f8'),
        ("DEC",'f8'),
        ("MAGB",'f4'),
        ("MAGR",'f4'),
        ("MAGI",'f4'),
        ("MAGBERR",'f4'),
        ("MAGRERR",'f4'),
        ("MAGIERR",'f4'),
        ("RG",'f4'),
        ("E2",'f4'),
        ("PA",'f4'),
        ("PGAL",'f4'),
        ("SFD_EBV",'f4'),
        ("M_B",'f4'),
        ("U_B",'f4'),
        ("OBJNAME",'i8'),
        ("MASK",'i8'),
        ("SLIT",'i8'),
        ("DATE",'S10'),
        ("MJD",'f4'),
        ("SLITRA",'f4'),
        ("SLITDEC",'f4'),
        ("SLITLEN",'f4'),
        ("SLITPA",'f4'),
        ("Z",'f4'),
        ("ZBEST",'f4'),
        ("ZERR",'f4'),
        ("ZQUALITY",'i4'),
        ("CLASS",'S6'),
        ("SUBCLASS",'S6'),
        ("RCHI2",'f4'),
        ("DOF",'i8'),
        ("VDISP",'f4'),
        ("VDISPERR",'f4'),
        ("COMMENT",'S43')]
                
  

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=np.dtype(types)) 

# destination folder
dst = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\DEEP2\DEEP2.bin" 



# write to file
records.tofile(dst)
