#!/bin/bash

FOLDER=./appcode/
FINDER=$(find $FOLDER -name *.yaml)
for f in  $FINDER
do
	echo $f
	#kubectl create -f $f
done
