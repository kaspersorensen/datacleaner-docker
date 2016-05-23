# datacleaner-docker
A docker image for running DataCleaner jobs

## Build instructions

```
docker build -t datacleaner .
```

## Run instructions

After build, to show DataCleaner version, run:

```
docker run -it --rm datacleaner /opt/DataCleaner/datacleaner.sh -version
```

If you want to run a job using this image, be sure to copy in the required files (usually job and conf.xml) to the image.

```
docker cp conf.xml datacleaner:/opt/DataCleaner/myconf.xml
docker cp myjob.analysis.xml datacleaner:/opt/DataCleaner/myjob.analysis.xml
```

And then fire off the execution:

```
docker run -it --rm datacleaner /opt/DataCleaner/datacleaner.sh -conf myconf.xml -job myjob.analysis.xml
```