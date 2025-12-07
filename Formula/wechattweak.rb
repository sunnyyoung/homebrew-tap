class Wechattweak < Formula
  desc "A command line utility to work with WeChatTweak-macOS."
  homepage "https://tweaks.app"
  version "2.0.0"
  url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{version}/wechattweak"
  sha256 "d26b86778c1d0995797b3635679e75d3d0b822f4bcfbd0fac5744c25b373e6eb"
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
