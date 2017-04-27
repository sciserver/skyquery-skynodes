-- SUBSAMPLING TABLE 'CatalogA' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[CatalogA] WITH (TABLOCKX)
    ([objId], [ra], [dec], [astroErr], [cx], [cy], [cz], [htmId], [zoneId], [mag_1], [mag_2], [mag_3])
 SELECT sourcetablealias.[objId], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[astroErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[mag_3]
 FROM   [SkyNode_TEST].[dbo].[CatalogA] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'CatalogB' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[CatalogB] WITH (TABLOCKX)
    ([objId], [ra], [dec], [astroErr], [cx], [cy], [cz], [htmId], [zoneId], [mag_1], [mag_2], [mag_3])
 SELECT sourcetablealias.[objId], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[astroErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[mag_3]
 FROM   [SkyNode_TEST].[dbo].[CatalogB] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'CatalogC' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[CatalogC] WITH (TABLOCKX)
    ([objId], [ra], [dec], [astroErr], [cx], [cy], [cz], [htmId], [zoneId], [mag_1], [mag_2], [mag_3])
 SELECT sourcetablealias.[objId], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[astroErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[mag_3]
 FROM   [SkyNode_TEST].[dbo].[CatalogC] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'CatalogD' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[CatalogD] WITH (TABLOCKX)
    ([objId], [ra], [dec], [astroErr], [cx], [cy], [cz], [htmId], [zoneId], [mag_1], [mag_2], [mag_3])
 SELECT sourcetablealias.[objId], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[astroErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[mag_3]
 FROM   [SkyNode_TEST].[dbo].[CatalogD] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'CatalogWithNoPrimaryKey' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[CatalogWithNoPrimaryKey] WITH (TABLOCKX)
    ([objId], [ra], [dec], [astroErr], [cx], [cy], [cz], [htmId], [zoneId], [mag_1], [mag_2], [mag_3])
 SELECT sourcetablealias.[objId], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[astroErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[mag_1], sourcetablealias.[mag_2], sourcetablealias.[mag_3]
 FROM   [SkyNode_TEST].[dbo].[CatalogWithNoPrimaryKey] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'GalexPhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objId] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objId], master.dbo.RandomDouble() AS randomnumber
	FROM [SkyNode_TEST].[dbo].[GalexPhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objId]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_TEST_STAT].[dbo].[GalexPhotoObjAll] WITH (TABLOCKX)
	([objId], [mode], [ra], [dec], [cx], [cy], [cz], [htmId], [zoneId], [nuv_mag], [fuv_mag])
 SELECT sourcetablealias.[objId], sourcetablealias.[mode], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[nuv_mag], sourcetablealias.[fuv_mag]
 FROM   [SkyNode_TEST].[dbo].[GalexPhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objId = sourcetablealias.objId
	;


GO

-- SUBSAMPLING TABLE 'SampleData' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData] WITH (TABLOCKX)
    ([float], [double], [decimal], [nvarchar(50)], [bigint], [int], [tinyint], [smallint], [bit], [ntext], [char], [datetime], [guid])
 SELECT sourcetablealias.[float], sourcetablealias.[double], sourcetablealias.[decimal], sourcetablealias.[nvarchar(50)], sourcetablealias.[bigint], sourcetablealias.[int], sourcetablealias.[tinyint], sourcetablealias.[smallint], sourcetablealias.[bit], sourcetablealias.[ntext], sourcetablealias.[char], sourcetablealias.[datetime], sourcetablealias.[guid]
 FROM   [SkyNode_TEST].[dbo].[SampleData] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_AllPrecision' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_AllPrecision] WITH (TABLOCKX)
    ([Decimal_01], [Decimal_02], [Decimal_38], [DateTime2_0], [DateTime2_1], [DateTime2_2], [DateTime2_3], [DateTime2_4], [DateTime2_5], [DateTime2_6], [DateTime2_7], [DateTimeOffset_0], [DateTimeOffset_1], [DateTimeOffset_2], [DateTimeOffset_3], [DateTimeOffset_4], [DateTimeOffset_5], [DateTimeOffset_6], [DateTimeOffset_7], [Time_0], [Time_1], [Time_2], [Time_3], [Time_4], [Time_5], [Time_6], [Time_7])
 SELECT sourcetablealias.[Decimal_01], sourcetablealias.[Decimal_02], sourcetablealias.[Decimal_38], sourcetablealias.[DateTime2_0], sourcetablealias.[DateTime2_1], sourcetablealias.[DateTime2_2], sourcetablealias.[DateTime2_3], sourcetablealias.[DateTime2_4], sourcetablealias.[DateTime2_5], sourcetablealias.[DateTime2_6], sourcetablealias.[DateTime2_7], sourcetablealias.[DateTimeOffset_0], sourcetablealias.[DateTimeOffset_1], sourcetablealias.[DateTimeOffset_2], sourcetablealias.[DateTimeOffset_3], sourcetablealias.[DateTimeOffset_4], sourcetablealias.[DateTimeOffset_5], sourcetablealias.[DateTimeOffset_6], sourcetablealias.[DateTimeOffset_7], sourcetablealias.[Time_0], sourcetablealias.[Time_1], sourcetablealias.[Time_2], sourcetablealias.[Time_3], sourcetablealias.[Time_4], sourcetablealias.[Time_5], sourcetablealias.[Time_6], sourcetablealias.[Time_7]
 FROM   [SkyNode_TEST].[dbo].[SampleData_AllPrecision] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_AllTypes' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_AllTypes] WITH (TABLOCKX)
    ([BigIntColumn], [NumericColumn], [BitColumn], [SmallIntColumn], [DecimalColumn], [SmallMoneyColumn], [IntColumn], [TinyIntColumn], [MoneyColumn], [FloatColumn], [RealColumn], [DateColumn], [DateTimeOffsetColumn], [DateTime2Column], [SmallDateTimeColumn], [DateTimeColumn], [TimeColumn], [CharColumn], [VarCharColumn], [VarCharMaxColumn], [TextColumn], [NCharColumn], [NVarCharColumn], [NVarCharMaxColumn], [NTextColumn], [BinaryColumn], [VarBinaryColumn], [VarBinaryMaxColumn], [ImageColumn], [TimeStampColumn], [UniqueIdentifierColumn])
 SELECT sourcetablealias.[BigIntColumn], sourcetablealias.[NumericColumn], sourcetablealias.[BitColumn], sourcetablealias.[SmallIntColumn], sourcetablealias.[DecimalColumn], sourcetablealias.[SmallMoneyColumn], sourcetablealias.[IntColumn], sourcetablealias.[TinyIntColumn], sourcetablealias.[MoneyColumn], sourcetablealias.[FloatColumn], sourcetablealias.[RealColumn], sourcetablealias.[DateColumn], sourcetablealias.[DateTimeOffsetColumn], sourcetablealias.[DateTime2Column], sourcetablealias.[SmallDateTimeColumn], sourcetablealias.[DateTimeColumn], sourcetablealias.[TimeColumn], sourcetablealias.[CharColumn], sourcetablealias.[VarCharColumn], sourcetablealias.[VarCharMaxColumn], sourcetablealias.[TextColumn], sourcetablealias.[NCharColumn], sourcetablealias.[NVarCharColumn], sourcetablealias.[NVarCharMaxColumn], sourcetablealias.[NTextColumn], sourcetablealias.[BinaryColumn], sourcetablealias.[VarBinaryColumn], sourcetablealias.[VarBinaryMaxColumn], sourcetablealias.[ImageColumn], sourcetablealias.[TimeStampColumn], sourcetablealias.[UniqueIdentifierColumn]
 FROM   [SkyNode_TEST].[dbo].[SampleData_AllTypes] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_AllTypes_Nullable' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_AllTypes_Nullable] WITH (TABLOCKX)
    ([BigIntColumn], [NumericColumn], [BitColumn], [SmallIntColumn], [DecimalColumn], [SmallMoneyColumn], [IntColumn], [TinyIntColumn], [MoneyColumn], [FloatColumn], [RealColumn], [DateColumn], [DateTimeOffsetColumn], [DateTime2Column], [SmallDateTimeColumn], [DateTimeColumn], [TimeColumn], [CharColumn], [VarCharColumn], [VarCharMaxColumn], [TextColumn], [NCharColumn], [NVarCharColumn], [NVarCharMaxColumn], [NTextColumn], [BinaryColumn], [VarBinaryColumn], [VarBinaryMaxColumn], [ImageColumn], [TimeStampColumn], [UniqueIdentifierColumn])
 SELECT sourcetablealias.[BigIntColumn], sourcetablealias.[NumericColumn], sourcetablealias.[BitColumn], sourcetablealias.[SmallIntColumn], sourcetablealias.[DecimalColumn], sourcetablealias.[SmallMoneyColumn], sourcetablealias.[IntColumn], sourcetablealias.[TinyIntColumn], sourcetablealias.[MoneyColumn], sourcetablealias.[FloatColumn], sourcetablealias.[RealColumn], sourcetablealias.[DateColumn], sourcetablealias.[DateTimeOffsetColumn], sourcetablealias.[DateTime2Column], sourcetablealias.[SmallDateTimeColumn], sourcetablealias.[DateTimeColumn], sourcetablealias.[TimeColumn], sourcetablealias.[CharColumn], sourcetablealias.[VarCharColumn], sourcetablealias.[VarCharMaxColumn], sourcetablealias.[TextColumn], sourcetablealias.[NCharColumn], sourcetablealias.[NVarCharColumn], sourcetablealias.[NVarCharMaxColumn], sourcetablealias.[NTextColumn], sourcetablealias.[BinaryColumn], sourcetablealias.[VarBinaryColumn], sourcetablealias.[VarBinaryMaxColumn], sourcetablealias.[ImageColumn], sourcetablealias.[TimeStampColumn], sourcetablealias.[UniqueIdentifierColumn]
 FROM   [SkyNode_TEST].[dbo].[SampleData_AllTypes_Nullable] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_NumericTypes' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_NumericTypes] WITH (TABLOCKX)
    ([TinyIntColumn], [SmallIntColumn], [IntColumn], [BigIntColumn], [RealColumn], [FloatColumn])
 SELECT sourcetablealias.[TinyIntColumn], sourcetablealias.[SmallIntColumn], sourcetablealias.[IntColumn], sourcetablealias.[BigIntColumn], sourcetablealias.[RealColumn], sourcetablealias.[FloatColumn]
 FROM   [SkyNode_TEST].[dbo].[SampleData_NumericTypes] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_NumericTypes_Null' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_NumericTypes_Null] WITH (TABLOCKX)
    ([TinyIntColumn], [SmallIntColumn], [IntColumn], [BigIntColumn], [RealColumn], [FloatColumn])
 SELECT sourcetablealias.[TinyIntColumn], sourcetablealias.[SmallIntColumn], sourcetablealias.[IntColumn], sourcetablealias.[BigIntColumn], sourcetablealias.[RealColumn], sourcetablealias.[FloatColumn]
 FROM   [SkyNode_TEST].[dbo].[SampleData_NumericTypes_Null] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SampleData_PrimaryKey' ---

 -- Insert subset into destination table
 INSERT [SkyNode_TEST_STAT].[dbo].[SampleData_PrimaryKey] WITH (TABLOCKX)
    ([ID], [Data1], [Data2])
 SELECT sourcetablealias.[ID], sourcetablealias.[Data1], sourcetablealias.[Data2]
 FROM   [SkyNode_TEST].[dbo].[SampleData_PrimaryKey] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'SDSSDR7PhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objId] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objId], master.dbo.RandomDouble() AS randomnumber
	FROM [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objId]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_TEST_STAT].[dbo].[SDSSDR7PhotoObjAll] WITH (TABLOCKX)
	([objId], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [type], [ra], [dec], [raErr], [decErr], [cx], [cy], [cz], [htmId], [zoneId], [u], [g], [r], [i], [z])
 SELECT sourcetablealias.[objId], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[type], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z]
 FROM   [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objId = sourcetablealias.objId
	;


GO

-- SUBSAMPLING TABLE 'SDSSDR7PhotoObjAll_NoHTM' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objId] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objId], master.dbo.RandomDouble() AS randomnumber
	FROM [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll_NoHTM] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objId]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_TEST_STAT].[dbo].[SDSSDR7PhotoObjAll_NoHTM] WITH (TABLOCKX)
	([objId], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [type], [ra], [dec], [raErr], [decErr], [cx], [cy], [cz], [zoneId], [u], [g], [r], [i], [z])
 SELECT sourcetablealias.[objId], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[type], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[zoneId], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z]
 FROM   [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll_NoHTM] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objId = sourcetablealias.objId
	;


GO

-- SUBSAMPLING TABLE 'SDSSDR7PhotoObjAll_NoZone' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objId] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objId], master.dbo.RandomDouble() AS randomnumber
	FROM [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll_NoZone] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objId]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_TEST_STAT].[dbo].[SDSSDR7PhotoObjAll_NoZone] WITH (TABLOCKX)
	([objId], [skyVersion], [run], [rerun], [camcol], [field], [obj], [mode], [type], [ra], [dec], [raErr], [decErr], [cx], [cy], [cz], [htmId], [u], [g], [r], [i], [z])
 SELECT sourcetablealias.[objId], sourcetablealias.[skyVersion], sourcetablealias.[run], sourcetablealias.[rerun], sourcetablealias.[camcol], sourcetablealias.[field], sourcetablealias.[obj], sourcetablealias.[mode], sourcetablealias.[type], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[raErr], sourcetablealias.[decErr], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmId], sourcetablealias.[u], sourcetablealias.[g], sourcetablealias.[r], sourcetablealias.[i], sourcetablealias.[z]
 FROM   [SkyNode_TEST].[dbo].[SDSSDR7PhotoObjAll_NoZone] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objId = sourcetablealias.objId
	;


GO

-- SUBSAMPLING TABLE 'WisePhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[cntr] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[cntr], master.dbo.RandomDouble() AS randomnumber
	FROM [SkyNode_TEST].[dbo].[WisePhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [cntr]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.01;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_TEST_STAT].[dbo].[WisePhotoObj] WITH (TABLOCKX)
	([cntr], [ra], [dec], [cx], [cy], [cz], [sigra], [sigdec], [sigradec], [htmId], [zoneId], [w1mpro], [w2mpro], [w3mpro], [w4mpro])
 SELECT sourcetablealias.[cntr], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[sigra], sourcetablealias.[sigdec], sourcetablealias.[sigradec], sourcetablealias.[htmId], sourcetablealias.[zoneId], sourcetablealias.[w1mpro], sourcetablealias.[w2mpro], sourcetablealias.[w3mpro], sourcetablealias.[w4mpro]
 FROM   [SkyNode_TEST].[dbo].[WisePhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.cntr = sourcetablealias.cntr
	;


GO

