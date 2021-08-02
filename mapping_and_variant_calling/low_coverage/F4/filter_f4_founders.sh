#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 6
#SBATCH -J filter_founders
#SBATCH -o ./filter_founders_%j.out
#SBATCH -e ./filter_founders_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
##command underneath this##
source activate v3 
infile="/home/tilman/storage/F4/all_f4.vcf.bgz"
reference="/home/tilman/storage2/all_GQ20_MQ50_noIndels_callrate0.3.vcf"
outfile="/home/tilman/storage/F4/all_f4_only_founder_snps.vcf.bgz"
threads="5"

/home/tilman/miniconda3/envs/v3/bin/python ../filter_for_founders.py -d  -i $infile -r $reference -o $outfile -t $threads 

