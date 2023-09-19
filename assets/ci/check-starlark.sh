#!/bin/bash
set -e
set -x

REPO_PARAMS="--repo.namespace=KumoCorp --repo.name=kumomta"

# This sanity checks the starlark by compiling it into yml
drone starlark --format $REPO_PARAMS

# Now try building the docs via drone; this requires the yml
# output from the previous command

drone exec \
  --event push \
  --pretty \
  --pipeline build-docs
