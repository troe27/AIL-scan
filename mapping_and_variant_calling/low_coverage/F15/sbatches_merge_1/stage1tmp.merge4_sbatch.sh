#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge4
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge4_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge4_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2718_S18_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2384_S10_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2455_S95_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2433_F15_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2590_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2457_S20_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3313_S48_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3213_S65_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2967_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2340_S7_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2912_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz