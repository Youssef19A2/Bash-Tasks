#!/bin/bash
#sends argument 
echo "File Name     :    $0"
echo "First Arg     :    $1"
echo "Second Arg    :    $2"
echo "Third Arg     :    $3"
echo "Number of arg :    $#"
echo "Process ID    :    $$"
echo "All arg       :    $*"
# shellcheck disable=SC2145
echo "All arg       :    $@"
