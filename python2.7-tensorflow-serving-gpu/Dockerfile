FROM triage/python2.7-bazel-gpu

# Fix paths so that CUDNN can be found
# See https://github.com/tensorflow/tensorflow/issues/8264
RUN ls -lah /usr/local/cuda/lib64/*
RUN mkdir /usr/lib/x86_64-linux-gnu/include/ && \
  ln -s /usr/lib/x86_64-linux-gnu/include/cudnn.h /usr/lib/x86_64-linux-gnu/include/cudnn.h && \
  ln -s /usr/include/cudnn.h /usr/local/cuda/include/cudnn.h && \
  ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so /usr/local/cuda/lib64/libcudnn.so && \
  ln -s /usr/lib/x86_64-linux-gnu/libcudnn.so.6 /usr/local/cuda/lib64/libcudnn.so.6

# Fix from https://github.com/tensorflow/serving/issues/327#issuecomment-282207825
WORKDIR /
RUN git clone https://github.com/NVIDIA/nccl.git && \
    cd nccl/ && \
    make CUDA_HOME=/usr/local/cuda && \
    make install && \
    mkdir -p /usr/local/include/external/nccl_archive/src && \
    ln -s /usr/local/include/nccl.h /usr/local/include/external/nccl_archive/src/nccl.h

# Build optimized tensorflow-serving and install
ENV TENSORFLOW_SERVING_VERSION 1.3.0
ENV CI_BUILD_PYTHON python
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
ENV TF_NEED_CUDA 1
ENV TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5,5.2,6.0,6.1
RUN cd /opt && \
    git clone --recurse-submodules https://github.com/tensorflow/serving && \
    cd serving && \
    git checkout tags/$TENSORFLOW_SERVING_VERSION && \
    cd tensorflow && \
    tensorflow/tools/ci_build/builds/configured GPU && \
    cd .. && \
    pip install numpy grpcio && \
    bazel build -c opt \
                --copt=-mavx \
                --copt=-mavx2 \
                --copt=-mfma \
                --copt=-mfpmath=both \
                --copt=-msse4.2 \
                --copt=-msse4.1 \
                --config=cuda \
                --crosstool_top=@local_config_cuda//crosstool:toolchain \
        tensorflow_serving/... && \
    cp bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server /usr/local/bin/ && \
    bazel clean --expunge