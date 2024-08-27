#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

NUM=$1
HALF=$((NUM / 2))
MULT=1
SUM=0

for ((i = 1; i <= HALF; i++)); do
    MULT=$((MULT * i))
done

for ((i = HALF + 1 + (NUM % 2); i <= NUM; i++)); do
    SUM=$((SUM + i))
done

echo "mult: $MULT"
echo "sum: $SUM"
