setwd('/home/tilman/nas/chicken_finemapping/QTL/20210106_qtl_mapping')
library(rtracklayer) # load lib

Zheya <- read.table("./data/20210311_Zheyas_marker.tsv", header = 1, sep="\t")

liftdata <- Zheya[!is.na(Zheya[,3]),c(1,2,3)]

liftdata[,2] <- paste('chr',liftdata[,2],sep="")

liftnames <- data.frame(liftdata[,1]) # marker names

liftnames[,1]<-as.character(liftnames[,1]) # make sure marker names are strings
colnames(liftnames)<-c("Marker") # label marker-name column

GG4 <- GRanges(seqnames=Rle(c(liftdata[,2])), ranges=IRanges(start=c(liftdata[,3]),end=c(liftdata[,3]),width=NULL)) #transform  markers into genomic ranges with width zero
mcols(GG4,use.names=TRUE) <- liftnames # name them

chain <- import.chain("./data/galGal4ToGalGal6.over.chain") 
GG6 <- liftOver(GG4, chain) # lift-over to GG5
GG6 = unlist(GG6)

tmp3<-c()
tmp3<-cbind(as.character(GG6$Marker),as.character(seqnames(GG6)),as.numeric(round(start(ranges(GG6))/1000000,1)))

write.csv(tmp3, './data/20210311_Zheyas_marker_GG6a.csv')
