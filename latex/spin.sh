#!/bin/bash

# Fancy function to display a progress bar while completing pid
# Params: pid - the pid of the process to monitor
spin () {
    pid=$1

    spin='-\|/'

    i=0
    while kill -0 $pid 2>/dev/null
    do
      i=$(( (i+1) %4 ))
      printf "\r${spin:$i:1}"
      sleep .1
    done
}
