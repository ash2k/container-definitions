#!/usr/bin/env bash

set -e -o pipefail

docker run --pull=always --rm -v="$(pwd):/workspace" -v="/var/run/docker.sock:/var/run/docker.sock" --workdir="/workspace" l.gcr.io/google/bazel \
  run //:image -- --norun

docker tag bazel:image registry.gitlab.com/gitlab-org/cluster-integration/gitlab-agent/ci:latest

docker push registry.gitlab.com/gitlab-org/cluster-integration/gitlab-agent/ci:latest

docker run -it --rm registry.gitlab.com/gitlab-org/cluster-integration/gitlab-agent/ci:latest
