#simulate data function

sim_dat <- function(n,perc.ear, coveff = c(0,0,0), cluster = 0, subcluster =0, iter) {
  library(dplyr)
  library(tidyr)
  library(magrittr)
  
  pbapply::pblapply(perc.ear, function(x){
    pbapply::pblapply(1:iter, function(z){
      #Set seed  
      set.seed(z)
      
      # Make Covariates
      trt1 <- rbinom(n, 1, 0.5) # treatment variables 
      trt2 <- rbinom(n, 1, 0.5) # 
      nobs.ear <- rbinom(n,1, x)+1 #Variable to denote both or single ear
      
      theta <- cluster #Group variance
      theta2 <- subcluster #Subgroup variance
      
      v <- rgamma(n, shape = 1/theta, rate = 1/theta) #Group effect
      
      dat <- data.frame(id= 1:n, censor = runif(n, min = 1, max = 130), nobs.ear, ear = nobs.ear, trt1, trt2, v) #make dataset
      #Expand dataset to have row for each ear
      dat %<>%
        uncount(nobs.ear) %>% mutate(id = rep(1:n,times=nobs.ear))
      
      #Take those with both and label one row right and other row left
      dat.both <- dat %>% filter(ear==2) %>% mutate(ear = rep(c(0,1), nrow(.)/2))
      #Take those with one ear and randomly assign ear side
      dat.one <- dat %>% filter(ear==1) %>% mutate(ear = rbinom(nrow(.),1,0.5))
      dat <- rbind(dat.both,dat.one)
      #interaction variables
      dat$int1 <- dat$ear *dat$trt1
      dat$int2 <- dat$ear *dat$trt2
      
      dat %<>% mutate(w = rgamma(nrow(dat), shape = 1/theta2, rate = 1/theta2), # subgroup effect
                      u = runif(nrow(dat), 0,1), #uniform variable for transformation
                      u1 = runif(nrow(dat), 0,1))
      
      
      lambda = 1/26
      gamma = 1.2
      x1 <- as.matrix(dat[c(3,4,7)]) #variables to use for first failure
      x2 <- as.matrix(dat[c(3,5,8)]) #variables to use for secoond failure
      if(cluster != 0 & subcluster != 0 ){
        dat$t <- (-log(dat$u)/(lambda * exp((x1 %*% c(0.4,0.3,-.25))+ log(dat$w) + log(dat$v))))^(1/gamma) #time to first filure
        
        dat$t1 <- (-log(dat$u1)/(lambda * exp((x2 %*% c(0.4,0.3,-.25))+ log(dat$w) + log(dat$v))))^(1/gamma) #time to second failure
      } else{ if(cluster != 0 & subcluster ==0 ){
        dat$t <- (-log(dat$u)/(lambda * exp((x1 %*% c(0.4,0.3,-.25)) + log(dat$v))))^(1/gamma) #time to first filure
        
        dat$t1 <- (-log(dat$u1)/(lambda * exp((x2 %*% c(0.4,0.3,-.25)) + log(dat$v))))^(1/gamma) #time to second failure
      }
        else{
          dat$t <- (-log(dat$u)/(lambda * exp((x1 %*% c(0.4,0.3,-.25)))))^(1/gamma) #time to first filure
          
          dat$t1 <- (-log(dat$u1)/(lambda * exp((x2 %*% c(0.4,0.3,-.25)))))^(1/gamma) #time to second failure
          
        }}
      #Cleaning data so that if time one is greater than censored time then there is no second failure. 
      dat$t <- ifelse(dat$t > dat$censor, NA, dat$t) 
      dat$t1 <- ifelse(dat$t + dat$t1 > dat$censor, NA, dat$t1)
      
      data_long <- gather(dat, event, ftime, t:t1, factor_key=TRUE)
      data_long$event_num = ifelse(data_long$event=="t",1,2)
      data_long$status = ifelse(is.na(data_long$ftime), 0,1)
      
      data_long %<>% arrange(id, ear) %>%  group_by(id, ear) %>% mutate(csum = cumsum(ftime),
                                                                        trt= ifelse(event == "t", trt1, trt2),
                                                                        int= ifelse(event == "t", int1, int2))
      #Finding cumulative time
      data_long %<>%
        group_by(id, ear) %>%
        mutate(csum=zoo::na.locf(csum, na.rm = FALSE))
      
      data_long$time = ifelse(is.na(data_long$ftime), data_long$censor -data_long$csum, data_long$ftime)
      data_long$time =ifelse(is.na(data_long$time),data_long$censor, data_long$time )
      
      done <-data_long[!duplicated(data_long[c(1,3,19)]),]
      done$pid <- paste0(done$id,ifelse(done$ear == 0, "L","R")) #Creating PID
      
      
      #Converting the data to be able to run through copula 
      done$ulevel = done$id
      done$llevel = as.numeric(as.factor(done$pid))
      done$failure = done$time
      done$delta = done$status
      done$cov1 = done$trt
      done$cov2 = done$ear
      done$cov3 = done$int
      
      done <- done[c(14,21:27)]
      
      done$seed <- z
      done$perc.ear <- x*100
      done
    } )
  } )
} 
#Full normal data set
fulldat <- sim_dat(600, #number of subjects
                   c(0.9,0.8,0.7, 0.6, 0.5, 0.1), #the different % ears
                   coveff = c(0.4,0.3,-.25), #beta coefficents 
                   cluster =0.3, #variances
                   subcluster= 0.15, 
                   1 #iterations
)

#Save data
save(test, file="/Users/annikahebbe/Desktop/Thesis Submission/Data/test.rds")


#simulate null data
nulldat <- sim_dat(600, #number of subjects
                   c(0.9,0.8,0.7, 0.6, 0.5, 0.1), #the different % ears
                   coveff = c(0,0,0), #beta coefficents 
                   cluster =0.3, #variances
                   subcluster= 0.15, 
                   1000 #iterations
)

save(nulldat, file="/Users/annikahebbe/Desktop/Thesis Submission/Data/Null/null_data.rds")


# Checks

#No subcluster var
nosubclu <- sim_dat(600, #number of subjects
                    c(0.9), #the different % ears
                    coveff = c(0.4,0.3,-.25), #beta coefficents 
                    cluster =0.3, #variances
                    subcluster= 0, 
                    1000 #iterations
)

save(nosubclu, file="/Users/annikahebbe/Desktop/Thesis Submission/Data/Checks/nosubclu.rds")



#large subcluster var
largesubclu <- sim_dat(600, #number of subjects
                       c(0.9), #the different % ears
                       coveff = c(0.4,0.3,-.25), #beta coefficents 
                       cluster =0.3, #variances
                       subcluster= 1.15, 
                       1000 #iterations
)

save(largesubclu, file="/Users/annikahebbe/Desktop/Thesis Submission/Data/Checks/largesubclu.rds")

#No var
novar <- sim_dat(600, #number of subjects
                 c(0.9), #the different % ears
                 coveff = c(0.4,0.3,-.25), #beta coefficents 
                 cluster =0, #variances
                 subcluster= 0, 
                 1000 #iterations
)

save(novar, file="/Users/annikahebbe/Desktop/Thesis Submission/Data/Checks/novar.rds")


