cask "kshan" do
  version "1.2.0"
  sha256 "f3a82a7d05204ee09a3d31292e17b751d7d9f44e94f8e69b8f0a065124722333"

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
    Kshan is not notarized yet, so macOS blocks it on first launch. Allow it once
    under System Settings > Privacy & Security > Open Anyway.
  EOS
end
