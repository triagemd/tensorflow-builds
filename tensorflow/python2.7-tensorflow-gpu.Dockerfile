FROM triage/python2.7-gpu

ARG TENSORFLOW_VERSION
RUN pip install --no-cache-dir tensorflow-gpu==$TENSORFLOW_VERSION
