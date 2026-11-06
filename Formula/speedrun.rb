# Written by update.sh for speedrun v0.4.8: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.8/speedrun-v0.4.8-macos-arm64.tar.gz"
      sha256 "1137482a6ab416f57467387d4b570da59bde4774c5a6fcfe925640ec8292527f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.4.8/speedrun-v0.4.8-linux-x86_64.tar.gz"
      sha256 "f00dd5fb9a4d6a8cff6ab146c7c698441e4a4c3d10537497d1193b847302f925"
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
