class Untcc < Formula
  desc "In-memory TCC bypass for macOS"
  homepage "https://github.com/sunnyyoung/untcc"
  url "https://github.com/sunnyyoung/untcc/releases/download/1.0/untcc"
  sha256 "782b3ce7a7a9636fec1f0d3afd7398a818de940d3f5b117630d50c50e48b2948"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

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
      Stopping the service leaves existing hooks active until tccd restarts.
      Injection errors stop the service; inspect the log before restarting it.
    EOS
  end

  test do
    assert_equal "untcc #{version}\n", shell_output("#{bin}/untcc --version")
  end
end
