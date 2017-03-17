#!/bin/sh

# Generate docs using Jazzy (in a usable format for Github-pages)
# Commit and push changes to git

set -e

cd $(dirname $0)

SWIFT_VERSION=$(swift --version | head -n1 | awk '{print $4}')

echo
echo "Generating docs (for swift version: $SWIFT_VERSION)"
echo "========================="

#clean_branch=$(git status --porcelain)
#if [ "$clean_branch" != "" ]; then
#    echo "Aborting: current branch is dirty"
#    exit 1
#fi

#current_branch=$(git symbolic-ref HEAD --short)
#if [ "$current_branch" != "master" ]; then
#    echo "Aborting: current branch differs from master"
#    exit 1
#fi

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

git add ../docs 1>/dev/null
git commit -m "Update documentation [skip ci]" 1>/dev/null
git push origin master 1>/dev/null
echo "Successfully added to version control"

echo "========================="
echo "Completed"
echo
