#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=10:00:00
#SBATCH --job-name=pass_longreads_prokka
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/pass_longreads/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/pass_longreads/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Source environments
source $HOME/.bash_profile

# Activate prokka environment
conda activate prokka

# Define variables
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/pass_longreads
pass_longread_genome=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/pass_assembly.fasta

# Annotate genome
prokka --outdir $output_dir/prokka \
        --prefix hvolcanii_DS2_passlongread_genome \
        --cpus 8 \
        --genus Haloferax \
        --species volcanii \
        --strain DS2 \
        --kingdom Archaea \
        --addgenes \
        --usegenus \
        --rfam \
        --locustag passlongread_ann \
        $pass_longread_genome
        
# Deactivate environment
conda deactivate
