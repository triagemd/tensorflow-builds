FROM triage/python2.7-bazel

# Build optimized tensorflow-serving and install
ARG TENSORFLOW_SERVING_VERSION
ARG TENSORFLOW_VERSION
RUN cd /opt && \
    git clone https://github.com/tensorflow/serving && \
    cd serving && \
    git checkout tags/$TENSORFLOW_SERVING_VERSION && \
    git submodule update --init --recursive && \
    cd tensorflow && \
    git checkout tags/v$TENSORFLOW_VERSION && \
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
