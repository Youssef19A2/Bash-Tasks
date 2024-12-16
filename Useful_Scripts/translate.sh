#!/bin/bash
read -p "Enter The Word: " word
url="https://translate.google.com.eg/?sl=en&tl=ar&text=${word}&op=translate"
firefox "$url"
