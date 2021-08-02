
import matplotlib.pyplot as plt
import pandas as pd
from cyvcf2 import VCF
from sklearn.preprocessing import Imputer
from sklearn.decomposition import PCA
import argparse
from argparse import RawTextHelpFormatter
import numpy as np

def cli_parser():
    '''
   parses command line input

    '''
    parser_main = argparse.ArgumentParser(prog='PCA_script.py',
                                          description='''WHAT THIS SCRIPT DOES:
    ######################################################
    INPUT : VCF file, filtered for biallelic snps, no indels
    ACTION: performs Principle Component Analysis
    OUTPUT: table with PC 1&2 for all samples
            table with cumulative explained variance for n PC's
    NOTE:
        can currently only do bi-allelic vcfs

    #####################################################''',
                                            formatter_class=RawTextHelpFormatter
                                         )
    parser_main.add_argument("-i","--infile",
                             help="path/to/your_snp_file.VCF",
                             required = True)
    parser_main.add_argument("-o", "--outfileprefix",
                             help="path/outfix for the output_files",
                             required = True)
    parser_main.add_argument("-c", "--cumulative_explained_variance",
                             help="look at cumulative explained_variance_ratio_ per PCA, needs number of PCAs to look at",
                             default = None)
    parser_main.add_argument("-n", "--n_PC",
                                 help="number of PCAs to look at",
                                 default = 2)
    parser_main.add_argument("-t", "--threads",
                             help="number of threads to use for VCF parsing",
                             default = "1")

    args = parser_main.parse_args()
    return args

def load_vcf_to_gt_array(vcf_file, threads=1):
    """ Load the VCF-file."""
    vcf = VCF(vcf_file, threads=threads, gts012=True)
    snps = []
    genotype_list = []
    for v in vcf:
        snps.append(str(v.CHROM)+"-"+str(v.POS))
        genotype_list.append(list(v.gt_types))
    genotype_array = np.array(genotype_list)
    df = pd.DataFrame(genotype_array)
    df.columns = vcf.samples
    df.index = snps
    df = df.transpose()
    df = df.astype("float")
    df[df > 2.0 ] = float("NaN")
    return df

def prep_array(df):
    """ Prep dataset. """
    x = df.iloc[:,0:-1].values
    y = df.iloc[:,-1].values
    # impute missing sites with the average across all samples
    imputer=Imputer(missing_values="NaN", strategy='mean', axis=0)
    imputer = imputer.fit(x[:,:])
    x[:, :]=imputer.transform(x[:, :])
    return x,y

def run_pca(x,y,components=2, cum_var=False):
    """ run PCA. """
    pca = PCA(n_components=components)
    pca_x = pca.fit_transform(x)
    if cum_var == True:
        var1=np.cumsum(np.round(pca.explained_variance_ratio_, decimals=4)*100)
        return [list(range(len(var1)+1))[1:], var1]
    else:
        return pca_x

def save_table(outfile_prefix, input_data, cum_var=False):
    """ Save table as textfile. """
    if cum_var == True:
        out = zip(input_data[0], input_data[1])
        with open(str(outfile_prefix)+"_cumulative explained_variance.tsv", "w") as handle:
            for pc in out:
                handle.write("\t".join(out)+"\n")
    else:
        np.savetxt(outfile_prefix+"_pca_data.tsv", input_data, fmt='%.18e', delimiter='\t', newline='\n')
    return None

def main():
    """ Execute workflow. """
    args = cli_parser()
    threads = int(args.threads)
    df = load_vcf_to_gt_array(vcf_file=args.infile, threads=threads)
    x,y = prep_array(df)
    if args.cumulative_explained_variance:
        cumvar = run_pca(x=x,y=y, components=args.cumulative_explained_variance, cum_var=True)
        save_table(outfile_prefix=args.outfileprefix, input_data=cum_var, cum_var=True)
    pca_data = run_pca(x=x ,y=y, components=args.n_PC)
    save_table(outfile_prefix=args.outfileprefix, input_data=pca_data)

if __name__ == "__main__":
    main()
