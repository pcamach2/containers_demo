Follow Mathworks reference example for building MATLAB Docker images: https://github.com/mathworks-ref-arch/matlab-dockerfile

Using this base Dockerfile, we add packages via apt-get and install FSL using the fslinstaller.py script.

We can now push the Docker image to our local repository and use it to build a Singularity image.

```
# start a local registry for Docker images
docker run -d -p 5000:5000 --restart=always --name registry registry:2
# if building from scratch, run build from the directory w/ your Dockerfile
cd ./location_of_Dockerfile
docker build -t matlabfsl:r2021bv6.0.4 -t localhost:5000/matlabfsl:r2021bv6.0.4 .
# if you need to convert only – use docker tag image:tag localhost:5000/image:tag
docker push localhost:5000/matlabfsl:r2021bv6.0.4 .
cd ../
sudo SINGULARITY_NOHTTPS=1 singularity build matlabfsl-r2021bv6.0.4.sif docker://localhost:5000/matlabfsl:r2021bv6.0.4
```

!Both of these software suites require a license!

You will need to download the FSL license from https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation and obtain a MATLAB license.dat from your Mathworks account or relevant administrator.

Make sure to bind the FSL license.txt to /opt/fsl/license.txt:

Singularity command:
```
singularity run -B /path/to/license.txt:/opt/fsl/license.txt,/path/to/data:/datain matlabfsl-r2021bv6.0.4.sif
```
