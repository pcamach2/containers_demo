#!/bin/bash
#
# This script is for building a MATLAB R2021b image on a host with the NVIDIA container runtime
# Run this script from your building directory. If you need sudo to build, do not run this script.
# Before running, follow external steps of the Mathworks example https://github.com/mathworks-ref-arch/matlab-dockerfile
#
# 1) git clone https://github.com/mathworks-ref-arch/matlab-dockerfile.git
# 2) cd ./matlab-dockerfile && nano Dockerfile #here we want to change the Dockerfile MPM section to include desired toolboxes and the license section to verification using a license.dat (uncomment the COPY network.lic /opt/matlab/licenses/)
# 3) you will need a license.dat file that is valid for your lab/group/etc.
#
# NOTE! Since MATLAB R2020b, Mathworks now hosts some basic Docker images at https://hub.docker.com/r/mathworks/matlab/tags
#   You can also check out deep-learning-specific builds at https://hub.docker.com/r/mathworks/matlab-deep-learning
#

git clone https://github.com/mathworks-ref-arch/matlab-dockerfile.git
mkdir ./matlab-dockerfile/matlab-install
# place install files and modified license in correct directories per guide in repo
cd ./matlab-dockerfile
docker build -t matlab:r2021b -t localhost:5000/matlab:r2021b .
cd ../
docker push localhost:5000/matlab:r2021b
