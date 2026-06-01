cask "gitbar" do
  version "1.1.7"
  sha256 "7ee8cd1fb51cf21119a9b5f31918dc40c7c1dc4f80b09452030406d212083cbb"

  url "https://github.com/patel-rushi/Gitbar/releases/download/v#{version}/GitBar-#{version}-arm64.dmg"
  name "GitBar"
  desc "macOS menu bar app that surfaces GitHub notifications that matter"
  homepage "https://github.com/patel-rushi/Gitbar"

  auto_updates true
  depends_on arch: :arm64

  app "GitBar.app"

  # GitBar is ad-hoc signed but not notarized. Strip the quarantine flag that
  # Homebrew applies so users don't hit the "app is damaged" Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/GitBar",
    "~/Library/Caches/com.rushipatel.gitbar",
    "~/Library/Caches/com.rushipatel.gitbar.ShipIt",
    "~/Library/Preferences/com.rushipatel.gitbar.plist",
    "~/Library/Saved Application State/com.rushipatel.gitbar.savedState",
  ]
end
