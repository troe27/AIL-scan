import pandas as pd
from collection import Counter

geno_id_file = '../data/20210104_matrices2/20210105_density_matrix.csv'
pheno_file = '../data/20210106_standardised_pheno.csv'

samples_gen = pd.read_csv(geno_id_file)['Unnamed: 0']
phe_id = pd.read_csv(pheno_file)['id']

samples_gen = [i.rstrip(".genotype") for i in samples_gen]
phe_id = [str(i) for i in phe_id]

intersect = set.intersection(set(phe_id),set(samples_gen))

intersect = list(intersect)

gen = [i[:-2] for i in intersect]

C = Counter(gen)

g = []
count = []
for key, item in C.items():
    g.append(key)
    count.append(item)
per_gen_count = pd.DataFrame([g,count]).T

per_gen_count.columns = ['generation', 'n_individuals']

per_gen_count.sort_values(by='generation', ascending=True, inplace=True)

per_gen_count.to_csv('20210118_individuals_per_generation.csv', index=False)