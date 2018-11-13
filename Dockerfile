FROM registry.centos.org/centos/centos:latest 

#RUN yum -y install btrfs-progs-devel \
#              atomic-registries \
#              bzip2 \
#              device-mapper-devel \
#              findutils \
#              git \
#              glibc-static \
#              glib2-devel \
#              gnupg \
#              golang \
#              golang-github-cpuguy83-go-md2man \
#              gpgme-devel \
#              libassuan-devel \
#              libseccomp-devel \
#              libselinux-devel \
#              skopeo-containers \
#              runc \
#              make \
#              ostree-devel \
#              python \
#              python3-dateutil \
#              python3-psutil \
#              python3-pytoml \
#              lsof \
#              which\
#              golang-github-cpuguy83-go-md2man \
#              nmap-ncat \
#              xz \
#              iptables && yum clean all

RUN yum -y install git && yum clean all
WORKDIR /go/src/github.com/containers/libpod
COPY build.sh /root/build.sh

LABEL RUN="podman run -it --rm --net=host -v /tmp/rpms:/root/rpmbuild/RPMS/x86_64/:Z IMAGE"

ENTRYPOINT ["sh", "/root/build.sh"]
