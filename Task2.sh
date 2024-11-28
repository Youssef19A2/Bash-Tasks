#!/bin/bash
#3-write bash script to download video from youtube#

read -p "Enter The url of The Video: " url
echo "$url"
yt-dlp "$url"



