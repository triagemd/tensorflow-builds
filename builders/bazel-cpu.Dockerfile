FROM ubuntu:16.04

RUN apt-get -y update && \
    apt-get -y install build-essential cmake software-properties-common curl wget unzip pkg-config zip zlib1g-dev openjdk-8-jdk openjdk-8-jre-headless git python python-dev python-pip python-virtualenv && \
    wget https://github.com/bazelbuild/bazel/releases/download/0.11.1/bazel-0.11.1-installer-linux-x86_64.sh && \
    chmod +x bazel-0.11.1-installer-linux-x86_64.sh && \
    ./bazel-0.11.1-installer-linux-x86_64.sh

# Install MKL-DNN
RUN cd /tmp && \
    git clone -b v0.20 https://github.com/intel/mkl-dnn.git && \
    cd mkl-dnn/scripts && \
    ./prepare_mkl.sh && \
    mkdir -p ../build && cd ../build && \
    cmake .. && make -j 32 && \
    make install && \
    rm -rf /tmp/mkl-dnn

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
