## Unemployment & Crime Rate per County 2013
* Upendra Addepalle, Chris Frazier, Robert McAlmon
---
For this project, we took data for unemployment per county and merged it with data on crime rates per county.

__Extract__:

There were three data sources which were used:
1. Unemployment data from a JSON file [https://www.kaggle.com/jayrav13/unemployment-by-county-us](https://www.kaggle.com/jayrav13/unemployment-by-county-us).
2. 2013 crime rate data from a CSV file on [https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county](https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county)
3. State-name to state-abbreviation data from a CSV file: [https://github.com/jasonong/List-of-US-States/blob/master/states.csv](https://github.com/jasonong/List-of-US-States/blob/master/states.csv)

The CSV files were easily loaded into pandas dataframes thanks to pandas' built in `DataFrame.read_csv()` function. The JSON file was read into a Python `dict`. It was unruly and contained extraneous information, so it had to be loaded more deliberately into a pandas dataframe. Only the annual data from the year 2013 was recorded from the `dict` into the dataframe, so that it would match the type of data coming from the crime reports.

![Alt text](images/State.jpg?raw=true "State Data")

![Alt text](images/crime_rate.jpg?raw=true "Crime Rate Data")

![Alt text](images/unemployment_rate.jpg?raw=true "Unemployment Rate Data")


__Transform__:

The goal of the transformation stage was to join the unemployment data and the crime data by county and state. First, an obvious discrepancy had to be addressed: the county and state were listed as a single column of form "[County], [ST]" where ST is the two letter state abbreviation in the crime rate data, but in the unemployment dataframe, they were listed as two columns, and the state name was spelled out in full. The discrepancy was addressed as follows:
1. Use the state-name to state-abbreviation dataframe to map the state names to state abbreviations in the unemployment data.
2. Split the county+state column in the crime rate data into two columns: a county column and a state abbreviation column.

Next, we had to check for less obvious discrepancies which could impede a successful inner join operation. Using Python's set operations, we examined the setwise differences between the county names of the unemployment and of the crime dataframes, found the discrepancies one by one, eliminated them, and continued the process until no more remediable discrepancies existed. As a result, our final code takes the following steps to eliminate the discrepancies in preparation of the join:
1. Split `county_name` column into two columns in crime rate dataframe
2. Convert county names to lower case for both unemployment and crime rate dataframes
3. Replace "st." with "saint" and "ste." with "sainte" in crime rate dataframe
4. Remove apostrophes in crime rate county names
5. Replace "debaca" with "de baca" and "mc kean" with "mckean" in the unemployment crime rate county names

After these steps had been taken, the fact remained that the crime rate data covered many more counties than the unemployment data; in fact, data on the state of California was entirely absent from the unemployment data. Remedying this would have been outside the scope of the project, however, so we simply acknowledged this and moved on to perform the final transformation:

* Merge the unemployment and crime rate data using an inner join on the county and state columns

![Alt text](images/Cleaned.jpg?raw=true "Cleaned Data")

__Load__:

Using SQLAlchemy, we created the database schema and loaded the merged dataframe into a MySQL database using pandas' `DataFrame.to_sql()` function. We chose to use a relational database since the resulting table is naturally indexed by county and state, and storing the table with an actual primary key eliminates future difficulties that could be had when trying to use this table with other data - namely, difficulties of the type we had to deal with when merging on county names.

![Alt text](images/sql_data.jpg?raw=true "SQL Data")

