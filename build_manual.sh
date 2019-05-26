#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install git
sudo apt install mecab
sudo apt install libmecab-dev
sudo apt install mecab-ipadic-utf8
sudo apt install build-essential

git clone https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
sudo bin/install-mecab-ipadic-neologd

# /etc/mecabrcを編集
# dicdir = /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd


