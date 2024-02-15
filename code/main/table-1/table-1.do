/*
Table 1:  Counts and Crude Estimates
*/

// Load in the synthetic data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Get numbers for table
tab death eversmoke, row col

// Get crude risk difference, risk-ratio, etc.
cs death eversmoke