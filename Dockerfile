# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
# FROM python:3.5
FROM registry.access.redhat.com/rhscl/python-35-rhel7
MAINTAINER Benson
LABEL description="Hello World"

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
# USER root
RUN mkdir /hellodjango
RUN groupadd -r hehe && useradd -r -g hehe hehe
USER hehe

# RUN yum install -y wget
# RUN wget https://bootstrap.pypa.io/get-pip.py
# RUN python get-pip.py --prefix=/usr/local/

# Python Package reference https://packaging.python.org/tutorials/installing-packages/#ensure-you-can-run-pip-from-the-command-line
# Installation to reference "https://github.com/openshift/source-to-image" & "https://github.com/sclorg/s2i-python-container" 
# RUN git clone https://github.com/sclorg/s2i-python-container.git
# RUN cd s2i-python-container
# make build TARGET=rhel7 VERSIONS=3.5

# Set the working directory to /music_service
WORKDIR /hellodjango

EXPOSE 8000

# Copy the current directory contents into the container at /music_service
ADD . /hellodjango/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
# RUN pip install -r requirements.txt --no-cache-dir
# RUN python3 --version
# RUN whereis python3
# RUN which python3
# RUN python -m ensurepip --default-pip
# RUN python -m pip list
# RUN pip3 install django==1.10 && gunicorn==19.9.0
# RUN pip install pymysql 

CMD ["/bin/bash", "-c", "python manage.py runserver 0.0.0.0:8000"]