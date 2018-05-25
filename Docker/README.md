## 1. Docker installation

Docker is a software container platform, which allows to isolate OS environments. Its main benefits over virtual machines are a reduced footprint (starting from 60MB for a Linux distribution - for example [ubuntu](https://hub.docker.com/_/ubuntu/)), and an easy way reconfigure an OS environment. Note: The Docker container for this course is 5GB, mostly due to the Anaconda (>1GB) and Spark (>1GB) distributions. A VirtualBox VM with the same configuration would take around 9GB.

For more information on Docker, see: 

* https://www.docker.com/what-docker
* https://en.wikipedia.org/wiki/Docker_(software)

**To download and install, see**: (NB: install the Community Edition)

* https://docs.docker.com/engine/installation

**Get started Docker tutorial:**

* https://docs.docker.com/get-started

We **strongly** encourage you to follow the tutorial, and learn how to build, run, pull and push a container. 

## 2. Container for the course

The docker image for this course is based on CentOS 7, and contains:

* Anaconda 5.0.1
* Spark 2.2.1
* kafka 1.0.0 
* Cassandra 3.11
* Tensorflow 1.4
* Keras 2.0.8

The Dockerfile (which contains all the instructions to install the software/frameworks and set up the image) is at https://gitlab.com/yannael/bda_course/blob/master/Docker/Dockerfile.

In order to avoid building the image from scratch, a prebuilt image is made available from DockerHub, see below.

## 3. Get started

### 3.1. Pull image

#### Pull image

The image is called ```bda_advancedanalytics ``` and is available from DockerHub (Note: image is 4GB, make sure you have a reasonably good Internet conection).

To install the image, use the standard ```docker pull``` command 

```
docker pull yannael/bda_advancedanalytics
```

Create a folder INFO-H515 and cd into it.

```
mkdir INFO-H515 
cd INFO-H515 
```

Git clone the repository for the course

```
git clone https://github.com/Yannael/BigDataAnalytics_INFOH515
```

Cd to the `BigDataAnalytics_INFOH515` folder

```
cd BigDataAnalytics_INFOH515
```

Finally, give recursive permission to all for writing to it (ease the sharing with Docker container)

```
chmod -R a+rwx .
```

The Docker container should now be able to read/write to your host ```bda_course``` folder.

### 3.2. Start container


**From the ```BigDataAnalytics_INFOH515 ``` folder**, start the container with

```
docker run -v `pwd`:/home/guest/shared -p 8888:8888 -p 4040:4040 -it yannael/bda_advancedanalytics bash
```

Notes

* -v is used to share folder (right permissions given above will allow your changes to be saved on your computer)
* -it starts the Docker container in interactive mode, so you can use the console and Bash
* -p is for sharing ports between the container and the host. 8888 is the notebook port, and 4040 the Spark UI port
* --privileged is for Cassandra, that requires priviledged access to the host.

You are logged in as root. Change user to guest

```
su guest
cd 
```

The course content, from the ```bda_course``` folder on the host, is in ```/home/guest/shared```.

Cd to this folder:

```
cd shared
```

**Shortcut**: The script ```start_container.sh``` can alternatively be used to start the container. 

### 3.3. Start notebook


An alias for starting the notebook was created with the Dockerfile, in/home/guest/.bashrc

To start the notebook, just type 

```
notebook
```

Open your browser at 127.0.0.1:8888 and enter the token provided in the console.

## Troubleshooting

#### Issue: 127.0.0.1 refused to connect

On some versions of Mac OSX and Windows, the [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) is used instead of the native Docker Engine on the system.

In this case, instead of connecting to the IP address of the localhost (i.e. 127.0.0.1), one should connect to the IP address of the virtual machine where the Docker Engine is running (192.168.99.100, by default).

For example, to connect to the Jupyter Notebook, you should open your browser at 192.168.99.100:8888

#### Issue: Shared folder empty

The [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) on Windows 10 Home shares by default only the primary hard drive (i.e. the one where Windows is installed -> C:).

In case your machine has more than one hard disk two solutions exists:
- Either the bda_course folder has to be located on the main hard drive (C:) 
- Or, a manual mountpoint to the second hard drive must be created in the configuration of VirtualBox (the provisioner running the virtual machine containing Docker Engine) as described [here](https://stackoverflow.com/questions/48828406/unable-to-share-volume-with-docker-toolbox-on-windows-10).
