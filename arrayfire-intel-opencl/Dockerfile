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
    xorg-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

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
    cd arrayfire && git fetch --tags && git checkout tags/v3.5.1 && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_CPU=ON \
             -DBUILD_CUDA=OFF \
             -DBUILD_OPENCL=ON \
             -DBUILD_UNIFIED=ON \
             -DBUILD_GRAPHICS=${COMPILE_GRAPHICS} \
             -DBUILD_NONFREE=OFF \
             -DBUILD_EXAMPLES=OFF \
             -DBUILD_TEST=OFF \
             -DBUILD_DOCS=OFF \
             -DUSE_FREEIMAGE_STATIC=OFF && \
    make -j8 && make install && \
    ldconfig

# Remove the glfw and arrayfire folders since they are already installed
RUN rm -rf /root/glfw && \
    rm -rf /root/arrayfire

WORKDIR /root
