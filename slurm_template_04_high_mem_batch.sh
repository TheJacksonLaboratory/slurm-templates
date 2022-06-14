#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=high_mem # Set the partition 
#SBATCH --qos=batch          # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the number of nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=46   # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 142 CPUs per node]
#SBATCH --mem=1024GB         # Here set to ~1TB (~22GB per core set above )[limited to 3022GB per node]
#SBATCH --time=24:00:00      # Set the max time limit (high_mem partition has 72 hr limit)

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###

