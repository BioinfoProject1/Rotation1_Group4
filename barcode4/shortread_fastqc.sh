#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10g
#SBATCH --time=24:00:00
#SBATCH --job-name=qc_shortreads_b4
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/qc/short_reads/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/qc/short_reads/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk


# Activate environment with fastqc in it
source $HOME/.bash_profile
conda activate RNAseq

# Path to R1
shortreads=/share/BioinfMSc/rotation1/Group4/short_read
out_dir=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/qc/short_reads

# QC
fastqc $shortreads/R1_shortreads.fastq.gz -o $out_dir
fastqc $shortreads/R2_shortreads.fastq.gz -o $out_dir

# Deactivate environment
conda deactivate
