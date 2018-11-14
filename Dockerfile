FROM registry.fedoraproject.org/fedora:28

RUN dnf -y install git && dnf clean all
WORKDIR /go/src/github.com/containers/libpod
COPY build.sh /root/build.sh

LABEL RUN="podman run -it --rm --net=host -v /tmp/rpms:/root/rpmbuild/RPMS/:Z IMAGE"

ENTRYPOINT ["sh", "/root/build.sh"]
