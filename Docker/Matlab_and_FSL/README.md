Follow Mathworks reference example for building MATLAB Docker images: https://github.com/mathworks-ref-arch/matlab-dockerfile

Using this base Dockerfile, we add packages via apt-get and install FSL using the fslinstaller.py script.

!Both of these software suites require a license!

You will need to download the FSL license from https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation and obtain a MATLAB license.dat from your Mathworks account or relevant administrator.

Make sure to bind the FSL license.txt to /opt/fsl/license.txt:

Docker command:
```
docker run --rm -it -v /path/to/license.txt:/opt/fsl/license.txt -v /path/to/data:/datain matlabfsl:r2021bv6.0.4
```

Note that installing via the fslinstaller.py script can stick at 0% for Stage 2 for a long time (hours on some machines). This is not a fatal error, so just let it be.
