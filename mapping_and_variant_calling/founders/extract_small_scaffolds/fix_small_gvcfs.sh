#!/bin/bash -l

## slurm submission script in order to fix the floatingpoint error introduced by combining htslib and gatktools


#SBATCH -A snic2018-3-170
# -p specifies the type of resource i want ( whole node, or core? ) and n the amount
#SBATCH -p core -n 10
#SBATCH -t 2:00:00
#SBATCH -J fix_gvcf
#SBATCH --mail-type=all
#SBATCH --get-user-env
#SBATCH --mail-user=tillman.ronneburg@imbim.uu.se
#SBATCH -o /home/tilman/storage/subset3/fix_gvcf_%j.out
#SBATCH -e /home/tilman/storage/subset3/fix_gvcf_%j.error
ls /home/tilman/storage/subset3/gvcf_small/*.vcf | xargs -n1 -I{} basename {} | xargs -n1 -P20 -I{} bash -c "cat /home/tilman/storage/subset3/gvcf_small/{} | ./fix_broken_gvcf.pl  > /home/tilman/storage/subset3/gvcf_small_floatingpoint_fixed/{}"
