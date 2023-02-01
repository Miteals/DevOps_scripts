#!/bin/bash

#Script that executes a report containing data from two csv files on name, age and account balance 
#covers 50% data from file informations.csv
#data sorted by account balance

number_of_lines='cat informations.csv' | wc -l 

cat -n informations.csv | tr '\t' ',' | tr -d ' ' | sort -k5 -t',' > tmp_inf.csv

cat locations.csv | sort -k3 -t',' > tmp_lok.csv

join -t',' -1 3 -2 5 -o 2.1 1.1 2.2 2.4 tmp_lok.csv tmp_inf.csv > after_join.csv

cat after_join.csv | sort -k4 -t',' -r | head -n$(($number_of_lines/2)) | sort -n | cut -d',' -f2,3,4 | tr ',' '\t'

rm tmp_inf.csv tmp_lok.csv after_join.csv | echo "Temporary files has been removed"