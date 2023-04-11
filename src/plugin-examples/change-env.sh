#!/bin/bash
#SBATCH -J test_job
#SBATCH -t 10:00:00
#SBATCH

# Run on head node with inherited environment
# ...

# Run on head node with a mounted environment
squashfs-mount compilers.sqfs /user-environments bash <<EOF
srun /user-environments/bin/gcc
EOF

# Run with the stack inherited environment
srun 

# Run with a different environment
srun 
