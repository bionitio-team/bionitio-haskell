#!/bin/bash

set -e
errors=0

TOP_DIR=`pwd`

# Run unit tests
cabal test > /dev/null 2>&1 || {
#stack test > /dev/null 2>&1 || {
    #echo "'stack test' failed"
    echo "'cabal test' failed"
    let errors+=1
}

# Run hlint static analysis 
hlint src || {
    echo "'hlint src' failed"
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Haskell specific tests"
