cask "castbar" do
  version "0.1.3"
  sha256 "bd6e94e168043b46e231b7ec9eb34026d65d7e3e2726e073b9eb428a5da720d9"

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
