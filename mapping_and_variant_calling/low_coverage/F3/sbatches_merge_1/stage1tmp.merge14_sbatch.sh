#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge14
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge14_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge14_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3490_F3_S25_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3547_F3_S77_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3473_F3_S11_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3263_F3_S5_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3426_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3176_F3_S20_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3571_F3_S2_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3416_F3_S55_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3538_F3_S68_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3606_F3_S36_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.14.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.14.vcf.bgz