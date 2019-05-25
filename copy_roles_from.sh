#!/bin/bash

# 詳細は下記URL参照
# gcloudのインストールが必要
# https://firebase.google.com/docs/firestore/manage-data/move-data?hl=ja

if [ $# -ne 1 ]; then
  project="starmine-develop"
else
  project=$1
fi

gcloud config set project $project
gcloud beta firestore export gs://$project.appspot.com --collection-ids=admin --async
gcloud beta firestore operations list

