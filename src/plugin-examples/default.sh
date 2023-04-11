$ squashfs-mount compilers.sqfs /user-environments bash
# User is running bash in a new namespace
$ srun /user-environments/bin/gcc
$ exit
# User is back in original namespace
