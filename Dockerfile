FROM ubuntu:20.10

RUN apt update && apt -y install build-essential cmake git curl unzip tar zip pkg-config
RUN git clone https://github.com/Microsoft/vcpkg.git /opt/vcpkg
WORKDIR /opt/vcpkg
RUN ./bootstrap-vcpkg.sh && ./vcpkg integrate install && ./vcpkg integrate bash && echo 'export PATH=$PATH:/opt/vcpkg' >>~/.bashrc

RUN ./vcpkg install paho-mqtt
RUN ./vcpkg install spdlog
RUN ./vcpkg install curl
RUN ./vcpkg install libwebsockets
RUN ./vcpkg install RapidJSON
RUN ./vcpkg install cxxopts
RUN ./vcpkg install zlib
RUN ./vcpkg install mongo-c-driver
RUN ./vcpkg install libarchive

CMD ["bash"]
