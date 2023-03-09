#!/bin/sh

set -e

base_url="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=de"
redirect_url=$( curl -s -o /dev/null -w '%{redirect_url}' $base_url )

version=$( echo $redirect_url | grep -oP '(?<=firefox-)(.+)(?=.tar.bz2)' )

git fetch --depth 1 --tags

if [ -z "$(git show-ref v$version)" ]
then
    # No release yet
    echo "::set-output name=package_version::$version"
fi
