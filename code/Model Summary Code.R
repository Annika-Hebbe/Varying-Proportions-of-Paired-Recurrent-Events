# Model Summary
library(magrittr)
library(dplyr)

#load in Full model output

full <- read.csv("full.txt", sep="")

full_sum <- full %>%  
                      mutate(B1_bais = B1 - 0.3,
                      B1_var = B1_sd^2,
                      B1_type2 =ifelse(B1_pval > 0.05,1,0),
                      B2_bais = B2 - 0.4,
                      B2_var = B2_sd^2,
                      B2_type2 =ifelse(B2_pval > 0.05,1,0),
                      B3_bais = B3 - -0.25,
                      B3_var = B3_sd^2,
                      B3_type2 =ifelse(B3_pval > 0.05,1,0)) %>% 

                      group_by(perc.ear, model) %>% 
  
                      summarise(
                      B1_bias = round(mean(B1_bais), 5),
                      B1_bais_ll = round(mean(B1_bais)- 1.96*sd(B1_bais), 5),
                      B1_bais_ul = round(mean(B1_bais)+ 1.96*sd(B1_bais), 5),
                      B1_var = round(mean(B1_var), 5),
                      B1_MSE = round(mean(B1_bias^2+B1_var), 5),
                      B1_type2 = round((1-mean(B1_type2))*100, 1),
                      B2_bias = round(mean(B2_bais), 5),
                      B2_bais_ll = round(mean(B2_bais)- 1.96*sd(B2_bais), 5),
                      B2_bais_ul = round(mean(B2_bais)+ 1.96*sd(B2_bais), 5),
                      B2_var = round(mean(B2_var), 5),
                      B2_MSE = round(mean(B2_bias^2+B2_var), 5),
                      B2_type2 = round((1-mean(B2_type2))*100, 1),
                      B3_bias = round(mean(B3_bais), 5),
                      B3_bais_ll = round(mean(B3_bais)- 1.96*sd(B3_bais), 5),
                      B3_bais_ul = round(mean(B3_bais)+ 1.96*sd(B3_bais), 5),
                      B3_var = round(mean(B3_var), 5),
                      B3_MSE = round(mean(B3_bias^2+B3_var), 5),
                      B3_type2 = round((1-mean(B3_type2))*100, 1),
                      C_bias = round(mean(group_effect-0.3), 5),
                      C_bais_ll = round(mean(group_effect-0.3)- 1.96*sd(group_effect-0.3), 5),
                      C_bais_ul = round(mean(group_effect-0.3)+ 1.96*sd(group_effect-0.3), 5),
                      Sc_bias = round(mean(subgroup_effect-0.15), 5),
                      Sc_bais_ll = round(mean(subgroup_effect-0.15)- 1.96*sd(subgroup_effect-0.15), 5),
                      Sc_bais_ul = round(mean(subgroup_effect-0.15)+ 1.96*sd(subgroup_effect-0.15), 5),
                      AIC = mean(AIC))

colnames(full_sum)[2] <- "Model"
levels(full_sum$Model) <- c("HKC", "NF PPL", "GF","Logistic", "NF MPL", "PWP")
full_sum$Model <- factor(full_sum$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))

write.table(full_sum, file="Full.txt", row.names = F)





#load in Null model output

null <- read.csv("null.txt", sep="")

null_sum <- null %>%  
  mutate(B1_bais = B1 -0,
         B1_var = B1_sd^2,
         B1_type2 =ifelse(B1_pval > 0.05,1,0),
         B2_bais = B2 - 0,
         B2_var = B2_sd^2,
         B2_type2 =ifelse(B2_pval > 0.05,1,0),
         B3_bais = B3 - 0,
         B3_var = B3_sd^2,
         B3_type2 =ifelse(B3_pval > 0.05,1,0)) %>% 
  
  group_by(perc.ear, model) %>% 
  
  summarise(
    B1_bias = round(mean(B1_bais), 5),
    B1_bais_ll = round(mean(B1_bais)- 1.96*sd(B1_bais), 5),
    B1_bais_ul = round(mean(B1_bais)+ 1.96*sd(B1_bais), 5),
    B1_var = round(mean(B1_var), 5),
    B1_MSE = round(mean(B1_bias^2+B1_var), 5),
    B1_type2 = round((1-mean(B1_type2))*100, 1),
    B2_bias = round(mean(B2_bais), 5),
    B2_bais_ll = round(mean(B2_bais)- 1.96*sd(B2_bais), 5),
    B2_bais_ul = round(mean(B2_bais)+ 1.96*sd(B2_bais), 5),
    B2_var = round(mean(B2_var), 5),
    B2_MSE = round(mean(B2_bias^2+B2_var), 5),
    B2_type2 = round((1-mean(B2_type2))*100, 1),
    B3_bias = round(mean(B3_bais), 5),
    B3_bais_ll = round(mean(B3_bais)- 1.96*sd(B3_bais), 5),
    B3_bais_ul = round(mean(B3_bais)+ 1.96*sd(B3_bais), 5),
    B3_var = round(mean(B3_var), 5),
    B3_MSE = round(mean(B3_bias^2+B3_var), 5),
    B3_type2 = round((1-mean(B3_type2))*100, 1),
    C_bias = round(mean(group_effect-0.3), 5),
    C_bais_ll = round(mean(group_effect-0.3)- 1.96*sd(group_effect-0.3), 5),
    C_bais_ul = round(mean(group_effect-0.3)+ 1.96*sd(group_effect-0.3), 5),
    Sc_bias = round(mean(subgroup_effect-0.15), 5),
    Sc_bais_ll = round(mean(subgroup_effect-0.15)- 1.96*sd(subgroup_effect-0.15), 5),
    Sc_bais_ul = round(mean(subgroup_effect-0.15)+ 1.96*sd(subgroup_effect-0.15), 5),
    AIC = mean(AIC))


colnames(null_sum)[2] <- "Model"
levels(null_sum$Model) <- c("HKC", "NF PPL", "GF","Logistic", "NF MPL", "PWP")
null_sum$Model <- factor(null_sum$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))

write.table(null_sum, file="Null.txt", row.names = F)

#### Checks ####
Chks <- read.csv("Checks.txt", sep="")


Chks$C_bias = ifelse(Chks$perc.ear == "novar", Chks$group_effect- 0, Chks$group_effect-0.3)

Chks$Sc_bias = ifelse(Chks$perc.ear == "largeSC", Chks$subgroup_effect- 1.15, 
                      Chks$subgroup_effect-0)




Chks_sum <- Chks %>%  
  mutate(B1_bais = B1 - 0.3,
         B1_var = B1_sd^2,
         B1_type2 =ifelse(B1_pval > 0.05,1,0),
         B2_bais = B2 - 0.4,
         B2_var = B2_sd^2,
         B2_type2 =ifelse(B2_pval > 0.05,1,0),
         B3_bais = B3 - -0.25,
         B3_var = B3_sd^2,
         B3_type2 =ifelse(B3_pval > 0.05,1,0)) %>% 
  
  group_by(perc.ear, model) %>% 
  
  summarise(
    B1_bias = round(mean(B1_bais), 5),
    B1_bais_ll = round(mean(B1_bais)- 1.96*sd(B1_bais), 5),
    B1_bais_ul = round(mean(B1_bais)+ 1.96*sd(B1_bais), 5),
    B1_var = round(mean(B1_var), 5),
    B1_MSE = round(mean(B1_bias^2+B1_var), 5),
    B1_type2 = round((1-mean(B1_type2))*100, 1),
    B2_bias = round(mean(B2_bais), 5),
    B2_bais_ll = round(mean(B2_bais)- 1.96*sd(B2_bais), 5),
    B2_bais_ul = round(mean(B2_bais)+ 1.96*sd(B2_bais), 5),
    B2_var = round(mean(B2_var), 5),
    B2_MSE = round(mean(B2_bias^2+B2_var), 5),
    B2_type2 = round((1-mean(B2_type2))*100, 1),
    B3_bias = round(mean(B3_bais), 5),
    B3_bais_ll = round(mean(B3_bais)- 1.96*sd(B3_bais), 5),
    B3_bais_ul = round(mean(B3_bais)+ 1.96*sd(B3_bais), 5),
    B3_var = round(mean(B3_var), 5),
    B3_MSE = round(mean(B3_bias^2+B3_var), 5),
    B3_type2 = round((1-mean(B3_type2))*100, 1),
    C = round(mean(group_effect), 5),
    C_bias = round(mean(C_bias), 5),
    C_bais_ll = round(mean(C_bias)- 1.96*sd(C_bias), 5),
    C_bais_ul = round(mean(C_bias)+ 1.96*sd(C_bias), 5),
    Sc_bias = round(mean(Sc_bias), 5),
    Sc = round(mean(subgroup_effect), 5),
    Sc_bais_ll = round(mean(Sc_bias)- 1.96*sd(Sc_bias), 5),
    Sc_bais_ul = round(mean(Sc_bias)+ 1.96*sd(Sc_bias), 5),
    AIC = mean(AIC))





colnames(Chks_sum)[2] <- "Model"
levels(Chks_sum$Model) <- c("HKC", "NF PPL", "GF","Logistic", "NF MPL", "PWP")
Chks_sum$Model <- factor(Chks_sum$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))
write.table(Chks_sum, file="/Users/annikahebbe/Desktop/Thesis Submission/Model Summary/Data/Checks.txt", row.names = F)






