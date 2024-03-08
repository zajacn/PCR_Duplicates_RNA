#!/bin/bash
#SBATCH --partition=employee
#SBATCH --array=1-36
#SBATCH --cpus-per-task=1
#SBATCH --time=1-00:00:00
#SBATCH --error=/srv/GT/analysis/zajacn/p2220/o31444_G4/G4_p2220_o31444_subsampled_v2/subsample.%J.err
#SBATCH --output=/srv/GT/analysis/zajacn/p2220/o31444_G4/G4_p2220_o31444_subsampled_v2/subsample.%J.out
#SBATCH --mem-per-cpu=20G
#SBATCH --job-name=p2220

source /usr/local/ngseq/etc/lmod_profile
module load Tools/seqtk/1.3

DIR=/srv/GT/analysis/zajacn/p2220/o31444_G4/G4_p2220_o31444_subsampled_v2

k=$SLURM_ARRAY_TASK_ID
name=`sed -n ${k}p < $(ls /srv/gstore/projects/p2220/G4_FC4_1S11M7B_20230715/*R1_001.fastq.gz)`

seqtk sample -s100 /srv/gstore/projects/p2220/G4_FC4_1S11M7B_20230715/${name} 2000000 | gzip > $DIR/${name}.subsampled.fastq

