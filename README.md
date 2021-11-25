# [INFO-H515 - Big Data Scalable Analytics](https://uv.ulb.ac.be/course/view.php?id=85246)

#### *Jacopo De Stefani, Giovanni Buroni, Théo Verhelst and Gianluca Bontempi* - [Machine Learning Group](http://mlg.ulb.ac.be) 

# Exercise classes - Overview 

This repository contains the material for the exercise classes of the ULB/VUB Big Data Analytics master course (first semester 2020) - Advanced analytics part.

These hands-on sessions provide:

* **Session 1** : An introduction to Spark and its Machine Learning (ML) library. The case study for the first session is a churn prediction problem: How to predict which customers will quit a subscription to a given service? The session covers the basics for loading and formatting a dataset for training an ML algorithm using Spark ML library, and illustrates the use of different Spark ML algorithms and accuracy metrics to address the prediction problem. 
* **Sessions 2 and 4**: An in-depth coverage of the use of the Map/Reduce programming model for distributing machine learning algorithms, and their implementation in Spark. Sessions 2, 3, and 4 cover, respectively, the Map/Reduce implementations from scratch of
	* **Session 2**: Linear regression (ordinary least squares and stochastic gradient descent). The algorithms are applied on an artificial dataset, and illustrate the numpy and Map/Reduce implementations for OLS and SGD. 
	* **Session 3**: Streaming analytics with Recursive Least Squares and model racing. The algorithms are implemented using Spark Streaming, on a data stream coming from a Kafka broker. The RLS approach is then compared with established ML approaches.
	* **Session 4**: Recommender system with alternating least squares, using as a case study a movie recommendation problem. 
	
	After detailing the Map/Reduce techniques for solving these problems, each session ends with an example on how to use the corresponding algorithm with Spark ML, and get insights into how Spark distributes the task using the Spark user interface.  
* **Session 5**: An overview of a deep learning framework (Keras/Tensorflow), and its use for image classification using convolutional neural networks.


The material is available as a set of Jupyter notebooks. 

# Clone this repository

From the command line, use

```
git clone https://github.com/Yannael/BigDataAnalytics_INFOH515
```

If using the course cluster, you will have to use SFTP to send this folder to the cluster. 

# Environment setup 

These notebooks rely on different technologies and frameworks for Big Data and machine learning (Spark, Kafka, Keras and Tensorflow). We summarize below different ways to have your environment set up. 

## Local setup (Linux)

### Python

Install Anaconda Python (see https://www.anaconda.com/download/, choose Linux distribution, and Python 3.6 version for 64-bit x86 systems). 

Make sure the binaries are in your PATH. Anaconda installer proposes to add them at the end of the installation process. If you decline, you may later add

```
export ANACONDA_HOME=where_you_installed_anaconda
export PATH=$ANACONDA_HOME/bin:$PATH
``` 


### Spark

Download from https://spark.apache.org/downloads.html (Use version 2.2.1, prebuilt for Apache Hadoop 2.7). Untar and add executables to your PATH, as well as Python libraries to PYTHONPATH

```
export SPARK_HOME=where_you_untarred_spark
export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
export PYTHONPATH="$SPARK_HOME/python/lib/pyspark.zip:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip"
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

### Notebook

The notebook is part of Anaconda. Start Jupyter notebook with 

```
jupyter notebook
```

and open in the browser at `127.0.0.1:8888`


## Docker

In order to ease the setting-up of the environment, we also prepared a [Docker](https://www.docker.com/) container that provides a ready-to-use environment. See `docker` folder for installing Docker, downloading the course container, and get started with it.

Note that the [Dockerfile](https://github.com/jdestefani/BigDataAnalytics_INFOH515/blob/master/Docker/Dockerfile) script essentially follows the steps for the 'local' installation. 

## Check if your setup is working

After setting up your environment (either in a Docker or your own machine) you should be able to run the notebook and scripts in `Check_Setup`

### Spark - Test with Check_Setup notebook

* Open notebook from  `Check_Setup/Demo_RDD_local.ipynb` 
* Run all cells

Follow instructions in `Check_Setup/Demo_RDD_local.ipynb` to have access to Spark UI.

### Kafka - Test with Check_Setup scripts

1. Run the script `Check_Setup/0_kafka_startup.sh` to start Zookeeper and Kafka.  
2. Run the script `Check_Setup/1_kafka_test_topic.sh` to check whether a topic can be created and deleted successfully.
3. **In two separate terminals:**
	1. Start first `Check_Setup/2_kafka_test_sender.sh`, and try sending some messages, by entering some text and concluding the message with the Enter key.
	2. Start first `Check_Setup/3_kafka_test_receiver.sh`, and check that the messages sent by the sender are correctly received.

## FAQ

