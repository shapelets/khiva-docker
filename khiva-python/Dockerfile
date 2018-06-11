FROM shapelets/khiva
LABEL maintainer="oscar.torreno@shapelets.io"

WORKDIR /root

# Cloning Khiva Python
RUN git clone https://github.com/shapelets/khiva-python.git && \
    cd khiva-python && git fetch --tags && git checkout tags/v0.1.0 && \
    pip3 install -r requirements.txt && \
    python3 setup.py install

RUN rm -rf /root/khiva-python