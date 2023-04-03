\section{Introduction}

\section{Spack Stacks}

\section{Deployment}

\section{Results and performance}

SPACK STACKS

IMPLEMENTATION

DEPLOYMENT

- CI/CD
    - uses GitHub -> GitLab runners
    - Step 1: build and push to artifactory
    - Step 2: 

- describe the deployment on Hohgant

RESULTS

Impact of Squashfs images
    - memory overheads of squashfs
        - mount a large image with 64 ranks a node and run a search on its contents to measure the memory consumed
    - compilation times
        - run tests on three configurations
            1 PE in RAM
            2 PE in mounted squashfs image
            3 PE in SCRATCH
            4 CPE via DVS
        - run a small and a large test:
            1. Simple hello world C example
            2. configure and compile of Arbor.

Performance of the installed PE:
    - basic MPI performance = OSU
    - application performance
        - SPH-EXA
        - GROMACS

NEXT STEPS


