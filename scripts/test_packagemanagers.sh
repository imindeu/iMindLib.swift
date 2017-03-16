#!/bin/bash
set -e

swift test

pod lib lint
