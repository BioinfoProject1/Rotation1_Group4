#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=80G
#SBATCH --time=23:00:00
#SBATCH --job-name=b4_highdepth_hybrid
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/genome_assembly/unicycler/highdepth_hybrid/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/genome_assembly/unicycler/highdepth_hybrid/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate unicycler environment
source $HOME/.bash_profile
conda activate unicycler2

# Paths
shortreads="/share/BioinfMSc/rotation1/Group4/short_read"
pass_longreads="/share/BioinfMSc/rotation1/Group4/long_read/merged_files"
out_dir="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/genome_assembly/unicycler/highdepth_hybrid"

# Hybrid assembly
unicycler -1 $shortreads/R1_shortreads.fastq.gz -2 $shortreads/R2_shortreads.fastq.gz -l $pass_longreads/pass_merged_barcode04.fastq -o $out_dir

# Deactivate conda environment
conda deactivate
