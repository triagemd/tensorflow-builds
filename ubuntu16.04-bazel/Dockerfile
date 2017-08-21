FROM ubuntu:16.04

# Install Java/JDK
RUN apt-get -y update && \
    apt-get -y install software-properties-common curl unzip && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-8-jdk openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Bazel
ENV BAZELRC /root/.bazelrc
ENV BAZEL_VERSION 0.4.5
# https://github.com/bazelbuild/bazel/issues/134
# https://github.com/bazelbuild/bazel/issues/418
RUN echo "startup --batch" >>/root/.bazelrc && \
    echo "build --spawn_strategy=standalone --genrule_strategy=standalone" >> /root/.bazelrc && \
    mkdir /bazel && \
    cd /bazel && \
    curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    curl -fSsL -o /bazel/LICENSE https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE && \
    chmod +x bazel-*.sh && \
    ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    cd / && \
    rm -f /bazel/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

CMD ["/bin/bash"]