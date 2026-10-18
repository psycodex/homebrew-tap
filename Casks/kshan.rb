cask "kshan" do
  version "1.1.1"
  sha256 "bd046605166c82db544af2395bd7a86a5bc98694166b404c17c4197a29843774"

  url "https://storage.googleapis.com/kshan-downloads/releases/#{version}/macos/Kshan-#{version}.dmg"
  name "Kshan"
  desc "Background time tracker with a focus quality score"
  homepage "https://kshan.io/"

  livecheck do
    url "https://storage.googleapis.com/kshan-downloads/app-archive.json"
    strategy :json do |json|
      json["items"].select { |item| item["platform"] == "macos" }.map { |item| item["version"] }
    end
  end

  auto_updates true
  depends_on :macos

  app "Kshan.app"

  uninstall quit: "io.kshan"

  zap trash: [
    "~/Library/Application Support/io.kshan",
    "~/Library/Caches/io.kshan",
    "~/Library/HTTPStorages/io.kshan",
    "~/Library/Preferences/group.io.kshan.firebase.plist",
    "~/Library/Preferences/io.kshan.plist",
  ]

  caveats <<~EOS
    Kshan is not notarized yet, so macOS blocks it on first launch. Either install
    without the quarantine flag:
      brew reinstall --no-quarantine kshan
    or allow it once under System Settings > Privacy & Security > Open Anyway.
  EOS
end
