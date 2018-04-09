#!/usr/bin/env bash
set -e -x

cd /opt
git clone --recurse-submodules -b $TENSORFLOW_SERVING_VERSION https://github.com/tensorflow/serving
cd serving
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
