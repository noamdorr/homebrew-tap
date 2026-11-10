cask "quotacanary" do
  version "0.1.11"
  sha256 "c6bc194e6a82cfcf8e184f154e63e0badf8b62d703c75a6abe5aab447e4b6bfa"

  url "https://github.com/noamdorr/quotacanary-oss/releases/download/mac-v#{version}/QuotaCanary-#{version}.dmg"
  name "QuotaCanary"
  desc "Menu bar monitor for API credit balances"
  homepage "https://quotacanary.com/"

  livecheck do
    url :url
    regex(/^mac[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :tahoe

  app "QuotaCanary.app"

  uninstall quit: "com.quotacanary.mac"

  zap trash: [
    "~/Library/Application Support/CrashReporter/QuotaCanary_*.plist",
    "~/Library/Application Support/QuotaCanary",
    "~/Library/Preferences/com.quotacanary.mac.plist",
  ]
end
