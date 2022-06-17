#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=dev      # Set the partition 
#SBATCH --qos=dev            # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=1    # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 30 CPUs per node]
#SBATCH --mem=6GB            # Set to a value ~10-20% greater than max amount of memory the job will use (or ~6 GB per core, for dev) (limited to 180 GB per node on compute partition)
#SBATCH --time=1:00:00       # Set the max time limit (dev partition/QoS has 8 hr limit)
#SBATCH --array=1-4          # runs array, no limit to how many run  

###-----load modules if needed-------###


###-----run script below this line-------###

LIB=$(sed -n -e "${SLURM_ARRAY_TASK_ID} p" /fastscratch/${USER}/adir/slurm-templates/workshop_examples/list_lib_names.txt)

echo "${LIB}_R1.fq    ${LIB}_R2.fq" > array_run2_${SLURM_ARRAY_TASK_ID}_out_${LIB}_file_names.txt

sleep 15

