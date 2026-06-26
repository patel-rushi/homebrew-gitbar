cask "gitbar" do
  version "1.2.8"
  sha256 "a255dd76c4f9725ed1c9e2f36113d8d8186e8c150894345d22e35f7e877e5a47"

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
