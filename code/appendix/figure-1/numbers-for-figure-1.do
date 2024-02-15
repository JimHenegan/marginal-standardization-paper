// Load in the synthetic data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Get numbers for Caption to Figure 1

// Get Simple, unadjusted death risk
tab death eversmoke, row col

// Get crude risk difference and crude relative risk.
cs death eversmoke

// Get numbers for Figure 1, Step One 

// "male prevalence" (what proportion of the data are male)
summarize male
display r(mean)

// "female prevalence"
display 1 - r(mean)

// Get smoking prevalences (male and female)
summarize eversmoke if male == 1
summarize eversmoke if male == 0

// Get death risk for exposed/unexposed for males
cs death eversmoke if male==1

// Get death risk for exposed/unexposed for females
cs death eversmoke if male==0

// Get numbers for Figure 1, Step Two
// Get "stratum rates" and standardized risk 
gen pop1=1
dstdize death pop male, by(eversmoke)

/*
See the "stratum rates" for eversmoke = 0 and eversmoke = 1
and the "adjusted rates" in the summary.
*/

// Get standardized risk difference
display r(adj)[1,2] - r(adj)[1,1]

// Get standardized risk ratio
display r(adj)[1,2] / r(adj)[1,1]