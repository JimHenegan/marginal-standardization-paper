# Synthetic data

The dataset used for the paper is from the [ARIC Study](https://sites.cscc.unc.edu/aric/). In this folder, we provide a modified ('synthetic') version of that dataset. The interested user can use this synthetic dataset to produce results similar to the ones given in the paper.

## Data dictionary

We provide pre-calculated BMI spline terms, as these terms were regularly used for the models in the paper.

| Variable Name | Variable Label                               |
| ------------- | -------------------------------------------- |
| `synth_id`      | Row number of the synthetic dataset          |
| `death`         | Participant is known to have died by Visit 7 |
| `eversmoke`     | Participant ever smoked cigarettes (1 = Yes, 0 = No) |
| `male` | Male indicator (1 = Male, 0 = Female) |
| `age` | Age at baseline visit in years | 
| `bmi`           | Body Mass Index (kg/m^2) at baseline visit  |
| `bmisp1` | BMI spline term: bmi | 
| `bmisp2` | BMI spline term: max(bmi - 18, 0) | 
| `bmisp3` | BMI spline term: max(bmi - 25, 0)| 
| `bmisp4` | BMI spline term:  max(bmi - 30, 0) | 
| `bmisp5` | BMI spline term:  max(bmi - 40, 0) | 
