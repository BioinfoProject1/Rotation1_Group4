#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=40g
#SBATCH --time=20:00:00
#SBATCH --job-name=mergeref_quast
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/compare_assembly_methods/mergedp4ref_quast/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/compare_assembly_methods/mergedp4ref_quast/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate QUAST environment
source $HOME/.bash_profile
conda activate quast

# File paths
unicycler_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid/highdepth_assembly.fasta"
pilon_polish_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/pilonpolish/polished.fasta"
merged_reference="/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/p4inc_merge_ref.fasta" # includes plasmids (1,3,4)
genes="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/genes.txt"
out_dir="/share/BioinfMSc/rotation1/Group4/barcode8/quast/compare_assembly_methods/mergedp4ref_quast"

# Run quast
quast.py $unicycler_assembly $pilon_polish_assembly \
    -r $merged_reference \
    -g $genes \
    -o $out_dir \
    --threads 16

# Deactivate conda environment
conda deactivate
