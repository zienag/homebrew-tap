cask "multivibe" do
  version "0.1.0"
  sha256 "22541a266cff7f8d55923a765faa733174da17a4270f8527521c4d57235c6f31"

  url "https://github.com/zienag/multivibe/releases/download/v#{version}/Multivibe.zip"
  name "Multivibe"
  desc "Native macOS terminal manager for multiple coding sessions"
  homepage "https://github.com/zienag/multivibe"

  depends_on macos: ">= :sequoia"

  app "Multivibe.app"
end
