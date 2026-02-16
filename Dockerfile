ARG BEANSTALKD_VERSION

FROM alpine:latest
LABEL authors="Darren Edale"

RUN apk add git build-base
RUN cd /
RUN if [ "" != "${BEANSTALKD_VERSION}" ]; then git clone --branch "${BEANSTALKD_VERSION}" --single-branch https://github.com/beanstalkd/beanstalkd.git; else git clone https://github.com/beanstalkd/beanstalkd.git; fi
RUN cd /beanstalkd && make
RUN install -m 755 /beanstalkd/beanstalkd /usr/local/bin/ && rm -rf /beanstalkd
RUN apk del git build-base
RUN mkdir -p /var/lib/beanstalkd/binlog
ENTRYPOINT ["beanstalkd", "-b", "/var/lib/beanstalkd/binlog"]
