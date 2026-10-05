FROM ubuntu
ARG VERSION=5.4.7
ARG EXT=xz
ENV CONFIG=default
WORKDIR /root
RUN apt update && apt upgrade -y && apt-get install -y \
    libboost-filesystem-dev \
    libboost-serialization-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-context-dev \
    libboost-test-dev \
    libssl-dev \
    libboost-test-dev \
    g++ \
    make \
    pkg-config \
    libluajit-5.1-dev \
    libboost-dev \
    cargo \
    lbzip2 \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*
ADD https://downloads.powerdns.com/releases/pdns-recursor-${VERSION}.tar.${EXT} ./
RUN tar -xf pdns-recursor-${VERSION}.tar.${EXT}
WORKDIR /root/pdns-recursor-${VERSION}
RUN ./configure && make -k -d && make install
RUN mkdir /var/run/pdns-recursor
COPY disable-dnssec.lua disable-dnssec.lua
COPY configs configs
RUN find configs -type f -name "*.conf" -delete
COPY bootup.sh bootup.sh
CMD ./bootup.sh
