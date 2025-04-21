#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --time=10:00:00
#SBATCH --job-name=R1merger04
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/shortread/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/short_read/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Merge R1 files
cat /share/BioinfMSc/Matt_resources/short_reads/Fastq/*_S4_*_R1*.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode4_rerun/shortread/R1merged_04.fastq.gz 
