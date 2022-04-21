#!/usr/bin/env bash

set -e -u

WORK_DIR="$PWD"

docker run --rm -v "$WORK_DIR/concourse/keys/web":/keys concourse/concourse \
  generate-key -t rsa -f /keys/session_signing_key

docker run --rm -v "$WORK_DIR/concourse/keys/web":/keys concourse/concourse \
  generate-key -t ssh -f /keys/tsa_host_key

docker run --rm -v "$WORK_DIR/concourse/keys/worker":/keys concourse/concourse \
  generate-key -t ssh -f /keys/worker_key

cp "$WORK_DIR/concourse/keys/worker/worker_key.pub" "$WORK_DIR/concourse/keys/web/authorized_worker_keys"
cp "$WORK_DIR/concourse/keys/web/tsa_host_key.pub" "$WORK_DIR/concourse/keys/worker"