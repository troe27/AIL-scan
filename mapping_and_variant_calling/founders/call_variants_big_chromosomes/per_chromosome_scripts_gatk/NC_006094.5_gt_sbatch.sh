#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 185:0:0 
#SBATCH -p core -n 15
#SBATCH -J genotypeGVCF
#SBATCH -o genotype_GVCF_NC_006094.5_%j.out
#SBATCH -e genotype_GVCF_NC_006094.5_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
module load bioinfo-tools
module load GATK
java -Xms10g -Xmx64g -jar /sw/apps/bioinfo/GATK/3.8-0/GenomeAnalysisTK.jar -nt 15 -T GenotypeGVCFs -R /home/tilman/storage/ref_gg6a/ref_unzipped/GCF_000002315.5_GRCg6a_genomic.fna --variant /home/tilman/storage/subset3/gvcf/AIL-P-1992_S19_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1674_S5_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2048_S1_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1740_S13_L005.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1670_S4_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1940_S12_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2012_S21_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1932_S9_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2040_S24_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1945_S13_L005.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1997_S20_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1728_S11_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1967_S16_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1774_S15_L005.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1655_S3_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1653_S1_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1927_S8_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2109_S9_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1897_S5_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1819_S20_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1953_S14_L005.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2029_S23_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1678_S6_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1736_S12_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1822_S21_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1833_S23_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1784_S16_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1934_S10_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2104_S7_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1680_S7_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1690_S8_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1844_S24_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2100_S6_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2064_S2_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1879_S2_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2108_S8_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1812_S18_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1654_S2_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1712_S9_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1890_S3_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2068_S3_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1988_S18_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2080_S4_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1896_S4_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1815_S19_L007.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1757_S14_L005.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2132_S11_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1832_S22_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1871_S1_L001.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2089_S5_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-F1-255_S12_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2130_S10_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1937_S11_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1786_S17_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1926_S7_L003.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-2026_S22_L008.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1972_S17_L006.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1720_S10_L004.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1925_S6_L002.g.vcf  --variant /home/tilman/storage/subset3/gvcf/AIL-P-1959_S15_L005.g.vcf  -L NC_006094.5 --out /home/tilman/storage/subset3/vcf/run_001_NC_006094.5_raw.vcf 
