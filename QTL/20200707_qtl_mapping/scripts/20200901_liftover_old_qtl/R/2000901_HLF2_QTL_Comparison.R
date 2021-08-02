#################### Author: Örjan Carlborg, IMBIM, Uppsala University ##############################
# Date of last revision: 180227
# Messed about by Tilman Rönneburg at 20200901

######################################## Description: ###############################################
# R-code for comparing results from analysis of the F2 intercross population between HWS and LWS
# birds from generation 40. The original results from these analyses are published in two report
# first based on a sparse Micro-satellite based linkage map in:
# Jacobsson, L., Park, H.-B., Wahlberg, P., Fredriksson, R., Perez-Enciso, M., Siegel, P. B., & Andersson, L. (2005). Many QTLs with minor additive effects are associated with a large difference in growth between two selection lines in chickens. Genetical Research, 86(02), 115. doi:10.1017/S0016672305007767
# and later after adding 300+ SNP markers in
# Wahlberg, P., Carlborg, Ö., Foglio, M., Tordoir, X., Syvänen, A.-C., Lathrop, M., et al. (2009). Genetic analysis of an F(2) intercross between two chicken lines divergently selected for body-weight. BMC Genomics, 10(1), 248. doi:10.1186/1471-2164-10-248
#
# Analyses here are based on the data/qtl probabilities from Wahlberg, 2009

########### The following processing ofdata and analyses are performed in this script:
# Section A. Reading in the data
# Section B. Further processing of the raw data
# Section C. Comparing genotypes (GBSA vs SNP/MS) & QTL genotype probabilities

#########################################################################################
##################### Section A. Reading in data ########################################
# tilman sets his wd
setwd('/Users/tilro532/dip_home/nas/chicken_finemapping/QTL/20200707_qtl_mapping/scripts/20200901_liftover_old_qtl/R/')

####### A.1 Reading in phenotypes for F2 population  ########
# Data used in Wahlberg, 2009 & Jacobsson, 2005  studies    #
# Input-file from Wahlberg, 2009 study                      #

Phenotypes <- read.table(file="../F2/hl071022.phen",header=TRUE,sep="\t")
tst <- Phenotypes<(-100000)
Phenotypes[tst]<-NA
rownames(Phenotypes)<-Phenotypes[,1]
Phenotypes <- Phenotypes[,2:ncol(Phenotypes)]

######## A.2. Reading in fixed effects for F2 population ########
# Data  used Wahlberg, 2009 & Jacobsson, 2005 studies           #
# Input-file from Wahlberg, 2009 study                          #

Fixed <- read.table(file="../F2/hl071022.fix",header=TRUE,sep=" ")
rownames(Fixed) <- Fixed[,1]
Fixed <- Fixed[,2:ncol(Fixed)]

####### A.3. Reading in genome-wide genotype-probabilities                 ####
# F2 QTL genotype probabilities, calculated using Haley et al, 2004 algorithm #
# Input-file from Wahlberg, 2009 study                                        #
# Genotype probabilities were then calculated using the QTLExpress software   #

Geno <- read.table(file="../F2/hl070831.khcoeffqe",header=FALSE,sep="\t")
Geno[,8] <- Geno[,4]-Geno[,7] # Calculate the indicator regression variable as in Haley et al, 2004 (P(QQ)-p(qq), where Q=HWS allele, q=LWS allele)

###### A.4. Reading in Genetic- and Physical map (Wahlberg, 2009)       ########## 
# Map is available in the Supplements of the paper Wahlberg, 2009                #
# Input-file created by Örjan Carlborg based on the published genetic map        #
# Physical locations in this file are given on the GalGal3 assembly              #
# One missmatch on Chromosome 27 detected -> marker moved 0.1 cM in marker map   #

MrksF2 <- read.table(file="../F2/150202_OCG_hlF2markermapWahlberg2009.txt",header=TRUE,sep="\t")
MrksF2[,1] <- as.numeric(as.character(MrksF2[,1]))
MrksF2[,2] <- as.numeric(as.character(MrksF2[,2]))
colnames(MrksF2)[2]<-c("GalGal3Mb")
MrksF2[,3] <- as.numeric(as.character(MrksF2[,3]))
MrksF2[,4] <- as.character(MrksF2[,4])
# Chr 27, 59 cM does not exist in mrk probabilities -> move to 58.9 cM
MrksF2[which(MrksF2[,1]==27&MrksF2[,3]==59),3]<-58.9
MrksF2[,5] <- as.integer(floor(MrksF2[,3]))
colnames(MrksF2)[5]<-c("cMInt")
MrksF2[,6] <- MrksF2[,2]*1000000 # Convert Mb locations to bp
MrksF2[,6] <- as.numeric(as.character(MrksF2[,6]))
colnames(MrksF2)[6]<-c("GalGal3bp")
MrksF2[,4] <- gsub('-', '_', MrksF2[,4])
MrksF2<-MrksF2[!is.na(MrksF2[,1]),]

#########################################################################################
################### Section B. Further processing of the raw data               ######### 

################### B1. Liftover of marker locations GalGal3 to GalGal5         #########
########## SNP/MS in Wahlberg, 2009 on GalGal3, GBSA markers on GalGal5         #########
########## To integrate data, SNP/MS marker locations of Wahlberg et al 2009    ######### 
########## are transferred to GalGal5                                           #########
library(rtracklayer) # load lib


liftdata <- MrksF2[!is.na(MrksF2[,2]),c(1,4,6)] #chr, bp-pos and name of all markers that do not have missing position
liftdata[,1] <- paste('chr',liftdata[,1],sep="") # make chr into factor
liftnames <- data.frame(liftdata[,2]) # marker names
liftnames[,1]<-as.character(liftnames[,1]) # make sure marker names are strings
colnames(liftnames)<-c("Marker") # label marker-name column
GG3 <- GRanges(seqnames=Rle(c(liftdata[,1])), ranges=IRanges(start=c(liftdata[,3]),end=c(liftdata[,3]),width=NULL)) #transform  markers into genomic ranges with width zero
mcols(GG3,use.names=TRUE) <- liftnames # name them
chain <- import.chain("../galGal3ToGalGal5.over.chain") # import the GG3->GG5 chain
GG5 <- liftOver(GG3, chain) # lift-over to GG5






chain2 <- import.chain("../galGal5ToGalGal6.over.chain") # import the GG5->GG6 chain
GG6 <- liftOver(GG5, chain) # lift-over to GG6

GG6 = unlist(GG6)
#length(GG3)-length(GG5)
#setdiff(GG3$Marker, GG5$Marker)
tmp3<-c()
tmp3<-cbind(as.character(GG6$Marker),as.character(seqnames(GG6)),as.numeric(round(start(ranges(GG6))/1000000,1)))
tmp4<-c(tmp3)
MrksF2[MrksF2[,4]%in%tmp3[,1],8]<-tmp3[,3]
colnames(MrksF2)[8]<-c("GalGal6Mb")
LocMrksF2<-MrksF2[,c(1,3,7,8,2,4)]


GG5 = unlist(GG5)
length(GG3)-length(GG5)
setdiff(GG3$Marker, GG5$Marker)
tmp<-c()
tmp<-cbind(as.character(GG5$Marker),as.character(seqnames(GG5)),as.numeric(round(start(ranges(GG5))/1000000,1)))
tmp2<-c(tmp)
MrksF2[MrksF2[,4]%in%tmp[,1],7]<-tmp[,3]
colnames(MrksF2)[7]<-c("GalGal5Mb")
LocMrksF2<-MrksF2[,c(1,3,7,2,4)]

####### B.2. Manual assignment of GalGal5 location for markers where liftover failed #######
####### Locations in file found by manually searching the NCBI database in February, 2018  #

LocManMrksF2 <- read.table(file="../F2/180226_OCG_hlF2markersWahlberg2009ManualPositionNCBI.txt",header=TRUE,sep="\t")
LocManMrksF2[,1] <- as.character(LocManMrksF2[,1])
LocManMrksF2[,4] <- as.numeric(LocManMrksF2[,4])
for (i in 1:nrow(LocManMrksF2)){
  LocMrksF2[which(LocMrksF2[,5]==LocManMrksF2[i,1]),3] <- LocManMrksF2[i,4]
  MrksF2[which(MrksF2[,4]==LocManMrksF2[i,1]),7] <- LocManMrksF2[i,4]
}


Geno_a <- matrix(data=NA,nrow=length(unique(Geno[,2])))
Geno_a[,1]<-unique(Geno[,2])
rownames(Geno_a) <- Geno_a[,1]
for (i in 1:nrow(MrksF2)){
  Geno_a <- cbind(Geno_a,Geno[((Geno[,1]==MrksF2[i,1]) & (Geno[,3]==MrksF2[i,5])),8])
}
Geno_a <- Geno_a[,2:ncol(Geno_a)]
mrks <- MrksF2[,4]
colnames(Geno_a)<-mrks
Geno_a <- as.data.frame(Geno_a)
colnames(Geno_a) <- gsub('-', '_', colnames(Geno_a))


##### B.4. Read in datastructure with the raw SNP/MS genotypes from Per Wahlberg  ###########
## This is done by running the script 180226_ReadQTLFastFiles.R

source(file ="../R/20200902_ReadQTLFastFiles.R") # edited file with new paths

##### B.5. Load the Rqtl object mapthis including genotype, phenotype and linkage map #######
## data for the GBSA marker data

load(file='../HL_F2_mapthis.Rdata')


qtl_chromosome <- 1
qtl_marker <- 'rs15502284'

#### Find the location for this in the genotype object containing the raw SNP/MS genotype information
if (qtl_chromosome > 1) {
  qtl_marker_location <- mrks_chrom[qtl_chromosome,which(Mapinfo$Marker==qtl_marker)]
} else if (qtl_chromosome == 1) {
  qtl_marker_location <- mrks_chrom[qtl_chromosome,which(Mapinfo$Marker==qtl_marker)]
  if (qtl_marker_location > 46) {
    # On GGA1 '+1' is used for markers with ID >=47 as mrk 47 on the genetic map 
    # was not included in the linkage map published in Wahlberg 2009
    qtl_marker_location <- mrks_chrom[qtl_chromosome,(which(Mapinfo$Marker==qtl_marker)+1)]
  }
}



#### Extract the SNP/MS genotypes for all individuals at this location
## Genotypes given as: 'ID, allele 1, allele 2'
qtl_mrk_genotypes <- RawGenotypesF2[c(1,2*qtl_marker_location,2*qtl_marker_location+1)]


#### Extracting SNP/MS genotypes only for a subset of the individuals (e.g. a FS family)
## Example, FS family including F2's 353 & 358
#1997 0 0 1 2
#1812 0 0 0 1
#1690 0 0 1 1
#1925 0 0 0 2
#175 1997 1812 1 
#294 1690 1925 0 
#353 175 294 1 
#358 175 294 1 

family  <- c(1997,1812,1690,1925,175,294,353,358)
qtl_mrk_family <- qtl_mrk_genotypes[qtl_mrk_genotypes[,1]%in%family,1:3]


prepare_plot_prob <- function (plot_chromosome,plot_name) {
  ## First get GBSA probabilities
  tmp1 <- eval(parse(text = paste("mapthis$geno$",plot_chromosome,"$prob[,,1]",sep="'")))
  tmp2 <- eval(parse(text = paste("mapthis$geno$",plot_chromosome,"$prob[,,3]",sep="'")))
  rqtlprob_gbsa<-tmp1-tmp2
  rqtlprob_gbsa<-as.data.frame(rqtlprob_gbsa)
  rownames(rqtlprob_gbsa)<-mapthis$pheno[,"F2_ID"]
  
  ## then locations of GBSA markers
  gbsa_cms <- eval(parse(text = paste("as.vector(unname(mapthis$geno$",plot_chromosome,"$map))",sep="'")))
  gbsa_locations<-eval(parse(text = paste('(as.numeric(gsub(',plot_name,',"",names(mapthis$geno$',plot_chromosome,'$map))))',sep="'")))
  colnames(rqtlprob_gbsa)<-gbsa_locations
  
  ## Second get locations for SNP/MS markers 
  chrom_mrknames <- Mapinfo[which(Mapinfo$Chromosome==plot_chromosome),1]
  which(colnames(Geno_a) %in% chrom_mrknames)
  Chrom_geno <- Geno_a[which(as.numeric(rownames(Geno_a)) %in% mapthis$pheno[,"F2_ID"]),which(colnames(Geno_a) %in% chrom_mrknames)]
  snpms_locations<-(as.numeric(LocMrksF2$GalGal5Mb[which(LocMrksF2$Chromosome==plot_chromosome)]))
  colnames(Chrom_geno)<-snpms_locations
  
  ## Prepare for plotting the probabilities across the chromosome
  # Create variables that contain one column for every scored marker 
  tmp1 <- rqtlprob_gbsa
  tmp1[] <- 'NA'
  tmp2 <- Chrom_geno
  tmp2[] <- 'NA'
  
  # One for the GBSA and one for the MS/SNP markers, columns empty if marker of other kind
  plot_gbsa_prob <- cbind(rqtlprob_gbsa,tmp2)
  plot_qtl_prob <- cbind(Chrom_geno,tmp1)
  # Sort them to plot markers in correct order
  plot_gbsa_prob <- plot_gbsa_prob[ , order(as.numeric(colnames(plot_gbsa_prob)))]
  plot_qtl_prob <- plot_qtl_prob[ , order(as.numeric(colnames(plot_qtl_prob)))] 
}

##### C.2.2 Function for plotting genotype probabilities across an entire chromosome for a given individual
## The individual to plot is provided in the 'check_this_id' variable and the chromosome in 'check_this_chrom'
## Output are plots with genotype-probabilities from SNP/MS data (qtlprobs) and GBSA data (rqtlprobs)
checkid <- function (check_this_id,check_this_chrom)  {
  qtlprobs<-Geno$V8[which(Geno$V2==check_this_id & Geno$V1==check_this_chrom)]
  tmp1 <- eval(parse(text = paste("mapthis$geno$",check_this_chrom,"$prob[which(mapthis$pheno[1]==check_this_id),,1]",sep="'")))
  tmp2 <- eval(parse(text = paste("mapthis$geno$",check_this_chrom,"$prob[which(mapthis$pheno[1]==check_this_id),,3]",sep="'")))
  rqtlprob<-as.numeric(tmp1-tmp2)
  plot(rqtlprob)
  plot(qtlprobs)
}

#### Provide ID & Chromosome & run 'checkid' function 
## this will output SNP/MS & GBSA qtl probabilities for individual 
ID_tocheck <- 353
Chrom_tocheck <- 1
checkid(ID_tocheck,Chrom_tocheck)

### ToDo: plot probabilities at scored markers  & corresponding Mb locations

##### Checking locations across 'plot_chromosome' for individuals

chromosome_to_plot <- 2





QTLJacobsson2005 <- read.table(file="../F2/150203_OCG_QTLJacobsson2005.txt",header=TRUE,sep="\t")
QTLJacobsson2005[,4]<-as.character(QTLJacobsson2005[,4])
QTLJacobsson2005[,4] <- gsub(' ', '', QTLJacobsson2005[,4])
QTLJacobsson2005[,5]<-as.character(QTLJacobsson2005[,5])
QTLJacobsson2005[,5] <- gsub(' ', '', QTLJacobsson2005[,5])

# The linkage map on Chromosome 7 is flipped - swap places for flanking markers
tmp <- QTLJacobsson2005[QTLJacobsson2005[,2]=="7",4]
QTLJacobsson2005[QTLJacobsson2005[,2]=="7",4] <- QTLJacobsson2005[QTLJacobsson2005[,2]=="7",5]
QTLJacobsson2005[QTLJacobsson2005[,2]=="7",5] <- tmp

# Then, read in the locations for the QTL reported in Wahlberg, 2009. In this paper, no confidence
# interval for the QTL are given, only the peak location

QTLWahlberg2009 <- read.table(file="../F2/150203_OCG_QTLWahlberg2009.txt",header=TRUE,sep="\t")
QTLWahlberg2009[,2]<-as.numeric(QTLWahlberg2009[,2])
QTLWahlberg2009[,3]<-as.numeric(QTLWahlberg2009[,3])
QTLWahlberg2009[,4]<-as.character(QTLWahlberg2009[,4])

###### Physical map-locations for QTL in Jacobsson, 2005 #########
# Determine Mb locations on GalGal5 for the confidence-interval markers QTL in Jacobsson, 2005.

# Two markers flanking QTL (MCW130 & BMP7) are missing in Wahlberg, 2009
# Instead use the neareast marker in Jacobsson, 2005 that is present in Wahlberg, 2009
# These are MCW0293 (MCW130) & MC3R (BMP7). We use the MC3R_PYRO from Wahlberg, 2009 for MC3R
QTLJacobsson2005[,5] <- gsub('MCW130', 'MCW0293', QTLJacobsson2005[,5])
QTLJacobsson2005[,5] <- gsub('BMP7', 'MC3R_PYRO', QTLJacobsson2005[,5])
for (i in 1:nrow(QTLJacobsson2005)){
  #Left marker
  QTLJacobsson2005[i,6] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,4],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,4],nchar(QTLJacobsson2005[i,4])-2,nchar(QTLJacobsson2005[i,4])))),5]
  QTLJacobsson2005[i,7] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,4],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,4],nchar(QTLJacobsson2005[i,4])-2,nchar(QTLJacobsson2005[i,4])))),3]  
  QTLJacobsson2005[i,8] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,4],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,4],nchar(QTLJacobsson2005[i,4])-2,nchar(QTLJacobsson2005[i,4])))),2]  
  #Right marker
  QTLJacobsson2005[i,9] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,5],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,5],nchar(QTLJacobsson2005[i,5])-2,nchar(QTLJacobsson2005[i,5])))),5]
  QTLJacobsson2005[i,10] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,5],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,5],nchar(QTLJacobsson2005[i,5])-2,nchar(QTLJacobsson2005[i,5])))),3]  
  QTLJacobsson2005[i,11] <- LocMrksF2[which((substr(LocMrksF2[,5],1,3)%in%substr(QTLJacobsson2005[i,5],1,3)) & (substr(LocMrksF2[,5],nchar(LocMrksF2[,5])-2,nchar(LocMrksF2[,5]))%in%substr(QTLJacobsson2005[i,5],nchar(QTLJacobsson2005[i,5])-2,nchar(QTLJacobsson2005[i,5])))),2]  
}
QTLJacobsson2005<-QTLJacobsson2005[,c(1:4,7:8,5,10:11)]
colnames(QTLJacobsson2005)[c(2,5,6,8,9)]<-c("Chromosome","MbGG4L","cML","MbGG4R","cMR")
QTLJacobsson2005[,2]<-as.numeric(QTLJacobsson2005[,2])
QTLJacobsson2005[,5]<-as.numeric(QTLJacobsson2005[,5])
QTLJacobsson2005[,6]<-as.numeric(QTLJacobsson2005[,6])
QTLJacobsson2005[,8]<-as.numeric(QTLJacobsson2005[,8])
QTLJacobsson2005[,9]<-as.numeric(QTLJacobsson2005[,9])

###### Physical map-locations for QTL in Wahlberg, 2009 #########
# Identify the markers that flank the QTL-peak 
for (i in 1:nrow(QTLWahlberg2009)){
  #Left marker
  #print(i)
  LChr <- (LocMrksF2[,1]==QTLWahlberg2009[i,2]) # limit to markers from the same chromosome
  #print(LChr)
  LMrks <- (LocMrksF2[,2] <= QTLWahlberg2009[i,3]) # i think this is supposed to compare to cm, not trait
  QTLWahlberg2009[i,5] <- LocMrksF2[which(LChr&LMrks)[length(which(LChr&LMrks))],5]
  QTLWahlberg2009[i,6] <- LocMrksF2[which(LChr&LMrks)[length(which(LChr&LMrks))],3]  
  QTLWahlberg2009[i,7] <- LocMrksF2[which(LChr&LMrks)[length(which(LChr&LMrks))],2]  
  #Right marker
  UMrks <- (LocMrksF2[,2] >= QTLWahlberg2009[i,3])
  QTLWahlberg2009[i,8] <- LocMrksF2[which(LChr&UMrks)[1],5]
  QTLWahlberg2009[i,9] <- LocMrksF2[which(LChr&UMrks)[1],3]  
  QTLWahlberg2009[i,10] <- LocMrksF2[which(LChr&UMrks)[1],2]
}
QTLWahlberg2009<-QTLWahlberg2009[,c(1:2,4:10)]
colnames(QTLWahlberg2009)[c(4,5,6,7,8,9)]<-c("MrkL","MbGG4L","cML","MrkR","MbGG4R","cMR")
QTLWahlberg2009[,2]<-as.numeric(QTLWahlberg2009[,2])
QTLWahlberg2009[,5]<-as.numeric(QTLWahlberg2009[,5])
QTLWahlberg2009[,6]<-as.numeric(QTLWahlberg2009[,6])
QTLWahlberg2009[,8]<-as.numeric(QTLWahlberg2009[,8])
QTLWahlberg2009[,9]<-as.numeric(QTLWahlberg2009[,9])
