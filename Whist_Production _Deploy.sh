#!/bin/bash

# Make sure we have gcloud installed in travis env
if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then
  rm -rf "$HOME/google-cloud-sdk"
  curl https://sdk.cloud.google.com | bash > /dev/null
fi

# Promote gcloud to PATH top priority
source $HOME/google-cloud-sdk/path.bash.in

gcloud components update kubectl

kubectl set image deployment/whist-backend whist-backend=hub.docker.com/r/whistteam/whist-game-production/docker-maven-test:$TRAVIS_COMMIT