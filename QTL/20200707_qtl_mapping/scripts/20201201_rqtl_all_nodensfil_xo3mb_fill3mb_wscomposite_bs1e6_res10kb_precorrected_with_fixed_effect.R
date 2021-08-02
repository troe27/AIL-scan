library("data.table")
library("qtl")

genfile =  '../data/20200727_all_wscomposite_binsize1mb_3mbxo_3mbfill.csv'
phefile = '../data/20200727_intersection_phenotypes.csv'

datf2 <- read.cross(format = "csvs",
                    genotypes = c(-1,0,1,"C","D"),
                    dir='.',
                    genfile=genfile,
                    phefile = phefile )

nt.bymar <- ntyped(datf2, "mar")
todrop <- names(nt.bymar[nt.bymar < 100])   # changed the filtering here

datf2.1 <- drop.markers(datf2, todrop)

#datf2.2 <- subset(datf2.1, ind=(ntyped(datf2.1)>50)) # removing all individuals that have less than 5% of all markers
datf2.2 <- datf2.1 # do not remove low marker individuals

cg <- comparegeno(datf2.2)

wh <- which(cg > 0.9, arr=TRUE)
wh <- wh[wh[,1] < wh[,2],]

gt <- geno.table(datf2.2)


gt[gt$P.value < 0.05/totmar(datf2.2),]
todrop <- rownames(gt[gt$P.value < 0.05/totmar(datf2.2),])
#datf2.3 <- drop.markers(datf2.2, todrop)

datf2.3 <- datf2.2 # do not drop markers
datf2.4 <- datf2.3

datf2.4 <- est.rf(datf2.4)
datf2.4_tst <- markerlrt(datf2.4)

genmap <- est.map(datf2.4, error.prob=0.005)
datf2.4 <- replace.map(datf2.4, genmap)

datf2.5 <- datf2.4

test2 <- subset(datf2.5, ind=test$pheno['BW8']!='NA')

#residuals from OLS pheno ~ SEX + GENERATION
resid_fix = read.table('20201201_residuals_precorrected_for_sex_and_generation_as_fixed_effects.csv', sep = ',', header = TRUE)

test2$pheno['fix_precorrBW8'] <- resid_fix$sex_gen_resid

#residuals from LMM pheno ~ SEX + (1|GENERATION)

resid = read.table('20201125_residuals_precorrected_for_sex_and_generation.csv', sep = ',', header = TRUE)

test2$pheno['precorrBW8'] <- resid$sex_gen_resid


# calc genoprobs

test2 <- calc.genoprob(test2, step=1)
test2 <- calc.genoprob(test2, step=0, off.end = 0)
ac <- pull.pheno(test2, c("SEX", 'GENERATION')) 
ac_sex <- pull.pheno(test2, c("SEX" )) 

# base, dont use this
out.hk.AC <- scanone(test2, pheno.col =3, addcovar=ac,  method='hk') 

# corrected using normalised bodyweight
out.hk.normBW8 <- scanone(test2, pheno.col =4, addcovar=ac_sex,  method='hk') 

# corrected using ols residuals
out.hk.precor_fixed <- scanone(test2, pheno.col = 8,  method='hk') 

# corrected using lmm residuals
out.hk.precor_random <- scanone(test2, pheno.col = 9,  method='hk') 


# getting permutation thresholds

test2chr4 = subset(test2, chr=4) # for suggestive


# fixed 

#significance
out.hk.precor_fix.perm <- scanone(test2, pheno.col = 8,  method='hk', n.perm = 10000)
# suggestive
out.hk.precor_fix.chr4.perm <- scanone(test2chr4, pheno.col = 8,  method='hk', n.perm = 10000) 


#normalised phenos

#significant
out.hk.normBW8.perm <- scanone(test2, pheno.col = 4,  method='hk', n.perm = 10000) 
#suggestive
out.hk.normBW8.chr4.perm <- scanone(test2chr4, pheno.col = 4,  method='hk', n.perm = 10000) 

save.image(file = "20201201_rqtl_all_fixedprecorr_andnormbw_perm.Rdata")