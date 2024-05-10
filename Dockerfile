FROM python:3.11



RUN apt-get update && apt-get install -y build-essential gcc-11 clang clang-tools cmake cppcheck valgrind afl gcc-multilib git wget libfl2 && rm -rf /var/lib/apt/lists/*
RUN pip3 install xmltodict pycryptodome

ENV TOOLCHAIN_DIR /toolchain

RUN mkdir -p ./${TOOLCHAIN_DIR} && \
      wget -q https://github.com/openlumi/BA2-toolchain/releases/download/20201219/ba-toolchain-20201219.tar.bz2 -O - | tar -jx -C ./${TOOLCHAIN_DIR}

WORKDIR /app
