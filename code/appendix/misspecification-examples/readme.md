# Illustrate effects of model misspecification

This folder contains scripts that show what can happens when one misspecifies a model.

| File Name | Description | 
| --------- | ----------- |
| [`01-poisson.do`](01-poisson.do) | An example showing how a poisson model can lead to "predicted probabilities" that are greater than 1. |
| [`02-linear.do`](02-linear.do) | An example showing how a linear model can lead to "predicted probabilities" that are greater than 1. |
| [`03-hybrid-log-binomial.do`](03-hybrid-log-binomial.do) | An example showing how a hybrid log binomial model may fail to converge. |
| [`04-hybrid-linear-binomial.do`](04-hybrid-linear-binomial.do) | An example showing how a hybrid linear binomial model may fail to converge. |