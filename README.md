# Quick Guide

## View your running/pending jobs 
- Use the squeue command and replace ```<userID>``` with you userID  
```squeue -u <userID>```

## To get an interactive node with srun (no MPI)

- Default srun request **small tasks only** (1 hr time limit, 1 core, compute partition & batch QoS). \
```srun --pty bash```

- General format for srun [**do not execute without changing values**]\
```srun -p <partition> -q <QoS> -N <Number of Nodes> -n <Number of tasks> -c <cores> --time <time> --pty bash```

- Single-core srun interactive job on **dev** partition and **dev** QoS with 4 cpus and 8GB RAM for 4 hrs.\
```srun -p dev -q dev -N 1 -n 1 -c 1 --mem 8GB --time 4:00:00 --pty bash```

- Single-core srun interactive job on **dev** partition and **dev** QoS with 4 cpus and 8GB RAM for 8 hrs (time limit for dev QoS).\
```srun -p dev -q dev -N 1 -n 1 -c 1 --mem 8GB --time 8:00:00 --pty bash```

- Multi-core srun interactive job on **dev** partition and **dev** QoS with 4 cpus and 8GB RAM for 8 hrs (time limit for dev QoS).\
```srun -p dev -q dev -N 1 -n 1 -c 4 --mem 8GB --time 8:00:00 --pty bash```

- Multi-core srun interactive job on **compute** partition (default) and **batch** QoS (default) with 4 cpus and 8GB RAM for 12 hrs.\
```srun -p compute -q batch -N 1 -n 1 -c 4 --mem 8GB --time 12:00:00 --pty bash```

## Example Slurm **sbatch** script header file templates

- Single-core sbatch script on **dev** partition & **dev** QoS with 1 cpu and 6GB for 8 hrs (time limit for dev QoS). [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_00_dev_dev.sh "slurm_template_00_dev_dev.sh").

- Multi-core sbatch script on **dev** partition & **dev** QoS with 4 cpus and 24GB for 8 hrs (time limit for dev QoS). [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_01_dev_dev.sh "slurm_template_01_dev_dev.sh").

- Multi-core sbatch script on **compute** partition & **batch** QoS with 4 cpus and 48GB RAM for 24 hrs. [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_02_compute_batch.sh "slurm_template_02_compute_batch.sh").

- Multi-core sbatch script on **compute** partition & **long** QoS with 4 cpus and 48GB RAM for 96 hrs. [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_03_compute_long.shh "slurm_template_03_compute_long.sh").

- Multi-core sbatch script on **compute** partition & **long** QoS with 4 cpus and 48GB RAM for 96 hrs. [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_04_high_mem_batch.sh "slurm_template_04_high_mem_batch.sh").

- Multi-core sbatch script on **compute** partition & **long** QoS with 4 cpus and 48GB RAM for 96 hrs. [LINK](https://github.com/TheJacksonLaboratory/slurm-templates/blob/main/slurm_template_05_compute_batch_array.sh "slurm_template_05_compute_batch_array.sh").

## General sbatch headers 
- Run sbatch jobs with ```sbatch <sbatch_script.sh>``` where **<sbatch_script.sh>** is the name of your slurm script. 
 - Set the number of cores with the ```--cpus-per-task``` flag and leave ```--nodes=1``` and ```--ntasks=1``` set to 1 (for most jobs).
 - The ```--cpus-per-task``` value is passed into the job as the ```${SLURM_CPUS_PER_TASK}``` enviromental variable.


## sbatch header for dev partition and dev QoS
 - dev CPU core speed 3.60GHz vs compute 2.70GHz
 - dev has 8 hour time limit 
 - dev partition and dev QoS must be ran together

```{: .bash}
#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=dev      # Set the partition 
#SBATCH --qos=dev            # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=4    # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 30 CPUs per node]
#SBATCH --mem=24GB           # Set to a value ~10-20% greater than max amount of memory the job will use (or ~6 GB per core, for dev) (limited to 180 GB per node on dev partition)
#SBATCH --time=8:00:00       # Set the max time limit (dev partition/QoS has 8 hr limit)

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###


```

## sbatch example header for compute partition and batch QoS

```{: .bash}
#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=compute  # Set the partition 
#SBATCH --qos=batch          # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the number of nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=4    # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 70 CPUs per node]
#SBATCH --mem=48GB           # Set to a value ~10-20% greater than max amount of memory the job will use (or ~10 GB per core, for compute partition) [limited to 760 GB per node on compute partition]
#SBATCH --time=72:00:00      # Set the max time limit (batch QoS 72 hr limit)

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###


```

## sbatch example header for compute partition and **long** QoS
 - **long** QoS is designed for jobs that do not finish in the batch QoS

```{: .bash}
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


```

## sbatch example header for **high_mem** partition and batch QoS
 - high_mem partition only for jobs requiring **more than 760GB RAM** per node
 - max available memory on the high_mem nodes is 3022GB, just shy of 3TB (3072GB binary unit), also the '--mem' value is required to be an integer (no decimals). 
 - high_mem partition time limit is 72 hours so use with **batch** QoS.

```{: .bash}
#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=high_mem # Set the partition 
#SBATCH --qos=batch          # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the number of nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=46   # Set the number of CPUs for task (change to number of CPU/threads utilized in run script/programs) [limited to 142 CPUs per node]
#SBATCH --mem=1024GB         # Here set to ~1TB (~22GB per core set above )[limited to 3022GB per node]
#SBATCH --time=24:00:00      # Set the max time limit (batch QoS 72 hr limit)

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###


```

## sbatch example header for compute partition and batch QoS with an array
 - array value can be found in the variable ${SLURM_ARRAY_TASK_ID}
 - limit the number of arrays running at once by adding the % to ```#SBATCH --array=1-10%1``` for 1 job to run at time    

```{: .bash}
#!/bin/bash

#SBATCH --job-name=MY_JOB    # Set job name
#SBATCH --partition=compute  # Set the partition 
#SBATCH --qos=batch          # Set the QoS
#SBATCH --nodes=1            # Do not change unless you know what your doing (it set the number of nodes (do not change for non-mpi jobs))
#SBATCH --ntasks=1           # Do not change unless you know what your doing (it sets the number of tasks (do not change for non-mpi jobs))
#SBATCH --cpus-per-task=4    # Set the number of CPUs per task (change to number of CPU/threads utilized in run script/programs) [limited to 70 CPUs per node] 
#SBATCH --mem=64GB           # Set to a value ~10-20% greater than max amount of memory the job will use (or ~10 GB per core) [limited to 700 GB per node on compute partition]
#SBATCH --time=72:00:00      # Set the max time limit (batch QoS 72 hr limit)
#SBATCH --array=1-10         # runs array 

###-----load modules if needed-------###
module load singularity

###-----run script below this line-------###


```

## View Cluster Setting and Job Limits. 

- The partitions ```scontrol show partition```

- The QoS settings ```sacctmgr show qos```




