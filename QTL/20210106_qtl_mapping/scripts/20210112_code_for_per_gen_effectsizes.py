import pandas as pd
import numpy as np

def convert_effectsize(df1, df2, group='GENERATION', pheno='BW8'):
    est_ll = {}
    for i, k in df1.iterrows():
        est_l = []
        est_l2 = []
        SE_l = []
        SE_l2 = []

        lid = 0
        id_l = []
        est = k['est']
        SE = k['SE']
        #print(est)
        for j, l in df2.groupby('GENERATION'):
            #print(l[pheno].std())
            #print(k['Unnamed: 0'],j,est*l[pheno].std())
            est_l.append(est*l[pheno].std()*len(l))
            est_l2.append(est*l[pheno].std())

            SE_l.append(SE*l[pheno].std()*len(l))
            SE_l2.append(SE*l[pheno].std())

            lid = lid+len(l)
            id_l.append(j)
        #print(k['Unnamed: 0'], np.sum(est_l)/lid)
        est_ll.setdefault(k['Unnamed: 0'],{})
        est_ll[k['Unnamed: 0']]['mean_effectsize'] = np.sum(est_l)/lid
        est_ll[k['Unnamed: 0']]['mean_SE'] = np.sum(SE_l)/lid
        est_ll[k['Unnamed: 0']]['all_effect'] = est_l2
        est_ll[k['Unnamed: 0']]['all_SE'] = SE_l2

    
    return est_ll, id_l


effectsizes = pd.read_csv('../results/20210111_qtl_effectsizes.csv')
phenos = pd.read_csv('../data/20201221_all_pheno.csv')

all_convert = convert_effectsize(df1=effectsizes, df2=phenos)

ll = []
for key, item in all_convert[0].items():
    l = []
    l.append(key)
    l.append(item['mean_effectsize'])
    l.append(item['mean_SE'])
    l = l + item['all_effect'] + item['all_SE']
    ll.append(l)
    
    
columns = ['name', 'mean_est', 'mean_SE']+['gen_'+str(i)+'_est' for i in all_convert[1]]+['gen_'+str(i)+'_SE' for i in all_convert[1]]

allconv_df = pd.DataFrame(ll)

allconv_df.columns = columns