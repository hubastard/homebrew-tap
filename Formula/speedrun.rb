# Written by update.sh for speedrun v0.4.3: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.3/speedrun-v0.4.3-macos-arm64.tar.gz"
      sha256 "622cf0ef331a2d482f7f2729b2c79144d20cba746f2f1e2964f3fa704d0d38c1"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.3/speedrun-v0.4.3-linux-x86_64.tar.gz"
      sha256 "d0bd08c04a16e5027296774275e5a909d389158545b794b73d6ce474f0e0d277"
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
