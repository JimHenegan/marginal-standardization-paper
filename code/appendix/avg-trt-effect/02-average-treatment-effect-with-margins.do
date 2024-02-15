/* 
Average treatment effect among the treated and untreated   
Computing with the help of the "margins" command
*/

// Load in the data
clear
import delimited "../../../synthetic-data/aric-synth.csv"

/* 
  Average Treament Effect among the Treated, where "Treatment" = "Smoking"
  ATT (eversmoke==1)   
 */

 logistic death i.eversmoke i.male##c.age bmisp*
margins if eversmoke==1, at(eversmoke=(0 1)) post
matlist e(b) 			// to see naming of betas in Stata memory 
lincom _b[2._at] - _b[1._at]


/* 
  Average Treament Effect among the Unreated
  ATT (eversmoke==0)   
 */


logit death i.eversmoke i.male##c.age bmisp*
margins if eversmoke==0, at(eversmoke=(0 1)) post
matlist e(b) 			// to see naming of betas in Stata memory 
lincom _b[2._at] - _b[1._at]