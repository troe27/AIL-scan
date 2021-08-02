library("data.table")
library("qtl")


load('./20210106_qtl_mapping.Rdata')
# maybe skip estimating the map for now?

genmap <- est.map(datf2.4, error.prob=0.005)

save.image('./20210107_qtl_mapping_withmap.Rdata')




datf2.4 <- replace.map(datf2.4, genmap)



datf2.5 <- datf2.4




datf2.5 <- calc.genoprob(datf2.5, step=1)

datf2.5 <- calc.genoprob(datf2.5, step=0, off.end = 0)

save.image('./20210107_qtl_mapping_withgenoprob.Rdata')


ac <- pull.pheno(datf2.5, c("SEX")) 

out.hk.AC <- scanone(datf2.5, pheno.col =2, addcovar=ac,  method='hk') 



out.hk.ac.perm <- scanone(datf2.5, pheno.col = 2,  method='hk', addcovar=ac, n.perm = 10000) 

datf2.5chr4 = subset(datf2.5, chr=4)
chr4ac = pull.pheno(datf2.5chr4, c("SEX")) 

out.hk.ac.chr4.perm <- scanone(datf2.5chr4, pheno.col = 2, addcovar=chr4ac, method='hk', n.perm = 10000) 

summary(out.hk.ac.perm)

summary(out.hk.ac.chr4.perm)



save.image('20210107_qtl_mapping_with_map_and_results.Rdata')
