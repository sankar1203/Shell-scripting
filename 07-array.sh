#!/bin/bash

Movies=("court" "hit" "simha" "pushpa2")

echo "first movie: $Movies[0]"
echo "first movie: ${Movies[0]}"
echo "first movie: ${Movies[4]}"

echo "all movie: ${Movies[@]}"