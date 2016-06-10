DROP TABLE ##ranges

GO



WITH r AS
(
	SELECT specObjID, ROW_NUMBER() OVER (ORDER BY specObjID) AS rn
	FROM SkyNode_SDSSDR12..SpecObjAll
),
s AS
(
	SELECT *
	FROM r
	WHERE rn % 50000 = 0
),
q AS
(
	SELECT
		ISNULL(LAG(specObjID) OVER (ORDER BY specObjID), 0) id_from,
		specObjID id_to
	FROM s

	UNION

	SELECT
		specObjID id_from,
		ISNULL(LEAD(specObjID) OVER (ORDER BY specObjID), 9223372036854775807) id_to
	FROM s
)
SELECT *
INTO ##ranges
FROM q

GO

SELECT COUNT(*) FROM ##ranges

GO









SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

GO

DECLARE @H float = 4.0 / 3600.0
DECLARE @id_from bigint, @id_to bigint

DECLARE rng CURSOR FOR
SELECT id_from, id_to
FROM ##ranges
WHERE id_from > 1237665428108674395
ORDER BY id_from

OPEN rng
FETCH NEXT FROM rng INTO @id_from, @id_to

WHILE @@FETCH_STATUS = 0 
BEGIN

	BEGIN TRANSACTION

	UPDATE SkyNode_SDSSDR12..SpecObjAll
	SET zoneID = CONVERT(INT,FLOOR((dec + 90.0) / @H))
	WHERE specObjID >= @id_from AND specObjID < @id_to

	COMMIT

	PRINT @id_to

	FETCH NEXT FROM rng INTO @id_from, @id_to
END

CLOSE rng
DEALLOCATE rng