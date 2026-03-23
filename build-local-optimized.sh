#!/bin/zsh
set -euo pipefail

repo_dir="${0:A:h}"
build_dir="$repo_dir/build-arm64-metal"

export PATH="/opt/homebrew/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig:${PKG_CONFIG_PATH:-}"

cmake -S "$repo_dir" -B "$build_dir" -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_OSX_ARCHITECTURES=arm64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=13.4 \
  -DENABLE_METAL=ON \
  -DMACOS_BUNDLE=OFF \
  -DCEMU_CXX_FLAGS="-march=native"

cmake --build "$build_dir"
