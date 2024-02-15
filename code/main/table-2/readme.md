# Appendix Table 2

This folder contains a Stata script ([`appendix-table-1.do`](./appendix-table-1.do)) that produces Table 2 in the Appendix.

## Table of Comparisons

The script uses the synthetic data provided by the repository, so the numbers produced by the script may differ from the ones presented in the paper. The table below compares the results from the paper with the results from the synthetic data.

| Description                                   | Result from real data | Result from synthetic data |
| --------------------------------------------- | --------------------- | -------------------------- |
| female count                                  | `8686`                | `8678`                     |
| count of female never smokers with death == 0 | `2828`                | `2822`                     |
| count of female never smokers with death == 1 | `1753`                | `1748`                     |
| count of female ever smokers with death == 0  | `2037`                | `2037`                     |
| count of female ever smokers with death == 1  | `2068`                | `2071`                     |
| risk of death for female never smokers        | `0.383`               | `0.382`                    |
| risk of death for female ever smokers         | `0.504`               | `0.504`                    |
| smoking prevalence among females              | `0.473`               | `0.473`                    |
| male count                                    | `7067.0`              | `7075.0`                   |
| count of male never smokers with death == 0   | `1092.0`              | `1102.0`                   |
| count of male never smokers with death == 1   | `890.0`               | `890.0`                    |
| count of male ever smokers with death == 0    | `1910.0`              | `1911.0`                   |
| count of male ever smokers with death == 1    | `3175.0`              | `3172.0`                   |
| risk of death for male never smokers          | `0.449`               | `0.447`                    |
| risk of death for male ever smokers           | `0.624`               | `0.624`                    |
| smoking prevalence among males                | `0.720`               | `0.718`                    |
| female never-smoke product                    | `0.211`               | `0.211`                    |
| female ever-smoke product                     | `0.278`               | `0.278`                    |
| male never-smoke product                      | `0.201`               | `0.201`                    |
| male ever-smoke product                       | `0.280`               | `0.280`                    |
| standardized death rate for never-smokers     | `0.412`               | `0.411`                    |
| standardized death rate for ever-smokers      | `0.558`               | `0.558`                    |
| standardized risk difference                  | `0.145`               | `0.147`                    |
| standardized relative risk                    | `1.353`               | `1.356`                    |
