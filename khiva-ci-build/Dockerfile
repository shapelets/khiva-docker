FROM ubuntu:trusty
LABEL maintainer="oscar.torreno@shapelets.io"

RUN apt-get update && apt-get install -y software-properties-common && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libfftw3-dev \
    libfontconfig1-dev \
    libfreeimage-dev \
    liblapack-dev \
    liblapacke-dev \
    libopenblas-dev \
    xorg-dev

WORKDIR /root

# AF_DISABLE_GRAPHICS - Environment variable to disable graphics at
# runtime due to lack of graphics support by docker - visit
# http://arrayfire.org/docs/configuring_environment.htm#af_disable_graphics
# for more information
ENV AF_DISABLE_GRAPHICS=1
RUN git clone --recursive https://github.com/arrayfire/arrayfire.git -b master && \
    cd arrayfire && git fetch --tags && git checkout tags/v3.5.1 && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_CPU=ON \
             -DBUILD_CUDA=OFF \
             -DBUILD_OPENCL=OFF \
             -DBUILD_UNIFIED=OFF \
             -DBUILD_GRAPHICS=OFF \
             -DBUILD_NONFREE=OFF \
             -DBUILD_EXAMPLES=OFF \
             -DBUILD_TEST=OFF \
             -DBUILD_DOCS=OFF \
             -DUSE_FREEIMAGE_STATIC=OFF && \
    make -j8 && make install && \
    ldconfig

# Remove the arrayfire folder since it is already installed
RUN rm -rf /root/arrayfire

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
    rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install CMake 3.11.3
RUN apt-get remove -y cmake && \
    wget https://cmake.org/files/v3.11/cmake-3.11.3-Linux-x86_64.sh && \
    bash cmake-3.11.3-Linux-x86_64.sh --prefix=/usr --skip-license && \
    rm cmake-3.11.3-Linux-x86_64.sh

# Purge cache
RUN apt-get clean && \
    apt-get purge

WORKDIR /root
