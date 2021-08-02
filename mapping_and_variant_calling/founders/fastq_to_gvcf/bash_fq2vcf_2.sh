#!/bin/bash

## submit a variant calling job for each forward file in the textfile

cat restart_gatk_only.txt  | xargs -n1 -P 1 -I{} sbatch ./bash_fq2vcf_1v2.sh {}
