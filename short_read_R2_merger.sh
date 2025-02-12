#!/bin/bash

$#SBATCH --partition=defq
$#SBATCH --nodes=1
$#SBATCH --ntasks=1
$#SBATCH --cpus-per-task=8
$#SBATCH --mem=5g
$#SBATCH --time=00:50:00                                                                                                
$#SBATCH --job-name=R2_merger
$#SBATCH --output=/share/BioinfMSc/rotation1/Group4/short_read/shortR2merger-%x-%j.out
$#SBATCH --error=/share/BioinfMSc/rotation1/Group4/short_read/shortR2merger-%x-%j.err
$#SBATCH --mail-type=ALL
$#SBATCH --mail-user=alyzx23@nottingham.ac.uk

# Merge R2 files
cat /share/BioinfMSc/Matt_resources/short_reads/Fastq/*_S4_*_R2*.fastq.gz > /share/BioinfMSc/rotation1/Group4/short_read/R2_shortreads.fastq.gz 
