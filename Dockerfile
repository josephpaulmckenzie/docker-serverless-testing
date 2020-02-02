FROM ubuntu:18.04
LABEL maintainer="Joseph Mckenzie <me@josephpmckenzie.com>"

ADD scripts root/scripts

# Install utilities
RUN apt-get update && apt-get -y install locales && \
    locale-gen en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    sed --in-place 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
    apt-utils\
    apt-transport-https \
    build-essential \
    curl \
    git \
    software-properties-common \
    wget\
    nano\
    sudo -y

RUN root/scripts/set_time_zone.sh

# Install Node.js v12.x
RUN apt-get install -y\
    g++ \
    make && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -  && \
    apt-get install -y \
    nodejs && \
    npm config set prefix '/usr/local'

# Install AWS cli
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    apt install awscli  -y

# Install Serverless Framework
RUN npm install -g try-thread-sleep\
    npm install -g serverless --ignore-scripts spawn-sync

# Set environment variables
ENV HOME /root

# Define working directory
WORKDIR /root

ADD /tests /tests
VOLUME /tests

# Define default command
# CMD ["bash"]
# # Command to run
# ENTRYPOINT ["scripts/set_time_zone.sh"]
# CMD [""]


# Expose web server port
EXPOSE 8080