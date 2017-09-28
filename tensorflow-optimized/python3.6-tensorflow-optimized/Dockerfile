FROM triage/python3.6-bazel

# Build optimized tensorflow and install
ARG TENSORFLOW_VERSION
RUN cd /opt && \
    git clone https://github.com/tensorflow/tensorflow && \
    cd tensorflow && \
    git checkout tags/v$TENSORFLOW_VERSION && \
    tensorflow/tools/ci_build/builds/configured CPU && \
    pip install numpy && \
    bazel build -c opt --copt=-mavx \
                       --copt=-mavx2 \
                       --copt=-mfma \
                       --copt=-mfpmath=both \
                       --copt=-msse4.2 \
                       --copt=-msse4.1 \
        //tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg && \
    pip install --upgrade pip && \
    pip install --upgrade /tmp/tensorflow_pkg/tensorflow-*.whl && \
    bazel clean --expunge && \
    rm -Rf /opt/tensorflow
