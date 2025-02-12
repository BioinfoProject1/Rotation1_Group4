#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:30:00
#SBATCH --job-name=final_merged
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/mergednanoplot_results/mergeerror.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/mergednanoplot_results/mergeerror.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk
source $HOME/.bash_profile

TEMP_DIR=~/fastq_merge_tmp
DEST_DIR=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot
FAIL_DIR=/share/BioinfMSc/Matt_resources/long_reads/fastq_fail/barcode04
PASS_DIR=/share/BioinfMSc/Matt_resources/long_reads/fastq_pass/barcode04

mkdir -p $TEMP_DIR

zcat $FAIL_DIR/*.fastq.gz > $TEMP_DIR/fail_merged_barcode04.fastq
zcat $PASS_DIR/*.fastq.gz > $TEMP_DIR/pass_merged_barcode04.fastq

cat $TEMP_DIR/fail_merged_barcode04.fastq $TEMP_DIR/pass_merged_barcode04.fastq > $TEMP_DIR/final_merged_barcode04.fastq
                                                                                                                        
gzip $TEMP_DIR/final_merged_barcode04.fastq                                                                             
mv $TEMP_DIR/final_merged_barcode04.fastq.gz $DEST_DIR/                                                                 
                                                                                                                        
rm -rf $TEMP_DIR                                                                                                        
                                                                                                                        
conda activate nanoplot                                                                                                 
NanoPlot --fastq final_merged_barcode04.fastq.gz --outdir finalnanoplot_results --minlength 1000   

conda deactivate  
