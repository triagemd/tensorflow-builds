FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

# Install Python
RUN apt-get -y update && \
    apt-get install -y python python-dev python-pip python-virtualenv wget && \
    apt-get clean && \
    python -m pip install --no-cache-dir --upgrade pip wheel

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/local/cuda/lib64:/usr/local/cuda/lib64/stubs:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Fix paths so CUDA and CUDNN can be found
# See https://github.com/tensorflow/tensorflow/issues/14573, https://github.com/tensorflow/tensorflow/issues/8264
RUN mkdir /usr/lib/x86_64-linux-gnu/include/ && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so /usr/local/cuda/lib64/libcudnn.so && \
    ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so.6 /usr/local/cuda/lib64/libcudnn.so.6
