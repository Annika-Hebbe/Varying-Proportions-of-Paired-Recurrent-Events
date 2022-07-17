library(dplyr)
library(magrittr) 

##### Import data #####
full <- read.csv("Full.txt", sep="")

full$Model <- factor(full$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))

tab1 <-  full %>% filter(perc.ear == 90) %>%  mutate(across(3:26, round, 3)) 
tab2 <- full %>% filter(perc.ear == 50) %>%  mutate(across(3:26, round, 3))


tab1$B1_CI= paste0("(",tab1$B1_bais_ll,", ", tab1$B1_bais_ul,")")
tab1$B2_CI= paste0("(",tab1$B2_bais_ll,", ", tab1$B2_bais_ul,")")
tab1$B3_CI= paste0("(",tab1$B3_bais_ll,", ", tab1$B3_bais_ul,")")
tab1$C_CI = paste0("(",tab1$C_bais_ll,", ", tab1$C_bais_ul,")")
tab1$SC_CI= paste0("(",tab1$Sc_bais_ll,", ", tab1$Sc_bais_ul,")")

tab2$B1_CI= paste0("(",tab2$B1_bais_ll,", ", tab2$B1_bais_ul,")")
tab2$B2_CI= paste0("(",tab2$B2_bais_ll,", ", tab2$B2_bais_ul,")")
tab2$B3_CI= paste0("(",tab2$B3_bais_ll,", ", tab2$B3_bais_ul,")")
tab2$C_CI = paste0("(",tab2$C_bais_ll,", ", tab2$C_bais_ul,")")
tab2$SC_CI= paste0("(",tab2$Sc_bais_ll,", ", tab2$Sc_bais_ul,")")


##### Table 1

tab1_1 <- tab1 %>% select(perc.ear, Model, Bias = B1_bias, 
                                           CI= B1_CI, 
                                           Varience = B1_var, 
                                           MSE= B1_MSE, 
                                           Power = B1_type2)
tab1_1$variable = "trt"


tab1_2 <- tab1 %>% select(perc.ear, Model, Bias = B2_bias, 
                                           CI= B2_CI, 
                                           Varience = B2_var, 
                                           MSE= B2_MSE, 
                                           Power = B2_type2)
tab1_2$variable = "ear"

tab1_3 <- tab1 %>% select(perc.ear, Model, Bias = B3_bias, 
                                           CI= B3_CI, 
                                           Varience = B3_var, 
                                           MSE= B3_MSE, 
                                           Power = B3_type2)
tab1_3$variable = "int"

tab1_4 <- tab1 %>% select(perc.ear, Model, Bias = C_bias, 
                                           CI= C_CI)
tab1_4$variable = "randomc"
tab1_4$Varience = ""
tab1_4$MSE = ""
tab1_4$Power = ""

tab1_5 <- tab1 %>% select(perc.ear, Model, Bias = Sc_bias, 
                                           CI= SC_CI)
tab1_5$variable = "randomsc"
tab1_5$Varience = ""
tab1_5$MSE = ""
tab1_5$Power = ""


table1 <- rbind(tab1_1, rbind(tab1_2, rbind(tab1_3, rbind(tab1_4, tab1_5))))

table1$variable <- factor(table1$variable, levels = c("trt", "ear", "int", "randomc", "randomsc"))

table1 %<>% arrange(variable, perc.ear, Model)


write.table(table1, file="table1.txt", row.names = F)




##### Table 2

tab2_1 <- tab2 %>% select(perc.ear, Model, Bias = B1_bias, 
                          CI= B1_CI, 
                          Varience = B1_var, 
                          MSE= B1_MSE, 
                          Power = B1_type2)
tab2_1$variable = "trt"


tab2_2 <- tab2 %>% select(perc.ear, Model, Bias = B2_bias, 
                          CI= B2_CI, 
                          Varience = B2_var, 
                          MSE= B2_MSE, 
                          Power = B2_type2)
tab2_2$variable = "ear"

tab2_3 <- tab2 %>% select(perc.ear, Model, Bias = B3_bias, 
                          CI= B3_CI, 
                          Varience = B3_var, 
                          MSE= B3_MSE, 
                          Power = B3_type2)
tab2_3$variable = "int"

tab2_4 <- tab2 %>% select(perc.ear, Model, Bias = C_bias, 
                          CI= C_CI)
tab2_4$variable = "randomc"
tab2_4$Varience = ""
tab2_4$MSE = ""
tab2_4$Power = ""

tab2_5 <- tab2 %>% select(perc.ear, Model, Bias = Sc_bias, 
                          CI= SC_CI)
tab2_5$variable = "randomsc"
tab2_5$Varience = ""
tab2_5$MSE = ""
tab2_5$Power = ""



table2 <- rbind(tab2_1, rbind(tab2_2, rbind(tab2_3, rbind(tab2_4, tab1_5))))

table2$variable <- factor(table2$variable, levels = c("trt", "ear", "int", "randomc", "randomsc"))

table2 %<>% arrange(variable, perc.ear, Model)

write.table(table2, file="table2.txt", row.names = F)





#### Table 4
tab3 <-  full %>% select(1:8) %>%  mutate(across(3:8, round, 3)) 
tab3$B1= paste0(tab3$B1_bias, " (",tab3$B1_bais_ll,", ", tab3$B1_bais_ul,")")


tab3_1 <- tab3 %>% select(perc.ear, Model, Bias = B1, 
                          Varience = B1_var, 
                          MSE= B1_MSE, 
                          Power = B1_type2)

tab3_1 %<>% arrange(-perc.ear, Model)

write.table(tab3_1, file="table4.txt", row.names = F)



#### Table 5
tab4 <-  full %>% select(1,2, 9:14) %>%  mutate(across(3:8, round, 3)) 
tab4$B2= paste0(tab4$B2_bias, " (",tab4$B2_bais_ll,", ", tab4$B2_bais_ul,")")

tab4_1 <- tab4 %>% select(perc.ear, Model, Bias = B2, 
                          Varience = B2_var, 
                          MSE= B2_MSE, 
                          Power = B2_type2)

tab4_1 %<>% arrange(-perc.ear, Model)

write.table(tab4_1, file="table5.txt", row.names = F)


#### Table 6
tab5 <-  full %>% select(1,2,15:20 ) %>%  mutate(across(3:8, round, 3)) 
tab5$B3= paste0(tab5$B3_bias, " (",tab5$B3_bais_ll,", ", tab5$B3_bais_ul,")")

tab5_1 <- tab5 %>% select(perc.ear, Model, Bias = B3,
                          Varience = B3_var, 
                          MSE= B3_MSE, 
                          Power = B3_type2)

tab5_1 %<>% arrange(-perc.ear, Model)

write.table(tab5_1, file="table6.txt", row.names = F)



#### Table 7
tab6 <-  full %>% select(1,2,21:23 ) %>%  mutate(across(3:5, round, 3)) 
tab6$C = paste0(tab6$C_bias, " (",tab6$C_bais_ll,", ", tab6$C_bais_ul,")")

tab6_1 <- tab6 %>% select(perc.ear, Model, C)


tab6_2 <-  full %>% select(1,2,24:26 ) %>%  mutate(across(3:5, round, 3)) 
tab6_2$Sc = paste0(tab6_2$Sc_bias, " (",tab6_2$Sc_bais_ll,", ", tab6_2$Sc_bais_ul,")")

tab6_3 <- tab6_2 %>% select(perc.ear, Model, Sc)

table6 <- left_join(tab6_1, tab6_3)

table6 %<>% arrange(-perc.ear, Model)

write.table(table6, file="table7.txt", row.names = F)



##### Import null #####
null <- read.csv("Null.txt", sep="")

null$Model <- factor(null$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))

#### Table 8
tab8 <-  null %>% select(1:8) %>%  mutate(across(3:8, round, 3)) 
tab8$B1= paste0(tab8$B1_bias, " (",tab8$B1_bais_ll,", ", tab8$B1_bais_ul,")")


tab8_1 <- tab8 %>% select(perc.ear, Model, Bias = B1, 
                          Varience = B1_var, 
                          MSE= B1_MSE, 
                          Power = B1_type2)

tab8_1 %<>% arrange(-perc.ear, Model)

write.table(tab8_1, file="table8.txt", row.names = F)



#### Table 9
tab9 <-  null %>% select(1,2, 9:14) %>%  mutate(across(3:8, round, 3)) 
tab9$B2= paste0(tab9$B2_bias, " (",tab9$B2_bais_ll,", ", tab9$B2_bais_ul,")")

tab9_1 <- tab9 %>% select(perc.ear, Model, Bias = B2, 
                          Varience = B2_var, 
                          MSE= B2_MSE, 
                          Power = B2_type2)

tab9_1 %<>% arrange(-perc.ear, Model)

write.table(tab9_1, file="table9.txt", row.names = F)


#### Table 10
tab10 <-  null %>% select(1,2,15:20 ) %>%  mutate(across(3:8, round, 3)) 
tab10$B3= paste0(tab10$B3_bias, " (",tab10$B3_bais_ll,", ", tab10$B3_bais_ul,")")

tab10_1 <- tab10 %>% select(perc.ear, Model, Bias = B3,
                          Varience = B3_var, 
                          MSE= B3_MSE, 
                          Power = B3_type2)

tab10_1 %<>% arrange(-perc.ear, Model)

write.table(tab10_1, file="table10.txt", row.names = F)



#### Table 11
tab11 <-  null %>% select(1,2,21:23 ) %>%  mutate(across(3:5, round, 3)) 
tab11$C = paste0(tab11$C_bias, " (",tab11$C_bais_ll,", ", tab11$C_bais_ul,")")

tab11_1 <- tab11 %>% select(perc.ear, Model, C)


tab11_2 <-  null %>% select(1,2,24:26 ) %>%  mutate(across(3:5, round, 3)) 
tab11_2$Sc = paste0(tab11_2$Sc_bias, " (",tab11_2$Sc_bais_ll,", ", tab11_2$Sc_bais_ul,")")

tab11_3 <- tab11_2 %>% select(perc.ear, Model, Sc)

table11 <- left_join(tab11_1, tab11_3)

table11 %<>% arrange(-perc.ear, Model)

write.table(table11, file="table11.txt", row.names = F)


#### Checks ####

chks <- read.csv("Checks.txt", sep="")

chks$Model <- factor(chks$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))

#### Table 12 - nosc ####
tab12 <-  chks %>% filter(perc.ear == "NoSC") %>%  mutate(across(3:26, round, 3)) 

tab12_1 <- tab12 %>% select(perc.ear, Model, Bias = B1_bias, 
                            Varience = B1_var, 
                            MSE= B1_MSE, 
                            Power = B1_type2)
tab12_1$variable = "trt"


tab12_2 <- tab12 %>% select(perc.ear, Model, Bias = B2_bias, 
                            Varience = B2_var, 
                            MSE= B2_MSE, 
                            Power = B2_type2)
tab12_2$variable = "ear"

tab12_3 <- tab12 %>% select(perc.ear, Model, Bias = B3_bias, 
                            Varience = B3_var, 
                            MSE= B3_MSE, 
                            Power = B3_type2)
tab12_3$variable = "int"

tab12_4 <- tab12 %>% select(perc.ear, Model, Bias = C_bias)
tab12_4$variable = "randomc"
tab12_4$Varience = ""
tab12_4$MSE = ""
tab12_4$Power = ""

tab12_5 <- tab12 %>% select(perc.ear, Model, Bias = Sc_bias)
tab12_5$variable = "randomsc"
tab12_5$Varience = ""
tab12_5$MSE = ""
tab12_5$Power = ""

table12 <- rbind(tab12_1, rbind(tab12_2, rbind(tab12_3, rbind(tab12_4, tab12_5))))


table12$variable <- factor(table12$variable, levels = c("trt", "ear", "int", "randomc", "randomsc"))

table12 %<>% arrange(variable, perc.ear, Model)


write.table(table12, file="table12.txt", row.names = F)








#### Table 13 - large sc
tab13 <-  chks %>% filter(perc.ear == "largeSC") %>%  mutate(across(3:26, round, 3)) 

tab13_1 <- tab13 %>% select(perc.ear, Model, Bias = B1_bias, 
                            Varience = B1_var, 
                            MSE= B1_MSE, 
                            Power = B1_type2)
tab13_1$variable = "trt"


tab13_2 <- tab13 %>% select(perc.ear, Model, Bias = B2_bias, 
                            Varience = B2_var, 
                            MSE= B2_MSE, 
                            Power = B2_type2)
tab13_2$variable = "ear"

tab13_3 <- tab13 %>% select(perc.ear, Model, Bias = B3_bias, 
                            Varience = B3_var, 
                            MSE= B3_MSE, 
                            Power = B3_type2)
tab13_3$variable = "int"

tab13_4 <- tab13 %>% select(perc.ear, Model, Bias = C_bias)
tab13_4$variable = "randomc"
tab13_4$Varience = ""
tab13_4$MSE = ""
tab13_4$Power = ""

tab13_5 <- tab13 %>% select(perc.ear, Model, Bias = Sc_bias)
tab13_5$variable = "randomsc"
tab13_5$Varience = ""
tab13_5$MSE = ""
tab13_5$Power = ""

table13 <- rbind(tab13_1, rbind(tab13_2, rbind(tab13_3, rbind(tab13_4, tab13_5))))


table13$variable <- factor(table13$variable, levels = c("trt", "ear", "int", "randomc", "randomsc"))

table13 %<>% arrange(variable, perc.ear, Model)


write.table(table13, file="table13.txt", row.names = F)

#### Table 14 - no var
tab14 <-  chks %>% filter(perc.ear == "novar") %>%  mutate(across(3:26, round, 3)) 

tab14_1 <- tab14 %>% select(perc.ear, Model, Bias = B1_bias, 
                           Varience = B1_var, 
                           MSE= B1_MSE, 
                           Power = B1_type2)
tab14_1$variable = "trt"


tab14_2 <- tab14 %>% select(perc.ear, Model, Bias = B2_bias, 
                            Varience = B2_var, 
                            MSE= B2_MSE, 
                            Power = B2_type2)
tab14_2$variable = "ear"

tab14_3 <- tab14 %>% select(perc.ear, Model, Bias = B3_bias, 
                            Varience = B3_var, 
                            MSE= B3_MSE, 
                            Power = B3_type2)
tab14_3$variable = "int"

tab14_4 <- tab14 %>% select(perc.ear, Model, Bias = C_bias)
tab14_4$variable = "randomc"
tab14_4$Varience = ""
tab14_4$MSE = ""
tab14_4$Power = ""

tab14_5 <- tab14 %>% select(perc.ear, Model, Bias = Sc_bias)
tab14_5$variable = "randomsc"
tab14_5$Varience = ""
tab14_5$MSE = ""
tab14_5$Power = ""

table14 <- rbind(tab14_1, rbind(tab14_2, rbind(tab14_3, rbind(tab14_4, tab14_5))))


table14$variable <- factor(table14$variable, levels = c("trt", "ear", "int", "randomc", "randomsc"))

table14 %<>% arrange(variable, perc.ear, Model)


write.table(table14, file="table14.txt", row.names = F)

#### Table 15 - AIC

tab15 <-  full %>% select(1,2,27) 
tab15 %<>% arrange(perc.ear, Model)
write.table(tab15, file="table15.txt", row.names = F)
