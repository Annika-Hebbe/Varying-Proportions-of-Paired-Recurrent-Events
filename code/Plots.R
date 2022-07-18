library(dplyr)
library(magrittr) 
library(ggplot2)
library(tidyr)
##### Import data #####
full <- read.csv("Full.txt", sep="")

full$Model <- factor(full$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))
##### Import null #####
null <- read.csv("Null.txt", sep="")

null$Model <- factor(null$Model, levels = c("Logistic", "PWP", "GF", "NF MPL", "NF PPL", "HKC"))


##### Plot 1: Treatment #####
trt <- full %>% select(perc.ear, Model, B1_bias, B1_var, B1_MSE, B1_type2)
trt_long<- gather(trt, condition, value, B1_bias:B1_type2, factor_key=TRUE)
trt_long$value<- ifelse(trt_long$Model == "Logistic" & trt_long$condition != "B1_type2", NA, trt_long$value)
levels(trt_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=trt_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs(x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure1.pdf", width = 7.65, height = 5.56)

##### Plot 2: Ear #####
ear <- full %>% select(perc.ear, Model, B2_bias, B2_var, B2_MSE, B2_type2)
ear_long<- gather(ear, condition, value, B2_bias:B2_type2, factor_key=TRUE)
ear_long$value<- ifelse(ear_long$Model == "Logistic" & ear_long$condition != "B2_type2", NA, ear_long$value)
levels(ear_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=ear_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs(x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure2.pdf", width = 7.65, height = 5.56)




##### Plot 3: Interaction #####
int <- full %>% select(perc.ear, Model, B3_bias, B3_var, B3_MSE, B3_type2)
int_long<- gather(int, condition, value, B3_bias:B3_type2, factor_key=TRUE)
int_long$value<- ifelse(int_long$Model == "Logistic" & int_long$condition != "B3_type2", NA, int_long$value)
levels(int_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=int_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs( x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figue3.pdf", width = 7.65, height = 5.56)





##### Plot 4: Random #####
re <- full %>% select(perc.ear, Model, C_bias, Sc_bias)
re_long<- gather(re, condition, value, C_bias:Sc_bias, factor_key=TRUE)
levels(re_long$condition) <- c("Cluster","Sub-Cluster")

ggplot(data=re_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition) + 
  labs( x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure4.pdf", width = 7.65, height = 5.56)



##### Plot 5: Null Treatment #####
trt <- null %>% select(perc.ear, Model, B1_bias, B1_var, B1_MSE, B1_type2)
trt_long<- gather(trt, condition, value, B1_bias:B1_type2, factor_key=TRUE)
trt_long$value<- ifelse(trt_long$Model == "Logistic" & trt_long$condition != "B1_type2", NA, trt_long$value)
levels(trt_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=trt_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs(x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure5.pdf", width = 7.65, height = 5.56)


##### Plot 6: Null Ear #####
ear <- null %>% select(perc.ear, Model, B2_bias, B2_var, B2_MSE, B2_type2)
ear_long<- gather(ear, condition, value, B2_bias:B2_type2, factor_key=TRUE)
ear_long$value<- ifelse(ear_long$Model == "Logistic" & ear_long$condition != "B2_type2", NA, ear_long$value)
levels(ear_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=ear_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs(x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure6.pdf", width = 7.65, height = 5.56)




##### Plot 7: Null Interaction #####
int <- null %>% select(perc.ear, Model, B3_bias, B3_var, B3_MSE, B3_type2)
int_long<- gather(int, condition, value, B3_bias:B3_type2, factor_key=TRUE)
int_long$value<- ifelse(int_long$Model == "Logistic" & int_long$condition != "B3_type2", NA, int_long$value)
levels(int_long$condition) <- c("Bias","Variance", "MSE","Power")

ggplot(data=int_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition, scales = "free") + 
  labs( x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure7.pdf", width = 7.65, height = 5.56)





##### Plot 8: Null Random #####
re <- null %>% select(perc.ear, Model, C_bias, Sc_bias)
re_long<- gather(re, condition, value, C_bias:Sc_bias, factor_key=TRUE)
levels(re_long$condition) <- c("Cluster","Sub-Cluster")

ggplot(data=re_long, aes(x=perc.ear, y=value))+ geom_line(aes(linetype=Model, color=Model)) + 
  scale_x_continuous(breaks = c(10,50,60,70,80,90))+ 
  facet_wrap(~condition) + 
  labs( x = "Pair Percentage", 
       caption = "PWP - Prentice-Williams-Peterson, GF – Gamma frailty, NF – nested frailty, HKC – hierarchical Kendall copula") + 
  theme_light()+
  theme(axis.title.y=element_blank(),
        plot.title = element_text(hjust = 0.5),
        panel.grid.minor.x = element_blank(),
        plot.caption = element_text(hjust = 0.5)) 
#+ 
#  scale_color_grey()
ggsave("Figure8.pdf", width = 7.65, height = 5.56)


