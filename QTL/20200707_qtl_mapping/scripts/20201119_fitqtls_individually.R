library("data.table")
library("qtl")

load('20201109_nodens.Rdata')


chrom  <- c(1,1,1,2,2,3,4,6,6,7,8,8,9,10,12,13,14,16,21,23,27,29)

pos <-c(84.23679,164.2182,401.677,216.027,327.171,141.6651,49.49908,0.02957916,78.12438,50.22548,21.68429,91.15566,0.6851328,20.48725,7.497863,4.298689,22.88642,8.951825,3.066803,1.00E-07,7.00E-07,6.00E-07)


# Fit QTLS INDIVIDUALLY


for (qtl in seq(1,23)){
    curr_chrom = chrom[qtl]
    curr_pos = pos[qtl]
    qtls <- makeqtl(datf2.5, chr = curr_chrom, pos = curr_pos, what = 'prob')
    fit_sugg <- fitqtl(datf2.5, pheno.col = 3, qtl = qtls, covar = ac2, get.ests=TRUE)
    print(summary(fit_sugg))
}