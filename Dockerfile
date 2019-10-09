# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM registry.access.redhat.com/rhscl/python-35-rhel7
MAINTAINER Benson
LABEL description="Hello World"

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /hellodjango
RUN groupadd -r hehe && useradd -r -g hehe hehe
USER hehe

# Set the working directory to /music_service
WORKDIR /hellodjango

EXPOSE 8000

# Copy the current directory contents into the container at /music_service
ADD . /hellodjango/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

CMD ["/bin/bash", "-c", "python manage.py runserver 0.0.0.0:8000"]