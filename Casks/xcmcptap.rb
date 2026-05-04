cask "xcmcptap" do
  version "1.2.2"
  sha256 "6a096bc746a6ad5a45ac98b4437705612d7430d2defe569f4cd7df1beed22f3d"

  url "https://github.com/zienag/xcmcptap/releases/download/v#{version}/XcodeMCPTap-#{version}.dmg"
  name "Xcode MCP Tap"
  desc "Persistent bridge that eliminates repeated Xcode MCP permission dialogs"
  homepage "https://github.com/zienag/xcmcptap"

  depends_on macos: ">= :tahoe"

  app "Xcode MCP Tap.app"
  binary "#{appdir}/Xcode MCP Tap.app/Contents/MacOS/xcmcptap"

  # Register the launch agent right after the cask copies the .app,
  # so the user doesn't have to open the UI to start the service.
  postflight do
    system_command "#{appdir}/Xcode MCP Tap.app/Contents/MacOS/xcmcptap",
                   args: ["install"]
  end

  # Tear down the agent + any system symlink while the .app is still
  # on disk (SMAppService.unregister needs the bundle present).
  # This runs as the user and handles both the SMAppService agent
  # and any privileged helper-daemon-installed `/usr/local/bin`
  # symlink without prompting for sudo.
  uninstall_preflight do
    system_command "#{appdir}/Xcode MCP Tap.app/Contents/MacOS/xcmcptap",
                   args: ["uninstall"]
  end

  zap trash: [
    "~/Library/LaunchAgents/alfred.xcmcptap.plist",
    "~/.local/bin/xcmcptap",
  ]

  caveats <<~CAVEATS
    Xcode MCP Tap is now running. Wire up your MCP client of choice
    with one of these commands (the `xcmcptap` binary is on your PATH
    via this cask):

      claude mcp add --transport stdio xcode -- xcmcptap
      codex mcp add xcode -- xcmcptap
      gemini mcp add xcode xcmcptap
      code --add-mcp '{"name":"xcode","command":"xcmcptap"}'

    Cursor / Windsurf — paste this into the editor's MCP config:

      {"mcpServers":{"xcode":{"command":"xcmcptap"}}}

    The first agent that connects will show Xcode's "Allow access to
    tools" dialog once. After that, every other client on the system
    shares the same approval.
  CAVEATS
end
