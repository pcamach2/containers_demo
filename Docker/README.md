# Docker cheatsheet

## Building from Dockerfile (from file location, for pushing to organization Docker hub)
docker build –t organization/image:tag .

## Building from Dockerfile (from file location, for local only)
docker build –t image:tag .

## Building from Docker hub
docker pull pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime

## Mounting volumes from host to image
docker run -v /path/to/Directory:/directory/in/container -v /path/to/Directory2:/directory2/in/container organization/image:tag

## Tagging an image
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

## Pushing to a repo
docker push organization/image:tag

## Running with gpu access (nvidia-smi command at end should display gpu info)
docker run --gpus all -it --rm image:tag nvidia-smi 

## Pull up a terminal in container for testing
docker run -it -v /path/to/scripts:/opt/scripts --entrypoint /bin/bash image:tag
