#!/bin/sh

set -e
set -x
set -o pipefail

echo "== pulling aerial theme: =="
git submodule update --init
ls themes/aerial/

echo "== running hugo to generate /public folder =="
hugo
ls public/

# upload /publish folder to GCP bucket, i need to store credentials somewhere
echo "== authenticating in GCP =="

echo "$GCLOUD_AUTH" | base64 -d > "$HOME"/gcloud.json
sh -c "gcloud auth activate-service-account --key-file=$HOME/gcloud.json $*"


echo "== uploading /public folder to the bucket... =="
sh -c "gsutil -m cp -r public/* gs://katya.ai"


echo "== uploaded /public folder to the bucket =="