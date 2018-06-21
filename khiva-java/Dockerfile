FROM shapelets/khiva
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y maven

# Cloning Khiva Java
RUN git clone https://github.com/shapelets/khiva-java.git && \
    cd khiva-java && git fetch --tags && git checkout tags/khiva-0.1.0 && \
    mvn install

# Clean up APT when done
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -rf /root/khiva-java