/* 
An example showing how a linear-binomial hybrid model may fail to converge.
*/

// Load the data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Set the maximum number of iterations to 10
set maxiter 10

// Try to fit the model
glm death i.eversmoke i.male age, family(binomial) link(identity)

// Check to see if convergence was achieved ('0' means 'no')
display e(converged)