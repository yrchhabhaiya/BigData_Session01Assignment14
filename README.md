# BigData_Session01Assignment14
Introduction to Hive.

----------------------------------------------------------------------------------------------------------------------------
Create a database named 'custom'.
hive> CREATE DATABASE custom;
hive> USE custom;

Create a table named temperature_data inside custom having below fields:
1. date (mm-dd-yyyy) format
2. zip code
3. temperature
The table will be loaded from comma-delimited file.
Load the dataset.txt (which is ',' delimited) in the table.
hive> CREATE TABLE temperature_data
    > (
    > date STRING,
    > zip int,
    > temp int
    > )
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ',';
hive> LOAD DATA LOCAL INPATH '/home/acadgild/hive/dataset.txt'
    > INTO TABLE temperature_data;
    
Screenshot: Assignment14.1
----------------------------------------------------------------------------------------------------------------------------

Fetch date and temperature from temperature_data where zip code is greater than
300000 and less than 399999.
hive> SELECT date, temp
    > FROM temperature_data
    > WHERE zip >= 300000 AND zip <=399999;

Calculate maximum temperature corresponding to every year from temperature_data
table.
hive> SELECT SUBSTR(date,7,4) AS year, MAX(temp)
    > FROM temperature_data
    > GROUP BY SUBSTR(date,7,4);

Calculate maximum temperature from temperature_data table corresponding to those
years which have at least 2 entries in the table.
hive> SELECT SUBSTR(date,7,4) AS year, MAX(temp)
    > FROM temperature_data
    > GROUP BY SUBSTR(date,7,4)
    > HAVING COUNT(*) > 2;

Create a view on the top of last query, name it temperature_data_vw.
hive> CREATE VIEW temperature_data_vw
    > AS
    > SELECT SUBSTR(date,7,4) AS year, MAX(temp)
    > FROM temperature_data
    > GROUP BY SUBSTR(date,7,4)
    > HAVING COUNT(*) > 2;
    
Export contents from temperature_data_vw to a file in local file system, such that each
file is '|' delimited.
hive> INSERT OVERWRITE LOCAL DIRECTORY '/home/acadgild/hive/export'
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY '|'
    > SELECT * FROM temperature_data_vw;

