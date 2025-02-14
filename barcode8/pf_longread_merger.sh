#!/bin/bash                                                                                                             
                                                                                                                        
#SBATCH --partition=defq                                                                                                
#SBATCH --nodes=1                                                                                                       
#SBATCH --ntasks=1                                                                                                      
#SBATCH --cpus-per-task=8                                                                                               
#SBATCH --mem=5g                                                                                                        
#SBATCH --time=00:50:00                                                                                                 
#SBATCH --job-name=pf_merger                                                                                            
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/long_read/slurm-%x-%j.out                                   
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/long_read/slurm-%x-%j.err                                    
#SBATCH --mail-type=ALL                                                                                                 
#SBATCH --mail-user=mbyle1@nottingham.ac.uk                                                                             
                                                                                                                        
# source your bash profile so you can use conda                                                                         
source $HOME/.bash_profile                                                                                              
                                                                                                                        
# Activate conda environment                                                                                            
conda activate nanoplot                                                                                                 
                                                                                                                        
# Merge pass files                                                                                                      
cat /share/BioinfMSc/rotation1/Group4/barcode8/long_read/fail_merged_barcode08.fastq.gz /share/BioinfMSc/rotation1/Group4/barcode8/long_read/pass_merged_barcode08.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode8/long_read/pf_merged_barcode08.fastq.gz

# Nanoplot                                                                                                              
NanoPlot --fastq pf_merged_barcode08.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode8/long_read/pfnanoplot_results/

# Deactivate conda environment                                                                                          
conda deactivate 
