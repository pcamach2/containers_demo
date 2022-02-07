# Singularity cheat sheet:

## Building from def file
singularity build image.sif image.def

## Building from Docker hub
singularity build pytorch-1.9.1-cuda11.1-cudnn8-runtime.sif docker://pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime

## One –B tag can be used to bind all desired directories :: use a comma to separate each
singularity run –B /path/to/Directory:/directory/in/container image.sif

## Running with gpu access
singularity run --nv image.sif nvidia-smi 

## Pull up a terminal in container for testing
singularity shell -B ./:/opt/scripts image.sif
