#!/usr/bin/env bash
# Builds the ZIP for OpenAI's plugin portal (platform.openai.com/plugins):
# plugin.json and mcp.json from this folder plus the icons, at the root of
# the archive. The public directory submission is the OpenDocs.cc MCP server
# only; the CLI skill needs a terminal, so Codex users get it from the repo
# (.codex-plugin/) instead.
#
#   openai/build.sh            # writes openai/dist/opendocs-cc-<version>.zip
#
# Reviewer credentials go in the portal's Review details, never in the ZIP.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
root="$(dirname "$here")"

demo="$(jq -r '.extensions["com.openai"].review.demo_recording_url' "$here/plugin.json")"
if [ -z "$demo" ] || [ "$demo" = "null" ]; then
  echo "Set extensions.com.openai.review.demo_recording_url in openai/plugin.json first (a video reviewers can open)." >&2
  exit 1
fi

version="$(jq -r .version "$here/plugin.json")"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

cp "$here/plugin.json" "$here/mcp.json" "$stage/"
mkdir -p "$stage/assets"
cp "$root/assets/opendocs.png" "$root/assets/opendocs-small.svg" "$stage/assets/"

mkdir -p "$here/dist"
out="$here/dist/opendocs-cc-$version.zip"
rm -f "$out"
(cd "$stage" && zip -qr -X "$out" .)
echo "$out"
