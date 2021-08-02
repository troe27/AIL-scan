setwd('/Users/tilro532/dip_home/nas/chicken_finemapping/QTL/20200707_qtl_mapping/scripts/20200901_liftover_old_qtl/R/')
library(rtracklayer) # load lib


S3 <- read.table("../../../auxillary_data/20200909_YZ2017_S3_modified_for_liftover.csv", header = 1, sep = ',')


liftdata <- S3[!is.na(S3[,3]),c(2,3,4)] #chr, bp-pos and name of all markers that do not have missing position

liftdata[,1] <- paste('chr',liftdata[,1],sep="") # make chr into factor

liftnames <- data.frame(liftdata[,3]) # marker names
liftnames[,1]<-as.character(liftnames[,1]) # make sure marker names are strings
colnames(liftnames)<-c("Marker") # label marker-name column
GG4 <- GRanges(seqnames=Rle(c(liftdata[,1])), ranges=IRanges(start=c(liftdata[,2]),end=c(liftdata[,2]),width=NULL)) #transform  markers into genomic ranges with width zero
mcols(GG4,use.names=TRUE) <- liftnames # name them
chain <- import.chain("../galGal4ToGalGal6.over.chain") # import the GG4->GG6 chain
GG6 <- liftOver(GG4, chain) # lift-over to GG5
GG6 = unlist(GG6)


tmp3<-c()
tmp3<-cbind(as.character(GG6$Marker),as.character(seqnames(GG6)),as.numeric(round(start(ranges(GG6))/1000000,1)))

write.csv(tmp3, '../../../auxillary_data/old_qtls/YZ2017_supp3_GG6.txt')


