#!/bin/zsh
set -euo pipefail

repo_dir="${0:A:h}"
bin_dir="$repo_dir/bin"
portable_dir="$bin_dir/portable"
bundle_bin="$bin_dir/Cemu_release.app/Contents/MacOS/Cemu_release"
plain_bin="$bin_dir/Cemu_release"

mkdir -p "$portable_dir"

if [[ -x "$bundle_bin" ]]; then
  exec "$bundle_bin" "$@"
elif [[ -x "$plain_bin" ]]; then
  exec "$plain_bin" "$@"
else
  print -u2 "Cemu local build not found."
  print -u2 "Expected one of:"
  print -u2 "  $bundle_bin"
  print -u2 "  $plain_bin"
  exit 1
fi
