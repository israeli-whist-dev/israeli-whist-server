#!/bin/bash

sudo: false
language: python
cache:
  directories:
    "$HOME/google-cloud-sdk/"
env:
  GAE_PYTHONPATH=${HOME}/.cache/google_appengine PATH=$PATH:${HOME}/google-cloud-sdk/bin
  PYTHONPATH=${PYTHONPATH}:${GAE_PYTHONPATH} CLOUDSDK_CORE_DISABLE_PROMPTS=1
before_install:
  openssl aes-256-cbc -K $encrypted_404aa45a170f_key -iv $encrypted_404aa45a170f_iv
  in credentials.tar.gz.enc -out credentials.tar.gz -d
  if [ ! -d "${GAE_PYTHONPATH}" ]; then python scripts/fetch_gae_sdk.py $(dirname
  "${GAE_PYTHONPATH}"); fi
  if [ ! -d ${HOME}/google-cloud-sdk ]; then curl https://sdk.cloud.google.com | bash;
fi
  tar -xzf credentials.tar.gz
  mkdir -p lib
  gcloud auth activate-service-account --key-file client-secret.json
install:
  gcloud config set project continuous-deployment-192112
  gcloud -q components update gae-python
  pip install -r requirements.txt -t lib/
script:
  python test_main.py
  gcloud -q preview app deploy app.yaml --promote
  python e2e_test.py

gcloud auth activate-service-account --key-file ${HOME}/build/israeli-whist-dev/israeli-whist-server/whist-game-production-c2e47c08e54c.json
gcloud container clusters get-credentials whist-game-cluster-production --zone us-central1-c

