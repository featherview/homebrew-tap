cask "featherview" do
  version "0.12.1"
  sha256 "10cdb1b2c2ab739898cdfa4a6439bbaa4a5301e90a2cfc2cd6ba8329f18e31b1"

  url "https://github.com/featherview/featherview/releases/download/v#{version}/Featherview-#{version}.dmg"
  name "Featherview"
  desc "Fast, keyboard-driven image viewer with batch conversion"
  homepage "https://featherview.mynetx.net/"

  livecheck do
    url "https://featherview.mynetx.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Featherview.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Featherview.app"]
  end

  zap trash: [
    "~/Library/Containers/net.mynetx.featherview.preview",
    "~/Library/Containers/net.mynetx.featherview.thumbnail",
    "~/Library/Preferences/net.mynetx.featherview.plist",
    "~/Library/Saved Application State/net.mynetx.featherview.savedState",
  ]

  caveats <<~EOS
    Featherview is not notarized by Apple. The install removes the download mark
    so it opens directly. If macOS still blocks it, run this once:
      xattr -dr com.apple.quarantine /Applications/Featherview.app
  EOS
end
