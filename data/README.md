## Abstract

This research analyzes paired recurrent event data from the Childrens Hopsital Colorado time to tympanoplasty failure dataset. The information in this dataset include ear side (right or left), treatment for tympanoplasty, and time to failure. Each patient can be considered a cluster with paired ears as a sub-cluster. Tt is possible for a patient to have sub-clusters of one or both ears and graft failure rates may differ by sub-cluster. To minic the CHCO dataset, we simulated 1,000 datasets for six different pair percentages: 10%, and 50: 90% using the nested MPL fraitly Cox model.

## Availability

Per the Childrens Hospital Colordao, the data cannot be made publicly available because of the sensitivity of the information.

## Simulated data

All simulated data were simulated using the 'Simulate Data Code.R'. That is, we simulated 1,000 datasets for six different pair percentages: 10%, 50%, 60%, 70%, 80% and 90%. Each simulated dataset simulated time to failure using the nested MPL fraitly Cox model for 600 patients. The model included cluster and sub-cluster random effects and three predictors: side of sub-cluster (left or right ear), a treatment assignment (Fascia or non-Fascia), and the interaction between the two. Sub-cluster side was assumed to be constant over time, while treatment could vary by each ear and recurrent event. 

## Code Book

event_num: Event number 

ulevel:  ID variable for upper level clustering term 

llevel: ID variable for lower level clustering term 

failure: time of failure or censoring 

delta: 1 for experienced failure, 0 for did not experience failure

cov1: treatment: 1 for "treatment", 0 for "control"  

cov2: anatomical feature: 1 for "right", 0 for "left"  

cov3: interaction between cov1 and cov2

seed: Iternation number

perc.ear: percent of patients having both "ears" intervened on.
