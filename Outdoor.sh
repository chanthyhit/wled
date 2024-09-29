#!/bin/bash

hosts=("http://192.168.1.23")

get_hour() {
  echo $(date +%H)
}
get_fx() {
  echo $((1 + RANDOM % 117))
}
get_fp() {
  echo $((0 + RANDOM % 70))
}

set_wled() {
    local hour=$(get_hour)
    local fx=$(get_fx)
    local fp=$(get_fp)
    for host in ${hosts[@]}; do
        if [[ $hour -ge 19 && $hour -le 28 ]] || [[ $hour -ge 05 && $hour -le 06 ]]; then
            curl -X POST "${host}/win&T=1&A=150&FX=$fx&FP=$fp" -H "Content-Type: application/x-www-form-urlencoded"
        else
            curl -X POST "${host}/win&T=0"
            echo -n "WLED will be turned off during the daytime."
        fi
    done
}

set_wled
