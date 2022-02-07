# containers_demo
Demo for containerizing applications with Docker and Singularity

You will need Docker and Singularity installed on your machine.

Docker: https://docs.docker.com/get-docker/

Singularity: https://singularity-userdoc.readthedocs.io/en/latest/installation.html

## Docker to Singularity process

### start a local registry for Docker images

docker run -d -p 5000:5000 --restart=always --name registry registry:2

### if building from scratch, run build from the directory w/ your Dockerfile

cd ./location_of_Dockerfile
docker build -t image:tag -t localhost:5000/image:tag .

#### if you need to convert only – use docker tag image:tag localhost:5000/image:tag

docker push localhost:5000/image:tag
cd ../
sudo SINGULARITY_NOHTTPS=1 singularity build image.sif docker://localhost:5000/image:tag

