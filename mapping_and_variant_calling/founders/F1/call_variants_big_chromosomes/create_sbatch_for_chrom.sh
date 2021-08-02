#!/bin/bash

## execute gatk_gt_gvcf_creator.py to create sbatch files for all big chromosomes. 
## with different ressources for big-large, big-medium and big-small chroms
## tilman.ronneburg@imbim.uu.se

cat bigchroms_large.txt | xargs -n1 -I{} python gatk_gt_gvcf_creator.py --infolder /home/tilman/storage2/Galgal6_BAM_F1/data --outfile /home/tilman/storage2/storage2/Galgal6_BAM_F1/vcf/run_001 --reference /home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna --script_name per_chromosome_scripts_gatk/{}_gt --threads 20 --gatk_path /sw/apps/bioinfo/GATK/3.8-0/GenomeAnalysisTK.jar  --make_sbatch --chrom {}


cat bigchroms_medium.txt | xargs -n1 -I{} python gatk_gt_gvcf_creator.py --infolder /home/tilman/storage/subset3/gvcf/ --outfile /home/tilman/storage2/storage2/Galgal6_BAM_F1/vcf/run_001 --reference /home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna --script_name per_chromosome_scripts_gatk/{}_gt --threads 15  --gatk_path /sw/apps/bioinfo/GATK/3.8-0/GenomeAnalysisTK.jar  --make_sbatch --chrom {}

cat bigchroms_small.txt | xargs -n1 -I{} python gatk_gt_gvcf_creator.py --infolder /home/tilman/storage/subset3/gvcf/ --outfile /home/tilman/storage2/storage2/Galgal6_BAM_F1/vcf/run_001 --reference /home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna --script_name per_chromosome_scripts_gatk/{}_gt --threads 10  --gatk_path /sw/apps/bioinfo/GATK/3.8-0/GenomeAnalysisTK.jar  --make_sbatch --chrom {}
