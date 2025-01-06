#!/bin/bash

MOVIES=("$1" "$2" "$3")

echo "first movie name : ${MOVIES[0]}"
echo "second movie name : ${MOVIES[1]}"
echo "third movie name : ${MOVIES[2]}"

echo "All movies names : ${MOVIES[@]}"