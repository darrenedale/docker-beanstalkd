FROM alpine:latest
LABEL authors="Darren Edale"
ARG BEANSTALKD_VERSION

RUN apk add git build-base
RUN if [ "" != "${BEANSTALKD_VERSION}" ]; then git clone --branch "v${BEANSTALKD_VERSION}" --single-branch https://github.com/beanstalkd/beanstalkd.git /beanstalkd; else git clone https://github.com/beanstalkd/beanstalkd.git /beanstalkd; fi
RUN cd /beanstalkd && make && install -m 755 /beanstalkd/beanstalkd /usr/local/bin/ && rm -rf /beanstalkd
RUN apk del git build-base
RUN mkdir -p /var/lib/beanstalkd/binlog
ENTRYPOINT ["beanstalkd", "-b", "/var/lib/beanstalkd/binlog"]
