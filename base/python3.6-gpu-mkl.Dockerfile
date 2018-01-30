FROM triage/python3.6-cuda9.1

# Install MKL-DNN
RUN apt-get -y update && \
    apt-get install -y build-essential cmake git && \
    cd /tmp && \
    git clone https://github.com/01org/mkl-dnn.git && \
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
