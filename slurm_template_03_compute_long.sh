#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=compute  # Set the partition 
#SBATCH --qos=long           # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the number of nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=4    # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 70 CPUs per node]
#SBATCH --mem=48GB           # Set to a value ~10-20% greater than max amount of memory the job will use (or ~10 GB per core, for compute partition) [limited to 760 GB per node on compute partition]
#SBATCH --time=96:00:00      # Set the max time limit (long QoS has 336 hr limit (14 days))

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###

