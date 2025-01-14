#!/bin/bash
#PBS -l select=2:ncpus=24:mpiprocs=24:mem=120gb
#PBS -N assembly_hassan_megahit
#PBS -q normal
#PBS -P CBBI1470
#PBS -l walltime=16:00:00
#PBS -m abe
#PBS -M georgekitundu2@gmail.com

#Author: GEORGE KITUNDU
#Date: sept 22, 2024

module load chpc/BIOMODULES
module load megahit/1.2.9


##variables
data_dir=/mnt/lustre/users/maloo/mbinda-George/hassan
out_dir=/mnt/lustre/users/maloo/mbinda-George/hassan/megahit_assembly2

megahit \
-1 $data_dir/ptb2_f.fastq.gz -2 $data_dir/ptb2_r_fastq.gz \
-o $out_dir