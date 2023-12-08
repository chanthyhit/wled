#!/bin/bash

getHour() {
  echo $(date +%H)
}

getFX() {
  echo $((1 + RANDOM % 117))
}

getFP() {
  echo $((0 + RANDOM % 70))
}

currentHour=$(getHour)
host="http://192.168.1.23"

if [ "$currentHour" -ge 17 ] || [ "$currentHour" -lt 6 ]; then
  randomFX=$(getFX)
  randomFP=$(getFP)
  curl -X POST "$host/win&T=1"
  curl -X POST "$host/win&A=150&FX=$randomFX&FP=$randomFP" -H "Content-Type: application/x-www-form-urlencoded"
else
  curl -X POST "$host/win&T=0"
  echo "WLED will be turned off during the daytime."
fi
