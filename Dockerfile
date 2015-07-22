# Use ubuntu trusty tar (14.04 LTS) as base image
FROM ubuntu:trusty

MAINTAINER Daniel Grabert <docker@synec.de>

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Define nvm version
ENV NVM_VERSION=v0.25.4
# Define nvm base dir
ENV NVM_DIR=/root/.nvm

# Update apt database
RUN apt-get update
# Perform dist-upgrade
RUN apt-get -y dist-upgrade
# Install deps for building nvm
RUN apt-get install -y wget build-essential python

# Fetch and install nodejs via nvm
RUN  wget -qO- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash \
        && source $NVM_DIR/nvm.sh

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
