#!/bin/bash

# 詳細は下記URL参照
# gcloudのインストールが必要
# https://firebase.google.com/docs/firestore/manage-data/move-data?hl=ja

read -sp "Copy from: starmine-develop(d), starmine-production(p) (d/p)? " env_from
echo $env_from

if [ $env_from = "p" ]; then
  env_from="starmine-production"
else
  env_from="starmine-develop"
fi

read -sp "Copy to: starmine-develop(d), starmine-production(p) (d/p)? " env_to
echo $env_to

if [ $env_to = "p" ]; then
  env_to="starmine-production"
else
  env_to="starmine-develop"
fi

read -sp "Copy from, uid: " uid_from
echo $uid_from

read -sp "Copy to, uid: " uid_to
echo $uid_to

gcloud config set project $env_from
gsutil cp -r gs://$env_from.appspot.com/users/$uid_from \
gs://$env_to.appspot.com/users/$uid_to
echo

