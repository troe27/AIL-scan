#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TEST Regression <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
setwd("~/Dropbox/Projects/Ongoing/HL_F2_SeqMrk/F2_re_seq/")
mrk.genotypes <- read.table("data/F2_n707.test.geno.mat.txt",stringsAsFactors = F,header = T,sep="\t")
id.genotypes <- rownames(mrk.genotypes)
f2.phenotypes <- read.table("data/061106_hl_f2_phenotypes.txt",stringsAsFactors = F,header = T,sep="\t")
f2.phenotypes.part <- read.table("data/HL_SEX_BW.txt",stringsAsFactors = F,header = T,sep="\t")
f2.phenotypes.part[f2.phenotypes.part<0]<-NA
rownames(f2.phenotypes) <- f2.phenotypes[,1]
rownames(f2.phenotypes.part) <- f2.phenotypes.part[,1]
rownames(mrk.genotypes) <- gsub(x=rownames(mrk.genotypes), pattern = "F2_", replacement = "")
rownames(mrk.genotypes) <- gsub(x=rownames(mrk.genotypes), pattern = "_F2", replacement = "")

for(i in c(1:ncol(mrk.genotypes))) {
  mrk.genotypes[,i] <- as.numeric(mrk.genotypes[,i])
}
mean(mrk.genotypes[,3],na.rm = "TRUE")
dev.off()
table(mrk.genotypes[,1:ncol(mrk.genotypes)])
table(mrk.genotypes[,2])

summary(mrk.genotypes)
column.counts <- colSums(!is.na(mrk.genotypes[,1:ncol(mrk.genotypes)]))
hist(column.counts)
row.counts <- rowSums(!is.na(mrk.genotypes))
hist(row.counts)

hist(colMeans(mrk.genotypes[,],na.rm="TRUE"))

require(gplots)
heatmap.2(data.matrix(mrk.genotypes),Rowv = FALSE, Colv=FALSE,trace="none")

f2 <- merge(f2.phenotypes.part,mrk.genotypes,by ="row.names")
rownames(f2)<-f2$CHICK

library(data.table)
DT <- as.data.table(f2)
DT <- DT[,which(unlist(lapply(DT, function(x)!all(is.na(x))))),with=F]
DT2<-na.omit(DT)
library(MASS)
fit <- lm(DT2$BW8~DT2$SEX+.,data=DT2[,12:ncol(DT2)])
step <- stepAIC(fit, direction="both")
step$anova # display results

tst <-lm(DT$BW8 ~DT$SEX+DT$CM000093.4.169.5)
summary(tst)
