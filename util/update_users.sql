DECLARE @dbname sysname
DECLARE @cmd nvarchar(max)

DECLARE dbs CURSOR FOR
SELECT name FROM sys.databases
WHERE name LIKE 'Sky%'

OPEN dbs

FETCH NEXT FROM dbs   
INTO @dbname

WHILE @@FETCH_STATUS = 0  
BEGIN  
	PRINT 'Processing database ' + @dbname

	--SET @cmd = 'ALTER DATABASE [' + @dbname + '] SET SINGLE_USER WITH ROLLBACK IMMEDIATE'
	--EXEC(@cmd)

	--SET @cmd = 'ALTER DATABASE [' + @dbname + '] SET READ_WRITE WITH NO_WAIT'
	--EXEC(@cmd)


	SET @cmd = 'USE [' + @dbname + ']; CREATE USER [SDSS\skyquery-user] FOR LOGIN [SDSS\skyquery-user]'
	EXEC(@cmd)
	
	SET @cmd = 'USE [' + @dbname + ']; GRANT SELECT ON DATABASE::[' + @dbname + '] TO [SDSS\skyquery-user]'
	EXEC(@cmd)

	SET @cmd = 'USE [' + @dbname + ']; ALTER ROLE [db_datareader] ADD MEMBER [SDSS\skyquery-user]'
	EXEC(@cmd)

	SET @cmd = 'USE [' + @dbname + ']; GRANT VIEW DEFINITION ON DATABASE::[' + @dbname + '] TO [SDSS\skyquery-user]'
	EXEC(@cmd)


	SET @cmd = 'USE [' + @dbname + ']; CREATE USER [SDSS\skyquery-script] FOR LOGIN [SDSS\skyquery-script]'
	EXEC(@cmd)

	SET @cmd = 'USE [' + @dbname + ']; ALTER ROLE [db_owner] ADD MEMBER [SDSS\skyquery-script]'
	EXEC(@cmd)


	SET @cmd = 'USE [' + @dbname + ']; CREATE USER [SDSS\skyquery-admin] FOR LOGIN [SDSS\skyquery-admin]'
	EXEC(@cmd)

	SET @cmd = 'USE [' + @dbname + ']; ALTER ROLE [db_owner] ADD MEMBER [SDSS\skyquery-admin]'
	EXEC(@cmd)

	--SET @cmd = 'ALTER DATABASE [' + @dbname + '] SET READ_ONLY WITH NO_WAIT'
	--EXEC(@cmd)

	--SET @cmd = 'ALTER DATABASE [' + @dbname + '] SET MULTI_USER WITH ROLLBACK IMMEDIATE'
	--EXEC(@cmd)

	FETCH NEXT FROM dbs   
	INTO @dbname
END

CLOSE dbs
DEALLOCATE dbs