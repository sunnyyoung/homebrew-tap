class Wechattweak < Formula
  desc "A command line utility to work with WeChatTweak-macOS."
  homepage "https://tweaks.app"
  version "2.0-beta4"
  url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{version}/wechattweak"
  sha256 "f07c20095669ef7d8a74bd4715d255d661537ebd094634e9ac8adbf174c7eea7"
  license "AGPL-3.0"

  depends_on macos: :monterey

  def install
    bin.install "wechattweak"

    system "xattr", "-c", bin/"wechattweak"
  end

  test do
    system bin/"wechattweak", "--help"
  end
end
