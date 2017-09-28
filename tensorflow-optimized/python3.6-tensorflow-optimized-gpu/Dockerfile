FROM triage/python3.6-bazel-gpu

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

# Build optimized tensorflow and install
ARG TENSORFLOW_VERSION
ENV CI_BUILD_PYTHON python
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
ENV TF_NEED_CUDA 1
ENV TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5,5.2,6.0,6.1
RUN cd /opt && \
    git clone https://github.com/tensorflow/tensorflow && \
    cd tensorflow && \
    git checkout tags/v$TENSORFLOW_VERSION && \
    tensorflow/tools/ci_build/builds/configured GPU && \
    pip install numpy && \
    bazel build -c opt --copt=-mavx \
                       --copt=-mavx2 \
                       --copt=-mfma \
                       --copt=-mfpmath=both \
                       --copt=-msse4.2 \
                       --copt=-msse4.1 \
                       --config=cuda \
        //tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg && \
    pip install --upgrade pip && \
    pip install --upgrade /tmp/tensorflow_pkg/tensorflow-*.whl && \
    bazel clean --expunge && \
    rm -Rf /opt/tensorflow
