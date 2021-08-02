#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J redo_map_no_indel
#SBATCH -o redo_map_no_indel_%j.out
#SBATCH -e redo_map_no_indel_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
##command underneath this##

snakemake -s genotype_v6_part1.snek /home/tilman/storage2/F15/data/F15_3053_S53_L005.cleaned.vcf.bgz




