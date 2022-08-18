/* 
An example showing how a poisson model can lead to "predicted probabilities"
that are greater than 1.
*/

// Load the data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Fit the model
poisson death i.eversmoke i.male age, irr vce(robust)

// Generate predicted probabilities
predict yhat

// Summarize predicted probabilities
summ yhat

// How many predicted probabilities were greater than 1?
count if yhat > 1
