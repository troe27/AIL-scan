#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 05:0:0 
#SBATCH -p core -n 5
#SBATCH -J PCA_founders
#SBATCH -o PCA_founders_%j.out
#SBATCH -e PCAfounders_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL


/home/tilman/miniconda3/envs/v3/bin/python PCA_script.py  -i /home/tilman/storage2/all_GQ20_MQ50_noIndels_callrate0.3.vcf -o ./PCA_founders -c 15 -t 5 -n 5


