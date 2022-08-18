# `logit_standardization`

We provide an R function that uses predictive margins from logistic regression to estimate standardized risk differences and ratios. The function provides 95th percentile confidence bounds obtained using bootstrap resampling.

The main function is stored in the `logit_standardization.R` file.  It depends on the [`boot`](https://cran.r-project.org/web/packages/boot/boot.pdf) package.

## Usage 

Suppose you have the main funciton loaded into your environment.  Then you can call the function as follows: 

```
logit_standardization(formula, main_effect, data, num_bootstrap_replicates)
```

Here, 
 - `formula` is the same `formula` you would use to define a logistic regression model with [`stats::glm`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/glm.html),
 - `main_effect` is the main treatment effect in your marginal analysis,
 - `data` is a data frame containing the variables in your `formula`,
 - `num_bootstrap_replicates` is the number of bootstrap replicates to use.

## Example

Here is some example input and output:

```
> # Load in the data
> dat <- read_csv("../../../synthetic-data/aric-synth.csv")

> # Define the formula
> formula <- death ~ eversmoke + age + male + age:male + bmisp1 + bmisp2 +  bmisp3 + bmisp4 + bmisp5

> # Call the bootstrap_delta_ratio function
> results <- 
+   bootstrap_delta_ratio(
+     formula = formula,
+     main_effect = "eversmoke",  
+     data = dat,
+     num_bootstrap_replicates = 199
+   )
> 

> # View the results
> results
                Estimate   CILB   CIUB
Risk Difference   0.1473 0.1292 0.1617
Risk Ratio        1.3551 1.3028 1.3997
```

See [`example.r`](./example.r) for a full example.
