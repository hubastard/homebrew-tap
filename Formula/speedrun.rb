# Written by update.sh for speedrun v0.2.11: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.11/speedrun-v0.2.11-macos-arm64.tar.gz"
      sha256 "bb2bfbf1ad7c8706d986528a1ffab88efcc21174b4a6abfe2f4a09e109931c84"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.11/speedrun-v0.2.11-linux-x86_64.tar.gz"
      sha256 "d74c278634bbee02473fdea01de0e5fb1d4b5c7d768375ff00c6777f00c8d2c1"
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
