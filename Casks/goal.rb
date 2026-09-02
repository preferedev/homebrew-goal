cask "goal" do
  version "0.1.0"
  sha256 "abde6ade385f021f63103aea05aaad2b3fc9ff09f2fcedfb4e60c7e26989f903"

  url "https://github.com/preferedev/Goal/releases/download/v#{version}/Goal-#{version}-mac-arm64.dmg"
  name "Goal"
  desc "The workspace for your entire development session"
  homepage "https://github.com/preferedev/Goal"

  depends_on macos: :monterey
  depends_on arch: :arm64

  app "Goal.app"

  # Unsigned / ad-hoc Electron builds get a Gatekeeper "damaged" dialog unless
  # quarantine is cleared and the bundle is re-signed locally after install.
  postflight do
    app_path = "#{appdir}/Goal.app"
    system_command "/usr/bin/xattr", args: ["-cr", app_path]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", app_path]
  end

  zap trash: [
    "~/Library/Application Support/Goal",
  ]

  caveats <<~EOS
    Goal builds are currently unsigned. If macOS still says the app is damaged:

      xattr -cr /Applications/Goal.app
      codesign --force --deep --sign - /Applications/Goal.app
  EOS
end
