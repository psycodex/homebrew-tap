cask "kshan" do
  version "1.0.0"
  sha256 "93fe70291bd7bfdbf44291bd8dec9b9d72aaa1b98a13f54825c543ad6f8aa0c0"

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
