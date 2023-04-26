$ squashfs-mount debuggers.sqfs /user-environment bash
$ sbatch test.job
$ cat test.job
#!/bin/bash
#SBATCH -J test_job
#SBATCH -t 10:00:00

squashfs-mount compilers.sqfs /user-environment bash <<EOF
srun /user-environments/bin/gcc test.c
EOF

/user-environment/bin/gdb -ex run a.out 

srun --uenv-file=compilers.sqfs /user-environments/bin/gcc test.c

srun /user-environment/bin/gdb -ex run a.out 

