class Wechattweak < Formula
  desc "A command line utility to work with WeChatTweak-macOS."
  homepage "https://tweaks.app"
  version "2.0-beta3"
  url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{version}/wechattweak"
  sha256 "e0e4a6f730c6217180905fdf7a35803859902914d624bd4129cf3e0882b97ba0"
  license "AGPL-3.0"

  depends_on macos: :monterey

  resource "config" do
    url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{Wechattweak::version}/config.json"
    sha256 "d11771092eb59fffc49c9dbddc430bc99ab53c3c8e7d5f61f1b0c74255130a5c"
  end

  def install
    bin.install "wechattweak"

    resource("config").stage do
      bin.install "config.json"
    end

    system "xattr", "-c", bin/"wechattweak"
  end

  test do
    system bin/"wechattweak", "--help"
  end
end
