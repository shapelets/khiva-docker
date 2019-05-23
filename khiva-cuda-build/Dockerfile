FROM shapelets/arrayfire-cuda
LABEL maintainer="oscar.torreno@shapelets.io"

# Update the apt-get cache
RUN apt-get update

# Installing conan
RUN apt-get install -y python3-pip && \
    pip3 install conan

# Installing documentation dependencies
RUN apt-get install -y doxygen graphviz && \
    pip3 install sphinx breathe sphinx-rtd-theme

# Installing Java
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Purge cache
RUN apt-get clean && \
    apt-get purge

WORKDIR /root
