#!/bin/bash
#SBATCH --ntasks=8
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=16
#SBATCH --threads-per-core=1
#SBATCH --output=job.out
#SBATCH --error=job.err
#SBATCH --time=0:15:0
#SBATCH --partition=nvgpu
#SBATCH --uenv-file=forge2213.squashfs
#SBATCH --uenv-mount=/user-environment
#
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
# export ALLINEA_SET_SYSROOT="/"
module use /user-environment/modules
module load arm-forge cray-mpich cuda gcc
#
srun --cpus-per-task=16  \
--cpu-bind=verbose,none ./cuda_visible_devices.sh \
forge-client ./uenv.exe
