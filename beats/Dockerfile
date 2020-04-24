FROM ubuntu:18.04

ENV GOROOT=/go
ENV GOPATH=/gopath
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

RUN apt-get update; \
	apt-get install -y curl git python3 python3-pip

# Install mage
RUN pip3 install virtualenv && \
    curl https://dl.google.com/go/go1.13.8.linux-armv6l.tar.gz | tar xz && \
    go get github.com/magefile/mage && \
    cd $GOPATH/src/github.com/magefile/mage && \
    go run bootstrap.go

# Checkout specific version of all beats
# This errors as it thinks it cannot build it!
RUN go get github.com/elastic/beats; exit 0

RUN cd $GOPATH/src/github.com/elastic/beats && \
    git checkout 7.6