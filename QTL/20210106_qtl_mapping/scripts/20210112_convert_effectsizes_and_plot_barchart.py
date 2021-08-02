import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import copy

from functions.translate import translate_dict as transdict

def convert_effectsize_simple(df1, df2, pheno='BW8'):
    est_ll = []
    for i, k in df1.iterrows():
        
        est = k['est']
        SE = k['SE']
        n_est = est*df2[pheno].std()
        n_SE = SE*df2[pheno].std()
        est_ll.append([k['Unnamed: 0'],n_est, n_SE])
        
    return est_ll
        
tdict = transdict().translate_dict

effectsizes = pd.read_csv('../results/20210111_qtl_effectsizes.csv')

phenos = pd.read_csv('../data/20201221_all_pheno.csv')

all_convert_simple_NOF8 = convert_effectsize_simple(df1=effectsizes, df2=phenos.loc[phenos.GENERATION != 8])


est_noF8 = pd.DataFrame(all_convert_simple_NOF8)
est_noF8.columns = ['name', 'est', 'SE']

est_noF8_add = pd.DataFrame([k for i,k in est_noF8.iterrows() if k['name'].endswith('a') ])
est_noF8_dom = pd.DataFrame([k for i,k in est_noF8.iterrows() if k['name'].endswith('d') ])

markers = '''1-56,1-171,2-99,2-113,3-35,3-74,4-11,4-23,4-36,4-70,5-1,5-10,5-34,6-30,7-4,7-21,9-4,11-9,11-21,13-7,14-12,15-6,15-16,16-11,27-6'''.split(',')

chrom = [tdict[i.split('-')[0]] for i in markers]
position = [i.split('-')[1] for i in markers]

est_noF8_dom['markers'] = markers
est_noF8_add['markers'] = markers

merged = pd.merge(est_noF8_add, est_noF8_dom, on='markers', suffixes=['_add', '_dom'])

merged['chromosome'] = chrom
merged['pos_Mb'] = position

merged.to_csv('../results/20210112_effectsizes_in_gram_noF8.csv', index=None)


fig, (ax,ax1) = plt.subplots(ncols=1, nrows=2, figsize=(15,5), sharey=True, sharex=True)

sns.barplot(x='name', y='est', data=est_noF8_add, yerr=est_noF8_add['SE'], alpha=0.5, ax=ax, color='Black')
sns.barplot(x='name', y='est', data=est_noF8_dom, yerr=est_noF8_dom['SE'], alpha=0.5, ax=ax1, color='Black')

ax1.set_xticks(range(len(est_noF8_add)))
plotlabels = [ k['chromosome']+'@'+k['pos_Mb'] for i,k in merged.iterrows()]
ax1.set_xticklabels(plotlabels, rotation=45, ha='right', size=14)
ax.set_xlabel('', size=1)

ax1.set_xlabel('QTL (Chr@Mb)', size=15)
ax.set_ylabel('Addtitive\nEffectsize in g', size=15)

ax1.set_ylabel('Dominance\nEffectsize in g', size=15)

ax.axhline(0, color='Black', lw=0.5)

plt.tight_layout()

plt.savefig('../results/figures/20210111_effectsize_stdbw8_add_dom_barchart.png')
