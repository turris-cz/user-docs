# This is Docker file for container used on Gitlab to build and test documentation.
# To build it you have to run in repository root:
#   docker build -t registry.labs.nic.cz/turris/user-docs -f .DockerFile .
# With built container you can push it to Gitlab with:
#   docker push registry.labs.nic.cz/turris/user-docs
FROM debian:bullseye

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
  pip3 install --requirement /requirements.txt && \
  rm /requirements.txt

CMD [ "bash" ]
