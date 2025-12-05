class Wechattweak < Formula
  desc "A command line utility to work with WeChatTweak-macOS."
  homepage "https://tweaks.app"
  version "2.0-beta1"
  url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{version}/wechattweak"
  sha256 "f624a1b4ee50aab2edc1309723048ec9bfdcedd2be3739db4d6840295845c953"
  license "AGPL-3.0"

  depends_on macos: :monterey

  resource "config" do
    url "https://github.com/sunnyyoung/WeChatTweak/releases/download/#{Wechattweak::version}/config.json"
    sha256 "779ad2491ecaa9bf587c804eabe802333a6b460ccb5cc60033a1ff5cd4174230"
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
