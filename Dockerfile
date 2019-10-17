# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
#FROM registry.access.redhat.com/rhscl/python-35-rhel7
FROM bastion.bensonocp.lab:5000/rhscl/python-35-rhel7
MAINTAINER Benson
LABEL description="Hello World"

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
USER root
RUN mkdir /hellodjango
# RUN groupadd -r hehe && useradd -r -g hehe hehe
# USER hehe

# Set the working directory to /music_service
WORKDIR /hellodjango

EXPOSE 8000

# Copy the current directory contents into the container at /music_service
ADD . /hellodjango/

# Install any needed packages specified in requirements.txt
# RUN pip install -r requirements.txt --no-cache-dir
RUN python3 -m pip list
# RUN pip3 install django==1.10 && gunicorn==19.9.0
# RUN pip install pymysql 

# CMD ["/bin/bash", "-c", "python manage.py runserver 0.0.0.0:8000"]