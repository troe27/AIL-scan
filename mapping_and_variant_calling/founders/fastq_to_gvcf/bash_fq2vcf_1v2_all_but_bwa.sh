#!/bin/bash -l
#SBATCH -A snic2018-3-170
# -p specifies the type of resource i want ( whole node, or core? ) and n the amount
#SBATCH -p core -n 4
#SBATCH -t 100:00:00
#SBATCH -J rerun_nobwa
#SBATCH --mail-type=all
#SBATCH --get-user-env
#SBATCH --mail-user=tillman.ronneburg@imbim.uu.se
#SBATCH -o /home/tilman/storage/subset3/rerun_nobwa_%j.out
#SBATCH -e /home/tilman/storage/subset3/rerun_nobwa_%j.error

module load bioinfo-tools
module load python3
module load picard
module load GATK
module load samtools
module load bwa
source /home/tilman/venv/bin/activate

fname=${1%_R1_001.fastq.gz}
fname_short=$(basename $fname)
forward=${fname}_R1_001.fastq.gz
reverse=${fname}_R2_001.fastq.gz

cores=4
ref="/home/tilman/storage/ref_gg6a/GCF_000002315.5_GRCg6a_genomic.fna.gz"
unzip_ref="/home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna"
bamfolder="/home/tilman/storage/subset3/bams"
bamrgfolder="/home/tilman/storage/subset3/bams_rg"
bamrgddfolder="/home/tilman/storage/subset3/bams_dedup" #logs!
gvcffolder="/home/tilman/storage/subset3/gvcf"

#mkdir /home/tilman/storage/subset3
#mkdir $bamfolder
#mkdir $bamrgfolder
#mkdir $bamrgddfolder
#mkdir ${bamrgddfolder}/logs
#mkdir $gvcffolder


echo $fname_short

#bwa mem -aM -t $cores $ref $forward $reverse | samtools view -bT $ref | samtools sort -l 0 -@ $cores -m 3G --output-fmt BAM -o ${bamfolder}/${fname_short}.bam

java -Xmx5G -jar $PICARD_HOME/picard.jar AddOrReplaceReadGroups  I=${bamfolder}/${fname_short}.bam O=${bamrgfolder}/${fname_short}.bam RGID=${fname_short} RGLB=nextera RGPL=illumina RGPU=${fname_short} RGSM=${fname_short} && rm ${bamfolder}/${fname_short}.bam

java -Xmx5G -jar $PICARD_HOME/picard.jar MarkDuplicates I=${bamrgfolder}/${fname_short}.bam O=${bamrgddfolder}/${fname_short}.bam METRICS_FILE=${bamrgddfolder}/logs/${fname_short}_dedup.log REMOVE_DUPLICATES=false && rm ${bamrgfolder}/${fname_short}.bam

java -Xmx5G -jar $PICARD_HOME/picard.jar BuildBamIndex I=${bamrgddfolder}/${fname_short}.bam

emit_thresh=20   #Threshold for tagging possible variants
call_thresh=30   #Threshold for tagging _good_ variants
#hetrate=0.03    #Popgen heterozygosity rate (that is, for any two random chrom in pop, what is rate of mismatch).Human is ~0.01, s$
minBaseScore=20  #Minimum Phred base score to count a base (20 = 0.01 error, 30=0.001 error,
outmode="EMIT_ALL_CONFIDENT_SITES"
java -Xmx5G -jar $GATK_HOME/GenomeAnalysisTK.jar --analysis_type HaplotypeCaller -I ${bamrgddfolder}/${fname_short}.bam --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -mbq $minBaseScore -stand_call_conf $call_thresh -out_mode $outmode -o $gvcffolder/${fname_short}.g.vcf -R $unzip_ref -nct $cores -nt 1 && rm ${bamrgddfolder}/${fname_short}.bam && echo $fname >> /home/tilman/storage/subset3/done_samples.txt

