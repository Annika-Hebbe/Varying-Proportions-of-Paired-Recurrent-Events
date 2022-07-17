#Fit simulated data to models
# read in data
fulldat <- readRDS("full_data.RData")
nulldat <- readRDS("null_data.RData")
novar <- readRDS("novar.RData")
nosubclu <- readRDS("nosubclu.RData")
largesubclu <- readRDS("largesubclu.RData")

#Logistic, PWP, GF
simulate_3 <- function(dataset, FILENAME){
  library(lme4)
  library(survival)
 
  pbapply::pblapply(1:length(dataset), function(x){
    
    pbapply::pblapply(dataset[[x]], function(df){
      
    #### GLMER ####
    tryCatch({
      glmer <- suppressMessages(glmer(delta ~ cov1 +cov2 + cov3 + (1| llevel), data = df,
                                      family = binomial(link=logit)))
      warning <-ifelse(warnings(glmer)== NULL, "0", "1")
    })
    
    
    summary.glmer <- data.frame(seed = df$seed[1],
                                perc.ear = df$perc.ear[1],
                                model = "Logistic",
                                B1 = summary(glmer)$coeff[2,1],
                                B1_sd = summary(glmer)$coeff[2,2],
                                B1_pval = summary(glmer)$coeff[2,4],
                                B2 = summary(glmer)$coeff[3,1],
                                B2_sd = summary(glmer)$coeff[3,2],
                                B2_pval = summary(glmer)$coeff[3,4],
                                B3 = summary(glmer)$coeff[4,1],
                                B3_sd = summary(glmer)$coeff[4,2],
                                B3_pval = summary(glmer)$coeff[4,4],
                                group_effect = NA,
                                subgroup_effect= NA,
                                AIC = AIC(glmer))
    
    
    
    #### PWP.GT ####
    PWP.GT <- coxph(Surv(failure, delta) ~ cov1 + cov2 + cov3 + cluster(llevel) +
                      strata(event_num),
                    method = "breslow", data= df)
    summary.PWP.GT <- data.frame(seed = df$seed[1],
                                 perc.ear = df$perc.ear[1],
                                 model = "PWP",
                                 B1 = summary(PWP.GT)$coeff["cov1","coef"],
                                 B1_sd = summary(PWP.GT)$coeff["cov1","se(coef)"],
                                 B1_pval = summary(PWP.GT)$coeff["cov1","Pr(>|z|)"],
                                 B2 = summary(PWP.GT)$coeff["cov2","coef"],
                                 B2_sd = summary(PWP.GT)$coeff["cov2","se(coef)"],
                                 B2_pval = summary(PWP.GT)$coeff["cov2","Pr(>|z|)"],
                                 B3 = summary(PWP.GT)$coeff["cov3","coef"],
                                 B3_sd = summary(PWP.GT)$coeff["cov3","se(coef)"],
                                 B3_pval = summary(PWP.GT)$coeff["cov3","Pr(>|z|)"],
                                 group_effect = NA,
                                 subgroup_effect= NA,
                                 AIC = AIC(PWP.GT))
    
    
    
    #### FRIALTY ####
    frailty=coxph(Surv(failure, delta) ~ cov1 + cov2 + cov3 + frailty(ulevel), data=df)
    summary.frailty <- data.frame(seed = df$seed[1],
                                  perc.ear = df$perc.ear[1],
                                  model = "GF",
                                  B1 = summary(frailty)$coefficients["cov1","coef"],
                                  B1_sd = summary(frailty)$coefficients["cov1","se2"],
                                  B1_pval = summary(frailty)$coefficients["cov1","p"],
                                  B2 = summary(frailty)$coefficients["cov2","coef"],
                                  B2_sd = summary(frailty)$coefficients["cov2","se2"],
                                  B2_pval = summary(frailty)$coefficients["cov2","p"],
                                  B3 = summary(frailty)$coefficients["cov3","coef"],
                                  B3_sd = summary(frailty)$coefficients["cov3","se2"],
                                  B3_pval = summary(frailty)$coefficients["cov3","p"],
                                  group_effect = as.numeric(substring(summary(frailty)$print2, 28,35)),
                                  subgroup_effect= NA,
                                  AIC= AIC(frailty))
    
    full <- do.call("rbind",
                    list(summary.glmer,
                         summary.PWP.GT,
                         summary.frailty
                    )
    )   
    
    if(df$seed[1] == 1 & x==1){
      write.table(full, 
                  file=paste0(FILENAME,".txt"),
                  row.names = F)}
    else{
      write.table(full, 
                  file=paste0(FILENAME,".txt"), 
                  col.names = F, row.names = F, append = TRUE)}
})  
  }) 

} 

simulate_3(fulldat,
           "Full_3")

simulate_3(nulldat,
           "Null_3")

simulate_3(novar,
           "novar_3")

simulate_3(nosubclu,
           "nosubclu_3")

simulate_3(largesubclu,
           "largesubclu_3")



#MPL
simulate_mpl <- function(dataset, FILENAME){
  library(frailtypack)
  pbapply::pblapply(1:length(dataset), function(x){
    
    pbapply::pblapply(dataset[[x]], function(df){
      
      #### FRIAL NESTED ####
      
      
      nested <- frailtyPenal(Surv(failure,delta)~ cov1 + cov2 + cov3  + cluster(ulevel) + subcluster(llevel),data=df,
                             n.knots=4,kappa=10000,
                             cross.validation=TRUE,hazard="Splines")
      summary.nested <- data.frame(seed = df$seed[1],
                                   perc.ear = df$perc.ear[1],
                                   model = "MPL",
                                   B1 = nested$coef["cov1"],
                                   B1_sd = sqrt(diag(nested$varH))[3],
                                   B1_pval = nested$beta_p.value["cov1"],
                                   B2 = nested$coef["cov2"],
                                   B2_sd = sqrt(diag(nested$varH))[4],
                                   B2_pval = nested$beta_p.value["cov2"],
                                   B3 = nested$coef["cov3"],
                                   B3_sd = sqrt(diag(nested$varH))[5],
                                   B3_pval = nested$beta_p.value["cov3"],
                                   group_effect = nested$alpha,
                                   subgroup_effect = nested$eta,
                                   AIC = NA)
      
      
      full <- do.call("rbind",
                      list(summary.nested
                      )
      )   
      
      if(df$seed[1] == 1 & x==1){
        write.table(full, 
                    file=paste0(FILENAME,".txt"),
                    row.names = F)}
      else{
        write.table(full, 
                    file=paste0(FILENAME,".txt"), 
                    col.names = F, row.names = F, append = TRUE)}
    })  
  }) 
  
} 

simulate_mpl(fulldat, 
             "full_mpl")

simulate_mpl(nulldat, 
             "Null_mpl")

simulate_mpl(novar, 
             "novar_mpl")

simulate_mpl(nosubclu, 
             "nosubclu_mpl")

simulate_mpl(largesubclu, 
             "largesubclu_mpl")


# PPL
simulate_ppl <- function(dataset, FILENAME){
  library(coxme)
  pbapply::pblapply(1:length(dataset), function(x){
    
    pbapply::pblapply(dataset[[x]], function(df){
      
      #### COXME ####
      nested <- coxme(Surv(failure, delta) ~ cov1 + cov2 + cov3 + (1|ulevel/llevel), data= df)
      beta <- fixef(nested)
      nvar <- length(beta)
      nfrail <- nrow(nested$variance) - nvar
      se <- sqrt(diag(as.matrix(nested$variance))[nfrail + 1:nvar])
      z <- beta/se
      p <- 2*(1-pnorm(abs(z)))
      summary.coxme<- data.frame(perc.ear = df$perc.ear[1],
                                 seed = df$seed[1],
                                 model = "PPL",
                                 B1 = beta[1],
                                 B1_sd =  se[1],
                                 B1_pval = p[1],
                                 B2 = beta[2],
                                 B2_sd = se[2],
                                 B2_pval = p[2],
                                 B3 = beta[3],
                                 B3_sd = se[3],
                                 B3_pval = p[3],
                                 group_effect = summary(nested)$vcoef$ulevel,
                                 subgroup_effect = summary(nested)$vcoef$`ulevel/llevel`,
                                 AIC = AIC(nested))
      
      
      
      
      full <- do.call("rbind",
                      list(
                        summary.coxme
                      )
      )   
      
      if(df$seed[1] == 1 & x==1){
        write.table(full, file=paste0(FILENAME,".txt"),row.names = F)}
      else{
        write.table(full, file=paste0(FILENAME,".txt"), col.names = F, row.names = F, append = TRUE)}
      
    })  
  }) 
  
} 

simulate_ppl(fulldat, 
             "Full_ppl")
 
simulate_ppl(nulldat,
             "Null_ppl")

simulate_ppl(novar, 
             "novar_ppl")

simulate_ppl(nosubclu, 
             "nosubclu_ppl")

simulate_ppl(largesubclu, 
             "largesubclu_ppl")

# HKC
source("CodeSNW.R")
simulate_hkc <- function(dataset, FILENAME){
  
  pbapply::pblapply(1:length(dataset), function(x){
    
    pbapply::pblapply(dataset[[x]], function(df){

      #### HKC ####
      
      xnam <- c(names(df)[6:8],"cluster(ulevel)")
      fmla <- as.formula(paste("Surv(failure,delta) ~ ", paste(xnam, collapse= "+")))
      results <- coxph(fmla, robust=T,data=df,x=TRUE)
      est_beta <- as.numeric(summary(results)$coefficients[,1])
      covariates <- as.matrix(results$x)
      pseudos <- getPseudos(failure=df$failure,delta=df$delta,covariates=covariates,beta=est_beta)
      Uhat <- getMylist(failure=pseudos,delta=df$delta,covariates=covariates,ulevel=df$ulevel,llevel=df$llevel)
      
      
      theta1 <- fitTheta1(Uhat,start=1,method="BFGS")
      theta2 <- fitTheta2(Uhat,theta1=theta1,pairwise=FALSE,nimp=100,start=1,method="BFGS")
      
      summary.copula <- data.frame(seed = df$seed[1],
                                   perc.ear = df$perc.ear[1],
                                   model = "HKC",
                                   B1 = as.numeric(summary(results)$coefficients[1,1]),
                                   B1_sd = summary(results)$coef[1,4],
                                   B1_pval = summary(results)$coef[1,6],
                                   B2 = as.numeric(summary(results)$coefficients[2,1]),
                                   B2_sd = summary(results)$coef[2,4],
                                   B2_pval = summary(results)$coef[2,6],
                                   B3 = as.numeric(summary(results)$coefficients[3,1]),
                                   B3_sd = summary(results)$coef[3,4],
                                   B3_pval = summary(results)$coef[3,6],
                                   var_random_effect = NA,
                                   group_effect = theta2,
                                   subgroup_effect = theta1,
                                   AIC = AIC(results))
      
      full <- do.call("rbind",
                      list(summary.copula
                      )
      )   
      
      if(df$seed[1] == 1 & x==1){
        write.table(full, 
                    file=paste0(FILENAME,".txt"),
                    row.names = F)}
      else{
        write.table(full, 
                    file=paste0(FILENAME,".txt"), 
                    col.names = F, row.names = F, append = TRUE)}
    })  
  }) 
  
} 

simulate_hkc(fulldat, 
             "Full_HKC")

simulate_hkc(nulldat, 
             "Null_HKC")

simulate_hkc(novar, 
             "novar_HKC")

simulate_hkc(nosubclu, 
            "nosubclu_HKC")
            
simulate_hkc(largesubclu, 
             "largesubclu_HKC")


