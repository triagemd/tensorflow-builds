FROM ubuntu:16.04

# Install Python
RUN apt-get -y update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:jonathonf/python-3.6 && \
    apt-get -y update && \
    apt-get install -y python3.6 python3.6-dev python3-pip python3.6-venv wget && \
    apt-get clean && \
    python3.6 -m pip install --no-cache-dir --upgrade pip wheel && \
    cd /usr/bin && \
    rm -f python pip idle pydoc python2-config && \
    ln -s idle3.6 idle && \
    ln -s pydoc3.6 pydoc && \
    ln -s python3.6 python && \
    ln -s python3.6-config python-config && \
    ln -s pip3.6 pip

# Install MKL-DNN
RUN apt-get -y update && \
    apt-get install -y build-essential cmake git && \
    cd /tmp && \
    git clone -b v0.20 https://github.com/intel/mkl-dnn.git && \
    cd mkl-dnn/scripts && \
    ./prepare_mkl.sh && \
    mkdir -p ../build && cd ../build && \
    cmake .. && make -j 4 && \
    make install && \
    rm -rf /tmp/mkl-dnn && \
    apt-get -y purge build-essential cmake git && \
    apt-get -y autoremove && \
    apt-get clean

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
