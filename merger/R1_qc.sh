#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --job-name=qc_R1_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/qc/shortread/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/qc/shortread/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk


# Activate environment with fastq in it
source $HOME/.bash_profile
conda activate RNAseq

# Path to R1
R1=/share/BioinfMSc/rotation1/Group4/short_read
out_dir=/share/BioinfMSc/rotation1/Group4/qc/shortread

fastqc $R1/R1_shortreads.fastq.gz -o $out_dir

# Deactivate environment
conda deactivate
