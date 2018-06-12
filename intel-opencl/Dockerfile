# Use ubuntu:latest to download the latest Ubuntu LTS image
FROM ubuntu:bionic
LABEL maintainer="oscar.torreno@shapelets.io"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    clinfo \
    cpio \
    libhwloc5 \
    ocl-icd-opencl-dev \
    opencl-headers \
    wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

ENV PACKAGE_URL=http://registrationcenter-download.intel.com/akdlm/irc_nas/12556/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz
ENV PACKAGE_NAME=opencl_runtime_16.1.2_x64_rh_6.4.0.37

RUN wget -q ${PACKAGE_URL} -O /tmp/opencl_runtime.tgz && \
    tar -xzf /tmp/opencl_runtime.tgz -C /tmp && \
    sed 's/decline/accept/g' -i /tmp/${PACKAGE_NAME}/silent.cfg && \
    /tmp/${PACKAGE_NAME}/install.sh -s /tmp/${PACKAGE_NAME}/silent.cfg --cli-mode && \
    rm -rf /tmp/opencl_runtime.tgz

# Clean up APT when done
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root