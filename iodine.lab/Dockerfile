FROM ubuntu
ARG VERSION=iodine-0.8
WORKDIR /root
RUN apt update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    git \
    iproute2 \
    net-tools \
    iputils-ping \
    curl \
    python3 \
    iperf3 \
    && rm -rf /var/lib/apt/lists/*
RUN git clone --branch ${VERSION} --depth 1 https://github.com/yarrick/iodine.git
WORKDIR /root/iodine
RUN make && make install
COPY bootup.sh bootup.sh
RUN chmod +x bootup.sh
CMD ["./bootup.sh"]
