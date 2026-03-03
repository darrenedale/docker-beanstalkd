# Patches

This directory contains patches required to ensure beanstalkd builds successfully with the toolchain used during the
Docker build process. It shouldn't contain any significant changes from the original source. It's organised into
subdirectories specific to each version. Each subdirectory contains patch files named with a 3-digit sequence number
followed by the commit hash from which the patch was generated, separated by a hyphen. The image build process applies
the patches in order of their sequence numbers. The patch files should contain adequate descriptions of their purpose.

The `apply-patches.sh` script is used during the image build to apply the patches.
