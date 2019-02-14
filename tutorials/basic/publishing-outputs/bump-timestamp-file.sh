#!/bin/sh

set -e # fail fast
set -x # print commands

git clone resource-gist updated-gist

echo "1 --- listing contents of original repository cloned automatically "
cd resource-gist
ls -l

echo "2 --- editing repo that was manually cloned above"

cd ../updated-gist
ls -l
echo $(date) > bumpme

echo "3 --- content of original file in folder cloned automatically"
cat ../resource-gist/bumpme

echo "4 --- content of edited file in new folder cloned manually"
cat bumpme

git config --global user.email "nobody@concourse-ci.org"
git config --global user.name "Concourse"

git add .
git commit -m "Bumped date"
