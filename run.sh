#!/bin/sh

RAW_TABLE_NAME=owid_covid_data
CSV_FILE_PATH=./resources/owid-covid-data.csv
DB_INIT_PATH=./db/init
DB_QUERIES_PATH=./db/queries

# Get CSV
#wget https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv -P ./resources

# Drop db
dropdb --if-exists $RAW_TABLE_NAME

# Create db
createdb $RAW_TABLE_NAME

# Create raw data table
psql -d $RAW_TABLE_NAME -f .$DB_INIT_PATH/raw_data_table.sql

# Load raw data
psql -d $RAW_TABLE_NAME -c "\COPY data FROM '$CSV_FILE_PATH' WITH (FORMAT csv, DELIMITER ',', NULL '', header);"

# Drop db
dropdb $RAW_TABLE_NAME