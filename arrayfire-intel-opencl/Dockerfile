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
ENV AF_PATH=/opt/arrayfire AF_DISABLE_GRAPHICS=1
ARG COMPILE_GRAPHICS=OFF
RUN git clone --recursive https://github.com/arrayfire/arrayfire.git -b master && \
    cd arrayfire && git fetch --tags && git checkout tags/v3.6.0 && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/arrayfire-3 \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_CPU=ON \
    -DBUILD_CUDA=OFF \
    -DBUILD_OPENCL=ON \
    -DBUILD_UNIFIED=ON \
    -DBUILD_GRAPHICS=${COMPILE_GRAPHICS} \
    -DBUILD_NONFREE=OFF \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_TEST=ON \
    -DBUILD_DOCS=OFF \
    -DINSTALL_FORGE_DEV=ON \
    -DUSE_FREEIMAGE_STATIC=OFF && \
    make -j8 && make install && \
    mkdir -p ${AF_PATH} && ln -s /opt/arrayfire-3/* ${AF_PATH}/ && \
    echo "${AF_PATH}/lib" >> /etc/ld.so.conf.d/arrayfire.conf && \
    ldconfig

# Remove the glfw and arrayfire folders since they are already installed
RUN rm -rf /root/glfw && \
    rm -rf /root/arrayfire

WORKDIR /root
