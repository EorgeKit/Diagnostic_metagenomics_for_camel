#!/bin/bash
#PBS -l select=3:ncpus=24:mpiprocs=24:mem=120gb
#PBS -N aligning_raw_reads_to_camel_reference
#PBS -q normal
#PBS -P CBBI1470
#PBS -l walltime=8:00:00
#PBS -m abe
#PBS -M georgekitundu2@gmail.com

#Author: GEORGE KITUNDU
#Date: sept 21, 2024

eval "$(conda shell.bash hook)"
conda activate bwt2

##data variables
ref_contigs=/mnt/lustre/users/maloo/mbinda-George/data/
data_dir=/home/maloo/lustre/allan_project/allan-George/data/raw_data
results_dir=/mnt/lustre/users/maloo/mbinda-George/analysis/mapping_2_genome
sample_iterate=/mnt/lustre/users/maloo/mbinda-George/analysis/mapping_2_genome/index-announced #this is just for "for loop" iteration
index_dir=/mnt/lustre/users/maloo/mbinda-George/analysis/mapping_2_genome  


##ALigning to mitochondrial genomes

for sample in $sample_iterate/*
do
echo "This is sample $(basename $sample)"
echo
echo "Aligning sample '$(basename $sample)' to  mitochondrial references"
echo

mkdir -p $results_dir/alignment-mitochondrial-genomes/$(basename $sample)
mkdir -p $results_dir/alignment-mitochondrial-genomes/$(basename $sample)/un-aligned-concordantly
mkdir -p $results_dir/alignment-mitochondrial-genomes/$(basename $sample)/aligned-concordantly

bowtie2   --end-to-end -p 70 \
-x $index_dir/index-mito/mito_refs \
-1 $data_dir/$(basename $sample)_1.fastq.gz \
-2 $data_dir/$(basename $sample)_2.fastq.gz \
-S $results_dir/alignment-mitochondrial-genomes/$(basename $sample)/$(basename $sample).sam \
--un-conc-gz $results_dir/alignment-announced-contigs/$(basename $sample)/un-aligned-concordantly \
--al-conc-gz $results_dir/alignment-announced-contigs/$(basename $sample)/aligned-concordantly


echo
echo "Finished aligning $(basename $sample)"
echo
done

