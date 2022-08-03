#! /bin/bash
FILES=$(ls Simple_Datapath_tests)

rm ../*.report ../*.test ../*.error

for FILE in $FILES
do
	python3 Test.py -s -i Simple_Datapath_tests/$FILE -c ../SD_Group11.circ --logisimpath ../logisim.jar
done

rm ../*.report ../*.test ../*.error
