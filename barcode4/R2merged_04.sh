#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --time=10:00:00
#SBATCH --job-name=R2merger04
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/shortread/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/shortread/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Merge R2 files
cat /share/BioinfMSc/Matt_resources/short_reads/Fastq/*_S4_*_R2*.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode4_rerun/shortread/R2merged_04.fastq.gz 
