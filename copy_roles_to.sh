#!/bin/bash

# 詳細は下記URL参照
# gcloudのインストールが必要
# https://firebase.google.com/docs/firestore/manage-data/move-data?hl=ja

read -sp "Copy from: starmine-develop(d), starmine-production(p) (d/p)? " env_from
echo

if [ $env_from = "p" ]; then
  env_from="starmine-production"
else
  env_from="starmine-develop"
fi

read -sp "Copy to: starmine-develop(d), starmine-production(p) (d/p)? " env_to
echo

if [ $env_to = "p" ]; then
  env_to="starmine-production"
else
  env_to="starmine-develop"
fi

read -sp "Export prefix: " export_prefix
echo

gcloud config set project $env_to
gcloud beta firestore import gs://$env_from.appspot.com/$export_prefix --async
echo

echo ">> gcloud beta firestore operations list"
gcloud beta firestore operations list
