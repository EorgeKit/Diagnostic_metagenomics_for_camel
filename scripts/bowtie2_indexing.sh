#!/bin/bash
#PBS -l select=2:ncpus=24:mpiprocs=24:mem=120gb
#PBS -N indexing_camel_genome
#PBS -q normal
#PBS -P CBBI1470
#PBS -l walltime=8:00:00
#PBS -m abe
#PBS -M georgekitundu2@gmail.com

#Author: GEORGE KITUNDU
#Date: sept 27, 2024

eval "$(conda shell.bash hook)"
conda activate bwt2

##data variables
camel_genome=/mnt/lustre/users/maloo/mbinda-George/hassan/camel_ref_genome/GCF_036321535.1_mCamDro1.pat_genomic.fa
results_dir=/mnt/lustre/users/maloo/mbinda-George/hassan/camel_ref_genome/


#run bowtie indexing
bowtie2-build  $camel_genome $results_dir/$(basename -s .pat_genomic.fa $camel_genome) \
--verbose --threads 46


