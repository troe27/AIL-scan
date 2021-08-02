import pandas as pd
import numpy as np

def convert_effectsize_simple(val, df2, pheno='BW8'):   
    val2 = val*df2[pheno].std()
    return val2
    
phenos = pd.read_csv('../data/20201221_all_pheno.csv')

G6a = convert_effectsize_simple(val=0.08838, df2=phenos)
G7_1a = convert_effectsize_simple(val=0.05376, df2=phenos)
G7_2a = convert_effectsize_simple(val=0.11322, df2=phenos)
G7_3a = convert_effectsize_simple(val=0.06978, df2=phenos)

print(G6a)
print(G7_1a)
print(G7_2a)
print(G7_3a)

total_chr4 = sum([G6a, G7_1a, G7_2a, G7_3a])

total_g7 = sum([ G7_1a, G7_2a, G7_3a])




chr7_1a = convert_effectsize_simple(val=-0.003271, df2=phenos)

chr7_2a = convert_effectsize_simple(val=0.140168, df2=phenos)