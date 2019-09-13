#!/bin/bash

# 詳細は下記URL参照
# gcloudのインストールが必要
# https://firebase.google.com/docs/firestore/manage-data/move-data?hl=ja

read -sp "starmine-develop: d, starmine-production: p (d/p)? " env
echo

if [ $env = "p" ]; then
  env="starmine-production"
else
  env="starmine-develop"
fi

gcloud config set project $env
gcloud beta firestore export gs://$env.appspot.com --collection-ids=admin --async
echo

echo ">> gcloud beta firestore operations list"
gcloud beta firestore operations list
