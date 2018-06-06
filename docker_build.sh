#!/bin/bash
repo="rocka84/phpwarrior-docker"
tag="$(date +%Y%m%d%H%M)"

docker build -t "$repo":"$tag" .
docker tag "$repo":"$tag" "$repo":latest

echo -e "\n\nbuilt $repo:$tag"

