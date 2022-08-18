library(boot)  

# Given a formula, data, and a main_effect,
# compute the predictive margins associated with the main_effect and 
# return estimates for the risk difference and the ratio.

# In particular, this will let us get estimates 
# for the risk differences (delta) and risk ratios (ratio) 
# based on the original (non-bootstraped) data.

logit_standardization <- function(formula, main_effect, data, num_bootstrap_replicates){
  
  # Get the estimates for the delta and the ratio
  estimates <- get_delta_and_ratio_estimates(
    formula = formula,
    data = data,
    main_effect = main_effect
  )
  
  # Clean them
  clean_estimates <- handle_estimates(estimates)
  
  # Pass the the results from our call to boot
  raw_results_from_boot <- 
    get_results_from_boot(data = data,
                          num_bootstrap_replicates = num_bootstrap_replicates,
                          formula = formula,
                          main_effect = main_effect)
  
  # Clean them
  clean_results_from_boot <- handle_results_from_boot(raw_results_from_boot)
  
  # Combine our cleaned estimates into a data frame
  table_of_results <- make_df(clean_estimates, clean_results_from_boot)
  
  # Return the table
  return(table_of_results)
}


# Analysis Helpers
# ----------------

get_delta_and_ratio_estimates <- function(formula, data, main_effect){
  # Fit the logistic model using the data that was passed in.
  # This model will be used to generate our predictive margins (pm),
  # hence the name "pm.fit".
  pm.fit <- glm(formula = formula, family = binomial, data = data)
  
  ###########################################
  # make a copy of our data and change it
  # so that the value of our main_effect is always 0 
  data0 <- data
  data0[main_effect] <- 0 
  
  # make predictions based on this data
  phat0 <- predict(pm.fit, newdata = data0, type = c("response"))
  
  # compute the mean
  mean0 <- mean(phat0)
  
  ##############################################
  # make a copy of our data and change it 
  # so that the value of our main_effect is always 1
  data1 <- data
  data1[main_effect] <- 1 
  
  # make predictions based on this data
  
  phat1 <- predict(pm.fit, newdata = data1, type =c ("response"))
  
  # compute the mean
  mean1 <- mean(phat1)
  
  ##############################################
  # These are the statistics we will return:
  #   - "delta" : the risk difference and
  #   - "ratio" : the risk ratio
  delta <- mean1 - mean0
  ratio <- mean1 / mean0
  
  # prepare to return the results: the delta and the ratio
  to_return = list(delta = delta, ratio = ratio)
  
  # return the results
  return(to_return)
}



# A wrapper function for the call to boot.
# Note that this function requires the pm_fun function to be defined.
get_results_from_boot <- function(data, num_bootstrap_replicates, formula, main_effect){
  boot(data = data, 
       statistic = pm_fun,
       R = num_bootstrap_replicates,
       formula = formula,
       main_effect = main_effect)
}

# Bootstrap function for predictive margins
# Adapted from Russell's code
pm_fun <- function(data, indices, formula, main_effect) {
  # get our bootstrap sample based on the indices passed in by boot
  bootstrap_sample <- data[indices,] 
  
  # Get the estimates for the delta and the ratio
  results <- 
    get_delta_and_ratio_estimates(
      formula = formula,
      main_effect = main_effect,
      data = bootstrap_sample
    )
  
  # These are the statistics we wish to bootstrap:
  #   - "delta" : the risk difference and
  #   - "ratio" : the risk ratio
  delta <- results$delta
  ratio <- results$ratio
  
  # return the statistics
  return(c(delta, ratio))
}



# Presentation Helpers
# ---------------------

# clean up the estimates returned by "get_delta_and_ratio_estimates"
handle_estimates <- function(estimates){
  
  delta <- estimates$delta
  ratio <- estimates$ratio
  
  # clean up the estimates to help with presentation
  clean_delta <- format(round(delta ,4), nsmall = 4)
  clean_ratio <- format(round(ratio ,4), nsmall = 4)
  
  # prepare to return the clean estimates
  clean_estimates <- list(
    clean_delta = clean_delta,
    clean_ratio = clean_ratio
  )
  
  
  # return the clean estimates
  return(clean_estimates)
}



# Extract the bounds for the confidence interval
# that we got back from the call to "boot" 
# and try to present them in a clean manner.
handle_results_from_boot <- function(results){
  # Get, round, and format the CI for delta
  ci_delta <- boot.ci(results, index=1, type=c("perc"))
  lb_delta <- format(round(ci_delta$percent[4], 4), nsmall = 4)
  ub_delta <- format(round(ci_delta$percent[5], 4), nsmall = 4)
  
  # Get, round, and format the CI for the ratio
  ci_ratio <- boot.ci(results, index=2, type=c("perc"))
  lb_ratio <- format(round(ci_ratio$percent[4], 4), nsmall = 4)
  ub_ratio <- format(round(ci_ratio$percent[5], 4), nsmall = 4)
  
  # prepare to return the results as a list
  to_return <- list(
    lb_delta = lb_delta,
    ub_delta = ub_delta,
    lb_ratio = lb_ratio,
    ub_ratio = ub_ratio
  )
  
  # return the results
  return(to_return)
}


# Combine the results from handle_estimates and the handle_results_from_boot
# and present them as a data frame
make_df <- function(clean_estimates, clean_results_from_boot){
  
  delta <- clean_estimates$clean_delta
  ratio <- clean_estimates$clean_ratio
  
  lb_delta <- clean_results_from_boot$lb_delta
  ub_delta <- clean_results_from_boot$ub_delta
  
  lb_ratio <- clean_results_from_boot$lb_ratio
  ub_ratio <- clean_results_from_boot$ub_ratio
  # Prepare to store the results as a data frame
  estimates <- c(delta, ratio)
  lbs <- c(lb_delta, lb_ratio)
  ubs <- c(ub_delta, ub_ratio)
  
  # Store the results as a data frame
  columns <- cbind(estimates, lbs, ubs)
  result_df <- as.data.frame(columns)
  colnames(result_df) <- c("Estimate", "CILB", "CIUB")
  row.names(result_df) <- c("Risk Difference", "Risk Ratio")
  
  # Return the data frame
  return(result_df)
}
