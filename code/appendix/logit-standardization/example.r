library(tidyverse)

# Load in the logit_standardization function
source("./logit_standardization.R")

# Load in the data
dat <- read_csv("../../../synthetic-data/aric-synth.csv")

# Set a seed to make bootstrap sampling reproducible
set.seed(12345) 

# Define a formula for your model
formula <- death ~ eversmoke + age + male + age:male + bmisp1 + bmisp2 +  bmisp3 + bmisp4 + bmisp5

# Call the bootstrap_delta_ratio function
results <- 
  logit_standardization(
    data = dat,
    formula = formula,
    main_effect = "eversmoke",  
    num_bootstrap_replicates = 199
  )

# View the results
results