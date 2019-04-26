FROM shapelets/khiva

WORKDIR /root

# Installing mono
RUN apt-get install -y gnupg ca-certificates && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && apt-get install -y mono-complete && apt-get install nuget

# Cloning Khiva C#
RUN git clone https://github.com/shapelets/khiva-csharp.git && \
    cd khiva-csharp && git fetch --tags && git checkout tags/v0.2.3 && \
    nuget restore Khiva.sln && msbuild /p:Configuration=Release /p:platform=x64 Khiva.sln

# Clean up APT when done
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /root/khiva-csharp/src/bin/x64/Release/Khiva.dll /root 

RUN rm -rf /root/khiva-csharp