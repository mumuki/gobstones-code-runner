#!/bin/bash

set -e

NEW_VERSION=$1
VERSION_REGEXP='[0-9]+\.[0-9]+\.[0-9]+'
FULL_VERSION_REGEXP="^${VERSION_REGEXP}$"

if [[ ! $NEW_VERSION =~ $FULL_VERSION_REGEXP ]]; then
  echo "First param should be a version like X.X.X"
  exit 1
fi

echo "[Gobstones::CodeRunner] Updating version..."
sed -i -r "s/\"version\": \"${VERSION_REGEXP}/\"version\": \"${NEW_VERSION}/" bower.json
sed -i -r "s/VERSION = \"${VERSION_REGEXP}/VERSION = \"${NEW_VERSION}/" gem/lib/gobstones/code-runner/version.rb

echo "[Gobstones::CodeRunner] Testing if the build is ok..."
./build.sh

echo "[Gobstones::CodeRunner] Commiting files..."
git commit bower.json gem/lib/gobstones/code-runner/version.rb -m "Welcome ${NEW_VERSION}!"

echo "[Gobstones::CodeRunner] Tagging $NEW_VERSION..."
git tag "${NEW_VERSION}"

echo "[Gobstones::CodeRunner] Pushing..."
git push origin HEAD --tags

echo "[Gobstones::CodeRunner] Pushed. Travis will do the rest"
