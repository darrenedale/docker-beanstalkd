FROM alpine:latest AS build
ARG BEANSTALKD_VERSION

RUN apk add git build-base patch
RUN if [ "" != "${BEANSTALKD_VERSION}" ]; then git clone --branch "v${BEANSTALKD_VERSION}" --single-branch https://github.com/beanstalkd/beanstalkd.git /beanstalkd; else git clone https://github.com/beanstalkd/beanstalkd.git /beanstalkd; fi
COPY patches /patches
RUN if [ "" != "${BEANSTALKD_VERSION}" ]; then cd /beanstalkd && /patches/apply-patches.sh "${BEANSTALKD_VERSION}"; fi
RUN rm -rf /patches
RUN cd /beanstalkd && make && install -m 755 /beanstalkd/beanstalkd /usr/local/bin/ && rm -rf /beanstalkd
RUN apk del git build-base patch
RUN mkdir -p /var/lib/beanstalkd/binlog

FROM scratch
LABEL org.opencontainers.image.authors="Darren Edale"
LABEL org.opencontainers.image.source="https://github.com/darrenedale/docker-beanstalkd/"
LABEL org.opencontainers.image.title="Beanstalkd Server"
LABEL org.opencontainers.image.description="A lightweight image with a vanilla build of Beanstalkd Server."
COPY --from=build / /
ENTRYPOINT ["/usr/local/bin/beanstalkd", "-b", "/var/lib/beanstalkd/binlog"]
