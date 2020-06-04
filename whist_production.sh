#!/bin/bash

gcloud auth activate-service-account --key-file ${HOME}/build/israeli-whist-dev/israeli-whist-server/whist-game-production-c2e47c08e54c.json
gcloud container clusters get-credentials whist-game-cluster-production --zone us-central1-c

