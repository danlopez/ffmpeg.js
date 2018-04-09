FROM ubuntu

RUN apt-get update
RUN apt-get -y install vim wget python git automake libtool build-essential cmake libglib2.0-dev closure-compiler

RUN wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
RUN tar xzvf emsdk-portable.tar.gz

WORKDIR /emsdk-portable
RUN ls
RUN ./emsdk update
RUN ./emsdk install latest
RUN ./emsdk activate latest
RUN /bin/bash -c "source ./emsdk_env.sh"
WORKDIR /

RUN git clone -b extra-memory https://github.com/danlopez/ffmpeg.js.git
WORKDIR ffmpeg.js
RUN git submodule init
RUN git submodule update --recursive

CMD ["/bin/bash"]
