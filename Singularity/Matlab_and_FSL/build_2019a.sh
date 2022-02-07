#!/bin/bash
#
# This script is for building a MATLAB R2019a image
# Run this script from your building directory
# Before running, follow external steps of the Mathworks example https://github.com/mathworks-ref-arch/matlab-dockerfile
# 
# NOTE! Since MATLAB R2020b, Mathworks now hosts some basic Docker images at https://hub.docker.com/r/mathworks/matlab/tags
#   You can also check out deep-learning-specific builds at https://hub.docker.com/r/mathworks/matlab-deep-learning
#

git clone https://github.com/mathworks-ref-arch/matlab-dockerfile.git
mkdir ./matlab-dockerfile/matlab-install
# place install files and modified license in correct directories per guide in repo
cd ./matlab-dockerfile
docker build -f Dockerfile.R2019a -t matlab:r2019a -t localhost:5000/matlab:r2019a --build-arg MATLAB_RELEASE=R2019a .
cd ../
docker push localhost:5000/matlab:r2019b
sudo SINGULARITY_NOHTTPS=1 singularity build matlab-R2019a.sif docker://localhost:5000/matlab:r2019a
