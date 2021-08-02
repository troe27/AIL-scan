#!/bin/bash -l

## Slurm submission script to only keep all chromosomes starting with "NW" for all g.vcfs in the input folder

#SBATCH -A snic2018-3-170
# -p specifies the type of resource i want ( whole node, or core? ) and n the amount
#SBATCH -p core -n 4
#SBATCH -t 24:00:00
#SBATCH -J filt_gvcf_small_chromosomes
#SBATCH --mail-type=all
#SBATCH --get-user-env
#SBATCH --mail-user=tillman.ronneburg@imbim.uu.se
#SBATCH -o /home/tilman/storage/subset3/filt_gvcf_small_chromosomes%j.out
#SBATCH -e /home/tilman/storage/subset3/filt_gvcf_small_chromosomes_%j.error

source activate venv3

python filter_gvcfs_per_chrom.py --i /home/tilman/storage/subset3/gvcfs -o /home/tilman/storage/subset3/gvcfs_small_chrom -c NW -t 4
