FROM centos:centos7

RUN yum -y update;
RUN yum -y clean all;

# Install basic tools
RUN yum install -y  wget dialog curl sudo lsof vim axel telnet nano openssh-server openssh-clients bzip2 passwd tar bc git unzip net-tools initscripts gcc

#Install Java
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 
ENV JAVA_HOME /etc/alternatives/java_sdk

RUN echo root | passwd root --stdin

#Create guest user. 
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin

ENV HOME /home/guest
WORKDIR $HOME

USER guest

#Install Python Anaconda
RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh \
	&& chmod a+x Anaconda3-5.0.1-Linux-x86_64.sh \
	&& bash Anaconda3-5.0.1-Linux-x86_64.sh -b

ENV PATH $HOME/anaconda3/bin:$PATH

#Install Spark
RUN wget http://apache.cu.be/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz \
      && tar -xvzf spark-2.2.1-bin-hadoop2.7.tgz \
      && mv spark-2.2.1-bin-hadoop2.7 spark \
      && rm spark-2.2.1-bin-hadoop2.7.tgz

ENV SPARK_HOME $HOME/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHON_PATH

ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

#Install Kafka
RUN wget http://apache.cu.be/kafka/1.0.0/kafka_2.12-1.0.0.tgz
RUN tar xvzf kafka_2.12-1.0.0.tgz
RUN mv kafka_2.12-1.0.0 kafka
#Install Kafka Python module
RUN pip install kafka-python

ENV PATH $HOME/kafka/bin:$PATH

RUN echo "alias notebook=\"jupyter notebook --ip='*' --NotebookApp.iopub_data_rate_limit=2147483647 --no-browser \" " >> /home/guest/.bashrc

USER root 

#Install Tensorflow and Keras
RUN pip install tensorflow==1.6
RUN pip install keras==2.1
RUN pip install plotly

#Startup (start Cassandra, Zookeeper, Kafka producer)
ADD startup_script.sh /usr/bin/startup_script.sh
RUN chmod +x /usr/bin/startup_script.sh



