#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./debug_f9
#SBATCH -o ./debug_f9_%j.out
#SBATCH -e ./debug_f9_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate /domus/h1/tilman/scripts/chicken_finemapping/mapping_and_variant_calling/low_coverage/.snakemake/conda/e38e16b2
bwa mem -t 4 /home/tilman/storage/ref_gg6a/GCF_000002315.5_GRCg6a_genomic.fna.gz /home/tilman/storage/F9/fastq/F9_2303_S70_L004_R1_001.fastq.gz /home/tilman/storage/F9/fastq/F9_2303_S70_L004_R2_001.fastq.gz | samtools sort -@4 -O BAM -o /home/tilman/storage/F9/data/F9_2303_S70_L004.bam - 
