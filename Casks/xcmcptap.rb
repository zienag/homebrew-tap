cask "xcmcptap" do
  version "1.0.0"
  sha256 "b26ab789034db4b89bf374c9be80c88989ebeaaedeada5f9710826817658cd33"

  url "https://github.com/zienag/xcmcptap/releases/download/v#{version}/XcodeMCPTap-#{version}.dmg"
  name "Xcode MCP Tap"
  desc "Persistent bridge that eliminates repeated Xcode MCP permission dialogs"
  homepage "https://github.com/zienag/xcmcptap"

  depends_on macos: ">= :tahoe"

  app "Xcode MCP Tap.app"

  zap trash: [
    "~/Library/LaunchAgents/alfred.xcmcptap.plist",
    "~/.local/bin/xcmcptap",
  ]
end
