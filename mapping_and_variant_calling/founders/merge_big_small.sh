#!/bin/bash -l
# slurm submission script to merge the vcfs of all big chromosomes with the remaining small scaffolds.
#SBATCH -A snic2018-3-170
#SBATCH -t 10:0:0 
#SBATCH -p core -n 10
#SBATCH -J full_mergeVCF
#SBATCH -o full_mergeVCF_%j.out
#SBATCH -e full_mergeVCF_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
module load bioinfo-tools
module load GATK
ref=/home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna
gatk=/sw/apps/bioinfo/GATK/3.8-0/GenomeAnalysisTK.jar
java -Xmx64g -jar $gatk -T CombineVariants -R $ref --variant /home/tilman/storage/subset3/all_big_raw_low_resources_vcf_merged.vcf --variant /home/tilman/storage/subset3/vcf_small_raw.vcf --variant /home/tilman/storage/subset3/vcf/run_001_NC_006088.5_raw.vcf -o /home/tilman/storage/subset3/all.vcf -genotypeMergeOptions UNIQUIFY -nt 10
