#!/bin/sh -l

echo "Hello $1"
circom --help >> $GITHUB_OUTPUT
