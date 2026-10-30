# Written by update.sh for speedrun v0.2.5: edits here are overwritten.
class Speedrun < Formula
  desc "Fast black-box UI tests for Android and iOS, in plain YAML"
  homepage "https://github.com/hubastard/speedrun"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.5/speedrun-v0.2.5-macos-arm64.tar.gz"
      sha256 "000b8a7e9948fd0d7a361dcc7bb5b3d4518cd135bbb954ba5a686a26fbfbc25a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/hubastard/speedrun/releases/download/v0.2.5/speedrun-v0.2.5-linux-x86_64.tar.gz"
      sha256 "0aa5c48867d1ef6b21e5385ddcd4c2af48b26cbf54665f54d66e38bddc8fda77"
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
