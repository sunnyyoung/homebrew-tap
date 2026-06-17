cask "applereserver" do
  version "5.3"
  sha256 "526cbb688888cbc0ba5d036bf4dd7dba3c513f420c23bfa4cc0212ea3f8f8407"
  url "https://github.com/Sunnyyoung/AppleReserver/releases/download/#{version}/applereserver"

  name "AppleReserver"
  desc "Apple 官方预约命令行监控助手"
  homepage "https://github.com/Sunnyyoung/AppleReserver"

  binary "applereserver"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/applereserver"
  end
end
