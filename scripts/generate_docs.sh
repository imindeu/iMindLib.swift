#!/bin/sh

cd $(dirname $0)

clear

echo "Generating docs"
echo "==============="
echo

jazzy \
	--clean \
	--output ../docs \
	--swift-version 3.0.2 \
	--source-directory ../ \
	--module iMindLib \
	--min-acl internal \
	--readme ../README.md \
	--author iMind \
  	--author_url "http://www.imind.eu" \
  	--github_url "https://github.com/imindeu/iMind-Lib.swift"

echo
echo "==============="
echo "Completed"
echo