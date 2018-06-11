# Use ubuntu:latest to download the latest Ubuntu LTS image
FROM ubuntu:bionic
LABEL maintainer="oscar.torreno@shapelets.io"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    alien \
    build-essential \
    clinfo \
    libhwloc5 \
    ocl-icd-opencl-dev \
    opencl-headers \
    unzip \
    wget && \
    rm -rf /var/lib/apt/lists/*

ENV INTEL_DRIVER_URL=http://registrationcenter-download.intel.com/akdlm/irc_nas/11396/SRB5.0_linux64.zip
ENV INTEL_SDK_URL=http://registrationcenter-download.intel.com/akdlm/irc_nas/vcp/12526/intel_sdk_for_opencl_2017_7.0.0.2568_x64.gz

WORKDIR /tmp

# Download and extract the Intel OpenCL SDK
RUN wget ${INTEL_SDK_URL} && \
    TARBALL=$(basename ${INTEL_SDK_URL}) && \
    DIR=$(basename ${INTEL_SDK_URL} .gz) && \
    tar zxvf ${TARBALL} && \
    for i in ${DIR}/rpm/*.rpm ; do alien --to-deb $i ; done

# Install the Intel OpenCL SDK
RUN dpkg -i *.deb; exit 0

# Download and extract the Intel OpenCL Driver
RUN mkdir intel-driver && \
    cd intel-driver && \
    wget ${INTEL_DRIVER_URL} && \
    ZIP=$(basename ${INTEL_DRIVER_URL}) && \
    unzip ${ZIP} && \
    for i in *.rpm ; do alien --to-deb $i ; done

# Install the Intel OpenCL Driver
RUN cd intel-driver && \
    dpkg -i *.deb; exit 0

# Clean up APT when done
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root