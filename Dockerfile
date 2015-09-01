FROM quay.io/ukhomeofficedigital/jenkins-slave:v0.1.0

RUN mkdir -p /workdir/node

WORKDIR /workdir/node
RUN yum install -y curl && \
    yum -y groupinstall "Development Tools" && \
    curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1 && \
    ./configure && \
    make install && \
    yum clean all && \
    rm -rf /workdir/node
WORKDIR /home/jenkins
