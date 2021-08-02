import pandas as pd
import numpy as np
import statsmodels.api as sm
import statsmodels.formula.api as smf


# load data

cross = pd.read_csv('20201125_cross.csv', low_memory=False)
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


data = cross
pheno = 'BW8'
md = smf.mixedlm("{pheno} ~ SEX".format(pheno=pheno), data=data, groups='GENERATION')
mdf = md.fit()


residuals = pd.DataFrame([cross['id.1'], mdf.resid]).T

residuals.columns = ['id', 'sex_gen_resid']
residuals.to_csv('20201125_residuals_precorrected_for_sex_and_generation.csv')