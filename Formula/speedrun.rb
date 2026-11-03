# Written by update.sh for speedrun v0.3.0: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.3.0/speedrun-v0.3.0-macos-arm64.tar.gz"
      sha256 "948b9e4d004638401feba535b8934243f7f7aed66993ceb1663bdfa35187c425"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.3.0/speedrun-v0.3.0-linux-x86_64.tar.gz"
      sha256 "4b3ff94224616571ee56850677260a9cad22a6fca44d1a09a09c1f00eb26fc89"
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
