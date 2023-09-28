uenv start --view default gromacs.squashfs
gmx
uenv stop

uenv start gromacs.squashfs
module use /user-environment/modules
module load gromacs
gmx
uenv stop
