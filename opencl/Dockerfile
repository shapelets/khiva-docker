FROM intelopencl/intel-opencl:ubuntu-18.04-ppa AS build
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libfftw3-dev \
    libfreeimage-dev \
    liblapack-dev \
    liblapacke-dev \
    libopenblas-dev \
    ocl-icd-opencl-dev \
    python3-pip \    
    software-properties-common && \
    pip3 install setuptools && \
    pip3 install conan --upgrade && \
    conan remote add conan-mpusz https://api.bintray.com/conan/mpusz/conan-mpusz && \
    conan profile new --detect default && \
    conan profile update settings.compiler.libcxx=libstdc++11 default && \
    rm -rf /var/lib/apt/lists/*

ENV CXX g++-7
ENV CC gcc-7
WORKDIR /root
COPY *.patch ./

# AF_DISABLE_GRAPHICS - Environment variable to disable graphics at
# runtime due to lack of graphics support by docker - visit
# http://arrayfire.org/docs/configuring_environment.htm#af_disable_graphics
# for more information
# For build instructions: https://github.com/arrayfire/arrayfire/wiki/Build-Instructions-for-Linux
FROM build AS build-arrayfire
ENV AF_DISABLE_GRAPHICS=1
RUN git clone --recursive https://github.com/arrayfire/arrayfire.git && \
    cd arrayfire && \
    git checkout tags/v3.6.2 && \ 
	git apply /root/fix_queue.patch && \
    git apply /root/fix_sort.patch && \
    git apply /root/fix_sparse.patch && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/arrayfire \
             -DCMAKE_BUILD_TYPE=Release \
             -DAF_BUILD_CPU=ON \
             -DAF_BUILD_CUDA=OFF \
             -DAF_BUILD_OPENCL=ON \
             -DAF_BUILD_UNIFIED=ON \
             -DAF_WITH_GRAPHICS=OFF \
             -DAF_WITH_NONFREE=OFF \
             -DAF_BUILD_EXAMPLES=OFF \
             -DBUILD_TESTING=ON \
             -DAF_BUILD_DOCS=OFF \
             -DAF_WITH_LOGGING=OFF \
             -DAF_WITH_STATIC_FREEIMAGE=OFF && \
    cmake --build . --target install -- -j8 

FROM intelopencl/intel-opencl:ubuntu-18.04-ppa AS arrayfire-intel-opencl
COPY --from=build-arrayfire /opt/arrayfire /opt/arrayfire
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libopenblas-base \
    libfftw3-3 \
    liblapacke && \
    echo /opt/arrayfire/lib > /etc/ld.so.conf.d/arrayfire.conf && \
    ldconfig

# TODO: Add ctest step at the end when tests are stable in terms of accuracy.
FROM build AS build-khiva
WORKDIR /root
COPY --from=build-arrayfire /opt/arrayfire /opt/arrayfire
RUN echo /opt/arrayfire/lib > /etc/ld.so.conf.d/arrayfire.conf && \
    ldconfig && \
    add-apt-repository ppa:intel-opencl/intel-opencl && \
    apt-get update && \
    apt-get install -y intel-opencl-icd clinfo && \
    git clone --recurse-submodules https://github.com/shapelets/khiva.git && \
    cd khiva && \
    git checkout tags/v0.4.0 && \
	mkdir build && \
    cd build && \
    conan install .. --build missing && \
    cmake .. -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/khiva \
        -DKHIVA_BUILD_TESTS=ON \
        -DKHIVA_BUILD_BENCHMARKS=ON \
        -DKHIVA_BUILD_EXAMPLES=OFF \
        -DKHIVA_BUILD_DOCUMENTATION=OFF \
        -DKHIVA_USE_CONAN=ON \
        -DKHIVA_BUILD_JNI_BINDINGS=OFF && \
    cmake --build . --target install -- -j8

FROM arrayfire-intel-opencl as khiva-intel-opencl
COPY --from=build-khiva /opt/khiva /opt/khiva
RUN echo /opt/khiva/lib > /etc/ld.so.conf.d/khiva.conf && \
    ldconfig