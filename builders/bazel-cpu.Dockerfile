FROM ubuntu:16.04

ARG BAZEL_VERSION
RUN apt-get -y update && \
    apt-get -y install build-essential cmake software-properties-common curl unzip openjdk-8-jdk openjdk-8-jre-headless git python python-dev python-pip python-virtualenv && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get -y update && \
    apt-get -y install bazel=$BAZEL_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install MKL-DNN
RUN cd /tmp && \
    git clone https://github.com/01org/mkl-dnn.git && \
    cd mkl-dnn/scripts && \
    ./prepare_mkl.sh && \
    mkdir -p ../build && cd ../build && \
    cmake .. && make -j 4 && \
    make install && \
    rm -rf /tmp/mkl-dnn

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
