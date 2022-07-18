Data
================
## Abstract

This research analyzes paired recurrent event data from the Childrens Hopsital Colorado time to tympanoplasty failure dataset. The information in this dataset include ear side (right or left), treatment for tympanoplasty, and time to failure. Each patient can be considered a cluster with paired ears as a sub-cluster. Tt is possible for a patient to have sub-clusters of one or both ears and graft failure rates may differ by sub-cluster. To minic the CHCO dataset, we simulated 1,000 datasets for six different pair percentages: 10%, and 50: 90% using the nested MPL fraitly Cox model.

## Availability

Per the Childrens Hospital Colordao, the data cannot be made publicly available because of the sensitivity of the information.

## Simulated data

All simulated data were simulated using the 'Simulate Data Code.R'. That is, we simulated 1,000 datasets for six different pair percentages: 10%, 50%, 60%, 70%, 80% and 90%. Each simulated dataset simulated time to failure using the nested MPL fraitly Cox model for 600 patients. The model included cluster and sub-cluster random effects and three predictors: side of sub-cluster (left or right ear), a treatment assignment (Fascia or non-Fascia), and the interaction between the two. Sub-cluster side was assumed to be constant over time, while treatment could vary by each ear and recurrent event. 

## Files
Simulated data is provied here broken down by pair percentages. For example 'Data_90.rds' is the 1,000 iterations for the simulated data for pair percentages of 90. The same format is done for the Null data. The sensitivity data is only simulated for 90% pairs.
The 'Simulate Data Code.R' is written to simulate all pair percentages into one large dataset, however due to file upload size limits of Github, the data has been saved here brokendown by pair percentages.


Code
================
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
This R code take the large saved model output and summarized it by taking the mean value to concisely summarize each model by pair percentage. 

**Tables.R**  
This R code takes the saved summarized model output and produces the 14 plots found in the paper. This code does not include table 3 in the paper: the results from the CHCO dataset.

**Plots.R**  
This R code takes the saved summarized model output and produces the 8 plots found in the paper.
