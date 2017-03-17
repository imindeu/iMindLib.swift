#!/bin/sh

# Generate docs using Jazzy (in a usable format for Github-pages)

set -e

cd $(dirname $0)

SWIFT_VERSION=$(swift --version | head -n1 | awk '{print $4}')

echo
echo "Generating docs (for swift version: $SWIFT_VERSION)"
echo "========================="

jazzy \
    --clean \
    --output ../docs \
    --swift-version $SWIFT_VERSION \
    --source-directory ../ \
    --module iMindLib \
    --min-acl internal \
    --readme ../README.md \
    --author iMind \
    --author_url "http://www.imind.eu" \
    --github_url "https://github.com/imindeu/iMindLib.swift"

echo "========================="
echo "Completed"
echo
