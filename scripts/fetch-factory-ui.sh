#!/usr/bin/env bash
# Fetches the @factory/ui packaging proof tarball from the private
# Alscd/nutrition-tracker GitHub Release (FAC-1003 / FAC-998 AC2).
#
# This script is the *interim* install path: the registry publish
# (npm.pkg.github.com, scope @factory) is code-complete but blocked on a
# credential scope grant (packages:write) — see nutrition-tracker's
# packages/ui/README.md. Once that lands, this script + the `file:`
# dependency in package.json go away in favor of a normal registry range.
#
# Requires: FACTORY_GIT_READ_TOKEN (or any token with read access to
# Alscd/nutrition-tracker) in the environment.
set -euo pipefail

ASSET_ID=581374224
REPO="Alscd/nutrition-tracker"
OUT="vendor/factory-ui-0.1.0.tgz"

if [ -z "${FACTORY_GIT_READ_TOKEN:-}" ]; then
  echo "FACTORY_GIT_READ_TOKEN is required to fetch the private release asset." >&2
  exit 1
fi

mkdir -p vendor
curl -sL \
  -H "Authorization: token ${FACTORY_GIT_READ_TOKEN}" \
  -H "Accept: application/octet-stream" \
  "https://api.github.com/repos/${REPO}/releases/assets/${ASSET_ID}" \
  -o "$OUT"

echo "Fetched $OUT ($(wc -c < "$OUT") bytes)"
