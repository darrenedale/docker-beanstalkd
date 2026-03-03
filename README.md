# Docker image builder for beanstalkd

Compatible with beanstalkd v1.8 and later.

## Build an image with the latest beanstalkd:

    docker buildx build --tag "darrenedale/beanstalkd:latest" .

## Build an image with a specific beanstalkd version (e.g. 1.11):

    docker buildx build --tag "darrenedale/beanstalkd:1.11" --build-arg BEANSTALKD_VERSION=1.11 .
