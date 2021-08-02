#! /usr/bin/env sh

PROJECT=/mnt/bbg/AIL_reseq/F0_F19_lowCov/fastq.processed/to.merge/fc3/

firstR1=${PROJECT}F2_*_R1_*
secondR1=${PROJECT}*_F2_*_R1_*

for e in $firstR1
do
    e0=$(basename $e)
    e1=${e0:3:10}
    ln -s $e ${e1%%_*}_forward.fastq.gz
    ln -s ${e/R1/R2} ${e1%%_*}_reverse.fastq.gz
done

for e in $secondR1
do
    e1=$(basename $e)
    ln -s $e ${e1%%_*}_forward.fastq.gz
    ln -s ${e/R1/R2} ${e1%%_*}_reverse.fastq.gz
done

