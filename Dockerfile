FROM ubuntu:20.10

RUN groupadd -g 2000 jupyter \
    && useradd -d /home/jupyter -u 1000 -g jupyter jupyter

RUN mkdir /home/jupyter \
    && chown -R jupyter:jupyter /home/jupyter

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    gcc \
    g++ \
    make \
    python3 \
    python3-dev \
    python3-pip \
    tar \
    vim \
    wget

RUN cd /tmp \
    && wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
    && tar -xzvf ta-lib-0.4.0-src.tar.gz \
    && cd ta-lib \
    && ./configure --prefix=/usr \
    && make \
    && make install

RUN pip3 install scipy \
    numpy \
    pandas \ 
    matplotlib \
    jupyter

RUN pip3 install TA-Lib

EXPOSE 8888

USER jupyter

WORKDIR /home/jupyter

CMD jupyter notebook --ip=0.0.0.0 --port=8888