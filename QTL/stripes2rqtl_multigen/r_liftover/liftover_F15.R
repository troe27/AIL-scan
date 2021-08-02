library("data.table")
library("rtracklayer")

setwd("~/dip_home/nas/chicken_finemapping/QTL/stripes2rqtl_multigen/r_liftover/")
# load the chain
chain <- import.chain("galGal5ToGalGal6.over.chain")
F15qtls <- read.table("180828_QTL_F15_to_T.txt", header=T)

F15qtls[,2] <- as.numeric(as.character(F15qtls[,2]))
F15qtls[,3] <- as.numeric(as.character(F15qtls[,3]))
#F15qtls[,2] <- as.integer(as.character(F15qtls[,2]))
#F15qtls[,3] <- as.integer(as.character(F15qtls[,3]))
typeof(F15qtls[,2])
typeof(F15qtls[,3])

colnames(F15qtls) <- c("marker", "chr", "pos", "pval")
F15qtls[,4] <- as.character(F15qtls[,4])

liftdata <- F15qtls[!is.na(F15qtls[,3]),c(2,4,3)]

liftdata[,1] <- paste0("chr", liftdata[,1])
liftnames <- F15qtls[1]

seqnames <-Rle(c(liftdata[,1]))
ranges = IRanges(start=c(liftdata[,3]),end=c(liftdata[,3]), width=NULL)
GG5 <- GRanges(seqnames=seqnames, ranges=ranges)
mcols(GG5,use.names=TRUE) <- liftnames

GG6 <- liftOver(GG5, chain)
GG6 = unlist(GG6)
gg6table <- as.data.table(GG6)
write.csv(gg6table, "new_positions_for_F15qtls.csv")
