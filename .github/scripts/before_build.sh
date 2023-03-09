#!/bin/sh

set -e
export EDITOR=true
export DEBEMAIL="nobody@localhost"

apt-get -y install devscripts

url="https://download-installer.cdn.mozilla.net/pub/devedition/releases/$package_version/linux-x86_64/de/firefox-$package_version.tar.bz2"
mkdir download
curl -s -o - $url | tar -C download --strip-components=1 -jxf -

dch --create --newversion $package_version --package firefox-dev
