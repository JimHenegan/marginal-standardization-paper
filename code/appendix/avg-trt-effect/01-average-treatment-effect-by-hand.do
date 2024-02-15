/* 
Average treatment effect among the treated and untreated   
Computing "by hand"
*/

// Load in the data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Fit the model
logistic death i.eversmoke i.male##c.age bmisp*

/* xb for model  */
predict xb, xb
matlist e(b)

/* xb assuming smoker   */
gen xb0=xb - eversmoke*_b[1.eversmoke]+ 0

/* xb assuming neversmoker   */
gen xb1=xb - eversmoke*_b[1.eversmoke]+ 1*_b[1.eversmoke]

/*  phats assuming ever smoker or neversmoker  */
gen p0=invlogit(xb0)
gen p1=invlogit(xb1)

/* Marginal effect estimate (overall) */
gen pdiff=p1-p0
summ pdiff, d
display r(mean)

/* Average treatment effect among the non smokers */
summ pdiff if eversmoke==0
display r(mean)

/* Averge treatment effect among the smokers  */
summ pdiff if eversmoke==1
display r(mean)