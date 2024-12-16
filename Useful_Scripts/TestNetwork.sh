#!/bin/bash
#Test Network speed

if ! command -v speedtest-cli &>/dev/null;then
    echo "speedtest-cli is not installed. please install it usage your package manager. "
    exit 1 
fi

speedtest_Result=$(speedtest-cli)
echo "speed Test Result:"
echo "$speedtest_Result"