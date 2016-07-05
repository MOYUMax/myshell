#!/bin/bash

rq=0
rel=0
for ((i=0;i<10;i++))
    do read first second third; echo $first $second $third;
    if $third; then
	rq = $rq+1
	rel = $rel+rq/$second
	echo $rq $rel
    fi
done < test.txt
echo $rq $rel

