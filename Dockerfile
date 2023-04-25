FROM centos:7
WORKDIR /zsign
COPY . src/

RUN yum install -y g++ clang clang-static openssl-dev openssl-libs-static && \
    yum install -y zip unzip && \
    clang++ src/*.cpp src/common/*.cpp /usr/lib/libcrypto.a -O3 -o zsign -static && \
	apk del .build-deps && \
    rm -rf src

ENTRYPOINT ["/zsign/zsign"]
CMD ["-v"]
