library("data.table")
library("qtl")

genfile =  '../data/20210104_matrices2/20210105_rqtl_geno_wscomposite_onlyflipfilter.csv'
phefile = '../data/20210106_standardised_pheno.csv'


datf2 <- read.cross(format = "csvs",
                    genotypes = c(-1,0,1,"C","D"),
                    dir='.',
                    genfile=genfile,
                    phefile = phefile )
                    
                    
# load data - which bins have a Wahlberg 2009 marker?
Wahlberg_bins = read.table('../data/20210216_WB09_marker_positions.csv', sep = ',', header=FALSE)    
datf2 <- pull.markers(datf2, Wahlberg_bins$V1 )

nt.bymar <- ntyped(datf2, "mar")
todrop <- names(nt.bymar[nt.bymar < 100])   # changed the filtering here
datf2.1 <- drop.markers(datf2, todrop)

datf2.2 <- subset(datf2.1, ind=(ntyped(datf2.1)>5)) # removing all individuals that have less than 0.5% of all markers

cg <- comparegeno(datf2.2)
wh <- which(cg > 0.9, arr=TRUE)
wh <- wh[wh[,1] < wh[,2],]

gt <- geno.table(datf2.2)

gt[gt$P.value < 0.05/totmar(datf2.2),]
todrop <- rownames(gt[gt$P.value < 0.05/totmar(datf2.2),])
#datf2.3 <- drop.markers(datf2.2, todrop)

datf2.3 <- datf2.2
datf2.4 <- datf2.3

datf2.4 <- est.rf(datf2.4)
datf2.4_tst <- markerlrt(datf2.4)

save.image('20210216_Wahlberg_markers_afterRF.Rdata')

genmap <- est.map(datf2.4, error.prob=0.005)

save.image('20210216_Wahlberg_markers_aftergenmap.Rdata')

datf2.4 <- replace.map(datf2.4, genmap)
datf2.5 <- datf2.4

datf2.5 <- calc.genoprob(datf2.5, step=1)
datf2.5 <- calc.genoprob(datf2.5, step=0, off.end = 0)

ac <- pull.pheno(datf2.5, c("SEX")) 

out.hk.all_ind_wb_mark <- scanone(datf2.5, pheno.col = 2, addcovar=ac, method='hk') 

save.image(file = "20210216_rqtl_all_individs_wahlberg_markers.Rdata")