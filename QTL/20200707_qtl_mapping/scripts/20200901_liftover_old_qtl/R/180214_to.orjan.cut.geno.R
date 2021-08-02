
  genotype.hap1 <- read.table("~/Dropbox/Projects/Ongoing/HL_F2_SeqMrk/F2_re_seq/data/F2_827.within.fam.bin50.prob.txt",header=T,stringsAsFactors = F)
geno <- genotype.hap1
upper.cut <- 0.8
lower.cut <- 0.2
arbitary.cut <- function(geno,upper.cut,lower.cut){
  for( i in 1:nrow(geno)){
    id.h <- which(geno[i,] >= upper.cut)
    geno[i,id.h] <- 1
    id.l <- which(geno[i,] <= lower.cut)
    geno[i,id.l] <- -1
    id.hl <- which(geno[i,] > lower.cut & geno[i,] < upper.cut)
    geno[i,id.hl] <- 0
    cat(i,"\n")
  }
  return(geno)
}

arbitary.cut.missing <- function(geno,upper.cut,lower.cut,missing.upper,missing.lower){
  for( i in 1:nrow(geno)){
    #set homo
    id.h <- which(geno[i,] >= upper.cut)
    geno[i,id.h] <- 1
    id.l <- which(geno[i,] <= lower.cut)
    geno[i,id.l] <- -1
    #set het
    id.hl <- which(geno[i,] >= missing.lower & geno[i,] <= missing.upper)
    geno[i,id.hl] <- 0
    #set missing
    id.missing1 <- which(geno[i,] > missing.upper & geno[i,] < upper.cut)
    geno[i,id.missing1] <- NA
    id.missing2 <- which(geno[i,] > lower.cut & geno[i,] < missing.lower)
    geno[i,id.missing2] <- NA
    
    cat(i,"\n")
  }
  return(geno)
}

test <- arbitary.cut(geno = genotype.hap1,upper.cut = 0.8,lower.cut = 0.2) # this is cut above 0.8 to homozygous high below 0.2 to homozygous low and in the middle to me heterzogous

# below is 1-0.85 homozygous hig 0.85-0.7 NA,0.7-0.3 heterzogous, 0.3-0.15 NA,below 0.15 hom low
test2 <-arbitary.cut.missing(geno = genotype.hap1,upper.cut = 0.85,lower.cut = 0.15,missing.upper = 0.7,missing.lower = 0.3)

write.table(test,file = "~/projects/F2_seq/data/F2_827.within.fam.mat.bin50.cut.NA.txt",quote = F,sep = "\t")
