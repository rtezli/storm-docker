FROM rtezli/java

MAINTAINER Robert Tezli <robert@pixills.com>

COPY ./start.sh /
COPY ./welcome.sh /

RUN apt-get update && \
    apt-get -y install wget && \
    apt-get install -y procps && \
    apt-get -y install python && \
    mkdir -p /usr/share/storm && \
    mkdir -p ~/.storm && \
    touch ~/.storm/storm.yaml && \
    cd /usr/share/storm && \
    wget -nv http://mirror.netcologne.de/apache.org/storm/apache-storm-0.9.5/apache-storm-0.9.5.tar.gz && \
    tar zxf apache-storm-0.9.5.tar.gz && \
    rm -rf apache-storm-0.9.5.tar.gz && \
    ln -s /usr/share/storm/apache-storm-0.9.5 /usr/share/storm/latest && \
    mkdir -p /usr/share/zookeeper && \
    cd /usr/share/zookeeper && \
    wget -nv http://mirror.netcologne.de/apache.org/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz && \
    tar zxf zookeeper-3.4.6.tar.gz && \
    rm -rf zookeeper-3.4.6.tar.gz && \
    ln -s /usr/share/zookeeper/zookeeper-3.4.6  /usr/share/zookeeper/latest && \
    chmod +x /start.sh && \
    chmod +x /welcome.sh

ENV STORM_HOME /usr/share/storm/latest
ENV ZOOKEEPER_HOME /usr/share/zookeeper/latest
ENV PATH /usr/share/storm/latest/bin:\
/usr/share/storm/latest/sbin:\
/usr/share/zookeeper/latest/bin:\
/usr/share/zookeeper/latest/sbin:\
$PATH

VOLUME ["/data"]

EXPOSE  2181 6700 6701 6702 6703 6627 8080

ENTRYPOINT ["/start.sh"]
