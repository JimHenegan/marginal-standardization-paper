# Compute numbers shown in Table 1

This folder contains code that indicates how to produce the results shown in Table 1.

## Table of Comparisons

The script uses the synthetic data provided by the repository, so the numbers produced by the script may differ from the ones presented in the paper. The table below compares the results from the paper with the results from the synthetic data.

| Description | Result from paper | Result from synthetic data | 
| ------------| --------------------- | -------------------------- | 
| risk for smokers (cross tab) | `0.571` | `0.570` | 
| risk for non-smokers (cross tab) | `0.403` | `0.402` | 
| Odds Ratio (cross tab) | `1.970` | `1.975` | 
| risk difference (cross tab) | `0.168` | `0.168` | 
| risk difference lower bound (cross tab) | `0.152` | `0.153` | 
| risk difference upper bound (cross tab) | `0.183` | `0.184` | 
| risk ratio (cross tab) | `1.417` | `1.419` | 
| risk risk ratio lower bound (cross tab) | `1.368` | `1.370` | 
| risk risk ratio upper bound (cross tab) | `1.465` | `1.468` | 
| risk for smokers (model based standardization with sex as only confounder) | `0.560` | `0.560` | 
| risk for non-smokers (model based standardization with sex as only confounder) | `0.417` | `0.416` | 
| odds ratio (model based standardization with sex as only confounder) | `1.788` | `1.796` | 
| risk difference (model based standardization with sex as only confounder) | `0.143` | `0.144` | 
| risk difference lower bound (model based standardization with sex as only confounder) | `0.127` | `0.128` | 
| risk difference upper bound (model based standardization with sex as only confounder) | `0.159` | `0.160` | 
| risk ratio (model based standardization with sex as only confounder) | `1.342` | `1.345` | 
| risk risk ratio lower bound (model based standardization with sex as only confounder) | `1.295` | `1.298` | 
| risk risk ratio upper bound (model based standardization with sex as only confounder) | `1.389` | `1.392` | 
| risk for smokers (propensity score approach with sex as only confounder) | `0.558` | `0.558` | 
| risk for non-smokers (propensity score approach with sex as only confounder) | `0.412` | `0.411` | 
| odds ratio (propensity score approach with sex as only confounder) | `1.798` | `1.806` | 
| risk difference (propensity score approach with sex as only confounder) | `0.145` | `0.147` | 
| risk difference lower bound (propensity score approach with sex as only confounder) | `0.129` | `0.130` | 
| risk difference upper bound (propensity score approach with sex as only confounder) | `0.162` | `0.163` | 
| risk ratio (propensity score approach with sex as only confounder) | `1.353` | `1.356` | 
| risk risk ratio lower bound (propensity score approach with sex as only confounder) | `1.304` | `1.308` | 
| risk risk ratio upper bound (propensity score approach with sex as only confounder) | `1.401` | `1.405` | 
| risk for smokers (model based standardization with multiple confounders) | `0.562` | `0.562` | 
| risk for non-smokers (model based standardization with multiple confounders) | `0.416` | `0.415` | 
| odds ratio (model based standardization with multiple confounders) | `2.066` | `2.072` | 
| risk difference (model based standardization with multiple confounders) | `0.146` | `0.147` | 
| risk difference lower bound (model based standardization with multiple confounders) | `0.132` | `0.133` | 
| risk difference upper bound (model based standardization with multiple confounders) | `0.161` | `0.162` | 
| risk ratio (model based standardization with multiple confounders) | `1.352` | `1.355` | 
| risk risk ratio lower bound (model based standardization with multiple confounders) | `1.309` | `1.312` | 
| risk risk ratio upper bound (model based standardization with multiple confounders) | `1.395` | `1.398` | 
| risk for smokers (propensity score approach with multiple confounders) | `0.561` | `0.561` | 
| risk for non-smokers (propensity score approach with multiple confounders) | `0.413` | `0.412` | 
| odds ratio (propensity score approach with multiple confounders) | `1.816` | `1.822` | 
| risk difference (propensity score approach with multiple confounders) | `0.148` | `0.149` | 
| risk difference lower bound (propensity score approach with multiple confounders) | `0.131` | `0.132` | 
| risk difference upper bound (propensity score approach with multiple confounders) | `0.164` | `0.165` | 
| risk ratio (propensity score approach with multiple confounders) | `1.358` | `1.361` | 
| risk risk ratio lower bound (propensity score approach with multiple confounders) | `1.309` | `1.312` | 
| risk risk ratio upper bound (propensity score approach with multiple confounders) | `1.407` | `1.410` | 
