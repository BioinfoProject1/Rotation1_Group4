#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=ref_merger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# References
DS2=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/hvolcanii_ds2_ref.fasta
P1=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/hvolcanii_p1_ref.fasta
P3=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/hvolcanii_p3_ref.fasta
P4=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/hvolcanii_p4_ref.fasta
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc

# Merge reference
cat $DS2 $P1 $P3 $P4 > $output_dir/p4inc_merge_ref.fasta
