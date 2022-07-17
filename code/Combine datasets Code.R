# Combine singe datasets into one for ease of use
full_3 <- 
rbind(read.csv("full_10_3.txt", sep=""),
rbind(read.csv("full_50_3.txt", sep=""),
rbind(read.csv("full_60_3.txt", sep=""),
rbind(read.csv("full_70_3.txt", sep=""),
rbind(read.csv("full_80_3.txt", sep=""),
      read.csv("/full_90_3.txt", sep=""))))))


full_ppl <- read.csv("Full_ppl.txt", sep="")


full_mpl <- 
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_10_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_50_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_60_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_70_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_80_mpl.txt", sep=""),
      read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/Full/full_90_mpl.txt", sep=""))))))



full_hkc <- 
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_10_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_50_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_60_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_70_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_80_hkc.txt", sep=""),
      read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/Full/full_90_hkc.txt", sep=""))))))


full <- rbind(full_3, rbind(full_ppl, rbind(full_mpl,full_hkc)))

write.table(full, file="Full.txt", row.names = F)





#### Null ####
null_3 <- 
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_10_3.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_50_3.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/Null_60_3.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_70_3.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_80_3.txt", sep=""),
      read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/GLM-PWP-GF/Null/null_90_3.txt", sep=""))))))



null_ppl <- read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/PPL/null/null_ppl.txt", sep="")


null_mpl <- 
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_10_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_50_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_60_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_70_mpl.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_80_mpl.txt", sep=""),
      read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/MPL/null/null_90_mpl.txt", sep=""))))))



null_hkc <- 
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_10_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_50_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_60_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_70_hkc.txt", sep=""),
rbind(read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_80_hkc.txt", sep=""),
      read.csv("/Users/annikahebbe/Desktop/Thesis Submission/Model Output/hkc/null/null_90_hkc.txt", sep=""))))))

null <- rbind(null_3, rbind(null_ppl, rbind(null_mpl,null_hkc)))

write.table(null, file="null.txt", row.names = F)


#### Checks ####
chks_3 <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("noSC_3.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("largeSC_3.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("novar_3.txt", sep=""))))



chks_ppl <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("nosubclu.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("largesubclu.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("novar.txt", sep=""))))


chks_mpl <- 
rbind(data.frame(perc.ear= "NoSC", 
                 read.csv("noSC_mpl.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("largeSC_mpl.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("novar_mpl.txt", sep=""))))


chks_hkc <- 
rbind(data.frame(perc.ear= "NoSC",
                 read.csv("noSC_hkc.txt", sep="")),
rbind(data.frame(perc.ear= "largeSC", 
                 read.csv("largeSC_hkc.txt", sep="")),
      data.frame(perc.ear= "novar", 
                 read.csv("novar_hkc.txt", sep=""))))


chks <- rbind(chks_3, rbind(chks_ppl, rbind(chks_mpl,chks_hkc)))

write.table(chks, file="Checks.txt", row.names = F)

