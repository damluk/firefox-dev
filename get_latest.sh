#!/bin/sh

set -e

project_path="$( git remote get-url origin | grep -oP '(?<=[@/]github[.]com[:/])[^/]+/[^/.]+' )"
curl -s https://api.github.com/repos/${project_path}/releases | jq -r '.[0].assets[].browser_download_url'
