# -*- coding: utf-8 -*-
"""
Created on Wed Nov 18 10:10:05 2015

@author: ebanyai
"""
import pandas as pd
import numpy as np


path = r"\\SKYQUERY01\Data\temp0\data0\ebanyai\KIC\\"
src = path+"kic.txt.gz"

# LOAD DATA FILE
df = pd.read_table(src,sep="|",index_col=False,compression="gzip")

df.replace(to_replace=np.NaN, value=-9999,inplace=True)

df.rename(columns = {'kic_degree_ra':'RA','kic_dec':'DEC'}, inplace = True)
df["seqID"]= df.index+1

# DEFINE DATA TYPES FOR BINARY FORMAT
types = [("seqID","f8"),
        ("RA","f8"),    
        ("DEC","f8"),
        ("kic_pmra","f4"),
        ("kic_pmdec","f4"),
        ("kic_umag","f4"),
        ("kic_gmag","f4"),
        ("kic_rmag","f4"),
        ("kic_imag","f4"),
        ("kic_zmag","f4"),
        ("kic_gredmag","f4"),
        ("kic_d51mag","f4"),
        ("kic_jmag","f4"),
        ("kic_hmag","f4"),
        ("kic_kmag","f4"),
        ("kic_kepmag","f4"),
        ("kic_kepler_id","i8"),
        ("kic_tmid","i8"),
        ("kic_scpid","i8"),
        ("kic_altid","i8"),
        ("kic_altsource","i8"),
        ("kic_galaxy","i8"),
        ("kic_blend","i8"),
        ("kic_variable","i1"),
        ("kic_teff","f4"),
        ("kic_logg","f4"),
        ("kic_feh","f4"),
        ("kic_ebminusv","f4"),
        ("kic_av","f4"),
        ("kic_radius","f4"),
        ("kic_cq","S5"),
        ("kic_pq","i1"),
        ("kic_aq","i1"),
        ("kic_catkey","i8"),
        ("kic_scpkey","i8"),
        ("kic_parallax","f4"),
        ("kic_glon","f4"),
        ("kic_glat","f4"),
        ("kic_pmtotal","f4"),
        ("kic_grcolor","f4"),
        ("kic_jkcolor","f4"),
        ("kic_gkcolor","f4"),
        ("kic_fov_flag","i1"),
        ("kic_tm_designation","S17")]
        
dt_df = np.dtype(types)
           

# CREATE A NUMPY ARRAY WITH THE PROPER DATA TYPES & WRITE INTO FILE
# set datatypes for binary format
records = np.array(df.to_records(),dtype=dt_df) 


# destination folder
dst = path+"KIC.bin" 

# write to file
records.tofile(dst)