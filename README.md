# datacleaner-docker

A docker image for running DataCleaner jobs to do Data Quality analysis, Data Wrangling or straight ETL processing.

Go to http://datacleaner.org to get DataCleaner. This image is using the community edition of DataCleaner, but it should be very easy to adapt it to use any of the commercial editions too.

## Run instructions

To show DataCleaner version, run:

```
docker run --rm kaspersor/datacleaner
```

If you want to run a job using this image, the easiest way is to mount a volume containing the required files (usually job and conf.xml) to the image.

Often times this directory will be your local DataCleaner home folder, so you can mount it to `/dc_data` in a docker run command like this: `-v ~/.datacleaner/5.0.3:/dc_data`

So to verify - try and list your datastores:

```
docker run --rm -v ~/.datacleaner/5.0.3:/dc_data kaspersor/datacleaner ./datacleaner.sh -conf /dc_data/conf.xml -list DATASTORES
```

And now, run a job "myjob.analysis.xml":

```
docker run --rm -v ~/.datacleaner/5.0.3:/dc_data kaspersor/datacleaner ./datacleaner.sh -conf /dc_data/conf.xml -job /dc_data/jobs/myjob.analysis.xml
```

(Note that it seems there is an issue in DataCleaner around running jobs with spaces in their paths, so be sure to name the path to the job and conf.xml to a path without spaces).
