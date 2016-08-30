FROM fedora:latest
RUN dnf -y install docker git python-docker-py python-setuptools e2fsprogs koji python-pip python-backports-lzma osbs gssproxy && dnf clean all
RUN mkdir /tmp/atomic-reactor
ADD . /tmp/atomic-reactor
RUN cd /tmp/atomic-reactor && python setup.py install
CMD ["atomic-reactor", "--verbose", "inside-build"]
