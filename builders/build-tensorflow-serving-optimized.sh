#!/usr/bin/env bash
set -e -x

cd /opt
git clone https://github.com/tensorflow/serving
cd serving
git checkout tags/$TENSORFLOW_SERVING_VERSION
git submodule update --init --recursive
cd tensorflow
git checkout tags/v$TENSORFLOW_VERSION
tensorflow/tools/ci_build/builds/configured CPU
cd ..
pip install numpy grpcio
bazel build -c opt --incompatible_load_argument_is_label=false \
                   --config=mkl \
                   --copt=-mavx \
                   --copt=-mavx2 \
                   --copt=-mfma \
                   --copt=-mfpmath=both \
                   --copt=-msse4.2 \
                   --copt=-msse4.1 \
                   --copt=-O3 \
    tensorflow_serving/model_servers:tensorflow_model_server
mv bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server /builds/tensorflow_model_server_optimized
