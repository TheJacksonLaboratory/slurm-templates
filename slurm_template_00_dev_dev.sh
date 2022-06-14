#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=dev      # Set the partition 
#SBATCH --qos=dev            # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=1    # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 30 CPUs per node]
#SBATCH --mem=6GB            # Set to a value ~10-20% greater than max amount of memory the job will use (or ~6 GB per core, for dev) (limited to 180 GB per node on compute partition)
#SBATCH --time=8:00:00       # Set the max time limit (dev partition/QoS has 8 hr limit)

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###
