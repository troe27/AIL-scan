#!/bin/bash
source activate stripes
snakemake --keep-going -j 10 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F3.yaml  --rerun-incomplete
