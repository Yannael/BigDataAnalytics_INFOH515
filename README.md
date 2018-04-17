# [INFO-H515 - Big Data Scalable Analytics](http://uv.ulb.ac.be/course/view.php?id=74317?username=guest)

#### *Yann-Aël Le Borgne, Jacopo De Stefani and Gianluca Bontempi* - [Machine Learning Group](http://mlg.ulb.ac.be) 

# Exercise classes - Overview 

This repository contains the material for the execise classes of the ULB/VUB Big Data Analytics master course (first semester 2018) - Advanced analytics part.

These hands-on sessions provide:

* **Session 1** : An introduction to Spark and its Machine Learning (ML) library. The case study for the first session is a churn prediction problem: How to predict which customers will quit a subscription to a given service? The session covers the basics for loading and formatting a dataset for training an ML algorithm using Spark ML library, and illustrates the use of different Spark ML algorithms and accuracy metrics to address the prediction problem. 
* **Sessions 2-4**: An in-depth coverage of the use of the Map/Reduce programming model for distributing machine learning algorithms, and their implementation in Spark. Sessions 2, 3, and 4 cover, respectively, the Map/Reduce implementations from scratch of
	* **Session 2**: Linear regression (ordinary least squares and stochastic gradient descent). The algorithms are first applied on an artificial dataset, and then on a regression problem for predicting the price of a house as a function of its characteristics (size, location, comfort, ...). 
	* **Session 3**: Clustering with K-means. The algorithm is first applied on an artificial dataset, and then on a clustering problem for image compression.
	* **Session 4**: Recommender system with alternating least squares, using as a case study a movie recommendation problem. 
	
	After detailing the Map/Reduce techniques for solving these problems, each session ends with an example on how to use the corresponding algorithm with Spark ML, and get insights into how Spark distributes the task using the Spark user interface.  
* **Session 5**: An overview of a deep learning framework (Keras/Tensorflow), and its use for image classification using convolutional neural networks.

Additionally to these sessions, the `Supplementary_material` repository also contains examples for

* `project/KafkaSparkStreaming*`: Example of streaming architecture that uses Kafka (for publishing streaming content) and Spark Streaming (for ingesting and processing streaming content) 
* `mrmr`: An Map/Reduce implementation of the mRMR (Minimum Redundancy Maximum Relevance) feature selection algorithm.

The material is available as a set of Jupyter notebooks. 

# Environment setup 

These notebooks rely on different technologies and frameworks for Big Data and machine learning (Spark, Kafka, Keras and Tensorflow).

## Local setup (Linux)

### Python

Install Anaconda Python (see https://www.anaconda.com/download/, choose Linux distribution, and Python 3.6 version for 64-bit x86 systems). 

### Spark

Download from https://spark.apache.org/downloads.html (Use latest version, currently 2.3.0, prebuilt for Apache Hadoop 2.7). Untar and add executables to your PATH

```
export SPARK_HOME=where_you_untarred_spark
export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
``` 

### Kafka

Download from https://kafka.apache.org/downloads, and untar archive. Start with 

```
export KAFKA_HOME=where_you_untarred_kafka
nohup $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties  > $HOME/zookeeper.log 2>&1 &
nohup $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > $HOME/kafka.log 2>&1 &
```

### Keras and tensorflow

Install with `pip`

```
pip install tensorflow
pip install keras
```

## Big Data cluster

Connect with 

```
ssh -p 30 -L 18089:bd05:18089 -L 8081:localhost:8080 -L 8000:localhost:8000 -L 8888:hue:8888 -L 4042:bd06:4042 yleborgn@bigdata.ulb.ac.be 
```

If you get the following message 

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
```

Open `.ssh/known_hosts`, delete all entries starting with `bigdata.ulb.ac.be`, and retry connection. 


```
export PATH=/etc/anaconda3/bin:$PATH
export HADOOP_CONF_DIR=/etc/hadoop/conf
```

## Docker

In order to ease the setting-up of the environment, we also prepared a [Docker](https://www.docker.com/) container that provides a ready-to-use environment. See `docker` folder for installing Docker, downloading the course container, and get started with it.

## Computer rooms

Download from https://spark.apache.org/downloads.html (Use latest version, currently 2.3.0, prebuilt for Apache Hadoop 2.7). 

Untar and add executables to your PATH

```
export SPARK_HOME=where_you_untarred_spark
export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
``` 
 
Due to permission restrictions, you should manually add the execution flags to the executables you need to use, in particular

```

```

You may then start `pyspark` from the command line, and open the Spark UI at `127.0.0.1:4040`.

Start Jupyter notebook with 

```
jupyter notebook
```

and open in the browser at `127.0.0.1:8888`


