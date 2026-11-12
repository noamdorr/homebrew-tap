cask "quotacanary" do
  version "0.1.12"
  sha256 "3c74c8f7b740c54d27fd5961f154475ce5a8ff9833024e3382848f10698597af"

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
