/*
Appendix Table 2
*/

// Load in the synthetic data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// "male prevalence" (what proportion of the data are male)
summarize male

// "female prevalence"
display 1 - r(mean)

// Get counts for table
bysort male: tab death eversmoke, row col

// Get risks
cs death eversmoke if male==1
cs death eversmoke if male==0

// Get smoking prevalences (male and female)
summarize eversmoke if male == 1
summarize eversmoke if male == 0


// Standardized Death Rates (by group)
capture program drop get_standardized_death_rates
program define get_standardized_death_rates

	quietly summarize male
	local male_prev = r(mean)
	local female_prev = 1 - r(mean)
	
	quietly summarize death if eversmoke == 1 & male == 1
	local male_risk_eversmokers = r(mean)
	
	quietly summarize death if eversmoke == 0 & male == 1
	local male_risk_neversmokers = r(mean)
	
	quietly summarize death if eversmoke == 1 & male == 0
	local female_risk_eversmokers = r(mean)
	
	quietly summarize death if eversmoke == 0 & male == 0
	local female_risk_neversmokers = r(mean)
	
	display "Female Neversmokers:"
	display `female_prev' * `female_risk_neversmokers'	
	
	display "Female Eversmokers:"
	display `female_prev' * `female_risk_eversmokers'		
	
	display "Male Neversmokers:"
	display `male_prev' * `male_risk_neversmokers'	
	
	display "Male Eversmokers:"
	display `male_prev' * `male_risk_eversmokers'	
end 

get_standardized_death_rates

// Overall Mortality
gen pop1=1
dstdize death pop male, by(eversmoke)