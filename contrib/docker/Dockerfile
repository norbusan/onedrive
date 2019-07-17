# -*-Dockerfile-*-
FROM debian:buster-slim
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential ca-certificates curl libcurl4-openssl-dev libsqlite3-dev libsystemd-dev pkg-config git
RUN curl -fsS -o install.sh https://dlang.org/install.sh && \
    bash install.sh dmd
COPY . /usr/src/onedrive
RUN . "$(bash install.sh -a)" && \
    cd /usr/src/onedrive/ && \
    ./configure && \
    make clean && \
    make && \
    make install

FROM debian:buster-slim
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENTRYPOINT ["/entrypoint.sh"]
RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu libcurl4 libsqlite3-0 && \
    rm -rf /var/*/apt && \
    mkdir -p /onedrive/conf /onedrive/data
COPY contrib/docker/entrypoint.sh /
COPY --from=0 /usr/local/bin/onedrive /usr/local/bin/
