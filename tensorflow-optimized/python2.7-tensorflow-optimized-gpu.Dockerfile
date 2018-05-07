FROM triage/python2.7-cuda9.1-mkl

ARG TENSORFLOW_VERSION
ARG MIND_RELEASE_TAG
RUN pip install --no-cache-dir https://github.com/mind/wheels/releases/download/$MIND_RELEASE_TAG-gpu-cuda91-nomkl/tensorflow-$TENSORFLOW_VERSION-cp27-cp27mu-linux_x86_64.whl
