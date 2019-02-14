#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-gist updated-gist

echo "1-------------"

cd resource-gist
echo "2-------------"

cd updated-gist
echo $(date) > bumpme

ls -l

echo "resource-gist:"
ls -l resource-gist

echo "updated-gist:"
ls -l updated-gist

git config --global user.email "nobody@concourse-ci.org"
git config --global user.name "Concourse"

git add .
git commit -m "Bumped date"
