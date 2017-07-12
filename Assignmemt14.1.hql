REATE DATABASE custom;

USE custom;

CREATE TABLE temperature_data
(
date STRING,
zip int,
temp int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INPATH '/home/acadgild/hive/dataset.txt'
INTO TABLE temperature_data;

