### imports

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import os
import copy
import scipy as sc
from scripts.QC.GT_matrices import Genotypes, Pedigree

### Load imputed Genotypes

home = "/home/tilman/nas/stripes_AIL_gg6a/stripes2rqtl_bin500kb/"
initial_file = os.path.join(home, "F15","F15_gt_matrix_FilteredForBinsize500000.csv" )
gt = Genotypes(gt_file=initial_file, pedigree_file="/home/tilman/nas/pedigree/AIL_pedigree_20190826.tsv")
gt.construct_density_bin_matrix(folder="/home/tilman/nas/stripes_AIL_gg6a/")
gt.get_congruency_matrix()
gt.order_matrices()

markers = pd.read_csv("./r_liftover/full_f15_markers_geno.csv", ).transpose()
markers.columns = markers.iloc[0].astype(int).astype(str)
markers = markers[1:]
