cask "castbar" do
  version "0.1.1"
  sha256 "5d4d35dc5019ef146207dc2525e9f445c4613e36259ab9f1eea9e28478fed41f"

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
