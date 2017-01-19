# -*- coding: utf-8 -*-
"""
Created on Mon Nov 14 05:20:10 2016

@author: ebanyai
FAST CREATE PRELIMINARY SQL FILES
"""

import json
from os.path import isfile

#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

dbName = "TwoRXS"

spath = r"\\skyquery01\Data\temp0\data0\ebanyai\\"+dbName+"\\"
dpath = r"C:\Data\ebanyai\project\skyquery-all-v1.2\skyquery-skynodes\sql\\"+dbName+"\\"


tableName = "SourceObj"
fileName = spath+dbName+"_"+tableName+".bin"
dst = dpath+dbName+"_"+tableName+".sql"
primary_key = "IAU_NAME"
sName = spath+dbName+"_"+tableName+".jdict"


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

def rp(string):
    return string.replace(".","p").replace(" ","_").replace("-","_").replace("(","_").replace(")","").replace("/","p")

def get_description(dtypes,fName):
    if not isfile(fName):
        s_dict = {}

        for col in dtypes:
            desc = input("Descripton of "+col[0]+"? ")
            unit = input("Unit of "+col[0]+"? ")
            s_dict[col[0]] = [desc,unit]
        try:
            with open(fName,"w", encoding='utf-8') as f:
                json.dump(s_dict, f,indent=1)
            return s_dict
        except Exception as e:
            print(e)
            return s_dict
    else: 
        s_dict = json.load(open(fName), encoding='utf-8')
        return s_dict

def correction(colName,types=types):
    dDict = get_description(types,sName)
    desc = input("Description of "+colName+"? ")  
    unit = input("Unit of "+colName+"? ")
    dDict[colName] = [desc,unit]
    with open(sName,"w", encoding='utf-8') as f:
        json.dump(dDict, f,indent=1)

def sum_formatter(string):
    string = string.replace("\n", " \n\t--/ ")
    string = string.replace("<","&lt;")
    string = string.replace(">","&gt;")
    split_string = string.split(" ")
    new_string = "\n\t--/ <summary> "
    c = 0
    for s,i in zip(split_string,range(len(split_string))):
        c += len(s)    
        
        if "\n" in s:
            c = 0
        
        if c > 100:
            c = 0
            new_string += "\n\t--/ "
        else:
            new_string += s+" "
            
        if i == len(split_string)-1:
            new_string += "</summary>\n"
            
    
    return new_string


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

# dictionary for converting np.dtypes to sql types
type_dict = {"i8":"bigint",
             "i4":"int",
             "i2":"smallint",
             "i1":"tinyint",
             "f8":"float",
             "f4":"real"}

# include string variants
for i in range(1,91):
    type_dict["S"+str(i)] = "char("+str(i)+")"
    


# az én csodálatos életkönnyítőm :D 
def sqlCreator(dbName,tableName,fileName,dtypes,dest_folder,primary_key,description):
    with open(dest_folder,"w",encoding='utf-8') as f:
        f.write("USE [SkyNode_"+dbName+"]\n")
        f.write("\nGO\n\n")
        
        f.write("IF OBJECT_ID ('dbo."+tableName+"RAW', 'U') IS NOT NULL\n")
        f.write("\tDROP TABLE dbo."+tableName+"RAW;\n")
        f.write("\nGO\n\n")
        
        f.write("-- CREATE "+tableName+"RAW TABLE\n")
        
        f.write("CREATE TABLE dbo."+tableName+"RAW\n")
        f.write("(")
        
        for col in dtypes:
        	f.write("\t["+rp(col[0])+"] "+type_dict[col[1]]+" NOT NULL,\n")
        
        	
        f.write("\n\tCONSTRAINT [PK_"+tableName+"RAW] PRIMARY KEY CLUSTERED\n") 
        f.write("(\n")
        f.write("\t["+primary_key+"] ASC\n")
        f.write(") WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]\n")
        f.write(") ON [PRIMARY]\n")
        
        f.write("\nGO\n")
        
        f.write("\n-- BULK INSERT DATA\n")
        
        f.write("BULK INSERT\n") 
        f.write("\t"+tableName+"RAW\n")
        f.write("\tFROM '"+fileName+"'\n")
        f.write("\tWITH\n") 
        f.write("\t(\n")
        f.write("\t\tDATAFILETYPE = 'native',\n")
        f.write("\t\tTABLOCK\n") 
        f.write("\t)\n")
        
        f.write("\nGO\n\n")
        
        f.write("IF OBJECT_ID ('dbo."+tableName+"', 'U') IS NOT NULL\n")
        f.write("\tDROP TABLE dbo."+tableName+";\n")
        
        f.write("\nGO\n\n")
        
        f.write("-- CREATE "+tableName+" TABLE\n")
        
        f.write("CREATE TABLE dbo."+tableName+"\n") 
        f.write("(\n")
        
        f.write("\t--/ <summary> Cartesian X (J2000)</summary>\n")
        f.write("\t[cx] [float] NOT NULL,\n\n")
        f.write("\t--/ <summary> Cartesian Y (J2000)</summary>\n")
        f.write("\t[cy] [float] NOT NULL,\n\n")
        f.write("\t--/ <summary> Cartesian Z (J2000)</summary>\n")
        f.write("\t[cz] [float] NOT NULL,\n\n")
        f.write("\t--/ <summary> HTM ID (J2000)</summary>\n")
        f.write("\t[htmid] bigint NOT NULL,\n\n")
        f.write("\t--/ <summary> Zone ID (J2000)</summary>\n")
        f.write("\t[zoneid] int NOT NULL,\n")
        
            
        for col in dtypes:
            
            f.write(sum_formatter(description[col[0]][0]))
            if description[col[0]][1]:
                f.write("\t--/ <unit> "+ description[col[0]][1] +" </unit>\n")
            f.write("\t["+rp(col[0])+"] "+type_dict[col[1]]+" NOT NULL,\n")
        
        f.write("\n\tCONSTRAINT [PK_"+tableName+"] PRIMARY KEY CLUSTERED\n") 
        f.write("(\n")
        f.write("\t["+primary_key+"] ASC\n")
        f.write(")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]\n")
        f.write(") ON [PRIMARY]\n")
        
        f.write("\nGO\n\n")
        
        f.write("-- INSERT DATA + CREATE HTMID, CX, CY, CZ\n")
        
        f.write("INSERT dbo."+tableName+" WITH (TABLOCKX)\n")
        
        
        f.write("( cx, cy, cz, htmid, zoneid, ")
        for col,i in zip(dtypes,range(len(dtypes))):
            if i == len(dtypes)-1:
                f.write(rp(col[0]))
            else: 
                f.write(rp(col[0])+", ")
        f.write(")\n")
        f.write("SELECT c.x AS  cx, c.y AS cy, c.z AS cz, SkyQuery_CODE_dev.htmid.FromXyz(c.x,c.y,c.z) AS htmid, ")
        f.write("SkyQuery_CODE_dev.skyquery.ZoneIDFromDec(dec,4.0/3600.00000000) as zoneid, ")
        for col,i in zip(dtypes,range(len(dtypes))):
            if i == len(dtypes)-1:
                if col[0].lower() == "x" or col[0].lower() == "y" or col[0].lower() == "z" or col[0].lower() == "i":
                    f.write(tableName+"RAW."+rp(col[0]))
                else:
                    f.write(rp(col[0]))
            else:
                if col[0].lower() == "x" or col[0].lower() == "y" or col[0].lower() == "z" or col[0].lower() == "i":
                    f.write(tableName+"RAW."+rp(col[0])+", ")
                else:
                    f.write(rp(col[0])+", ")
        
        f.write("\nFROM dbo."+tableName+"RAW\n")
        f.write("CROSS APPLY SkyQuery_CODE_dev.point.EqToXyz(ra, dec) AS c\n")
        
        f.write("\nGO\n\n")        
        
        f.write("-- DROP RAW TABLE\n")
        f.write("DROP TABLE dbo."+tableName+"RAW;\n")
        f.write("GO\n\n")
        
        f.write("-- Spatial index\n")
        f.write("CREATE NONCLUSTERED INDEX [IX_"+tableName+"_Zone] ON [dbo].["+tableName+"] \n")
        f.write("(\n")
        f.write("\t[dec] ASC\n")
        f.write(")\n")
        f.write("INCLUDE\n")
        f.write("(\n")
        f.write("\t[ra],\n")
        f.write("\t[cx],\n")
        f.write("\t[cy],\n")
        f.write("\t[cz]\n")
        f.write(")\n")
        f.write("WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)\n")
        f.write("ON [PRIMARY]\n")
        f.write("GO\n\n")
        
        f.write("CREATE NONCLUSTERED INDEX [IX_"+tableName+"_ZoneID] ON [dbo].["+tableName+"] \n")
        f.write("(\n")
        f.write("\t[zoneid] ASC,\n")
        f.write("\t[ra] ASC\n")
        f.write(")\n")
        f.write("INCLUDE\n")
        f.write("(\n")
        f.write("\t[dec],\n")
        f.write("\t[cx],\n")
        f.write("\t[cy],\n")
        f.write("\t[cz]\n")
        f.write(")\n")
        f.write("WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)\n")
        f.write("ON [PRIMARY]\n")
        f.write("GO\n\n")
        
        f.write("-- HTM index\n")
        f.write("CREATE NONCLUSTERED INDEX [IX_"+tableName+"_HtmID] ON [dbo].["+tableName+"] \n")
        f.write("(\n")
        f.write("\t[htmid] ASC\n")
        f.write(")\n")
        f.write("INCLUDE\n")
        f.write("(\n")
        f.write("\t[ra],\n")
        f.write("\t[dec],\n")
        f.write("\t[cx],\n")
        f.write("\t[cy],\n")
        f.write("\t[cz],\n")
        f.write("\t[zoneID]\n")
        f.write(")\n")
        f.write("WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)\n")
        f.write("ON [PRIMARY]\n")
        f.write("GO")
    



# it needs the tpyes from the bin creator script
desc = get_description(types,sName)
sqlCreator(dbName,tableName,fileName,types,dst,primary_key,desc)

