# Annikas code
#### Full ####
full_3 <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.1_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.5_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.6, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.6_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.7_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.8_3.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Full/full_0.9_3.txt", sep="")))))))
full_3$group_effect <- full_3$var_random_effect
full_3 %<>% select(-var_random_effect)


full_ppl <- read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/Full/Full_ppl.txt", sep="")
full_ppl %<>% select(-var_random_effect, -group_effect_bias, -subgroup_effect_bias)

full_mpl <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.1_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.5_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.6,
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.6_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.7_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.8_mpl.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_0.9_mpl.txt", sep="")))))))
full_mpl %<>% select(-var_random_effect)


full_hkc <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.1_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.5_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.6,
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.6_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.7_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.8_hkc.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_0.9_hkc.txt", sep="")))))))
full_hkc %<>% select(-var_random_effect)

full <- rbind(full_3, rbind(full_ppl, rbind(full_mpl,full_hkc)))

write.table(full, file="/Users/annikahebbe/Desktop/Thesis Submission/Model Output/Combined/Full.txt", row.names = F)





#### Null ####
null_3 <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_0.1_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_0.5_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.6, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_0.6_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_0.7_3.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_0.8_3.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_0.9_3.txt", sep="")))))))
null_3$group_effect <- null_3$var_random_effect
null_3 %<>% select(-var_random_effect)


null_ppl <- read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/null/null_ppl.txt", sep="")
null_ppl %<>% select(-var_random_effect, -group_effect_bias, -subgroup_effect_bias)

null_mpl <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.1_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.5_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.6,
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.6_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.7_mpl.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.8_mpl.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_0.9_mpl.txt", sep="")))))))
null_mpl %<>% select(-var_random_effect)


null_hkc <- 
rbind(data.frame(perc.ear= 0.1, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.1_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.5, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.5_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.6,
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.6_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.7, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.7_hkc.txt", sep="")),
rbind(data.frame(perc.ear= 0.8, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.8_hkc.txt", sep="")),
      data.frame(perc.ear= 0.9, 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_0.9_hkc.txt", sep="")))))))
null_hkc %<>% select(-var_random_effect)

null <- rbind(null_3, rbind(null_ppl, rbind(null_mpl,null_hkc)))

write.table(null, file="/Users/annikahebbe/Desktop/Thesis Submission/Model Output/Combined/null.txt", row.names = F)


#### Checks ####
chks_3 <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Checks/noSC_3.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Checks/largeSC_3.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Checks/novar_3.txt", sep=""))))
chks_3$group_effect <- chks_3$var_random_effect
chks_3 %<>% select(-var_random_effect)



chks_ppl <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/Checks/nosubclu.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/Checks/largesubclu.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/Checks/novar.txt", sep=""))))

chks_ppl %<>% select(-perc.ear.1, -var_random_effect, -group_effect_bias, -subgroup_effect_bias)

chks_mpl <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/mPL/Checks/noSC_mpl.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/mPL/Checks/largeSC_mpl.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/mPL/Checks/novar_mpl.txt", sep=""))))
chks_mpl %<>% select(-var_random_effect)


chks_hkc <- 
rbind(data.frame(perc.ear= "NoSC",
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Checks/noSC_hkc.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Checks/largeSC_hkc.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Checks/novar_hkc.txt", sep=""))))

chks_hkc %<>% select(-var_random_effect)

chks <- rbind(chks_3, rbind(chks_ppl, rbind(chks_mpl,chks_hkc)))

write.table(chks, file="/Users/annikahebbe/Desktop/Thesis Submission/Model Output/Combined/Checks.txt", row.names = F)

