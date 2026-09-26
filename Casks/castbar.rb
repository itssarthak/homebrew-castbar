cask "castbar" do
  version "0.1.2"
  sha256 "79aa78b414638aca936a99d7e573a1907e95286653b450faf99e848de74aea37"

  url "https://github.com/itssarthak/castbar/releases/download/v#{version}/Castbar-#{version}.zip"
  name "Castbar"
  desc "Control Chromecast and Google Home devices from the menu bar"
  homepage "https://github.com/itssarthak/castbar"

  depends_on arch: :arm64
  depends_on :macos

  app "Castbar.app"

  # Not notarized yet: clear the download quarantine so it opens without the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Castbar.app"]
  end

  uninstall quit: "com.itssarthak.castbar"

  caveats "Start Castbar with: open -a Castbar"
end
