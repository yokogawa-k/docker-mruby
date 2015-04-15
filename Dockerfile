FROM debian:jessie
MAINTAINER Kazuya Yokogawa "yokogawa-k@klab.com"

RUN apt-get update \
    && apt-get --no-install-recommends -y install \
        git \
        ca-certificates \
        make \
        ruby \
        gcc \
        libc6-dev \
        bison \
        libssl-dev \
        libhiredis-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists 

COPY build_config.rb /build_config.rb
RUN git clone https://github.com/mruby/mruby.git \
    && mv -f /build_config.rb /mruby/build_config.rb \
    && cd mruby \
    && make -j$(nproc)

ENTRYPOINT ["/mruby/bin/mruby"]
CMD ["--help"]
