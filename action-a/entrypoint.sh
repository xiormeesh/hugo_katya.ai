#!/bin/sh

set -e
set -x
set -o pipefail

echo "== the code of the repo should be checked out here: =="
ls themes/aerial/

git submodule update --init
ls themes/aerial/

cat config.toml

# hugo build
echo "== running hugo to generate /public folder =="
hugo

ls public/

# upload /publish folder to GCP bucket, i need to store credentials somewhere
echo "== authenticating in GCP =="
echo $GCP_PROJECT_ID
echo $GCP_APPLICATION_CREDENTIALS


echo "== uploading /public folder llto the bucket... =="


echo "== uploaded /public folder to the bucket =="