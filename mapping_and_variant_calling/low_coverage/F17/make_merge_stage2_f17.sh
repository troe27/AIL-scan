#!/bin/bash

source activate v3
mkdir /home/tilman/storage/F17/merge_vcf_stage2
mkdir ./sbatches_merge_2

/home/tilman/miniconda3/envs/v3/bin/python ../create_merge.py --infolder /home/tilman/storage/F17/merge_vcf_stage1 --prefix /home/tilman/storage/F13/merge_vcf_stage2/run002  --make_sbatch --threads 4 --bcftools_path bcftools --batchsize 5 --scriptprefix ./sbatches_merge_2/stage2

#execute :
ls ./sbatches_merge_2/stage2* | xargs -n1 -I{} bash -c "sbatch  {}; sleep 2s" # sbatch had i/o issues
