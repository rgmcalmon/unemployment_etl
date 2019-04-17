/* Drop Schema if Exists */
DROP SCHEMA IF EXISTS prj_unemployment_etl;

/* Create Schema */
CREATE SCHEMA prj_unemployment_etl;

/* Set the Current Schema for Use */
use prj_unemployment_etl;


ALTER TABLE unemployment_and_crime_by_year_month COMMENT = 'https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county/discussion/27312
index: Table Index
EDITION: Edition Number
PART: Part Number
IDNO: SEQUENTIAL CASE ID 
CPOPARST: COUNTY POPULATION-AGENCIES REPORT ARRESTS 
CPOPCRIM: COUNTY POPULATION-AGENCIES REPORT CRIMES
AGARRST: NUMBER OF AGENCIES IN COUNTY REPORT ARRESTS
AGOFF: NUMBER OF AGENCIES IN COUNTY REPORT CRIMES
COVIND: COVERAGE INDICATOR 
INDEX: Total number of UCR (Uniform Crime Report) Index crimes, excluding arson. The sum of variables MURDER through MVTHEFT.
MODINDX: MODIFIED INDEX. Total number of UCR (Uniform Crime Report) index crimes reported, including arson (sum of variables, MURDER through ARSON)
MURDER: Number of MURDERS
RAPE: Number of RAPES
ROBBERY: Number of ROBBERIES
AGASSLT: Number of AGGRAVATED ASSAULTS 
BURGLRY: Number of BURGLARIES 
LARCENY: Number of LARCENIES
MVTHEFT: Number of MOTOR VEHICLE THEFTS 
ARSON: Number of ARSONS 
population: POPULATION 
FIPSST: FIPS STATE CODE
FIPSCTY: FIPS COUNTY CODE';

DROP TABLE IF EXISTS unemployment_and_crime_by_year;

CREATE TABLE unemployment_and_crime_by_year (
	id int NOT NULL AUTO_INCREMENT,
	county varchar(100),
	state_code varchar(2),
	state_name varchar(50),
	crime_year year(4),
	crime_rate_per_10000 float(7,2),
	county_popu_agn_rep_arrest int,
	county_popu_agn_rep_crimes int,
	number_agn_in_county_rep_arrest int,
	number_agn_in_county_rep_crimes int,
	coverage_indicator int,
	ucr_index int,
	ucr_mod_index int,
	number_of_murders int,
	number_of_rapes int,
	number_of_robbery int,
	number_of_aggravated_assault int,
	number_of_burglery int,
	number_of_larceny int,
	number_of_motor_vhcle_theft int,
	number_of_arsons int,
	population_count int,
	average_unemployment_rate float(3,2),
	date_created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

ALTER TABLE unemployment_and_crime_by_year COMMENT = 'https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county/discussion/27312
index: Table Index
EDITION: Edition Number
PART: Part Number
IDNO: SEQUENTIAL CASE ID 
CPOPARST: COUNTY POPULATION-AGENCIES REPORT ARRESTS 
CPOPCRIM: COUNTY POPULATION-AGENCIES REPORT CRIMES
AGARRST: NUMBER OF AGENCIES IN COUNTY REPORT ARRESTS
AGOFF: NUMBER OF AGENCIES IN COUNTY REPORT CRIMES
COVIND: COVERAGE INDICATOR 
INDEX: Total number of UCR (Uniform Crime Report) Index crimes, excluding arson. The sum of variables MURDER through MVTHEFT.
MODINDX: MODIFIED INDEX. Total number of UCR (Uniform Crime Report) index crimes reported, including arson (sum of variables, MURDER through ARSON)
MURDER: Number of MURDERS
RAPE: Number of RAPES
ROBBERY: Number of ROBBERIES
AGASSLT: Number of AGGRAVATED ASSAULTS 
BURGLRY: Number of BURGLARIES 
LARCENY: Number of LARCENIES
MVTHEFT: Number of MOTOR VEHICLE THEFTS 
ARSON: Number of ARSONS 
population: POPULATION 
FIPSST: FIPS STATE CODE
FIPSCTY: FIPS COUNTY CODE';