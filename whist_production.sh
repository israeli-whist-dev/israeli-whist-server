#!/bin/bash

cache:
  directories:
    "$HOME/google-cloud-sdk/"
script:
  gcloud version || true
  if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then rm -rf $HOME/google-cloud-sdk; export CLOUDSDK_CORE_DISABLE_PROMPTS=1; curl https://sdk.cloud.google.com | bash; fi
  # Add gcloud to $PATH
  source /home/travis/google-cloud-sdk/path.bash.inc
  gcloud version

gcloud auth activate-service-account --key-file ${HOME}/build/israeli-whist-dev/israeli-whist-server/whist-game-production-c2e47c08e54c.json
gcloud container clusters get-credentials whist-game-cluster-production --zone us-central1-c

