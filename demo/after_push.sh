#!/usr/bin/env bash
set -e
oldrev=$1
newrev=$2

echo files changed: $(git diff $oldrev $newrev --diff-filter=ACDMR --name-only | wc -l)

umask 002

git submodule sync && git submodule update --init --recursive
echo $newrev > REVISION

# composer install --prefer-dist --no-dev --no-progress
