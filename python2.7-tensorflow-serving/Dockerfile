FROM triage/python3.6-bazel

# Build optimized tensorflow-serving and install
ENV TENSORFLOW_SERVING_VERSION 1.3.0
RUN cd /opt && \
    git clone --recurse-submodules https://github.com/tensorflow/serving && \
    cd serving && \
    git checkout tags/$TENSORFLOW_SERVING_VERSION && \
    cd tensorflow && \
    tensorflow/tools/ci_build/builds/configured CPU && \
    cd .. && \
    pip install numpy grpcio && \
    bazel build -c opt \
                --copt=-mavx \
                --copt=-mavx2 \
                --copt=-mfma \
                --copt=-mfpmath=both \
                --copt=-msse4.2 \
                --copt=-msse4.1 \
        tensorflow_serving/... && \
    cp bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server /usr/local/bin/ && \
    bazel clean --expunge