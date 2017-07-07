#!/bin/bash

printf "Downloading BasicTex ..." 

# Default path to store .pkg
DIR="BasicTeX"
mkdir -p $DIR

# Download and progress bar
wget -P $DIR https://ctan.org/tex-archive/systems/mac/mactex/BasicTeX.pkg
pid=$! 
source ./spin.sh
spin $pid

# Install BasicTeX
sudo installer -pkg $DIR/BasicTeX.pkg -target /

# Update TeX Live
printf "Updating TeX Live ..."
sudo tlmgr update --self

INPUT_FILE="packages.txt"
ACTION="sudo tlmgr install"

# Install some useful packages
bash loop_command.sh $ACTION $INPUT_FILE

printf "Your BasicTeX setup is ready to rock!"
