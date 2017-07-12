ELECT date, temp
FROM temperature_data
WHERE zip >= 300000 AND zip <=399999;

SELECT SUBSTR(date,7,4) AS year, MAX(temp)
FROM temperature_data
GROUP BY SUBSTR(date,7,4);

SELECT SUBSTR(date,7,4) AS year, MAX(temp)
FROM temperature_data
GROUP BY SUBSTR(date,7,4)
HAVING COUNT(*) > 2;

CREATE VIEW temperature_data_vw
AS
SELECT SUBSTR(date,7,4) AS year, MAX(temp)
FROM temperature_data
GROUP BY SUBSTR(date,7,4)
HAVING COUNT(*) > 2;

INSERT OVERWRITE LOCAL DIRECTORY '/home/acadgild/hive/export'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
SELECT * FROM temperature_data_vw;

