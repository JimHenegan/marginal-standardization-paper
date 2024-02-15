# Compute Numbers for Figure 1

This folder contains a Stata script ([`numbers-for-figure-1.do`](./numbers-for-figure-1.do)) that indicates how one might get the numbers used in Figure 1.

## Table of Comparisons

The script uses the synthetic data provided by the repository, so the numbers produced by the script may differ from the ones presented in the paper. The table below compares the results from the paper with the results from the synthetic data.

| Description                                                    | Result given in paper | Result from synthetic data |
| -------------------------------------------------------------- | --------------------- | -------------------------- |
| number of never smokers                                        | `6563`                | `6562`                     |
| number of never smokers with death == 1                        | `2643`                | `2638`                     |
| crude death risk of never smokers                              | `0.403`               | `0.402`                    |
| number of ever smokers                                         | `9190`                | `9191`                     |
| number of ever smokers with death == 1                         | `5243`                | `5243`                     |
| crude death risk of ever smokers                               | `0.571`               | `0.570`                    |
| crude risk difference                                          | `0.168`               | `0.168`                    |
| crude relative risk                                            | `1.417`               | `1.419`                    |
| male prevalence                                                | `0.449`               | `0.449`                    |
| proportion of males who are ever smokers                       | `0.720`               | `0.718`                    |
| proportion of males who are never smokers                      | `0.280`               | `0.282`                    |
| female prevalence                                              | `0.551`               | `0.551`                    |
| proportion of females who are ever smokers                     | `0.473`               | `0.473`                    |
| proportion of females who are never smokers                    | `0.527`               | `0.527`                    |
| risk of death for male ever smokers                            | `0.624`               | `0.624`                    |
| risk of death for male never smokers                           | `0.449`               | `0.447`                    |
| risk of death for female ever smokers                          | `0.504`               | `0.504`                    |
| risk of death for female never smokers                         | `0.383`               | `0.382`                    |
| overall death rate for counterfactual never-smoking population | `0.412`               | `0.411`                    |
| overall death rate for counterfactual ever-smoking population  | `0.558`               | `0.558`                    |
| standardized risk difference                                   | `0.145`               | `0.147`                    |
| standardized relative risk                                     | `1.353`               | `1.356`                    |
