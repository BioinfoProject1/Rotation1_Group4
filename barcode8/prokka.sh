#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=10:00:00
#SBATCH --job-name=prokka_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/short_reads/prokka_shotreads.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/prokka_shortreads.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

# Source environments
source $HOME/.bash_profile

# Activate prokka environment
conda activate prokka

# Define variables
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/short_reads
shortread_genome=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/scaffolds.fasta

# Annotate genome
prokka --outdir $output_dir/prokka \
        --prefix hvolcanii_DS2_shortread_genome \
        --cpus 16 \
        --genus Haloferax \
        --species volcanii \
        --strain DS2 \
        --kingdom Archaea \
        --addgenes \
        --usegenus \
        --rfam \
        --locustag shortread_ann \
        $shortread_genome
        
# Deactivate environment
conda deactivate
