#! /bin/bash
sudo apt-get update && sudo apt-get -y upgrade
wget  https://go.dev/dl/go1.19.linux-amd64.tar.gz 
sudo tar -xvf go1.19.linux-amd64.tar.gz   
sudo mv go /usr/local
export GOROOT=/usr/local/go
mkdir $HOME/ws-go
export GOPATH=$HOME/ws-go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH