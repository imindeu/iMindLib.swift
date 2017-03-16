#!/bin/sh

# Check if Jazzy gem exists: install if missing.

set -e

echo
echo "Checkig Jazzy"
echo "========================="

if gem list jazzy -i 1>/dev/null ; then
    echo "Jazzy gem exists!" 
else
    echo "Jazzy gem not found! Installing it..."
    sudo gem install jazzy
fi

echo "========================="
echo "Completed"
echo