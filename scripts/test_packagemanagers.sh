#!/bin/bash
set -ex

swift test

pod lib lint
