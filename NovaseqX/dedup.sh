#!/bin/bash
#SBATCH --partition=employee
#SBATCH --array=1-36
#SBATCH --cpus-per-task=20
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=15G
#SBATCH --job-name=p2220_dedup

source /usr/local/ngseq/miniconda3/etc/profile.d/conda.sh
conda activate umi_tools

DIR=/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX_100bp/dedup
k=$SLURM_ARRAY_TASK_ID
name=`sed -n ${k}p < /srv/GT/analysis/zajacn/p2220/o31444_NovaseqX_100bp/dedup/list_of_files_interest`

umi_tools dedup --stdin=/srv/gstore/projects/p2220/o31444_STAR_cutto100bp_2023-12-07--17-39-06/${name}.bam --output-stats=${name} --stdout=$DIR/${name}.dedup.bam  --log=${name}.log
