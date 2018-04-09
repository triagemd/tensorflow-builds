#!/usr/bin/env bash
set -e -x

export CI_BUILD_PYTHON=python
export TF_NEED_CUDA=1
export TF_CUDA_VERSION=9.0
export TF_CUDNN_VERSION=7
export TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5,5.2,6.0,6.1,7.0
cd /opt
git clone --recurse-submodules -b $TENSORFLOW_SERVING_VERSION https://github.com/tensorflow/serving
cd serving
pip install numpy grpcio
bazel build -c opt --incompatible_load_argument_is_label=false \
                   --config=cuda \
                   --crosstool_top=@local_config_cuda//crosstool:toolchain \
    tensorflow_serving/model_servers:tensorflow_model_server
mv bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server /builds/tensorflow_model_server_gpu
