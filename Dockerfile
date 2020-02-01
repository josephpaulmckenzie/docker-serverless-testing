FROM ubuntu:18.04
LABEL maintainer="Joseph Mckenzie <me@josephpmckenzie.com>"

# Install utilities
RUN apt-get update && apt-get -y install locales && \
    locale-gen en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    sed --in-place 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
    apt-transport-https \
    build-essential \
    curl \
    git \
    software-properties-common \
    wget\
    nano

# Install Node.js v12.x
RUN apt-get install -y\
    g++ \
    make && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -  && \
    apt-get install -y \
    nodejs && \
    npm config set prefix '/usr/local'

# Install Serverless Framework
RUN npm install -g serverless -y 

# Add scripts
ADD scripts root/scripts

# Set environment variables
ENV HOME /root

# Define working directory
WORKDIR /root

# Define default command
# CMD ["bash"]
# Command to run
# ENTRYPOINT ["scripts/run.sh"]

# CMD [""]

# Expose CouchDb listen port
# EXPOSE 5984
# 
# Expose web server port
EXPOSE 8112

# Expose our data, logs and configuration volumes
# VOLUME ["/data", "/usr/local/var/log/couchdb", "/usr/local/etc/couchdb"]
# VOLUME ["/torrents", "/usr/local/var/log/deluge", "/usr/local/etc/deluge"]
