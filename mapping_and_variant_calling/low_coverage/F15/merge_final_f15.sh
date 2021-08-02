#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 20
#SBATCH -J merge_final
#SBATCH -o ./merge_final_%j.out
#SBATCH -e ./merge_final_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
module load bioinfo-tools
module load bcftools
module load htslib

infolder="/home/tilman/storage2/F15/merge_vcf_stage2"
inlist=$(ls ${infolder}/*vcf.bgz | tr '\n' ' ')
outfile="/home/tilman/storage2/F15/all_f15.vcf.bgz"

bcftools merge $inlist -O z --threads 18 -o $outfile  && tabix -p vcf $outfile
