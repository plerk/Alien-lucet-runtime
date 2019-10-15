#!/bin/sh

set -ex

docker build . -f ./maint/builder/Dockerfile -t plicease/ab-lucet-runtime

rm -rf maint/pkg

docker run --rm -v `pwd`/maint/pkg:/pkg plicease/ab-lucet-runtime af install --prefix=/pkg/usr/local

mv maint/pkg/usr/local/dynamic/* maint/pkg/usr/local/lib
rmdir maint/pkg/usr/local/dynamic
rm -rf maint/pkg/usr/local/_alien

cd maint/pkg
tar zcvf ~/dev/site-dist/docs/ab/lucet-runtime.tar.gz *
cd ../..

rm -rf maint/pkg
