#!/bin/sh

echo "Building and copying to ./bin/"
stack build --local-bin-path=./.bin --copy-bins

echo "Testing bytestring serialization"
/usr/bin/time -l ./bytestring.sh
echo "Testing coerce serialization"
/usr/bin/time -l ./coerce.sh

echo "Comparing results"
diff ./coerce.txt ./bytestring.txt

echo "Removing results"
rm ./coerce.txt
rm ./bytestring.txt
