cask "whalu" do
  version "0.5.1"
  sha256 "f7cb2712a5d5ea3dff2df96a2ce0a4d86a8ed0702210dbc29432b0669f6bc85c"

  url "https://github.com/danileph/whalu/releases/download/v#{version}/Whalu-macOS-universal.zip"
  name "Whalu"
  desc "Window navigation and tiling for macOS"
  homepage "https://danileph.github.io/whalu/"

  depends_on macos: ">= :sequoia"

  app "Whalu.app"
end
