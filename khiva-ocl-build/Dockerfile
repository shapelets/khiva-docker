FROM shapelets/arrayfire-intel-opencl
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
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Purge cache
RUN apt-get clean && \
    apt-get purge

WORKDIR /root