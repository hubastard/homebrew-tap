# Written by update.sh for speedrun v0.4.10: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.10/speedrun-v0.4.10-macos-arm64.tar.gz"
      sha256 "bfcaaa142801ca366463d4fa76555fa5e0a2a86a8542267810ee277a10c54e3f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.10/speedrun-v0.4.10-linux-x86_64.tar.gz"
      sha256 "a72aea93a6266fdea76def1994a88617d6a0d3f273e8571cc6a11f869917b822"
    end
  end

  def install
    bin.install "speedrun"
  end

  def caveats
    <<~TEXT
      Android: adb on your PATH and an emulator or device.
      iOS (macOS): Xcode and a booted simulator.
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/speedrun --version")
  end
end
