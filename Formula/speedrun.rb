# Written by update.sh for speedrun v0.2.8: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.8/speedrun-v0.2.8-macos-arm64.tar.gz"
      sha256 "0be990fa73cd2dba3f0da03d05f227bc88dbbbc928855293fabec0fb0bfc99b1"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.8/speedrun-v0.2.8-linux-x86_64.tar.gz"
      sha256 "a5981974bd1fb4a67728451190e2ba548da99d8f7a0676f2f7839c5fe3392f32"
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
