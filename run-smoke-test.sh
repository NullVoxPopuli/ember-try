#!/usr/bin/env bash

set -ex
rm ember-try*.tgz || true
npm pack
now=$(date +%s)
mv ember-try*.tgz "ember-try-${now}.tgz"
cd smoke-test-app && yarn upgrade "ember-try@file:../ember-try-${now}.tgz" && yarn install && "./${1}"
