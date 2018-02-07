ARG CUDA_VERSION
FROM nvidia/cuda:${CUDA_VERSION}-cudnn7-devel-ubuntu16.04

ARG BAZEL_VERSION
RUN apt-get -y update && \
    apt-get -y install build-essential software-properties-common curl unzip openjdk-8-jdk openjdk-8-jre-headless git python python-dev python-pip python-virtualenv && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get -y update && \
    apt-get -y install bazel=$BAZEL_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/local/cuda/lib64:/usr/local/cuda/lib64/stubs:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Fix paths so CUDA and CUDNN can be found
# See https://github.com/tensorflow/tensorflow/issues/14573, https://github.com/tensorflow/tensorflow/issues/8264
RUN mkdir /usr/lib/x86_64-linux-gnu/include/ && \
    ln -s /usr/lib/x86_64-linux-gnu/include/cudnn.h /usr/lib/x86_64-linux-gnu/include/cudnn.h && \
    ln -s /usr/include/cudnn.h /usr/local/cuda/include/cudnn.h && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so /usr/local/cuda/lib64/libcudnn.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so.7 /usr/local/cuda/lib64/libcudnn.so.7 && \
    ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1

# Fix from https://github.com/tensorflow/serving/issues/327#issuecomment-282207825
RUN cd /tmp && \
    git clone https://github.com/NVIDIA/nccl.git && \
    cd nccl/ && \
    make -j 4 CUDA_HOME=/usr/local/cuda && \
    make install && \
    mkdir -p /usr/local/include/external/nccl_archive/src && \
    ln -s /usr/local/include/nccl.h /usr/local/include/external/nccl_archive/src/nccl.h && \
    rm -rf nccl
