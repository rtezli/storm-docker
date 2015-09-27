#spark-docker

## Intro

[Apache Storm](https://spark.apache.org) is an open source cluster computing framework. In contrast to Hadoop's two-stage disk-based MapReduce paradigm, Spark's multi-stage in-memory primitives provides performance up to 100 times faster for certain applications. See also : [spark programming guide](https://spark.apache.org/docs/latest/programming-guide.html#deploying-to-a-cluster)

[Docker](https://www.docker.com) is an open-source project that automates the deployment of applications inside software containers, by providing an additional layer of abstraction and automation of operating-system-level virtualization on Linux, Mac OS and Windows.

## Image

Spark 1.5.0, Hadoop 2.6 image

Based on: vanilla rtezli/java

Virtual size: 620.3 MB

Apt packages: procps

Volumes : /data


## Usage

To run the image as nimbus (master) use i.e. :

`docker run --name storm-nimbus -it -h storm-nimbus rtezli/storm nimbus`

To run the image as worker use i.e. :

`docker run -it rtezli/spark worker spark://spark-master01:7077`

If you are running the master and worker on the same docker host, don't forget to link the spark master

`docker run -it --link spark-master:spark-master rtezli/storm worker spark://spark-master01:7077`

`docker run --name storm-zookeper -it -h storm-zookeper rtezli/storm dev-zookeper`
