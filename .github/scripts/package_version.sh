#!/bin/sh

base_url="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=de"
redirect_url=$( curl -s -o /dev/null -w '%{redirect_url}' $base_url )

version=$( echo $redirect_url | grep -oP '(?<=firefox-)(.+)(?=.tar.bz2)' )
echo "::set-output name=package_version::$version"
