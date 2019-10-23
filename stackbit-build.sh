#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db0ce2afacbc6001be79a2e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db0ce2afacbc6001be79a2e
curl -s -X POST https://api.stackbit.com/project/5db0ce2afacbc6001be79a2e/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5db0ce2afacbc6001be79a2e/webhook/build/publish > /dev/null
