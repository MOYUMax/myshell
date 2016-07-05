#!/bin/bash

echo $1
cat $1|grep duration |cut -d ':' -f 2-4




