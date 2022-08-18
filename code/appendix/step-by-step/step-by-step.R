library(tidyverse)

# Load in data
dat <- read_csv("../../../synthetic-data/aric-synth.csv")

# Step 1:
# Fit the logistic regression model to the data 
# with the exposure of interest (eversmoke) and all potential covariates. 

formula <- death ~ eversmoke + age + male + age:male  + bmisp1 + bmisp2 +  bmisp3 + bmisp4 + bmisp5
fit <- glm(data = dat, formula = formula, family = binomial)

# Step 2: Capture the estimated regression coefficients.
summary(fit)
fit$coefficients

# Step 3:
# Now assume that all patients were exposed (eversmoke=1), 
# and at the same time that all patients continued to have their own 
# covariate patterns.  Estimate a predicted (or expected) value for risk 
# on the log odds scale.

dat_1 <- dat
dat_1["eversmoke"] <- 1
predictions_on_log_odds_scale_1 <- fit %>% predict(dat_1) 

# Step 4:
# For each patient, transform the log odds (risk) into a risk 
# with the help of the inverse logit transformation. 

inverse_logit <- function(x){
  return(exp(x)/(1+exp(x)))
}

risks_1 <- inverse_logit(predictions_on_log_odds_scale_1)

# Step 5:
# Average the individual patient estimated risk across all patients 
# to arrive at the marginally standardized risk 
# assuming that all patients are exposed, 
# to estimate theaverage risk assuming exposed, or ARiskE. 

ARiskE <- mean(risks_1)

# Step 6. Repeat steps 3,4 and 5,
# but now assuming that all patients were unexposed. 
# Estimate ARiskU, the average risk assuming the patients are unexposed.

dat_0 <- dat
dat_0["eversmoke"] <- 0
predictions_on_log_odds_scale_0 <- fit %>% predict(dat_0) 
risks_0 <- inverse_logit(predictions_on_log_odds_scale_0)
ARiskU <- mean(risks_0)

# Step 7.  Estimate

## Risk Difference

ARiskE - ARiskU

## Risk Ratio

ARiskE/ARiskU
