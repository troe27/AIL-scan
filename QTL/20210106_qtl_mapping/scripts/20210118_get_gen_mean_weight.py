import pandas as pd
import numpy as np

phenos = pd.read_csv('../data/20201221_all_pheno.csv')

ph_g = phenos.groupby('GENERATION')

tb = []
for i,k in ph_g:
    tb.append(['F'+str(i), int(np.round(k['BW8'].mean(),0)),int(np.round(k['BW8'].std(),0))])
    
a = pd.DataFrame(tb)
a.to_csv('../data/20210118_mean_and_stdev_BW8_per_gen.csv', index=False)

gen = pd.read_csv('../data/20210118_individuals_per_generation.csv')

gen['generation'] = ['F'+str(i) for i in gen['generation']]

b = pd.merge(gen,a, on='generation')

sumcol = ['all',np.sum(b['n_individuals']),phenos['BW8'].mean(), phenos['BW8'].std()]

b = b.T
b['sumcol'] = sumcol
b = b.T

formatted = [ '{mean}({stdev})'.format(mean=np.round(k['mean_BW8'],0),stdev=np.round(k['stdev_BW8'],0)) for i,k in b.iterrows()]

b.to_csv('../data/20210118_overview_table.csv', index=False)