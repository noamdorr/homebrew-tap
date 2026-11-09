cask "quotacanary" do
  version "0.1.10"
  sha256 "b23065fe6f43a8b3cbf63c5d976c145ec1e03b66ad31fea91093d7096a2b8bbd"

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
