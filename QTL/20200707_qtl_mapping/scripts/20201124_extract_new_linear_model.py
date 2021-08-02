import pandas as pd
import numpy as np
import statsmodels.api as sm
import statsmodels.formula.api as smf

#import matplotlib.pyplot as plt
#import seaborn as sns
#from collections import Counter

cross = pd.read_csv('20201123_cross.csv', low_memory=False)
cross = cross.drop([0,1])
cross = cross.reset_index()

cross = cross.replace('AA', -1)
cross = cross.replace('AB', 0)
cross = cross.replace('BB', 1)
cross = cross.replace('-', np.nan)

cross.GENERATION = ['F'+str(i) for i in cross.GENERATION]
cross.DAM = ['D'+str(i) for i in cross.DAM]

cross = cross.loc[cross.BW8.isna()==False]
cross.BW8 = cross.BW8.astype(int)
cross.SEX = cross.SEX.astype(int)


cnew = []
for i in cross.columns:
    if '-' in i:
        ni = 'mrk_'+'_'.join(i.split('-'))
    else:
        ni = i
    cnew.append(ni)
    
cross.columns = cnew


cross_markers = [i for i in cross.columns if i.startswith('mrk')]


def make_chicken_model(marker, data, pheno='BW8',):
    #drop all individuals where marker is missing
    subset = data.loc[data[marker].isna()==False] 
    
    md = smf.mixedlm("{pheno} ~ {marker}+ SEX".format(pheno=pheno, marker=marker), data=subset, groups='GENERATION')
    try:
        mdf = md.fit()
        return marker, mdf.pvalues[marker], mdf
    except:
        print('linalgerror at marker {marker}'.format(marker=marker) )
        return marker, np.nan, None
    
    
    
pvals = {}
for marker in cross_markers:
    #print(marker)
    m, p, model = make_chicken_model(marker=marker, data=cross)
 #print(m, p)
    pvals[m]={'pvalue':p, 'model':model}
    
    
    
    
pval2csv = []
for key, item in pvals.items():
    mrk = "-".join(key.lstrip('mrk_').split('_'))
    pval = item['pvalue']
    effectsize = pvals[key]['model'].params[key]
    se = pvals[key]['model'].bse_fe[key]
    ni = [mrk, pval, effectsize, se]
    pval2csv.append(ni)
    p_df = pd.DataFrame(pval2csv)
    p_df.columns = ['marker', 'pvalue', 'est_effectsize', 'effectsize_SE' ]

pp = []
for key, item in pvals.items():
    pp.append(item['pvalue'])
    
bh_corrected = sm.stats.multipletests(pvals = pp, method = 'fdr_bh')
bf_corrected = sm.stats.multipletests(pvals = pp, method = 'bonferroni')

p_df['bh_adj_pvalue_5perc'] = bh_corrected[1]
p_df['bh_tresh_pvalue'] = bh_corrected[0]

p_df.to_csv('20201124_mlm_results.csv')