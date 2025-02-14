#!/bin/bash                                                                                                             
                                                                                                                        
#SBATCH --partition=defq                                                                                                
#SBATCH --nodes=1                                                                                                       
#SBATCH --ntasks=1                                                                                                      
#SBATCH --cpus-per-task=8                                                                                               
#SBATCH --mem=100G                                                                                                      
#SBATCH --time=10:00:00                                                                                                 
#SBATCH --job-name=R2merger08                                                                                           
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2_shortreads.out                                
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2_shortreads.err                                 
#SBATCH --mail-type=ALL                                                                                                 
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk                                                                             
                                                                                                                        
# Merge R2 files                                                                                                        
cat /share/BioinfMSc/Matt_resources/short_reads/Fastq/*_S8_*_R2*.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2merged_08.fastq.gz 
