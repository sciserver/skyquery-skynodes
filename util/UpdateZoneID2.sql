DECLARE @H float = 4.0 / 3600.0

UPDATE SkyNode_SDSSDR12..PhotoObjAll
SET ZoneID = CONVERT(INT,FLOOR((dec + 90.0) / @H))



SELECT DISTINCT ZoneID
FROM SkyNode_SDSSDR12..PhotoObjAll
WHERE ra BETWEEN 0 AND 5 AND dec BETWEEN 0 AND 5