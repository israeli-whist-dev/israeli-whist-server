#!/bin/bash

gcloud container clusters get-credentials whist-game-cluster-production --zone us-central1-c
gcloud auth activate-service-account --key-file ${HOME}/build/israeli-whist-dev/israeli-whist-server/whist-game-production-c2e47c08e54c.json && kubectl set image deployment/whist-backend whist-backend=hub.docker.com/r/whistteam/whist-game-production/docker-maven-test:$TRAVIS_COMMIT