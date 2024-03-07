#!/bin/bash
#SBATCH --partition=employee
#SBATCH --array=1-36
#SBATCH --cpus-per-task=1
#SBATCH --time=1-00:00:00
#SBATCH --error=/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX/subsample.%J.err
#SBATCH --output=/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX/subsample.%J.out
#SBATCH --mem-per-cpu=20G
#SBATCH --job-name=p2220

source /usr/local/ngseq/etc/lmod_profile
module load Tools/seqtk/1.3

DIR=/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX

k=$SLURM_ARRAY_TASK_ID
name=`sed -n ${k}p < /srv/GT/analysis/zajacn/p2220/o31444_NovaseqX/list_of_files`

seqtk sample -s100 $DIR/o31444_NovaSeq_230825_X003_markedUMIs/${name} 2000000 > $DIR/o31444_NovaSeq_230825_X003_markedUMIs_subsampled/${name}.subsampled.fastq
gzip $DIR/o31444_NovaSeq_230825_X003_markedUMIs_subsampled/${name}.subsampled.fastq
