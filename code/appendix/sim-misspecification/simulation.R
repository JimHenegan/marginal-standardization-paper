library(tidyverse)

# Appendix Section 2.1 - Simulated Example
num_obs <- 1000

# Simulate Data

## Binary exposure
A <- rbinom(n = num_obs, size = 1, prob = 0.5)

## Binary confounder
C <- rbinom(n = num_obs, size = 1, prob = 0.5)

## Age
age <- runif(n = num_obs, min = 35, max = 85)
## Age reset so that baseline is at 35 
## (i.e., reset_age == 0 <--> age = 35)
reset_age <- age - 35

## Formula to get XBeta
beta_0 <- 0
beta_1 <- log(3)
beta_2 <- log(1.05)
beta_3 <- log(2)
beta_4 <- log(2)

XBeta  <- 
  beta_0 + 
  beta_1 * A + 
  beta_2 * reset_age +
  beta_3 * C + 
  beta_4 * A * C

## Get y_hat
inv_logit <- function(x) exp(x)/(1+exp(x))
y_hat <- inv_logit(XBeta)

## Get y
get_y <- function(y_hat) rbinom(n = 1, size = 1, prob = y_hat)
y <- sapply(X = y_hat, FUN = get_y)

## Models
logistic_model <- glm(y ~ A + reset_age + C + A*C, family = "binomial")
poisson_model <- glm(y ~ A + reset_age + C + A*C, family = "poisson")

## Make predictions under different assumptions
dat <- tibble(y = y, A = A, reset_age = reset_age, C = C)
dat_exposed <- dat %>% mutate(A = 1)
dat_unexposed <- dat %>% mutate(A = 0)
A_0_logit <- logistic_model %>% predict(dat_unexposed, type = "response")
A_1_logit <- logistic_model %>% predict(dat_exposed, type = "response")
A_0_log <- poisson_model %>% predict(dat_unexposed, type = "response")
A_1_log <- poisson_model %>% predict(dat_exposed, type = "response")

## Prepare data for plot
plot_dat <- bind_rows(tibble(x = A_0_log, A = "A=0", model = "log")) %>% 
  bind_rows(tibble(x = A_1_log, A = "A=1", model = "log")) %>% 
  bind_rows(tibble(x = A_0_logit, A = "A=0", model = "logit")) %>% 
  bind_rows(tibble(x = A_1_logit, A = "A=1", model = "logit"))



# Appendix Figure 2.1
plot_dat %>% 
  ggplot(mapping = aes(x=x, color = factor(A, levels = c("A=1","A=0")),
                       linetype = factor(model, levels = c("logit", "log"))))  +
  geom_density() + 
  theme_minimal() +
  geom_vline(xintercept = 1, linetype = "dashed") +
  theme(legend.title = element_blank()) +
  xlim(0, 1.2) +
  xlab("Predicted Probability from Model") + 
  ggtitle("Log model leads to predicted probabilities greater than 1")
  

# Appendix Figure 2.2
plot_dat %>% 
  ggplot(mapping = aes(x=x, color = factor(A, levels = c("A=1","A=0")),
                       linetype = factor(model, levels = c("logit", "log"))))  +
  stat_ecdf(geom = "step") + 
  theme_minimal() +
  geom_vline(xintercept = 1, linetype = "dashed") +
  theme(legend.title = element_blank()) +
  xlim(0, 1.2)+
  xlab("Predicted Probability from Model") +
  ylab("Cumulative density") +
  ggtitle("Log model leads to predicted probabilities greater than 1")
  

  