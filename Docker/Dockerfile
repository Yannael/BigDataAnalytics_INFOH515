#Container for Kafka - Spark streaming - Cassandra
#IMPORTANT: If you wish to share folder between your host and this container, make sure the UID for user guest is the same as your UID
#Check https://github.com/Yannael/brufence/blob/master/docker/streaming/README.md for details
FROM centos:centos7

RUN yum -y update;
RUN yum -y clean all;

# Install basic tools
RUN yum install -y  wget dialog curl sudo lsof vim axel telnet nano openssh-server openssh-clients bzip2 passwd tar bc git unzip

#Install Java
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 

#Create guest user. IMPORTANT: Change here UID 1000 to your host UID if you plan to share folders.
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin

ENV HOME /home/guest
WORKDIR $HOME

USER guest

#Install Anaconda Python distribution
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
RUN chmod a+x Anaconda3-2019.07-Linux-x86_64.sh \
	&& bash Anaconda3-2019.07-Linux-x86_64.sh -b

ENV PATH $HOME/anaconda3/bin:$PATH

#Install Spark (Spark 2.4.5 - 16/03/2020, prebuilt for Hadoop 2.7 or higher)
RUN wget https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
RUN tar xvzf spark-2.4.5-bin-hadoop2.7.tgz \
	&& mv spark-2.4.5-bin-hadoop2.7 spark \
	&& rm spark-2.4.5-bin-hadoop2.7.tgz

#Install Kafka
RUN wget https://downloads.apache.org/kafka/2.3.0/kafka_2.12-2.3.0.tgz 
RUN tar xvzf kafka_2.12-2.3.0.tgz \
	&& mv kafka_2.12-2.3.0 kafka \
	&& rm kafka_2.12-2.3.0.tgz

# Setting up required environment variables
ENV SPARK_HOME $HOME/spark
ENV KAFKA_HOME $HOME/kafka
ENV PATH $HOME/spark/bin:$HOME/spark/sbin:$HOME/kafka/bin:$PATH
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/pyspark.zip:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH

#Install Kafka Python module
RUN pip install --upgrade pip
RUN pip install kafka-python

RUN echo "alias notebook=\"jupyter notebook --ip='*' --NotebookApp.iopub_data_rate_limit=2147483647 --no-browser \" " >> /home/guest/.bashrc

#Install geopandas
USER root
RUN yum install -y gcc
RUN pip install geopandas
RUN conda install rtree

#Environment variables for Spark and Java
#ADD setenv.sh /home/guest/setenv.sh
#RUN chown guest:guest setenv.sh
#RUN echo . ./setenv.sh >> .bashrc

#Startup (start Zookeeper, Kafka servers)
ADD kafka_startup_script.sh /usr/bin/kafka_startup_script.sh
RUN chmod a+x /usr/bin/kafka_startup_script.sh



