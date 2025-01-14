#!/bin/bash
#PBS -l select=2:ncpus=24:mpiprocs=24:mem=120gb
#PBS -q normal
#PBS -P CBBI1470
#PBS -l walltime=48:00:00
#PBS -m abe
#PBS -M georgekitundu2@gmail.com
#PBS -N squeezemeta_hassan_sample2_provided_assembly_STEP14_restart

module load chpc/BIOMODULES
module load squeezemeta/1.6.4 

##DATA LOCATIONS
RAW_DATA_DIR=/mnt/lustre/users/maloo/mbinda-George/hassan
SAMPLE_FILES=/mnt/lustre/users/maloo/mbinda-George/hassan
ext_assembly=/mnt/lustre/users/maloo/mbinda-George/hassan/megahit_assembly2/final.contigs.fa

# Squeezemeta on sample2
singularity run -B /mnt:/mnt $SQUEEZEMETA  /opt/SqueezeMeta/scripts/SqueezeMeta.pl \
-p /home/maloo/sample2 --restart  -step 4 \
-m sequential \
-extassembly $ext_assembly \
-s $SAMPLE_FILES/sample2.samples \
-f $RAW_DATA_DIR \
-binners maxbin,metabat2,concoct \
-taxbinmode s+c \
-D  -t 50 -b 113

##Resume 
singularity run -B /mnt:/mnt $SQUEEZEMETA  /opt/SqueezeMeta/scripts/SqueezeMeta.pl \
-p /home/maloo/sample2 --restart  -step 14 -m sequential \
-extassembly $ext_assembly \
-s $SAMPLE_FILES/sample2.samples \
-f $RAW_DATA_DIR \
-binners maxbin,metabat2,concoct \
-taxbinmode s+c \
-D  -t 47 -b 30
