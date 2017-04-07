CREATE DATABASE [SkyNode_GAIADR1]
 CONTAINMENT = NONE
 ON 
 PRIMARY 
	(NAME = N'PRIMARY_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_0.mdf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_1.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_2.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_3.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_4.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_5.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_6.ndf' , SIZE = 20MB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\PRIMARY_7.ndf' , SIZE = 20MB , FILEGROWTH = 0),
 FILEGROUP SOURCES
	(NAME = N'SOURCE_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_0.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_1.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_2.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_3.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_4.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_5.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_6.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCE_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCE_7.ndf' , SIZE = 100GB , FILEGROWTH = 0),
 FILEGROUP SOURCEIDX
	(NAME = N'SOURCEIDX_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_0.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_1.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_2.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_3.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_4.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_5.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_6.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'SOURCEIDX_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\SOURCEIDX_7.ndf' , SIZE = 100GB , FILEGROWTH = 0)
 LOG ON 
	(NAME = N'LOG_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_0.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_1.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_2.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_3.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_4.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_5.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_6.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1\LOG_7.ldf' , SIZE = 20GB , FILEGROWTH = 0)

GO

ALTER DATABASE [SkyNode_GAIADR1] SET RECOVERY SIMPLE
GO
