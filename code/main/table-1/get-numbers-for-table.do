clear
import delimited "../../../synthetic-data/aric-synth.csv"

// Risk for smokers (cross tab)
summarize death if eversmoke == 1
display r(mean)

// Risk for non-smokers (cross tab)
summarize death if eversmoke == 0
display r(mean)

// Odds Ratio (cross tab)
logistic death i.eversmoke
display r(table)[1,2]

// Risk difference (cross tab)
margins r.eversmoke

// Risk ratio (cross tab)
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]

// Risks for smokers and non-smokers 
// (model based standardization with sex as only confounder)
logistic death i.eversmoke i.male 
margins eversmoke

// odds ratio (model based standardization with sex as only confounder)
logistic death i.eversmoke i.male 

// risk difference (model based standardization with sex as only confounder)
margins r.eversmoke

// risk ratio (model based standardization with sex as only confounder)
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]

// Propensity score approach (setup)
logit eversmoke i.male
predict phat
gen iptw=cond(eversmoke==1,1/phat,1/(1-phat))
drop phat 

// risks for smokers and non-smokers 
// (propensity score approach with sex as only confounder)
logit death i.eversmoke [pw=iptw]
margins eversmoke

// odds ratio (propensity score approach with sex as only confounder)
logistic death i.eversmoke [pw=iptw]

// risk difference (propensity score approach with sex as only confounder)
margins r.eversmoke

// risk ratio (propensity score approach with sex as only confounder)
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]

// clean up 
drop iptw

// Full model
logistic death i.eversmoke i.male male##c.age bmisp*  

// risk for smokers and non-smokers 
// (model based standardization with multiple confounders)
margins eversmoke

// odds ratio (model based standardization with multiple confounders)
logistic death i.eversmoke i.male male##c.age bmisp*  

// risk difference (model based standardization with multiple confounders)
margins r.eversmoke

// risk ratio (model based standardization with multiple confounders)
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]


// Propensity score approach (setup)
logit eversmoke male##c.age bmisp*
predict phat
gen iptw=cond(eversmoke==1,1/phat,1/(1-phat))
drop phat

// risk for smokers and non-smokers 
// (propensity score approach with multiple confounders)
logit death i.eversmoke [pw=iptw]
margins eversmoke

// odds ratio (propensity score approach with multiple confounders)
logistic death i.eversmoke [pw=iptw]

// risk difference (propensity score approach with multiple confounders)
margins r.eversmoke

// risk ratio (propensity score approach with multiple confounders)
margins eversmoke, post
nlcom _b[1.eversmoke]/_b[0.eversmoke]

// clean up
drop iptw