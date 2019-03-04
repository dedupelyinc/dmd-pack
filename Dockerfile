FROM ubuntu:16.04

RUN apt-get -y update && apt-get install -y wget libevent-pthreads-2.0-5 libevent-dev libssl-dev software-properties-common python-software-properties libmosquitto-dev gcc libcurl4-openssl-dev g++ build-essential

# Add postgres dev libs
RUN add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get -y update && \
    apt-get install -y libpq5 && \
    apt-get install -y libpq-dev

# DMD and Dub
RUN wget http://downloads.dlang.org/releases/2.x/2.085.0/dmd_2.085.0-0_amd64.deb && \
    dpkg -i dmd_2.085.0-0_amd64.deb && \
    apt-get install -f && \
    update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.gold" 20