FROM shapelets/khiva
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y r-base libssl-dev libssh2-1-dev libcurl4-openssl-dev

ADD install.R install.R

# Cloning Khiva Java
RUN Rscript install.R && \
    rm install.R

# Clean up APT when done
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*