uenv start gromacs.squashfs
# access the modules provided by the uenv
uenv modules use
module load gromacs
gmx

# alternatively use an environment view
uenv view default
gmx
uenv stop
