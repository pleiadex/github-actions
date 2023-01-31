FROM ubuntu:latest
LABEL purpose="test environment"
RUN apt update && apt install -y \
build-essential \
cmake \
curl \
unzip
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
SHELL ["/bin/bash", "-c", "source $HOME/.cargo/env"]
RUN curl -LO https://github.com/iden3/circom/archive/refs/tags/v2.0.5.zip
RUN unzip v2.0.5.zip && cd circom-2.0.5
RUN cargo build --release
RUN cargo install --path circom

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
