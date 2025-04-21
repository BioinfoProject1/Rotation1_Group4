#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=ann_merger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Annotation reference files
DS2=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/ann_DS2.gff3
P1=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/ann_plasmid1.gff3
P3=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/ann_plasmid3.gff3
P4=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc/ann_plasmid4.gff3
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/IGV_p4_inc

# Merge annotation files
cat $DS2 $P1 $P3 $P4 > $output_dir/p4inc_ann_merge_ref.gff3
