FROM shapelets/intel-opencl
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
    xorg-dev \
    clang && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

ENV CXX clang++
ENV CC clang

# Build GLFW from source
RUN git clone https://github.com/glfw/glfw.git && \
    cd glfw && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. && \
    make -j4 && \
    make install

# AF_DISABLE_GRAPHICS - Environment variable to disable graphics at
# runtime due to lack of graphics support by docker - visit
# http://arrayfire.org/docs/configuring_environment.htm#af_disable_graphics
# for more information
ENV AF_DISABLE_GRAPHICS=1
ARG COMPILE_GRAPHICS=OFF
RUN git clone --recursive https://github.com/arrayfire/arrayfire.git -b master && \
    cd arrayfire && git fetch --tags && git checkout tags/v3.6.2 && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local \
             -DCMAKE_BUILD_TYPE=Release \
             -DAF_BUILD_CPU=ON \
             -DAF_BUILD_CUDA=OFF \
             -DAF_BUILD_OPENCL=ON \
             -DAF_BUILD_UNIFIED=ON \
             -DAF_BUILD_GRAPHICS=${COMPILE_GRAPHICS} \
             -DAF_BUILD_NONFREE=OFF \
             -DAF_BUILD_EXAMPLES=OFF \
             -DAF_BUILD_TEST=OFF \
             -DAF_BUILD_DOCS=OFF \
             -DAF_USE_FREEIMAGE_STATIC=OFF && \
    make -j8 && make install && \
    ldconfig

# Remove the glfw and arrayfire folders since they are already installed
RUN rm -rf /root/glfw && \
    rm -rf /root/arrayfire

WORKDIR /root
