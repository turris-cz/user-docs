# This is the Docker file for containers used on GitLab to build and test
# the documentation.
#
# To build it you have to run in the repository root:
#   docker build -t registry.nic.cz/turris/user-docs .
# With a built container, you need to log in to GitLab first.
# Use a generated authentication token for this purpose (never use your password).
# https://gitlab.nic.cz/help/user/packages/container_registry/index.md#authenticate-with-the-container-registry
#   docker login registry.nic.cz -u <username> -p <token>
# Then you can push the built container to GitLab with:
#   docker push registry.nic.cz/turris/user-docs
# Logout from the GitLab server when done:
#   docker logout registry.nic.cz
FROM debian:bookworm

ENV HOME=/root

RUN \
  apt-get update && \
  apt-get -y install --no-install-recommends \
    python3-pip python3-setuptools python3-wheel \
    git wget \
    && \
  apt-get clean

ADD requirements.txt /requirements.txt

RUN \
  pip3 install --break-system-packages --requirement /requirements.txt && \
  rm /requirements.txt

CMD [ "bash" ]
