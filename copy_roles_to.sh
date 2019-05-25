#!/bin/bash

# 詳細は下記URL参照
# gcloudのインストールが必要
# https://firebase.google.com/docs/firestore/manage-data/move-data?hl=ja

if [ $# -ne 2 ]; then
  echo "USAGE: $0 [deployment_project] [export_prefix]" 1>&2
  exit 1
fi

gcloud config set project $1
gcloud beta firestore import gs://$1.appspot.com/$2 --async
gcloud beta firestore operations list
