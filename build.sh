#!/bin/bash

GOPATH=/go

export GOPATH=$GOPATH

git clone http://github.com/containers/libpod /go/src/github.com/containers/libpod
cd ../ && cd -
sh contrib/build_rpm.sh
