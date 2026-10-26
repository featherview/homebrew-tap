cask "featherview" do
  version "0.11.0"
  sha256 "26c17c26a3e66ce4873b03b40af50c5ca47cab8f5ec0d8c67d49763069f50898"

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

  zap trash: [
    "~/Library/Containers/net.mynetx.featherview.preview",
    "~/Library/Containers/net.mynetx.featherview.thumbnail",
    "~/Library/Preferences/net.mynetx.featherview.plist",
    "~/Library/Saved Application State/net.mynetx.featherview.savedState",
  ]

  caveats <<~EOS
    Featherview is not notarized by Apple, so macOS blocks its first launch.
    Open it once, then choose System Settings > Privacy & Security > Open Anyway.
  EOS
end
