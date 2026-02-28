#! /usr/bin/env sh

BEANSTALKD_VERSION="$1"

if ! [ -d "/patches/${BEANSTALKD_VERSION}" ]; then
  exit 0
fi

for PATCH in $(ls -1 "/patches/${BEANSTALKD_VERSION}"/*); do
  echo "Applying patch $(basename "${PATCH}")"
  patch -p1 <"${PATCH}"
done
