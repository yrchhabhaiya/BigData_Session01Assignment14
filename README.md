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
