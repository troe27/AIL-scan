setwd("~/dip_home/nas/chicken_finemapping/QTL/stripes2rqtl_multigen/r_liftover/")
## Genotypes and Phenotypes
load("epi_full_data.RData")
chr_num<-unlist(strsplit(names(full_data$geno),"[.]"))[seq(2,length(unlist(strsplit(names(full_data$geno),"[.]"))),2)]
phe<-as.numeric(full_data$pheno$BW8)
fx1<-as.numeric(full_data$pheno$sex)

# trans-format the genotypes
mrk_geno<-c()
mrks_info<-c()
for(i in 1:length(full_data$geno)){
  for(k in 1:ncol(full_data$geno[[i]]$g)){
    # define genos based on the most frequent allele
    alles<-table(unlist(strsplit(na.omit(full_data$geno[[i]]$g[,k]),"")))
    minA<-names(alles[order(alles)])[1]
    majA<-names(alles[order(alles)])[2]
    oneG<-full_data$geno[[i]]$g[,k]
    oneG[oneG==paste(minA,minA,sep="")]<-0
    oneG[oneG==paste(minA,majA,sep="")]<-1
    oneG[oneG==paste(majA,minA,sep="")]<-1
    oneG[oneG==paste(majA,majA,sep="")]<-2
    mrk_geno<-cbind(mrk_geno,as.numeric(oneG))
  }
  mrks_info<-rbind(mrks_info,as.matrix(full_data$geno[[i]]$mrk_info))
}

mrks_info[,2]<- as.numeric(mrks_info[,2])
#save(mrk_geno,mrks_info,file = “data/recoded.genotype.RData”)

#cat(mrk_geno)
##### liftover of marker positions

library("data.table")
library("rtracklayer")
chain <- import.chain("galGal5ToGalGal6.over.chain")

#tilman2[,1]
#tilman2[,2] <- as.numeric(as.character(tilman2[,2]))

trial_df <- as.data.table(mrks_info)
colnames(trial_df) <- c("marker", "chromosome", "position")
trial_df$chromosome <- paste0("chr",trial_df$chromosome)
trial_df$position <- as.numeric(trial_df$position)
trial_df$chromosome

liftnames <- trial_df$marker

ranges = IRanges(start=c(trial_df$position),end=c(trial_df$position), width=NULL)
seqnames <- Rle(c(trial_df$chromosome))
GG5 <- GRanges(seqnames=seqnames, ranges=ranges)
mcols(GG5,use.names=TRUE) <- liftnames
GG6 <- liftOver(GG5, chain)
GG6 = unlist(GG6)
gg6table <- as.data.table(GG6)
write.csv(gg6table, "new_positions_for_F15markers.csv")
mrk_table <- as.data.table(mrk_geno)
#mrk_table
full_data$pheno$id <- paste0(full_data$pheno$id,"15")
rownames(mrk_table) <- full_data$pheno$id
colnames(mrk_table) <- liftnames
write.csv(mrk_table, "full_f15_markers_geno.csv")
