cask "applereserver" do
  version "5.3"
  sha256 "526cbb688888cbc0ba5d036bf4dd7dba3c513f420c23bfa4cc0212ea3f8f8407"
  url "https://github.com/Sunnyyoung/AppleReserver/releases/download/#{version}/applereserver"

  name "AppleReserver"
  desc "Apple 官方预约命令行监控助手"
  homepage "https://github.com/Sunnyyoung/AppleReserver"

  binary "applereserver"
  depends_on :macos

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/applereserver"],
        must_succeed: false
  end
end
