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
