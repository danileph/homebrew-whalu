cask "whalu" do
  version "0.6.0"
  sha256 "c1a293f89aa7d6be9d3cc6e0641a163f59e8530b40acbebf508f27493dc3202f"

  url "https://github.com/danileph/whalu/releases/download/v#{version}/Whalu-macOS-universal.zip"
  name "Whalu"
  desc "Window navigation and tiling for macOS"
  homepage "https://danileph.github.io/whalu/"

  depends_on macos: :sequoia

  app "Whalu.app"
end
