cask "castbar" do
  version "0.1.0"
  sha256 "5f3f3bc44fc06b7f7c8686a08d96cff59d4830e223f204c935df2996b1d0f9f4"

  url "https://github.com/itssarthak/castbar/releases/download/v#{version}/Castbar-#{version}.zip"
  name "Castbar"
  desc "Control Chromecast and Google Home devices from the menu bar"
  homepage "https://github.com/itssarthak/castbar"

  depends_on arch: :arm64
  depends_on :macos

  app "Castbar.app"

  # Not notarized yet: clear the download quarantine so it opens without the Gatekeeper prompt,
  # then launch it so the menu bar icon appears right after install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Castbar.app"]
    run "/usr/bin/open", args: ["{{appdir}}/Castbar.app"], must_succeed: false
  end

  uninstall quit: "com.itssarthak.castbar"
end
