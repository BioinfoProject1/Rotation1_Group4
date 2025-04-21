#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10g
#SBATCH --time=05:00:00
#SBATCH --job-name=samtools
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/Samtools/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/Samtools/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate samtools

# Paths
data_dir=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid
work_dir=/share/BioinfMSc/rotation1/Group4/barcode8/Samtools
cp $data_dir/highdepth_assembly.fasta $work_dir
cd $work_dir

# Index hybrid
samtools faidx highdepth_assembly.fasta

# Filter for end region
samtools faidx highdepth_assembly.fasta 1:2846000-3483004 > hybrid_end.fasta

# Deactivate conda environment
conda deactivate
