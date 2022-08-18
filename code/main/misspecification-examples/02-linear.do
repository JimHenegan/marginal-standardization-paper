/* 
An example showing how a linaer model can lead to "predicted probabilities"
that are greater than 1.
*/

// Load the data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Fit the model
reg death i.eversmoke i.male age

// Generate predicted probabilities
predict yhatreg

// Summarize predicted probabilities
summ yhatreg

// How many predicted probabilities were greater than 1?
count if yhatreg > 1
