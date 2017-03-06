USE tempdb

GO

IF OBJECT_ID('tempdb..Htmlize') IS NOT NULL
DROP FUNCTION Htmlize

GO

CREATE FUNCTION Htmlize
(
	@orig nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	RETURN REPLACE(@orig, '<', '&lt;')
END

GO

USE BestDR12

GO

IF OBJECT_ID('tempdb..##sqltmp') IS NOT NULL
DROP TABLE ##sqltmp

CREATE TABLE ##sqltmp
(
	ID int IDENTITY(1, 1) PRIMARY KEY,
	script nvarchar(max)
)

DECLARE @objectName varchar(128)
DECLARE @type varchar(64)
DECLARE @access varchar(8)
DECLARE @description varchar(256)
DECLARE @text varchar(7200)

DECLARE tables_cursor
CURSOR FOR
SELECT name FROM sys.objects
WHERE name IN (SELECT name FROM BestDR12..DBObjects WHERE access = 'U')
ORDER BY name

OPEN tables_cursor

FETCH NEXT FROM tables_cursor INTO @objectName

WHILE @@FETCH_STATUS = 0
BEGIN

	SELECT @type = type, @access = access,
		@description = description, @text = text
	FROM BestDR12..DBObjects WHERE name = @objectName;

	-- Add object metadata and object create statement

	
	INSERT ##sqltmp
	VALUES 
		('--/ <summary>' + tempdb.dbo.Htmlize(@description) + '</summary>'),
		('--/ <remarks>' + tempdb.dbo.Htmlize(@text) + '</remarks>'),
		('CREATE ' +
			CASE 
				WHEN @type = 'U' THEN 'TABLE'
				WHEN @type = 'V' THEN 'VIEW'
				WHEN @type = 'P' THEN 'PROCEDURE'
				WHEN @type = 'F' THEN 'FUNCTION'
			END +
		' [' + @objectName + ']')

	-- Add parameters in case of procedures and functions

	IF @type IN ('P', 'F') BEGIN
		INSERT ##sqltmp VALUES ('(');

		WITH params AS
		(
			SELECT 
				'    ' + p.name + ' ' +
	
				CASE WHEN t.name = 'varchar' THEN 'varchar(' + 
					CASE WHEN p.max_length >= 0 THEN CAST(p.max_length AS varchar(10))
					ELSE 'max'
					END + ')'
				ELSE t.name END + ' ' +
	
				CASE p.is_nullable
				WHEN 1 THEN 'NULL'
				ELSE 'NOT NULL'
				END + 

				CASE WHEN p.has_default_value = 1 THEN ' = ' + CONVERT(varchar(128), p.default_value)
				ELSE ''
				END +

				CASE WHEN p.is_output = 1 THEN ' OUTPUT'
				ELSE ''
				END def,
				p.parameter_id id,
				LEAD(p.parameter_id) OVER (ORDER BY p.parameter_id) nextid
			FROM sys.parameters p
			INNER JOIN sys.types t ON t.system_type_id = p.system_type_id
			WHERE p.object_id = OBJECT_ID(@objectName) AND p.name <> ''
		)
		INSERT ##sqltmp
		SELECT 
			def + 
			CASE WHEN nextid IS NOT NULL THEN ',' + CHAR(13)+CHAR(10) + CHAR(13)+CHAR(10)
			ELSE '' END
		FROM params
		ORDER BY id
		
		INSERT ##sqltmp VALUES (')');
	END

	-- Add column metadata
	IF (SELECT COUNT(*) FROM sys.columns c WHERE c.object_id = OBJECT_ID(@objectName)) > 0
	BEGIN

		INSERT ##sqltmp VALUES ('(');

		WITH
		dbcols AS
		(
			SELECT * 
			FROM DBColumns
			WHERE tablename = @objectname
			UNION ALL
			SELECT DBColumns.* 
			FROM DBViewCols
			INNER JOIN DBColumns
				ON DBViewCols.parent = DBColumns.tablename AND DBViewCols.name = DBColumns.name
			WHERE DBViewCols.viewname = @objectName
		),
		cols AS 
		(
			SELECT
				CASE WHEN dbc.description <> '' THEN '    --/ <summary>' + tempdb.dbo.Htmlize(dbc.description) + '</summary>' + CHAR(13)+CHAR(10)
				ELSE ''
				END +
	
				CASE WHEN dbc.unit <> '' THEN '    --/ <unit>' + tempdb.dbo.Htmlize(dbc.unit) + '</unit>' + CHAR(13)+CHAR(10)
				ELSE ''
				END + 

				'    [' + c.name + '] ' +
	
				CASE WHEN t.name = 'varchar' THEN 'varchar(' + CAST(c.max_length AS varchar(10)) + ')'
				ELSE t.name END + ' ' +
	
				CASE c.is_nullable
				WHEN 1 THEN 'NULL'
					   ELSE 'NOT NULL'
				END def,
				c.column_id id,
				LEAD(c.column_id) OVER (ORDER BY c.column_id) nextid
			FROM sys.columns c
			INNER JOIN sys.types t ON t.system_type_id = c.system_type_id
			LEFT OUTER JOIN dbcols dbc ON dbc.name = c.name

			WHERE c.object_id = OBJECT_ID(@objectName)
		)
		INSERT ##sqltmp
		SELECT 
			def + 
			CASE WHEN nextid IS NOT NULL THEN ',' + CHAR(13)+CHAR(10) + CHAR(13)+CHAR(10)
			ELSE '' END
		FROM cols
		ORDER BY id
		

		INSERT ##sqltmp
		VALUES (')' + CHAR(13)+CHAR(10))

	END

	INSERT ##sqltmp
	VALUES (CHAR(13)+CHAR(10))

	FETCH NEXT FROM tables_cursor INTO @objectName
END

CLOSE tables_cursor
DEALLOCATE tables_cursor

SELECT * FROM ##sqltmp