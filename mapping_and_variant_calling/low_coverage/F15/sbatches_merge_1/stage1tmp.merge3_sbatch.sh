#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge3
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge3_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge3_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2366_S25_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2990_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2935_S49_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2581_S41_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2486_S17_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2469_S22_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3293_S31_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2550_S28_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2529_S33_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2606_S5_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3344_S73_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz