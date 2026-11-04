#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

repository="danileph/whalu"
archive="Whalu-macOS-universal.zip"
tag="$(gh api "repos/$repository/releases/latest" --jq .tag_name)"
if [[ ! "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  printf 'Expected a stable Whalu release tag, got %s.\n' "$tag" >&2
  exit 1
fi

download_dir="$(mktemp -d)"
trap 'rm -rf "$download_dir"' EXIT
gh release download "$tag" --repo "$repository" --dir "$download_dir" \
  --pattern "$archive" --pattern "$archive.sha256"

read -r checksum filename < "$download_dir/$archive.sha256"
if [[ ! "$checksum" =~ ^[0-9a-f]{64}$ || "$filename" != "$archive" ]]; then
  printf 'Invalid checksum file for %s.\n' "$archive" >&2
  exit 1
fi
(cd "$download_dir" && shasum -a 256 -c "$archive.sha256")

cat > Casks/whalu.rb <<CASK
cask "whalu" do
  version "${tag#v}"
  sha256 "$checksum"

  url "https://github.com/$repository/releases/download/v#{version}/$archive"
  name "Whalu"
  desc "Window navigation and tiling for macOS"
  homepage "https://danileph.github.io/whalu/"

  depends_on macos: :sequoia

  app "Whalu.app"
end
CASK
