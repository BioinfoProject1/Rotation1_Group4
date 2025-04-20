#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=06:00:00
#SBATCH --job-name=spades_short_reads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/short_reads.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/short_reads.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

source ~/.bashrc
conda activate spades

# Run SPAdes
spades.py \
    -1 /share/BioinfMSc/rotation1/Group4/barcode8/short_read/R1merged_08.fastq \
    -2 /share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2merged_08.fastq \
    -o /share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads \
    --careful \
    -t 8 \
    -m 100

# Deactivate conda environment
conda deactivate
