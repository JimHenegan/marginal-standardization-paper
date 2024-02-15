# Appendix Table 1

This folder contains a script ([`appendix-table-1.do`](./appendix-table-1.do)) that produces Table 1 in the Appendix.

## Table of Comparisons

The script uses the synthetic data provided by the repository, so the numbers produced by the script may differ from the ones presented in the paper. The table below compares the results from the paper with the results from the synthetic data.

| Description                             | Result from paper | Result from synthetic data |
| --------------------------------------- | ----------------- | -------------------------- |
| number of never smokers with death == 1 | `2643`            | `2638`                     |
| number of never smokers with death == 0 | `3920`            | `3924`                     |
| number of ever smokers with death == 1  | `5243`            | `5243`                     |
| number of ever smokers with death == 0  | `3947`            | `3948`                     |
| number of never smokers                 | `6563`            | `6562`                     |
| number of ever smokers                  | `9190`            | `9191`                     |
| total sample size                       | `15753`           | `15753`                    |
| risk of death for never smokers         | `0.403`           | `0.402`                    |
| risk of death for ever smokers          | `0.571`           | `0.570`                    |
| risk difference estimate                | `0.168`           | `0.168`                    |
| risk difference lower bound             | `0.152`           | `0.153`                    |
| risk difference upper bound             | `0.183`           | `0.184`                    |
| risk ratio estimate                     | `1.417`           | `1.419`                    |
| risk ratio lower bound                  | `1.368`           | `1.370`                    |
| risk ratio upper bound                  | `1.465`           | `1.468`                    |
| smoking prevalence                      | `0.583`           | `0.583`                    |
