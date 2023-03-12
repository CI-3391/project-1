#!/bin/sh

DB_NAME=owid-covid-data
SCHEMA_NAME=svr
DATA_TABLE_NAME=data
CSV_FILE_PATH=./resources/owid-covid-data.csv
DB_INIT_PATH=./db/init
DB_QUERIES_PATH=./db/queries
CSV_URL=https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv

# Get CSV
echo $'\x0a\x0a -- Resources check.'
echo $'--------------------------------------------------------------------\x0a'

if test -f "$CSV_FILE_PATH"; then 
    echo $'\x0a\x0a -- csv file already downloaded, all good!.'
else 
    echo $'\x0a\x0a -- Downloading csv file, be patient.'
    echo $'----------------------------------------------------------------\x0a'
    wget $CSV_URL -P ./resources
fi

# Drop db
echo $'\x0a\x0a -- Drop db if exists to avoid and conflic.'
echo $'--------------------------------------------------------------------\x0a'
dropdb --if-exists -e $DB_NAME

# Create db
echo $'\x0a\x0a -- Create db.'
echo $'--------------------------------------------------------------------\x0a'
createdb -e $DB_NAME

# Create schema and data table
echo $'\x0a\x0a -- Create schema svr and load csv file.'
echo $'--------------------------------------------------------------------\x0a'
psql -d $DB_NAME -f $DB_INIT_PATH/data.sql -e

# Load raw data
psql -d $DB_NAME -c "\COPY $SCHEMA_NAME.$DATA_TABLE_NAME FROM '$CSV_FILE_PATH' WITH (FORMAT csv, DELIMITER ',', NULL '', header);"

# Create tables
echo $'\x0a\x0a -- Tables creation and data normalization.'
echo $'--------------------------------------------------------------------\x0a'
psql -d $DB_NAME -f $DB_INIT_PATH/test_unit.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/country.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/confirmed_cases.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/confirmed_deaths.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/excess_mortality.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/hospital_and_icu.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/policy_responces.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/reproduction_rate.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/tests_and_positivity.sql -e
psql -d $DB_NAME -f $DB_INIT_PATH/vaccinations.sql -e

# Queries
echo $'\x0a\x0a -- Running queries.'
echo $' -- Some tables will be created in this stage for better performance.'
echo $'--------------------------------------------------------------------\x0a'
psql -d $DB_NAME -f $DB_QUERIES_PATH/query_one.sql -e
psql -d $DB_NAME -f $DB_QUERIES_PATH/query_two.sql -e
psql -d $DB_NAME -f $DB_QUERIES_PATH/query_three.sql -e
psql -d $DB_NAME -f $DB_QUERIES_PATH/query_four.sql -e
psql -d $DB_NAME -f $DB_QUERIES_PATH/query_five.sql -e