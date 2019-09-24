FROM shapelets/khiva-ocl-build
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

# Cloning Khiva
RUN pip3 install conan --upgrade && \
    git clone https://github.com/shapelets/khiva.git && \
    cd khiva && git fetch --tags && git checkout tags/v0.4.0 && \
	git submodule update --init && mkdir build && cd build && \
    conan remote add conan-mpusz https://api.bintray.com/conan/mpusz/conan-mpusz && \
    conan install .. --build missing -s compiler.libcxx=libstdc++11 && \
    cmake .. \
    -DCMAKE_BUILD_TYPE=Release && \
    make -j8 && make install && \
    ldconfig

RUN rm -rf /root/khiva
