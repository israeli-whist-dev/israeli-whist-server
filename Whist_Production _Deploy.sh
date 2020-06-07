#!/bin/bash

# Make sure we have gcloud installed in travis env
if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then
  rm -rf "$HOME/google-cloud-sdk"
  curl https://sdk.cloud.google.com | bash > /dev/null
fi

# Promote gcloud to PATH top priority
source $HOME/google-cloud-sdk/path.bash.in

gcloud auth activate-service-account --key-file ${HOME}/build/israeli-whist-dev/israeli-whist-server/whist-game-production-c2e47c08e54c.json
gcloud container clusters get-credentials whist-game-cluster-production --zone us-central1-c 

gcloud components update kubectl
