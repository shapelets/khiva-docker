FROM shapelets/khiva-ocl-build
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

ENV KHIVA_PATH=/opt/khiva

# Cloning Khiva
RUN git clone https://github.com/shapelets/khiva.git && \
    cd khiva && git fetch --tags && git checkout tags/v0.1.0 && mkdir build && cd build && \
    conan remote add conan-mpusz https://api.bintray.com/conan/mpusz/conan-mpusz && \
    cmake .. -DCMAKE_INSTALL_PREFIX=${KHIVA_PATH} \
    -DCMAKE_BUILD_TYPE=Release && \
    make -j8 && make install && \
    echo "${KHIVA_PATH}/lib" >> /etc/ld.so.conf.d/khiva.conf && \
    ldconfig

RUN rm -rf /root/khiva

WORKDIR ${KHIVA_PATH}