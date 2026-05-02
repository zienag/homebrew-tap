cask "xcmcptap" do
  version "1.1.0"
  sha256 "b463996b8c0d2a359508c82161ff348fa72a89c00e38a03cfa8828681fec03ec"

  url "https://github.com/zienag/xcmcptap/releases/download/v#{version}/XcodeMCPTap-#{version}.dmg"
  name "Xcode MCP Tap"
  desc "Persistent bridge that eliminates repeated Xcode MCP permission dialogs"
  homepage "https://github.com/zienag/xcmcptap"

  depends_on macos: ">= :tahoe"

  app "Xcode MCP Tap.app"

  uninstall launchctl: "alfred.xcmcptap",
            delete:    "/usr/local/bin/xcmcptap"

  zap trash: [
    "~/Library/LaunchAgents/alfred.xcmcptap.plist",
    "~/.local/bin/xcmcptap",
  ]
end
