# Docker image builder for beanstalkd

## Build an image with the latest beanstalkd:

    docker buildx build .

## Build an image with a specific beanstalkd version:

    docker buildx build --build-arg BEANSTALKD_VERSION=<tag> .

