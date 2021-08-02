#!/bin/bash -l

## slurm submission script to filter g.vcf files individually, i.e. in their own jobs. takes g.vcf at pos {1} in stdin

#SBATCH  -A snic2018-3-170
#SBATCH  -p core -n 1
#SBATCH -t 3:00:00
#SBATCH -J filter_chrom
#SBATCH --mail-type=all
#SBATCH --get-user-env
#SBATCH --mail-user=tilman.ronneburg@imbim.uu.se
#SBATCH -o filter_NW_%j.out
#SBATCH -e filter_NW_%j.error
source activate v3
python ./filter_per_file_per_chrom.py -i ${1} -o /home/tilman/storage/subset3/gvcf_small/filtered -c NW -t 1
 
