#! /bin/bash

rm "../*.report*" "../*.test*" "../*.error"

python3 Test.py -f -i test.txt -c ../SD_Group11.circ --logisimpath ../logisim.jar

rm "../*.report*" "../*.test*" "../*.error*"
