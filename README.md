# Rotation1 Group4
## Introduction
This project is about LIFE4136 being carried out in Group4 of Rotation1. This research project is about the strain of a microorganism. We need to study which places or parts of the genome have been modified and where what changes have occurred. Our data includes short-read (Illumina data) and long-read data for some samples, but the majority of the samples only have long-read data. We want a collection of these genomes to determine what has happened to them.
## Installation
A conda environment (named 'myenv' was already created during the environment setup). If not created yet, we can create a new conda environment using the following command:

```bash
conda create -n bioinfo_env python=3.8
conda activate bioinfo_env conda create -n bioinfo_env python=3.8
conda activate bioinfo_env
```
Install required tools using commands:
```bash
conda install -c bioconda unicycler=0.5.0
conda install -c bioconda nanoplot=1.42.0
conda install -c bioconda quast=5.2.0
conda install -c bioconda busco=5.7.1
conda install -c bioconda prokka=1.14.6
conda install -c bioconda minimap2=2.28
```
## Data

## Code
### 1. Merged files
| Script Name                                      | Description                     |
|--------------------------------------------------|---------------------------------|
| [longreadmerge.sh](https://github.com/ZiqiXiong919/repo-name/blob/main/merged_files/merger/longreadmerge.sh)     | Merge long-read data           |
| [merger.sh](https://github.com/ZiqiXiong919/repo-name/blob/main/merged_files/merger/merger.sh)                   | General-purpose merging script |
| [short_read_R1_merger.sh](https://github.com/ZiqiXiong919/repo-name/blob/main/merged_files/merger/short_read_R1_merger.sh) | Merge short-read R1 data     |
| [short_read_R2_merger.sh](https://github.com/ZiqiXiong919/repo-name/blob/main/merged_files/merger/short_read_R2_merger.sh) | Merge short-read R2 data     |
### 2. QC
| passmerger.sh        | Merge reads passing QC         |
## References
