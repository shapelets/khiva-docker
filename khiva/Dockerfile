FROM shapelets/khiva-ocl-build
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

# Cloning Khiva
RUN git clone https://github.com/shapelets/khiva.git && \
    cd khiva && git fetch --tags && git checkout tags/v0.1.0 && mkdir build && cd build && \
    conan remote add conan-mpusz https://api.bintray.com/conan/mpusz/conan-mpusz && \
    cmake .. \
    -DCMAKE_BUILD_TYPE=Release && \
    make -j8 && make install && \
    ldconfig

RUN rm -rf /root/khiva