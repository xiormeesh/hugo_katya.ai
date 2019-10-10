# Deploying a Hugo website to GCP using Github actions

## 1. Hugo

create a basic hugo website and theme following https://gohugo.io/getting-started/quick-start/

in my case:

```
hugo new site katyaai
cd katyaai/
git init
git submodule add git@github.com:xiormeesh/aerial.git themes/aerial
```

Modify config.toml accodring to your theme's settings

I created katya.ai with modified aerial theme as a submodule.
Note: I need to download the submodule theme using `git submodule update --init` after cloning/checking out a repo.

## 2. GCP

### GCP:Storage
create a bucket and make it public

### GCP:IAM 

- create a service account and give it roles of `Storage Object Admin` and `Storage Object Creator`
- generate .json token | `base64`

## 3. Github Actions

- create a github:secret with GCP service account token in base64 format

- create a workflow to checkout the actions (1) and run docker actions in action-a/ (2):
	https://github.com/xiormeesh/hugo_katya.ai/blob/master/.github/workflows/main.yml

- create `Dockerfile`, debian-based go image, install gcloud + hugo:
	https://github.com/xiormeesh/hugo_katya.ai/tree/master/action-a

- create `entrypoint.sh`:
	https://github.com/xiormeesh/hugo_katya.ai/blob/master/action-a/entrypoint.sh
  
  - downloading the theme
  - generating static files
  - authenticating using secret (decoding back from base64)
  - uploading files using gsutil
