#!/bin/bash                                                                                                             
                                                                                                                        
#SBATCH --partition=defq                                                                                                
#SBATCH --nodes=1                                                                                                       
#SBATCH --ntasks=1                                                                                                      
#SBATCH --cpus-per-task=16                                                                                              
#SBATCH --mem=100G                                                                                                      
#SBATCH --time=12:00:00                                                                                                 
#SBATCH --job-name=unicycler_short_reads                                                                                
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results/unicycler.out                            
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results/unicycler.err                             
#SBATCH --mail-type=ALL                                                                                                 
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk                                                                             
                                                                                                                        
# Load environment                                                                                                      
source $HOME/.bash_profile                                                                                              
                                                                                                                        
# Activate Unicycler environment                                                                                        
conda activate unicycler                                                                                                
                                                                                                                        
# Define input and output paths                                                                                         
R1="/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results/R1_shortreads.fastq"                                  
R2="/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results/R2_shortreads.fastq"                                  
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results/unicycler_shortread" 

# Create output directory if it doesn't exist                                                                           
mkdir -p "$OUTPUT_DIR"                                                                                                  
                                                                                                                        
# Run Unicycler                                                                                                         
unicycler -1 "$R1" -2 "$R2" -o "$OUTPUT_DIR" --threads 16                                                               
                                                                                                                        
# Deactivate Conda environment                                                                                          
conda deactivate     
