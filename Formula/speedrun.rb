# Written by update.sh for speedrun v0.4.11: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.11/speedrun-v0.4.11-macos-arm64.tar.gz"
      sha256 "2cef542b267a73e173d3e279d8bf458aeb7d8c51838fa28b037d75db6b45275a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.11/speedrun-v0.4.11-linux-x86_64.tar.gz"
      sha256 "59df792bda489fe9b12edee15ef7c35704dbfc7d2572e5b9219320cb012403d7"
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
