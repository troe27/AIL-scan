library("data.table")
library("qtl")

genfile =  '../data/20210104_matrices2/20210105_rqtl_geno_wscomposite_onlyflipfilter.csv'
phefile = '../data/20210106_standardised_pheno.csv'



datf2 <- read.cross(format = "csvs",
                    genotypes = c(-1,0,1,"C","D"),
                    dir='.',
                    genfile=genfile,
                    phefile = phefile )

summary(datf2)

summary(datf2)



plotMissing(datf2)

par(mfrow=c(1,2), las=1)
plot(ntyped(datf2), ylab="No. typed markers", main="No. genotypes by individual")
plot(ntyped(datf2, "mar"), ylab="No. typed individuals", main="No. genotypes by marker")

nt.bymar <- ntyped(datf2, "mar")
todrop <- names(nt.bymar[nt.bymar < 100])   # changed the filtering here


todrop

datf2.1 <- drop.markers(datf2, todrop)

par(mfrow=c(1,2), las=1)
plot(ntyped(datf2.1), ylab="No. typed markers", main="No. genotypes by individual") 
plot(ntyped(datf2.1, "mar"), ylab="No. typed individuals",main="No. genotypes by marker")





datf2.2 <- subset(datf2.1, ind=(ntyped(datf2.1)>5)) # removing all individuals that have less than 0.5% of all markers
#datf2.2 <- datf2.1 # do not remove low marker individuals

summary(datf2.2)

length(ntyped(datf2.1, "ind"))
length(ntyped(datf2.2, "ind"))

par(mfrow=c(1,2), las=1)
plot(ntyped(datf2.2), ylab="No. typed markers", main="No. genotypes by individual") 
plot(ntyped(datf2.2, "mar"), ylab="No. typed individuals",main="No. genotypes by marker")

summary(datf2.2)

cg <- comparegeno(datf2.2)

hist(cg[lower.tri(cg)], breaks=seq(0, 1, len=101), xlab="No. matching genotypes") 
rug(cg[lower.tri(cg)])

wh <- which(cg > 0.9, arr=TRUE)
wh <- wh[wh[,1] < wh[,2],]

wh

print(dup <- findDupMarkers(datf2.2, exact.only=FALSE))

gt <- geno.table(datf2.2)




#### do not drop markers with segregation distortion


gt[gt$P.value < 0.05/totmar(datf2.2),]
todrop <- rownames(gt[gt$P.value < 0.05/totmar(datf2.2),])
#datf2.3 <- drop.markers(datf2.2, todrop)

length(todrop)

datf2.3 <- datf2.2

g <- pull.geno(datf2.2)
gfreq <- apply(g, 1, function(a) table(factor(a, levels=1:3)))
gfreq <- t(t(gfreq) / colSums(gfreq))
par(mfrow=c(1,3), las=1)
for(i in 1:3) plot(gfreq[i,], ylab="Genotype frequency", main=c("AA", "AB", "BB")[i], ylim=c(0,1))

g <- pull.geno(datf2.3)
gfreq <- apply(g, 1, function(a) table(factor(a, levels=1:3)))
gfreq <- t(t(gfreq) / colSums(gfreq))
par(mfrow=c(1,3), las=1)
for(i in 1:3) plot(gfreq[i,], ylab="Genotype frequency", main=c("AA", "AB", "BB")[i], ylim=c(0,1))

### do not filter for gfreq

#id_gtfreq <- which(gfreq[1,]<0.5 & gfreq[2,]<0.65 & gfreq[2,]>0.35 & gfreq[3,]<0.5)

#datf2.4 <- subset(datf2.3, ind=(id_gtfreq))

datf2.4 <- datf2.3

g <- pull.geno(datf2.4)
gfreq <- apply(g, 1, function(a) table(factor(a, levels=1:3)))
gfreq <- t(t(gfreq) / colSums(gfreq))
par(mfrow=c(1,3), las=1)
for(i in 1:3) plot(gfreq[i,], ylab="Genotype frequency", main=c("AA", "AB", "BB")[i], ylim=c(0,1))

datf2.4 <- est.rf(datf2.4)
datf2.4_tst <- markerlrt(datf2.4)

rf <- pull.rf(datf2.4)
lod <- pull.rf(datf2.4, what="lod")
plot(as.numeric(rf), as.numeric(lod), xlab="Recombination fraction", ylab="LOD score")

plotRF(datf2.4, alternate.chrid=TRUE)

save.image('20210106_qtl_mapping.Rdata')

# maybe skip estimating the map for now?

genmap <- est.map(datf2.4, error.prob=0.005)

summaryMap(genmap)

plotMap(genmap)

datf2.4 <- replace.map(datf2.4, genmap)

plot(countXO(datf2.4), ylab="Number of crossovers")
hist(countXO(datf2.4), ylab="Number of crossovers")
mean(countXO(datf2.4), ylab="Number of crossovers")


datf2.5 <- datf2.4

plotPheno(datf2.2, pheno.col=2)



#plotMissing(datf2.5, reorder=TRUE)

datf2.5 <- calc.genoprob(datf2.5, step=1)

datf2.5 <- calc.genoprob(datf2.5, step=0, off.end = 0)


ac <- pull.pheno(datf2.5, c("SEX")) 

out.hk.AC <- scanone(datf2.5, pheno.col =2, addcovar=ac,  method='hk') 



out.hk.ac.perm <- scanone(datf2.5, pheno.col = 2,  method='hk', addcovar=ac, n.perm = 10000) 

datf2.5chr4 = subset(datf2.5, chr=4)
chr4ac = pull.pheno(datf2.5chr4, c("SEX")) 

out.hk.ac.chr4.perm <- scanone(datf2.5chr4, pheno.col = 2, addcovar=chr4ac, method='hk', n.perm = 10000) 

summary(out.hk.ac.perm)

summary(out.hk.ac.chr4.perm)



save.image('20210106_qtl_mapping_with_map_and_results.Rdata')
