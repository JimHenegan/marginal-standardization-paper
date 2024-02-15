// Load in the synthetic data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Odds Ratio
logistic death i.eversmoke i.male male##c.age bmisp*  

// Average Rates
margins eversmoke

// Risk Difference
logistic death i.eversmoke i.male male##c.age bmisp*  
margins r.eversmoke

// Risk Ratio 
logistic death i.eversmoke i.male male##c.age bmisp*  
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]
