#!/bin/bash
module load bioinfo-tools
module load snakemake
snakemake -k  -j 250 -s ./genotype_v6_part1.snek --configfile config/config_f9.yaml  --cluster-config config/slurm.json  --cluster config/slurm_scheduler.py  --cluster-status config/slurm_status.py --rerun-incomplete --use-conda
