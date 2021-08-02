#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 72:0:0 
#SBATCH -p core -n 20
#SBATCH -J tabix_final
#SBATCH -o tabix_final_%j.out
#SBATCH -e merge_final_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
module load bioinfo-tools
module load htslib

source activate v3



outfile="/home/tilman/storage/F10/all_f10.vcf.bgz"

tabix -p vcf $outfile
