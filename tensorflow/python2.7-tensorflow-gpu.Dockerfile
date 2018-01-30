FROM triage/python2.7-cuda9.0

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow-gpu==$TENSORFLOW_VERSION
