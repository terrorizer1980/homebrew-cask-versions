cask "termius-beta" do
  version "7.20.0"
  sha256 :no_check

  if Hardware::CPU.intel?
    url "https://autoupdate.termius.com/mac-beta/Termius%20Beta.dmg"
  else
    url "https:///autoupdate.termius.com/mac-beta-arm64/Termius+Beta.dmg"
  end

  name "Termius Beta"
  desc "SSH client"
  homepage "https://www.termius.com/beta-program"

  livecheck do
    url "https://autoupdate.termius.com/mac-beta/latest-mac.yml"
    strategy :electron_builder
  end

  app "Termius Beta.app"

  zap trash: [
    "/Library/Preferences/com.termius-beta.mac.helper.plist",
    "/Library/Preferences/com.termius-beta.mac.plist",
    "~/.termius",
    "~/Library/Application Support/Termius Beta",
    "~/Library/Logs/Termius Beta",
    "~/Library/Saved Application State/com.termius-beta.mac.savedState",
  ]
end
