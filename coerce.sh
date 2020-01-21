#!/bin/sh

for n in {1..500}; do
    ./.bin/p1-c | ./.bin/p2-c >> coerce.txt
done
