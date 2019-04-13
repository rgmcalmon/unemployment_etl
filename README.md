# Unemployment & Crime Rate per County 2013
* Upendra Addepalle, Chris Frazier, Robert McAlmon
---
For this project, we will take data for unemployment per county and merge it with data on crime rates per county.

__Extract__:
* Take unemployment data from a JSON file [https://www.kaggle.com/jayrav13/unemployment-by-county-us](https://www.kaggle.com/jayrav13/unemployment-by-county-us).
* Take 2013 crime rate data from a CSV file on [https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county](https://www.kaggle.com/mikejohnsonjr/united-states-crime-rates-by-county)
* Take state-name to state-abbreviation data from a CSV file: [https://github.com/jasonong/List-of-US-States/blob/master/states.csv](https://github.com/jasonong/List-of-US-States/blob/master/states.csv)

__Transform__:
* Drop rows from years except 2013 from the unemployment data
* Drop extraneous columns from the unemployment and the crime rate data
* Map state names to state abbreviations in the unemployment data
* Split the county+state column in the crime rate data into two columns: a county column and a state abbreviation column.
* Merge the unemployment and crime rate data using an inner join on the county and state columns

__Load__:
* Export the merged data into a MySQL database.
