#!/bin/sh

for n in {1..500}; do
    ./.bin/p1-b | ./.bin/p2-b >> bytestring.txt
done

