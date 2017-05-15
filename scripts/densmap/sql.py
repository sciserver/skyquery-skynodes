# -*- coding: utf-8 -*-
"""
Created on Tue May  9 05:23:37 2017

@author: ebanyai

This module contains functions for the Density map plots
"""
import pymssql
import numpy as np

def GetDensity(dbName,dbTable,level=8,isStat=False):
    dbStat = ""
    
    if (isStat):
        dbStat = "_STAT"
    
    sql = """
    DECLARE @level int = """+str(level)+""";
    DECLARE @bits int = POWER(2, 40 - 2 * @level);
    DECLARE @mask bigint = 0xFFFFFFFFFFFFFFFF * @bits;
     
    PRINT CAST(@mask AS binary(8));
     
    WITH density AS
    (
                    SELECT (htmid & @mask) / @bits AS htmid, COUNT(*) AS cnt
                    FROM SkyNode_"""+dbName+dbStat+".."+dbTable+"""
                    GROUP BY (htmid & @mask) / @bits
    )
    SELECT c.ra, c.dec, cnt / htmid.Area(htmid)
    FROM density
    CROSS APPLY htmid.GetCorners(htmid) c
    ORDER BY htmid
    """
    conn = pymssql.connect("skyquery01\mssql_a", "", "", "SkyQuery_CODE_dev")
    cursor = conn.cursor()
    cursor.execute(sql)
    arr = np.array(cursor.fetchall())
    conn.commit()
    print(arr.shape)
    return (arr[:,0], arr[:,1], arr[:,2])