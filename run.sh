#!/bin/sh

DB_NAME=owid-covid-data
SCHEMA_NAME=svr
DATA_TABLE_NAME=data
CSV_FILE_PATH=./resources/owid-covid-data.csv
DB_INIT_PATH=./db/init
DB_QUERIES_PATH=./db/queries

# Get CSV
#wget https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv -P ./resources

# Drop db
dropdb --if-exists $DB_NAME

# Create db
createdb $DB_NAME

# Create schema and data table
psql -d $DB_NAME -f .$DB_INIT_PATH/data.sql

# Load raw data
psql -d $DB_NAME -c "\COPY $SCHEMA_NAME.$DATA_TABLE_NAME FROM '$CSV_FILE_PATH' WITH (FORMAT csv, DELIMITER ',', NULL '', header);"

# Create tables
psql -d $DB_NAME -f .$DB_INIT_PATH/test_unit.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/country.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/confirmed_cases.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/confirmed_deaths.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/excess_mortality.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/hospital_and_icu.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/policy_responces.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/reproduction_rate.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/tests_and_positivity.sql
psql -d $DB_NAME -f .$DB_INIT_PATH/vaccinations.sql

# Queries

# Drop db
dropdb $DB_NAME