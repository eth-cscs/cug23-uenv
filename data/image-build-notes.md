Working node: nid003193

```
── salloc -t 240 --partition=cpu
salloc: Nodes nid003193 are ready for job
── srun --pty -n1 bash
```

I removed cuda from the arbor-recipe environment.

```
# in $SCRATCH/software
stack-config -r /scratch/e1000/bcumming/software/arbor-recipe -b /dev/shm/bcumming/arbor -s hohgant
stack-config -r /scratch/e1000/bcumming/software/arbor-recipe -b $SCRATCH/arbor-env -s hohgant
```

Build on dev/shm with 64 cores
```
cd /dev/shm/bcumming
time env --ignore-environment PATH=/usr/bin:/bin:`pwd`/spack/bin make store.squashfs -j64
real	26m5.828s       no cache
real	2m24.949s       with cache
```


```
cd $SCRATCH/arbor-env
time env --ignore-environment PATH=/usr/bin:/bin:`pwd`/spack/bin make store.squashfs -j64
```

```
            full-scratch    full-ram    cache   partial
time(s)     2714            1566        145     487
time(m)     45:14           26:06       2:25    8:07
```

For the partial build I changed Python from 3.10 -> 3.9, which required building 39 packages,
with the following contributing the bulk of the time:

package     time(s)
--------------------
py-numpy    198
python       70
py-cython    64
py-mpi4py    53
ninja        25
