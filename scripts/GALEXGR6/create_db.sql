CREATE DATABASE [SkyNode_GALEXGR6]
 CONTAINMENT = NONE
 ON 
 PRIMARY 
	(NAME = N'PRIMARY_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_0.mdf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_1.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_2.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_3.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_4.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_5.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_6.ndf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'PRIMARY_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PRIMARY_7.ndf' , SIZE = 20GB , FILEGROWTH = 0),
 FILEGROUP PHOTOOBJ
	(NAME = N'PHOTOOBJ_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_0.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_1.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_2.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_3.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_4.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_5.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_6.ndf' , SIZE = 150GB , FILEGROWTH = 0),
	(NAME = N'PHOTOOBJ_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOOBJ_7.ndf' , SIZE = 150GB , FILEGROWTH = 0),
 FILEGROUP PHOTOIDX
	(NAME = N'PHOTOIDX_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_0.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_1.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_2.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_3.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_4.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_5.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_6.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'PHOTOIDX_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\PHOTOIDX_7.ndf' , SIZE = 100GB , FILEGROWTH = 0),
 FILEGROUP VPHOTOOBJ
	(NAME = N'VPHOTOOBJ_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_0.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_1.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_2.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_3.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_4.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_5.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_6.ndf' , SIZE = 200GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOOBJ_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOOBJ_7.ndf' , SIZE = 200GB , FILEGROWTH = 0),
FILEGROUP VPHOTOIDX
	(NAME = N'VPHOTOIDX_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_0.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_1.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_2.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_3.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_4.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_5.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_6.ndf' , SIZE = 100GB , FILEGROWTH = 0),
	(NAME = N'VPHOTOIDX_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\VPHOTOIDX_7.ndf' , SIZE = 100GB , FILEGROWTH = 0)
 LOG ON 
	(NAME = N'LOG_0', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd0\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_0.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_1', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd1\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_1.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_2', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd2\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_2.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_3', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd3\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_3.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_4', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd4\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_4.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_5', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd5\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_5.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_6', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd6\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_6.ldf' , SIZE = 20GB , FILEGROWTH = 0),
	(NAME = N'LOG_7', FILENAME = N'C:\data\data1\skynode\ssd_a\ssd7\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6\LOG_7.ldf' , SIZE = 20GB , FILEGROWTH = 0)

GO

ALTER DATABASE [SkyNode_GALEXGR6] SET RECOVERY SIMPLE
GO
