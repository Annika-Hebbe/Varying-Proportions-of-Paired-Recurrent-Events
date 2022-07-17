## Abstract

The code includes all functions necessary to run the results from the simulated data found in Section 3 of the paper. The file ‘Simulate data Code.R’ provides code to reproduce the simulated data stored in the data folder. The ‘Model output code.R’ provides code to run the simulated data through the multiple models discussed in the paper and the ‘Model summary code.R’ takes the model output and summarized it concisely. Lastly, the tables.R and plots.R code provide code to recreate the tables and plots seen in the paper.
 


## Description
The following code files were used to obtain model output and summarize the output for the manuscript. 

**Model Output Code.R**  
This R code filters the simulated datasets through the following models: generalized linear mixed model, the Prentice-Williams-Peterson model, a gamma frailty model, nested maximum penalized likelihood frailty model, partial penalized likelihood frailty model, and a hierarchical copula model. Beta coeffects, variance, p-values and when applicable variance of random effects are collected from each model thought this code and saved for each iteration. There are four different functions to run the data through, one function runs the generalized linear mixed model, the Prentice-Williams-Peterson model, and a gamma frailty model. The following three functions run the nested maximum penalized likelihood frailty model, partial penalized likelihood frailty model, and hierarchical copula model separately. This was done due to some models running into errors that would terminate an R session and by separating them out it was possible to identify the iteration that would not run properly. 

The HKC model sources a code file that is not publicly available called CodeSNW.R, which is not provided here due to being a code file provided by Su, C. L., Nešlehová, J. G., & Wang, W. (2019). Modelling hierarchical clustered censored data with the hierarchical Kendall copula. Canadian Journal of Statistics, 47(2), 182-203.  If one wishes to reproduce the model out from the HKC model, one should email Johanna G. Neslehova (johanna.neslehova@mcgill.ca) and ask for the appropriate code. 


**Combine Dataset Code.R**  
This R code takes the four saved output files and saves them into one large file to concisely summaries.

**Model Summary Code.R**  


**Tables.R**  

**Plot.R**  


## Softwear Requirments

R version 3.6.2. was used 

R packages to run reproducible code:

dplyr (1.0.8 or later)

tidyr (2.0.2 or later)

magrittr(2.0.2 or later)

lme4 (1.1- 23 or later)

survival (3.1- 8 or later)

frailtypack (3.1.0 or later)

coxme (2.2 - 16 or later)

ggplot2 (3.3.6. or later)


