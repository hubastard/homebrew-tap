# Written by update.sh for speedrun v0.4.9: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.9/speedrun-v0.4.9-macos-arm64.tar.gz"
      sha256 "d36547c600059c3c0b6e51469ece4b0ed942c14c60cfa2f4fca631a02bb32005"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.9/speedrun-v0.4.9-linux-x86_64.tar.gz"
      sha256 "b4580741ec4034ea8efc55fdc2f02dd0e8b04ed77d1477ff3a82ac365b2b99c8"
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
