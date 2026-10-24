cask "featherview" do
  version "0.10.0"
  sha256 "fed28c0d3de7f136146bafab2df5bfd594716d1110cc2ab5ca1f7a32cad14b78"

  url "https://github.com/featherview/featherview/releases/download/v#{version}/Featherview-#{version}.dmg"
  name "Featherview"
  desc "Fast, keyboard-driven image viewer with batch conversion"
  homepage "https://featherview.mynetx.net/"

  livecheck do
    url "https://featherview.mynetx.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

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
