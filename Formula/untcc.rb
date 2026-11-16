class Untcc < Formula
  desc "In-memory TCC bypass for macOS"
  homepage "https://github.com/sunnyyoung/untcc"
  url "https://github.com/sunnyyoung/untcc/releases/download/1.1/untcc"
  sha256 "2e8974d28f30d6bc8ee584dcae1d604489f53beedbc2a72d61fe6036d08137bc"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "untcc"
  end

  service do
    run opt_bin/"untcc"
    require_root true
    keep_alive crashed: true
    stop_timeout 15
    log_path var/"log/untcc.log"
    error_log_path var/"log/untcc.log"
  end

  def caveats
    <<~EOS
      Requires root and disabled SIP.
      Required on macOS 15: `sudo nvram boot-args="-arm64e_preview_abi"`
      Stopping the service leaves existing hooks active until tccd restarts.
      Injection errors stop the service; inspect the log before restarting it.
    EOS
  end

  test do
    assert_equal "untcc #{version}\n", shell_output("#{bin}/untcc --version")
  end
end
